# Implementazione dump one-shot parametri CarInfo — handoff per la build

> Documento di passaggio: tutte le modifiche sotto sono **staged** in `NTG_062_src/`,
> **NON ancora compilate** (data lavoro: 2026-06-24). Serve per riprendere il contesto
> sul PC che compila l'APK.

## Obiettivo della funzione
Scrivere nel file `Download/ntg_carinfo_log.txt` **tutti i parametri CarInfo leggibili**
con il **valore istantaneo**, **una sola volta** (snapshot in sovrascrittura, niente
monitor live che cicla). Scopo: capire quali parametri dell'auto (Audi A5) sono
realmente monitorabili.

## Idea architetturale (perché funziona)
- PULL universale: `CarInfo.instance().get(int what, int arg, Object def)`
  ([CarInfo.smali:949](NTG_062_src/apktool/smali/com/spd/carinfo/CarInfo.smali)).
  Sceglie `getInt/getFloat/getString/getBundle` in base al **tipo runtime del `def`**;
  se `!isConnected()` o `RemoteException` ritorna `def`.
- Le ~2260 costanti `what` stanno in 20+ classi annidate di `com.spd.carinfo.CarInfo`
  con **nomi NON offuscati** → enumerabili via reflection
  (`Class.forName` + `getDeclaredFields` + `getInt(null)`, filtrando
  `getType()==Integer.TYPE && Modifier.isStatic`).
- Per ogni `what` si legge come **int** (sentinella `Integer.MIN_VALUE`), **float**
  (sentinella `NaN`), **string** (sentinella `"NA"`). La sentinella distingue
  "il servizio ha risposto 0" da "non disponibile/disconnesso".

## File modificati / creati (4)

