# Monitor continuo parametri CarInfo (PULL + PUSH) — handoff per la build

> Modifiche in `NTG_062_src/`, **compilate il 2026-07-09** (build `apktool b` + firma v2+v3 OK,
> `NTG_062_audi_it.apk`). Resta da fare il **test a runtime sulla testata**. Documento di
> contesto per chi assembla/firma. Riflette lo stato attuale della funzione.

## Obiettivo della funzione
Scrivere in `Download/ntg_carinfo_log.txt` tutti i parametri CarInfo **leggibili** dal
CAN-box, per **dedurre** cosa è realmente monitorabile sull'Audi A5. Non è uno snapshot
unico: è un **monitor continuo** che unisce due sorgenti nella **stessa mappa deduplicata**
`what[+arg] → valore corrente`:

- **PULL** periodico (~3 s): interroga on-demand tutti i `what` conosciuti;
- **PUSH** live: riceve ogni cambiamento che il box **notifica** spontaneamente.

Un parametro nuovo (anche se **azionato durante la scansione** — luci, marcia, freccia…)
viene aggiunto; uno già visto viene aggiornato; la lista è deduplicata e riscritta in
**sovrascrittura** ad ogni ciclo → **non cresce all'infinito**.

> **Perché il PULL da solo non basta (nota epistemica).** Il box risponde `0` sia per un
> `what` "decodificato ma ora a 0" sia per uno "non decodificato" (su moltissimi `what` non
> usa una sentinella distinguibile). Quindi **un `0` nel PULL NON dimostra che il dato sia
> non leggibile.** Il PUSH risolve: se il box **invia** spontaneamente un `what`, quel dato è
> **provabilmente leggibile** — e cattura anche i **transitori** che cadono tra due passate
> PULL. Per una conclusione affidabile servono comunque più stati (motore freddo/caldo, in
> marcia, retromarcia, luci/porte aperte, dopo rifornimento).

## Architettura
- **PULL universale**: `CarInfo.instance().get(int what, int arg, Object def)` sceglie
  `getInt/getFloat/getString/getBundle` dal **tipo runtime del `def`**; se `!isConnected()`
  o `RemoteException` ritorna `def`. Bypassa l'iscrizione alle classi → raggiunge ogni `what`.
- **PUSH**: callback unico `CarInfo$Callback.onCarInfoDataChanged(int what, Object value,
  int unit)`. C'è **un solo** callback registrabile (`CarInfo.mCallback`), ed è l'app
  (`CarInfoManager`) → il monitor **deriva** da lì: `CarInfoManager` inoltra ogni evento a
  `DebugLog.onPush`.
- **Enumerazione via reflection** (per il PULL): ~2271 costanti `what` in 21 classi annidate
  di `com.spd.carinfo.CarInfo`, nomi non offuscati → `Class.forName` + `getDeclaredFields` +
  `getInt(null)`, filtrando `getType()==Integer.TYPE && Modifier.isStatic`.
- **Scansione indicizzata** `arg=0..5` (sedili/ruote/porte/zone/finestrini/camere); `arg=0`
  = valore globale.
