---
name: ntg062-debug-overlay
description: NTG_062 — overlay diagnostico (classe custom DebugLog in smali) che dumpa tutti i what CarInfo a schermo + file Download; ora include anche i Bundle
metadata:
  type: reference
---

Pagina diagnostica custom aggiunta al progetto (NON nell'APK originale). Classe `com.spd.xhsntg.DebugLog` + inner `DebugLog$DumpTask`, esistono **solo in smali** (`NTG_062_src/apktool/smali/com/spd/xhsntg/DebugLog*.smali`) — niente sorgente jadx in `java/`. Si modifica e si ricompila da lì (vedi [[ntg062-modding-build]]).

**Cosa fa**: al `onPageSelected` della pagina debug ([[ntg062-slider]]), `DebugLog.dumpAll()` lancia un `Thread` background (`DumpTask` mMode=0). Il task:
1. `names()` elenca ~21 nomi-classe (`com.spd.carinfo.CarInfo` + classi annidate: Instruments, ReverseAndAVM, AirCondition, Doors, Vehicles, Battery, …).
2. Per ogni classe, reflection `getDeclaredFields()` → tiene solo i `static int` (sono i `what`).
3. Per ogni `what` chiama `DebugLog.probe(sb, ci, name, what)`.
4. Scrive il risultato **una volta in sovrascrittura** in `Download/ntg_carinfo_log.txt` (`writeFileOverwrite`), poi aggiorna la TextView sul main thread (mMode=1 via `View.post`).
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
- **P1 — rimossi i filtri "scarta zero"** in `probe()`: keepInt era `!=MIN && !=0`, keepFloat `!isNaN && !=0.0`, keepStr escludeva `"0"`. Ora si tiene su **sola sentinella** (MIN_VALUE/NaN/"NA"/bundle-vuoto) → si recuperano i **valori 0 reali** (velocità a fermo, giri spenti, sterzo dritto, marcia P, temp 0). Le sentinelle restano per distinguere "non disponibile".
- **P3 — loop `arg=0..5`**: `arg` di `get()` non è più fisso a 0 ma viene da un nuovo campo statico `DebugLog.sArg`, che `DumpTask.run()` imposta in un loop 0..5 (riusa il registro v11 del Field, ormai morto dopo `getName()`). Cattura i dati **indicizzati**: sedili, ruote (TIRE_PRESSURE), porte, zone HVAC, finestrini, camere/radar AVM. La riga stampa `arg=N` solo se N>0 (le righe globali arg=0 mantengono il formato originale).
- **P2 — `try/catch Throwable` attorno alla chiamata `probe()`** in `run()`: un singolo `what` che lancia (es. ClassCastException da tipo inatteso) salta solo quell'arg, non aborta più l'intero dump. (La RemoteException è già gestita dentro `CarInfo.get()`.)
- Footer/criterio rietichettati: `what scansionati=` + `righe tenute (what+arg)=` (ora `tenute` conta righe what×arg, può superare i what).

**doNotDo (deciso, non fare)**: NON sostituire la lista hardcoded con `getDeclaredClasses()` (0 guadagno, rischio classi spurie); NON correggere il bug `Battery.CLASS_NAME` (riga 363 di CarInfo.java, copia-incolla da Wipers) né `Base` senza CLASS_NAME → **non impattano il logger** (usa i nomi field via reflection, non le costanti String); NON aggiungere getBoolean/getLong/getList (l'AIDL espone solo int/float/string/bundle); NON decodificare bitfield/enum nello smali (si fa a posteriori sul file txt).

**P4 — frontiera nuova NON ancora implementata (ma più fattibile del previsto)**: `IDVRService.getReverseInfo()` ritorna un Parcelable `ReverseAVMInfo` con dati assenti dai `what` CarInfo. Fattibilità confermata leggendo i sorgenti:
- L'AIDL **è già compilato nell'app**: `com/spd/dvr/aidl/IDVRService.java` (`getReverseInfo()` = `TRANSACTION_getReverseInfo` 22) + `com/spd/dvr/entity/aidl/ReverseAVMInfo.java`. Il proxy binder esiste già.
- Il bind è già fatto da `DvrHelper.java:170` → `Intent("com.spd.service.dvrservice").setPackage("com.spd.dvr")`. Quindi il path di bind è collaudato nell'app stessa (per il preview video) → il servizio è verosimilmente bindabile anche per `getReverseInfo`.
- `ReverseAVMInfo` ha **campi pubblici** (leggibili con `iget` diretto, niente getter): `angle`, `frontRadarValue[]`/`rearRadarValue[]`/`leftRadarValue[]`/`rightRadarValue[]` + `*RadarNum/MaxLevel/DispMode/Enable`, `doorFrontLeft/FrontRight/RearLeft/RearRight/Hood/Trunk`, `reverse`, `autoParkActive/Hints`, `lightState`, `cameraExist[]`, `brightness/contrast/hue/lvdsformat`, `avmEnable/avmHwSupport`.
- **Diagnosi pre-implementazione (richiesta dall'utente)**: serve `adb` su testata collegata (USB debug o `adb connect <ip>:5555`). `adb` installato sul Mac il 2026-06-25 (`brew install --cask android-platform-tools`). Comandi: `dumpsys package com.spd.dvr | grep -iA5 dvrservice` (esiste/esportato), `cmd package resolve-service -a com.spd.service.dvrservice`, e in retromarcia `logcat | grep -iE "dvr|reverse|avm|radar"`. La testata NON era collegata al Mac al momento (è in auto) → diagnosi da eseguire quando connessa.

Altre sorgenti minori: temp batteria via sticky `ACTION_BATTERY_CHANGED`, chiavi `SETTING_AVM_*` in Settings.System. Vedi [[ntg062-architecture-ipc]].