### 1. `NTG_062_src/apktool/smali/com/spd/xhsntg/DebugLog.smali` — RISCRITTO
- **Rimossi**: metodo `add(I,Object,I)` e field statico `sBuf` + `<clinit>`
  (era l'accumulo del monitor live).
- **Aggiunti**:
  - `dumpAll()` (public static): guard anti-rientro `sRunning`, avvia un `Thread`
    con `DebugLog$DumpTask` in modo 0.
  - `probe(StringBuilder, CarInfo, String name, int what):int` (package-private):
    legge int+float+string del `what`; **filtro** = tiene solo se
    `int!=0` oppure `float!=0` oppure `stringa non vuota e !="0"`; accoda riga
    `NAME what=<dec> int=.. float=.. str=..` (con `-` per i tipi scartati);
    ritorna 1 se tenuto, 0 altrimenti.
  - `writeFileOverwrite(String)` (package-private): `FileWriter(file, false)` =
    **SOVRASCRITTURA** (un solo snapshot), tutto in `try/catchall`.
  - `createView(Context):View` invariato nello scopo ma ora mostra solo un testo-hint
    (non usa più `sBuf`).
- `sText`, `sScroll`, `sRunning` resi **package-private** (erano `private`) per accesso
  da `DumpTask`.

### 2. `NTG_062_src/apktool/smali/com/spd/xhsntg/DebugLog$DumpTask.smali` — NUOVO
- `implements Runnable`. Field `mMode:I`, `mText:String`.
- `names()` (private static): array dei 21 nomi-classe da scandire
  (`com.spd.carinfo.CarInfo` + 20 classi annidate con costanti).
- `run()`:
  - `mMode==0` → **dump in background**: header (`connected=<bool>` + criterio),
    doppio loop (classi × campi) con reflection, per ogni costante chiama
    `DebugLog.probe(...)`, footer (`scansionati=N tenuti=M`),
    `DebugLog.writeFileOverwrite(out)`, poi rimanda l'update UI con
    `sText.post(new DumpTask(1, out))`.
  - `mMode==1` → applica `mText` a `sText` + `fullScroll` (sul main thread).
- ~6800 chiamate binder (2260 × 3 letture): per questo gira su `Thread`, **mai** sul
  main thread (evita ANR).

### 3. `NTG_062_src/apktool/smali/com/spd/xhsntg/CarInfoManager.smali` — 1 RIGA RIMOSSA
- In `onCarInfoDataChanged(ILjava/lang/Object;I)V` **rimosso**
  `invoke-static {p1,p2,p3} DebugLog->add` (stop al monitor live che scriveva a ogni
  callback). `.locals 11` invariato.

### 4. `NTG_062_src/apktool/smali/com/spd/xhsntg/FullscreenActivity$1.smali` — TRIGGER
- In `onPageSelected(I)V`, prima della logica esistente:
  `if position==4 → DebugLog.dumpAll()`. La pagina debug è l'indice **4**
  (`pswitch_4` → `m_test_view_4` in `MyViewPageAdapter`). Ogni riapertura rigenera lo
  snapshot (sovrascrive).

## Trappole smali gestite (per non re-incapparci alla build)
1. **Niente `.local`/`.end local`** quando si riusano i registri tra branch → usate
   solo `.locals N` (le `.local` sono solo debug-info e davano rischio di errore).
2. **Verifier Dalvik**: una reg letta in un handler `.catch` (es. `cn`) deve essere
   assegnata **prima** del `:try_start` → spostato `aget-object v14` fuori dal try.
3. **invoke non-range** → tutti i registri devono essere `<16`. Con `.locals 12` + 4
   parametri, i param finiscono in `p0..p3 = v12..v15` (ok perché <16).
4. Commenti smali con `#`, mai con `.line <testo>` (`.line` vuole solo un numero).
5. `fullScroll(0x82)` = `View.FOCUS_DOWN` (130).

## Validazione già fatta su questo PC (NON di build)
Solo **statica** (manca un assembler smali qui): script Python che verifica
bilanciamento `.method/.end method`, risoluzione di tutte le label
(`goto`/`if-*`/`.catch`/switch) e registri `<16` nelle invoke → **tutto OK**.
L'assemblaggio reale e la verifica DEX avvengono alla build.

## PASSI DA ESEGUIRE SUL PC DI BUILD
```sh
# dalla root del progetto (dove c'e sign_align.sh)
rm -rf NTG_062_src/apktool/build          # regola di progetto: pulire la cache build
apktool b NTG_062_src/apktool             # ricompila -> dist/NTG_062.apk (o nome da apktool.yml)
./sign_align.sh                           # zipalign + firma v1/v2/v3 (debug key)
```
NB: in questo branch sono presenti anche le modifiche precedenti non ancora compilate
(package distinto `com.spd.xhsntg.audi`, minSdk 26, label "Audi functions", icona di
default, rimozione AMap punto 10). Vedi `.claude/memory/ntg062-applied-mods.md`.

## Verifica post-build
1. `aapt dump badging <apk> | grep -E "package|sdkVersion|label"`
   → `com.spd.xhsntg.audi`, `sdkVersion:'26'`, `label:'Audi functions'`.
2. Installa con `adb install <apk>` (deve installarsi affianco all'originale).
3. In auto / con quadro acceso: apri l'app, scorri fino alla **5ª pagina**.
   Parte il dump (qualche secondo). Riapri per uno snapshot fresco.
4. Copia `Download/ntg_carinfo_log.txt` e controlla:
   - `connected=true` (se `false` → CarInfo non connesso, riprova o effetto Strada C);
   - le righe `tenute` = parametri realmente monitorabili sull'Audi.

## Formato atteso del file
```
=== NTG_062 CarInfo PULL dump (one-shot) ===
connected=true
criterio: solo i what con almeno un valore non nullo (int!=0 / float!=0 / stringa non vuota)

INSTANTANEOUS_FUEL what=100002 int=72 float=7.2 str=-
COOLANT_TEMPERATURE what=100059 int=89 float=89.0 str=-
...
scansionati=2261 tenuti=37
```

## Possibili aggiustamenti se il dump non e utile
- File enorme / tutto a 0 → il servizio risponde 0 a ogni what: stringere il filtro o
  ridurre i tipi letti.
- File vuoto con `connected=false` → trigger troppo presto: spostare/duplicare il
  trigger (es. anche dopo un ritardo in `FullscreenActivity.onCreate`).
- Servono i Bundle (porte/finestrini raggruppati) → aggiungere in `probe` una 4ª
  lettura con `def = new Bundle()` e `bundle.toString()`.
