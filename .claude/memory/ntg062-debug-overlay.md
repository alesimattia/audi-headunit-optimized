---
name: ntg062-debug-overlay
description: NTG_062 — pagina diagnostica custom DebugLog (smali) che dumpa i what CarInfo leggibili in Download; monitor CONTINUO PULL+PUSH con due file (mappa dedup + log eventi timestampato), Bundle-array espansi e min/max
metadata:
  type: reference
---

Pagina diagnostica custom aggiunta al progetto (NON nell'APK originale). Classe `com.spd.xhsntg.DebugLog` + inner `DebugLog$DumpTask`, esistono **solo in smali** (`NTG_062_src/apktool/smali/com/spd/xhsntg/DebugLog*.smali`) — niente sorgente jadx in `java/`. Si modifica e si ricompila da lì (vedi [[ntg062-modding-build]]).

## ARCHITETTURA ATTUALE — monitor continuo PULL+PUSH, 2 file (compilato 2026-07-13; test runtime in auto da fare)
`DebugLog` è un **monitor continuo** che fonde PULL+PUSH nella STESSA `sMap` deduplicata (chiave `"NAME what=X [arg=Y]"`), riscritta in sovrascrittura ogni ciclo (bounded). Produce **due file** in `Download/`:
- **`carinfo_readable_dedup.log`** — mappa dedup (stato corrente per what+arg). Sovrascritto ogni ciclo.
- **`carinfo_events_append.log`** — log APPEND-only degli eventi PUSH con timestamp `HH:mm:ss.SSS` (helper `writeEvent`, `FileWriter(append)`). Azzerato a ogni avvio monitor (flag `sEventFresh`: il primo write sovrascrive, poi append). Cattura la **SEQUENZA temporale** dei transitori (freccia/retro/freni) → prova semantica/polarità.

**Rinomina file (2026-07-15)**: i 3 log sono stati rinominati nei sorgenti — `ntg_carinfo_log.txt`→`carinfo_readable_dedup.log`, `ntg_carinfo_events.txt`→`carinfo_events_append.log`, e il logcat-mirror `NtgLog` `NTG_062_log.log`→`carinfo_logcat.log`. Effetto solo dopo ricompilazione; i dump già su disco/repo col vecchio nome sono pre-rinomina.

- **PULL** (thread bg, loop `while(sRunning)` ~3s): per ogni what×arg(0..5) → `probe` → upsert in `sMap` se "plausibile" (int!=0 non-eco / float!=0 / str non vuota·NA·0 / Bundle non vuoto). Popola `sNames` (what→NAME) per il PUSH. **Bundle espansi** via helper `bundleStr` (int[]/float[]/Object[] → `Arrays.toString`, NON più `[I@hash` di `Bundle.toString`): emergono livelli radar e cataloghi `ALL_MAKE/ALL_MODEL/ALL_CANBOX` (names[]/values[]). Righe numeriche: suffisso **` min=<min> max=<max>`** via helper `minMaxStr`+mappa `sNum` (intervallo su tutta la sessione, non solo ultimo valore).
- **PUSH** (thread binder): `CarInfoManager.init` registra **tutte le 19 classi** con `CLASS_NAME`; `onCarInfoDataChanged(what,val,unit)` inoltra OGNI evento a `DebugLog.onPush`. `onPush` **espande i Bundle** (bundleStr), aggiunge timestamp e scrive SEMPRE l'evento nel file eventi; fa dedup in `sMap` (chiave identica al PULL) **solo se il nome è noto** (in `sNames`) — un PUSH precoce con nome ignoto NON è perso (finisce nel log eventi con label `?`). Righe push marcate `push=<val> unit=<u>`.

**Campi `DebugLog`**: `sMap`+`sNames`+`sNum` = **`ConcurrentHashMap`** (scrivono 2 thread: monitor + binder → obbligatorio, mai LinkedHashMap/HashMap). `sNum` = chiave→`float[2]{min,max}`. `sRunning` (deve girare), `sBusy` (anti-doppio-thread), `sArg` (indice arg), `sEventFile` (File, private), `sEventFresh` (Z, true a `dumpAll`). `sMap`/`sNames`/`sNum` persistono per la vita del processo (reset = riavvio app; **ordine righe non garantito**).
**Ciclo di vita**: avvio `dumpAll()` da `FullscreenActivity$1.onPageSelected` all'ingresso pagina debug (**indice 2**); **NON** si ferma al cambio pagina; stop = `DebugLog.stop()` da `FullscreenActivity.onDestroy`. Intervallo = `const-wide/16 v5, 0xbb8` (3000 ms) in `DumpTask.run`.
**Metodi/`.locals`**: `probe(CarInfo,String,int)V` locals13 (v0 ex-sArg riusato per il float min/max prima del `\n`); `onPush(I,Object,I)V` **locals8**; `bundleStr(Bundle)String` locals6; `writeEvent(String)V` locals5 (try/catchall); `minMaxStr(String,F)String` locals5; `snapshot(Z)String`; `run()` locals15. (10 metodi totali in DebugLog.smali.)
**Nota epistemica (importante)**: il PULL ritorna `0` sia per "decodificato=0" sia per "non decodificato" → **un `0` NON prova non-leggibilità**. Il PUSH è autoritativo: what **notificato** = provabilmente leggibile, e cattura i **transitori** tra due passate PULL. Mappa completa → più stati (motore freddo/caldo, in marcia, retro, luci/porte).
**File toccati (5)**: `DebugLog.smali` (le 3 feature — array/eventi/min-max — sono tutte qui), `DebugLog$DumpTask.smali`, `CarInfoManager.smali` (init 4→19 + forward), `FullscreenActivity$1.smali` (start), `FullscreenActivity.smali` (stop). Handoff: **`IMPLEMENTAZIONE_DUMP_CARINFO.md`** (root, descrive la versione precedente a 1 file — da riallineare). **Compilato 2026-07-13** via `./compile_sign_align.sh`: `apktool b` OK (smali valido) + firma v2+v3 + round-trip OK → `NTG_062_audi_it.apk`; resta il test a runtime sulla testata (verifica ART/comportamento).

> Le sezioni sotto (one-shot, P1–P5) sono la **storia** dell'evoluzione del criterio/`probe`: la meccanica di lettura (`probe`, sentinelle, reflection 21 classi, Bundle) resta valida, ma il flusso **one-shot + `LinkedHashMap`** è **superato** dal monitor PULL+PUSH sopra.

**Cosa fa (STORICO one-shot, superato)**: al `onPageSelected` della pagina debug ([[ntg062-slider]]), `DebugLog.dumpAll()` lancia un `Thread` background (`DumpTask` mMode=0). Il task:
1. `names()` elenca ~21 nomi-classe (`com.spd.carinfo.CarInfo` + classi annidate: Instruments, ReverseAndAVM, AirCondition, Doors, Vehicles, Battery, …).
2. Per ogni classe, reflection `getDeclaredFields()` → tiene solo i `static int` (sono i `what`).
3. Per ogni `what` chiama `DebugLog.probe(sb, ci, name, what)`.
4. Scrive il risultato **una volta in sovrascrittura** in `Download/carinfo_readable_dedup.log` (`writeFileOverwrite`), poi aggiorna la TextView sul main thread (mMode=1 via `View.post`).
- Flag anti-rientro `sRunning`. Vista = ScrollView nero + TextView bianca (`createView`, agganciata in `MyViewPageAdapter.<init>`).

**`probe()` — lettura PULL on-demand** (non push): per ogni `what` chiama `CarInfo.get(what, 0, default)` con default-sentinella diversi per tipo e tiene la riga se ALMENO un tipo dà valore utile:
- int → default `Integer.MIN_VALUE`; keep se `!=MIN && !=0`
- float → default `NaN`; keep se `!isNaN && !=0`
- string → default `"NA"`; keep se non null/vuota/`"NA"`/`"0"`
- **bundle → default `new Bundle()`; keep se è davvero un Bundle con `size()>0`** (size() forza l'unparcel del binder; si dumpa con `Bundle.toString()`)
- Riga: `NAME what=<dec> int=.. float=.. str=.. bundle=..` (campo non utile = `-`).
- **Perché `get` non lancia ClassCastException** provando 4 tipi sullo stesso what: `CarInfo.get(what,arg,default)` ritorna il **default tipizzato** quando il tipo non combacia, non il valore nativo. Quindi un what bundle-typed letto come int torna `MIN_VALUE` (scartato) e come Bundle torna il bundle vero.

**Estensione Bundle (giugno 2026)**: aggiunta perché il dump originale leggeva solo int/float/string e **saltava i Bundle** → mileage (`TOTAL_RECHARGE_MILEAGE` 100013) e porte (`Doors.OPENED` 50001) risultavano falsamente "assenti" (vedi [[ntg062-carinfo-data]]). 4 edit in `DebugLog.smali`/`DumpTask.smali`: stringa criterio, lettura bundle in `probe`, `if-nez v11` nel keep-check, colonna `bundle=` nella riga. Registri liberi v9 (bundle) / v10 (scratch) / v11 (keepBundle), `.locals 12` invariato. Costo: +1 chiamata binder per field (~+2300), trascurabile su thread bg one-shot.

**Caveat**: richiede permesso storage per il file (il try/catchall fa sì che, se negato, il dump resti comunque a schermo). È una build `_debug`, da non lasciare nell'APK finale di produzione.

## Massimizzazione estrazione (giugno 2026, workflow `canbox-logger-maximize`)
Discovery esaustiva (4 lettori paralleli + sintesi) → confermato che le 21 classi hardcoded **coincidono al 100%** con le classi annidate di `CarInfo` (0 mancanti) e che tutti i `what` sono `static int` (nessun long/double). Quindi NON serve enumerazione dinamica né altri tipi. Applicate 3 modifiche (verificate da 2 review smali avversariali — assembla + semantica OK):
- **P1 — rimossi i filtri "scarta zero"** in `probe()`: keepInt era `!=MIN && !=0`, keepFloat `!isNaN && !=0.0`, keepStr escludeva `"0"`. Ora si tiene su **sola sentinella** (MIN_VALUE/NaN/"NA"/bundle-vuoto) → si recuperano i **valori 0 reali** (velocità a fermo, giri spenti, sterzo dritto, marcia P, temp 0). Le sentinelle restano per distinguere "non disponibile". ⚠️ **SUPERATO da P5 (2026-07-08)**: P1 rendeva il log enorme (~13.600 righe / 1 MB) perché il box risponde 0 su migliaia di `what`; l'utente ha chiesto una **mappa di leggibilità**, non i valori 0. Vedi sotto.
- **P3 — loop `arg=0..5`**: `arg` di `get()` non è più fisso a 0 ma viene da un nuovo campo statico `DebugLog.sArg`, che `DumpTask.run()` imposta in un loop 0..5 (riusa il registro v11 del Field, ormai morto dopo `getName()`). Cattura i dati **indicizzati**: sedili, ruote (TIRE_PRESSURE), porte, zone HVAC, finestrini, camere/radar AVM. La riga stampa `arg=N` solo se N>0 (le righe globali arg=0 mantengono il formato originale).
- **P2 — `try/catch Throwable` attorno alla chiamata `probe()`** in `run()`: un singolo `what` che lancia (es. ClassCastException da tipo inatteso) salta solo quell'arg, non aborta più l'intero dump. (La RemoteException è già gestita dentro `CarInfo.get()`.)
- Footer/criterio rietichettati: `what scansionati=` + `righe tenute (what+arg)=` (ora `tenute` conta righe what×arg, può superare i what).

## P5 — criterio "valore PLAUSIBILE" (2026-07-08, supera P1)
Obiettivo utente: **NON** valori live, solo sapere **se un parametro è leggibile** perché ha un valore plausibile (non default/zero). Il criterio P1 (tieni tutto ciò che è "presente", zeri inclusi) floodava il log. Modifica confinata a `probe()` di `DebugLog.smali` + stringa `criterio` in `DumpTask.smali` (2 file, `.locals 12` invariato, nessuna invoke fuori range). Nuovo keep:
- **keepInt** = presente (`!=MIN_VALUE`) **&& `!=0`** **&& non-eco**. Anti-eco = con `sArg>0` scarto `iv==sArg`: alcuni `what` (es. **190000-190003** = `OFFSET`/`RELEASE_AUDIO_FOCUS`/`REQUEST_AUDIO_FOCUS`/`RUI_POWER_MODE`, classe `Other`) riflettono solo l'indice `arg` passato, non sono dati del box → falsi positivi eliminati. Implementato con label extra `:cond_int_keep` (arg=0 salta il check eco).
- **keepFloat** = `!isNaN && fv!=0.0` (confronto via `cmpl-float v7,v3,v7` con v7=0.0f, `if-eqz`).
- **keepStr** = non null, `!="NA"`, len>0, **`!="0"`** (ri-aggiunto il filtro `"0"` che P1 aveva tolto).
- **bundle**: invariato (keep se size>0). Sono ~20 chiavi → niente flood; la plausibilità del contenuto si valuta a occhio sul `toString` (es. `TOTAL_RECHARGE_MILEAGE value=220412` plausibile vs `AVERAGE_FUEL value=0.0`/BENZ all-zero no). Non filtrato in smali perché iterare/valutare i valori del Bundle è complesso e il volume è basso.
- Effetto: ~13.600 → ~un centinaio di righe. Trade-off accettato dall'utente: un parametro **realmente 0** nello stato del dump **non compare** (0 non distinguibile da "non supportato"). Per mappa completa → ri-aprire la pagina debug (overwrite) in stati diversi: motore caldo/in moto, retromarcia, porte/luci aperte. Un `what` che compare in **almeno un** dump = leggibile.
- Stato: **staged, NON compilato** (regola: chiedere prima di compilare; mai su PC-030). Verificata solo staticamente (label bilanciate, reg <16).

**doNotDo (deciso, non fare)**: NON sostituire la lista hardcoded con `getDeclaredClasses()` (0 guadagno, rischio classi spurie); NON correggere il bug `Battery.CLASS_NAME` (riga 363 di CarInfo.java, copia-incolla da Wipers) né `Base` senza CLASS_NAME → **non impattano il logger** (usa i nomi field via reflection, non le costanti String); NON aggiungere getBoolean/getLong/getList (l'AIDL espone solo int/float/string/bundle); NON decodificare bitfield/enum nello smali (si fa a posteriori sul file txt).

**P4 — frontiera nuova NON ancora implementata (ma più fattibile del previsto)**: `IDVRService.getReverseInfo()` ritorna un Parcelable `ReverseAVMInfo` con dati assenti dai `what` CarInfo. Fattibilità confermata leggendo i sorgenti:
- L'AIDL **è già compilato nell'app**: `com/spd/dvr/aidl/IDVRService.java` (`getReverseInfo()` = `TRANSACTION_getReverseInfo` 22) + `com/spd/dvr/entity/aidl/ReverseAVMInfo.java`. Il proxy binder esiste già.
- Il bind è già fatto da `DvrHelper.java:170` → `Intent("com.spd.service.dvrservice").setPackage("com.spd.dvr")`. Quindi il path di bind è collaudato nell'app stessa (per il preview video) → il servizio è verosimilmente bindabile anche per `getReverseInfo`.
- `ReverseAVMInfo` ha **campi pubblici** (leggibili con `iget` diretto, niente getter): `angle`, `frontRadarValue[]`/`rearRadarValue[]`/`leftRadarValue[]`/`rightRadarValue[]` + `*RadarNum/MaxLevel/DispMode/Enable`, `doorFrontLeft/FrontRight/RearLeft/RearRight/Hood/Trunk`, `reverse`, `autoParkActive/Hints`, `lightState`, `cameraExist[]`, `brightness/contrast/hue/lvdsformat`, `avmEnable/avmHwSupport`.
- **Diagnosi pre-implementazione (richiesta dall'utente)**: serve `adb` su testata collegata (USB debug o `adb connect <ip>:5555`). `adb` installato sul Mac il 2026-06-25 (`brew install --cask android-platform-tools`). Comandi: `dumpsys package com.spd.dvr | grep -iA5 dvrservice` (esiste/esportato), `cmd package resolve-service -a com.spd.service.dvrservice`, e in retromarcia `logcat | grep -iE "dvr|reverse|avm|radar"`. La testata NON era collegata al Mac al momento (è in auto) → diagnosi da eseguire quando connessa.

Altre sorgenti minori: temp batteria via sticky `ACTION_BATTERY_CHANGED`, chiavi `SETTING_AVM_*` in Settings.System. Vedi [[ntg062-architecture-ipc]].