- **Criterio "valore plausibile"** (solo per il PULL, per non salvare migliaia di zeri):
  tiene un `what` se `int!=0` (e non semplice **eco** dell'indice `arg`, es. what
  190000-190003), oppure `float!=0.0`, oppure stringa non vuota/`"NA"`/`"0"`, oppure
  **Bundle non vuoto**. Il PUSH invece è accettato comunque (l'arrivo stesso è il segnale).
- **Upsert in `ConcurrentHashMap sMap`**, chiave `"NAME what=X [arg=Y]"`: PULL e PUSH
  scrivono nella **stessa** mappa con la **stessa** chiave → **dedup PUSH+PULL**.
  `ConcurrentHashMap` perché vi scrivono **due thread** (monitor + thread binder del
  callback). Conseguenza: **ordine righe non garantito** (stabile tra refresh).
- **Mappa nomi `sNames`** (`what` Integer → nome-costante), popolata dallo sweep PULL:
  consente a `onPush` di costruire la **stessa chiave** del PULL (quindi la fusione).

## File modificati (5) — stato attuale

### 1. `com/spd/xhsntg/DebugLog.smali`
- Campi: `sMap` + `sNames` (`ConcurrentHashMap`, thread-safe, persistenti per la vita del
  processo), `sBusy` (un thread monitor è vivo → evita doppioni), `sRunning` (il monitor
  deve continuare), `sArg` (indice arg corrente), `sText`/`sScroll` (UI).
- `dumpAll()`: avvio/ri-arma idempotente. `sRunning=true`, crea `sMap` e `sNames` una volta
  sola, avvia `Thread(DumpTask mMode=0)` **solo se** `sBusy==false`.
- `stop()`: `sRunning=false`. Agganciato **solo** a `FullscreenActivity.onDestroy` (file 5).
- `probe(CarInfo, String name, int what)V` (PULL): legge int/float/string/bundle con `sArg`,
  criterio plausibile + anti-eco, e in caso di keep `sMap.put(key, riga)`. `.locals 13`.
- `onPush(int what, Object value, int unit)V` (PUSH): se `sRunning` e il nome del `what` è
  già noto (`sNames`), fa upsert in `sMap` con chiave identica al PULL globale → dedup.
  Gira sul **thread binder** del callback. `.locals 4`.
- `snapshot(Z)Ljava/lang/String;`: header + `sMap.values()` + `elementi rilevati=<size>`.
- `writeFileOverwrite(String)`: `FileWriter(file, false)` = **sovrascrittura**, try/catchall.
- `createView(Context)`: ScrollView nero + TextView bianca (hint iniziale).

### 2. `com/spd/xhsntg/DebugLog$DumpTask.smali`
- `implements Runnable`. Field `mMode:I`, `mText:String`. `names()` = 21 nomi-classe.
- `run()`:
  - `mMode==0` → monitor background: `sBusy=true`, loop `while(sRunning)`: passata PULL
    completa (classi × campi × arg 0..5, ogni costante → `probe`; e **popola `sNames`**
    what→nome), poi `snapshot()` → `writeFileOverwrite()` → update UI `sText.post(new
    DumpTask(1, testo))` → `Thread.sleep(~3s)` → ripete. All'uscita `sBusy=false`.
  - `mMode==1` → applica `mText` a `sText` + `fullScroll` (main thread). `.locals 15`.
- Costo PULL: ~54.000 chiamate binder per passata (≈2271 campi × 6 arg × 4 letture), ogni
  ~3 s. Gira su `Thread`, **mai** sul main thread (niente ANR).

### 3. `com/spd/xhsntg/CarInfoManager.smali` — sorgente PUSH
- `init()`: registrazione PUSH **allargata da 4 a 19 classi** (tutte quelle con `CLASS_NAME`)
  → il box può notificare qualunque parametro. `.locals 4`. (NB: `Battery.CLASS_NAME` ha un
  valore errato a monte che duplica `Wipers` → registrazione innocua.)
- `onCarInfoDataChanged(int what, Object value, int unit)`: prima del proprio switch,
  **inoltra ogni evento** con `invoke-static DebugLog->onPush(what, value, unit)`. `onPush`
  è no-op se il monitor non gira, quindi il costo a monitor spento è trascurabile.

### 4. `com/spd/xhsntg/FullscreenActivity$1.smali` — TRIGGER (avvio)
- `onPageSelected(I)`: se `position==2` (pagina debug, indice shiftato dopo la rimozione
  delle pagine porte e sensori) → `DebugLog.dumpAll()`. **Non** si ferma cambiando pagina.

### 5. `com/spd/xhsntg/FullscreenActivity.smali` — STOP (chiusura app)
- `onDestroy()`: `DebugLog.stop()`. Unico punto d'arresto → il monitor gira attraverso i
  cambi pagina e si ferma solo alla chiusura reale dell'app (o alla morte del processo).

## Ciclo di vita
| Evento | Effetto |
|---|---|
| Apertura pagina debug (indice 2) | avvia il monitor (idempotente); da qui il PUSH accumula |
| Cambio pagina | **continua** in background (PULL + PUSH) |
| Chiusura app (`onDestroy`) | **stop** (`sRunning=false`, il thread esce) |

`sMap`/`sNames` persistono finché vive il processo: uscendo/rientrando nella pagina i dati
raccolti non si perdono. Reset = riavvio dell'app.

## Trappole smali gestite
1. **Niente `.local`/`.end local`** riusando registri tra branch → solo `.locals N`.
2. **Verifier Dalvik**: una reg letta in un handler `.catch` (es. `cn`/v14) va assegnata
   **prima** del `:try_start` → `aget-object v14` è fuori dal try.
3. **invoke non-range** → registri `<16`. `probe` `.locals 13` (param `p0..p2 = v13..v15`),
   `run()` `.locals 15` (`p0 = v15`), `onPush` `.locals 4`.
4. Commenti smali con `#`, mai `.line <testo>` (`.line` vuole solo un numero).
5. `Thread.sleep(J)` in `try/catch InterruptedException`; `const-wide/16 v5, 0xbb8` = 3000 ms.
6. `fullScroll(0x82)` = `View.FOCUS_DOWN` (130).
7. `put/values/size/get` chiamati su `Ljava/util/concurrent/ConcurrentHashMap;`.
8. **Concorrenza**: `sMap`/`sNames` scritti da due thread → devono essere `ConcurrentHashMap`
   (mai `LinkedHashMap`/`HashMap` semplici, che si corromperebbero).

## Validazione
- **Statica** sui 5 file: `.method/.end method`, label, `try_start/try_end`, registri `<16` → OK.
- **Build reale (2026-07-09)**: `apktool b` assembla `classes.dex` senza errori (⇒ smali valido),
  zipalign + firma v2+v3 verificata, e la ri-decodifica dell'APK compilato (round-trip) riesce
  (⇒ DEX strutturalmente valido). **Manca solo** la verifica DEX di ART + il comportamento a
  runtime, che si controllano installando sulla testata.

## Passi sul PC di build
```sh
# dalla root del progetto (dove c'è compile_sign_align.sh)
./compile_sign_align.sh    # pulizia cache + apktool b + zipalign + firma v2+v3 (uber-apk-signer)
```

## Verifica post-build
1. Installa l'APK sulla testata.
2. A quadro acceso, apri l'app e vai alla **pagina debug (indice 2, la 3ª)**: parte il
   monitor. Puoi poi cambiare pagina / guidare: continua a girare (PULL + PUSH).
3. **Aziona** i comandi da testare (luci, marce, frecce, clima…): compaiono nel file appena
   il box li notifica (PUSH) o li espone al PULL.
4. Copia `Download/ntg_carinfo_log.txt` e controlla:
   - `connected=true` (se `false` → CarInfo non connesso);
   - le righe presenti = parametri leggibili dal box su questa Audi. Le righe con `push=` sono
     quelle **notificate** dal box: la prova più forte di leggibilità.
5. Ripeti in stati diversi (motore caldo, in marcia, retro, luci) per completare la mappa.
6. Chiudi l'app per fermare il monitor.

## Formato del file
```
=== NTG_062 CarInfo LIVE monitor ===
connected=true
criterio: monitor continuo. Ogni what+arg con valore PLAUSIBILE ... arg 0..5.

ENGINE_TACHOMETER what=100042 int=640 float=- str=- bundle=-
TOTAL_RECHARGE_MILEAGE what=100013 int=- float=- str=- bundle=Bundle[{unit=0, value=220412}]
TEMPERATURE what=30006 int=- float=- str=- bundle=Bundle[{max=30.5, min=16.0, step=0.5, unit=0, value=23.0}]
TURN_SIGNAL_LAMP what=140058 push=1 unit=0      <- riga da PUSH (notificata dal box)
CANBOX_VERSION what=10004 int=- float=- str=YT-A4Q5-GD-Hx V212,... bundle=-

elementi rilevati=NN
```
Le righe `int=/float=/str=/bundle=` vengono dal PULL; le righe `push=… unit=…` dal PUSH
(stesso `what` → una sola voce, aggiornata dall'ultima sorgente).

## Possibili aggiustamenti
- **Carico**: ~54k chiamate binder ogni ~3 s (PULL) + il flusso PUSH, finché l'app è aperta.
  Se pesa: alzare l'intervallo (`const-wide/16 v5` in `DumpTask.run`) o ridurre `arg` a `0..0`
  per le classi non indicizzate.
- **Registrazione PUSH a 19 classi sempre attiva**: più IPC anche in uso normale. Accettabile
  in build di debug; per una build "pulita" si potrebbe registrare largo solo mentre il
  monitor gira.
- **Ordine righe non garantito** (`ConcurrentHashMap`): se serve un file ordinato, ordinare le
  chiavi in `snapshot` prima di scrivere.
- **Reset accumulo senza riavvio app**: non c'è; si potrebbe agganciare `sMap.clear()` +
  `sNames.clear()` a un gesto sulla pagina debug.
