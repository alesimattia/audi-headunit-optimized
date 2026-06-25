---
name: ntg062-architecture-ipc
description: NTG_062 — architettura IPC: l'app e un thin-client/launcher che orchestra una costellazione di componenti SPD esterni (carinfo, dvr, aircondition+AVM, carinfo.ui, SpdManager, app navi); mappa completa + capacita non sfruttate (AVM/radar parcheggio, HVAC) + chiavi Settings.System
metadata:
  type: reference
---

**Tesi**: `com.spd.xhsntg` **NON contiene logica di dominio propria**: dichiara SOLO 1 activity (`FullscreenActivity`) + 1 receiver (`ReverseBroadcast`), **zero service/provider**. E un **thin-client/overlay** che orchestra via AIDL/intent/broadcast/`Settings.System` una **costellazione di componenti SPD esterni** (firmware vendor cinese preinstallato sulla testata). Single dex, package `com/spd/{car,carinfo,dvr,view,xhsntg}` (no `com/spd/system`, no `com/spd/navi` dopo la rimozione). Tutta la telemetria, il video e i comandi auto arrivano da fuori → sotto **Strada C** (no privilegi sistema, vedi [[ntg062-overview]]) molti di questi binding possono fallire. Identita/firma in [[ntg062-overview]].

## Componenti esterni a cui l'app SI collega davvero
- **CarInfo service** (telemetria CAN): `bindService(Intent("com.spd.carinfo.service").setPackage("com.spd.carinfo"))`. AIDL `ICarInfoAidlInterface` (desc `com.spd.carinfo.ICarInfoAidlInterface`) + callback `ICarInfoAidlCallback`. `CarInfoManager.init` registra 5 classi: `Doors`, `ReverseAndAVM`, `General`, `Instruments`, `Vehicles`. PUSH+PULL. Dettaglio what-codes in [[ntg062-carinfo-data]].
- **DVR service** (video/AVM/retro/LVDS): `startService`+`bindService(Intent("com.spd.service.dvrservice").setPackage("com.spd.dvr"))`, client registrato come **`com.spd.spddvr`**. AIDL `IDVRService` (desc `com.spd.dvr.aidl.IDVRService`), auto-rebind con `linkToDeath`. L'app usa SOLO preview canale 0 + (potenziale) gestione file. Vedi [[ntg062-dvr-tuning]] e la sezione AVM sotto.
- **SpdManager** = `com.spd.system.service.SpdManager` — **SDK di PIATTAFORMA del vendor, NON impacchettato** nell'APK (risolto a runtime dal framework di sistema; richiede privilegi system → rischio Strada C). Usato da:
  - `SpdManager.getInstance(ctx).setSystemCmd(5, value, 1)` → **cmd 5 = luminosita schermo** (CarKeyView manopola destra). Altri cmd ignoti.
  - `new SpdManager(appCtx).enterSource("com.spd.xhsntg|com.spd.ntg.ACTION")` ad ogni `onResume` → si registra come **sorgente audio/media** nel sistema. (NB: `enterSource` esiste ANCHE su `IDVRService` — concetto diverso, arbitraggio sorgente DVR.)
  - `requestAudioFocus(pkg, 3, 16)` / `releaseAudioFocus(pkg, 3)` — `3` = AUDIO_MODE_NAVI_AUDIO.
- **App navi esterne** (`com.autonavi.amapauto` AMap, `com.tencent.wecarnavi` WeCar) via `SETTING_NAVI_APP` + widget broadcast. **Rimosse** nella build modificata. Dettaglio in [[ntg062-navigation]].
- **Settings UI vendor**: `Intent("com.spd.action.settingui")` extra `index` (10000 = selettore navi).
- **Trigger d'ingresso**: oltre a MAIN/LAUNCHER, l'activity risponde all'action **`com.spd.ntg.ACTION`** (cosi altri moduli SPD la lanciano; es. `ReverseBroadcast.startNTG` la porta in primo piano in retromarcia con extra `reverse`).

## Capacita LATENTI non sfruttate (helper SDK presenti ma MAI chiamati dall'app)
Sono metodi `static` in `com.spd.carinfo.CarInfo` (l'SDK) — definiti, **0 invocazioni** in `com/spd/{xhsntg,view,car}`. Sono il contratto-intent verso altre app SPD → utili per **aggiungere funzionalita** (obiettivo progetto) lanciando i moduli gia presenti sulla testata:
- **`com.spd.aircondition`** = app **HVAC + UI flottante AVM** (clima + 360°):
  - `startAirConditionActivity` → `ACTION_ACTIVITY` (apre schermata clima)
  - `startAirConditionService(type)` → `ACTION_SERVICE` (startService, extra `type`)
  - `openAirFloatButton(bool)` → broadcast `ACTION_FLOAT_BUTTON` (extra `value`)
  - `openAvmFloatButton(bool)` → broadcast `ACTION_FLOAT_AVM` → **mostra/nasconde il bottone flottante AVM (vista 360°)**
  - `setAirWindowEnabled(bool)` → `ACTION_FLOAT_WINDOW` (finestra clima flottante)
  - `setDoorWindowEnabled(bool)` → `ACTION_FLOAT_DOOR` (finestra stato-porte flottante)
  - tutti `setPackage("com.spd.aircondition")`, action prefisso `com.spd.aircondition.`
- **`com.spd.carinfo.ui`** = app **UI CarInfo autonoma**: `startCarInfoUi(ctx[, type])` → `ACTION_ACTIVITY` `setPackage("com.spd.carinfo.ui")`.

## Sottosistema AVM / assistenza-parcheggio (sul DVR service, UNTAPPED qui)
Metodi su `IDVRService` **NON wrappati** da `DvrHelper` → per usarli bisogna aggiungere wrapper in `DvrHelper`. E la **sorgente piu ricca di parametri-auto extra senza l'AIDL CAN** (obiettivo "leggere ulteriori parametri auto"), MA dipende dall'hardware (`avmHwSupport`, `cameraExist[8]`): su Audi senza box-AVM/360 sara `avmEnable=0`.
- `getReverseInfo()` → **`ReverseAVMInfo`** (Parcelable `com.spd.dvr.entity.aidl`), struct ricca: **radar ultrasuoni a 4 lati** (front/rear/left/right: `*RadarNum/MaxLevel/Value[]/DispMode/Enable`), `avmEnable`/`avmHwSupport`, `csi0Mode`/`csi1Mode` (modalita interfacce camera), `staticLine`/`dynamicLine` (linee guida), `reverse`/`frontCamera`, `turnDirection`, **`autoParkActive`/`autoParkHints`** (parcheggio automatico), **tutte le 6 porte** (FL/FR/RL/RR/trunk/hood), `lightState`, `mirror`, `speed`/`angle`, immagine `brightness/contrast/saturation/hue/sharp`, parametri **LVDS** (`lvdsformat/lvds_pkt_delay/lvds_switch/lvds_brightness/lvds_contrast/lvds_mode`), `carInfoAvm`.
- `registerReverseInfoCallback(name, IReverseInfoCallback)` / `unregisterReverseInfoCallback` — callback `onReverseInfoChange(int)` (PUSH stato retro).
- `get/setAvmConfigParam(stringKey, int)` — leggi/scrivi le chiavi `SETTING_AVM_*` via servizio.
- **Car-model PAY/licenza**: `getCarModelPayStatus(int)` / `sendCarModelPayCommand(int,int,int)` / `regCarModelPayCallback(ICarModelPayCallback{onModelStatusChanged(int,Bundle)})` → i **modelli 3D dell'auto per la vista AVM sono contenuto a pagamento/licenziato**.

## Inventario completo chiavi Settings.System (tabella `system`, serve WRITE_SETTINGS — dichiarato)
- `SETTING_BENZ_CAR_TYPE` — tipo carrozzeria per immagini porte (vedi [[ntg062-cardoor-images]]); fissato a 2 nello smali.
- `SETTING_NTG_FULL_SCREEN` — `0` = split (pager + preview a larghezza per-risoluzione), `1` = preview a tutto schermo. Letto da `FullscreenActivity` (`m_show_preview_mode`).
- `screen_brightness` — letto da CarKeyView (manopola destra), poi scritto via `SpdManager.setSystemCmd(5,...)`.
- **Pannello LVDS nascosto** (`LvdsTestView`, layout `test_layout.xml`): `SETTING_PKT_DELAY_HI`/`SETTING_PKT_DELAY_LOW` (range **-1..255**, -1 = off; timing pacchetti/pixel-clock LVDS del display bypassato), `SETTING_AVM_LVDS_BRIGHTNESS` (0..255, def **128**), `SETTING_AVM_LVDS_CONTRAST` (-100..100, def **0**). 4 campi numerici con ±/reset → calibrazione del **video bypass LVDS** (canale 0, vedi [[ntg062-dvr-tuning]]). Sblocco = long-press 3s sul preview, ora sempre abilitato (vedi [[ntg062-slider]]).
- **Famiglia `SETTING_AVM_*`** (costanti in `com.spd.dvr.utils.DataUtil`, usate dall'app AVM esterna): `SETTING_AVM_2D_3D_SWTICH_MODE` (**typo `SWTICH` nella chiave vera**, da copiare esatto), `SETTING_AVM_BOOT_LOOK_AROUND`, `SETTING_AVM_CAR_MODEL_SHAPE`/`_COLOR`/`_NON_BLACK_BOTTOM`, `SETTING_AVM_CAR_PLATE_NUMBER`/`_BG_COLOR`/`_FONT_COLOR`, `SETTING_AVM_CAR_RULER`, `SETTING_AVM_LR_AND_REVERS_DATA`, `SETTING_AVM_LR_LIGHT_AUTO`/`_SPEED` (camere laterali su freccia), `SETTING_AVM_REVERSE_TIMEOUT`, `SETTING_AVM_REVERS_AUTO`, `SETTING_AVM_ALARM_LIGHT_AUTO`.
- **Originali RIMOSSE nella build modificata**: `SETTING_NAVI_APP` (era in `com/spd/navi`, vedi [[ntg062-navigation]]), `SETTING_DEVELOPER_MODE` (gate del pannello LVDS, ora bypassato).

## Identificazione box CAN + marca (com.spd.carinfo.CarModel)
`Vehicles.CURRENT_MODEL` (what 170004) ritorna un int che impacchetta nei bit alti: **CANBOX_\*** (vendor del box CAN: RAISE=0x1000000, HIWORLD, HUACHENYU, DOGEN, SIMPLE, BSJ, OUDI, XCARBUS, BINARY, XINBUSS, LUZHENG, CYT, OUTER_BOX, RSW, HANGCHUANG=Integer.MIN_VALUE) + **CAR_MAKE_\*** (40+ marche: BENZ, BMW, FORD, HONDA, BYD, CHANG_AN, GEELY, ... + pseudo-make `CAR_MAKE_AVM`/`AUDIO`/`AIR`). **Quali dati arrivino davvero dipende dal CANBOX_\* cablato** alla specifica Audi (vedi caveat in [[ntg062-carinfo-data]]).

## Arbitraggio audio/sorgente
`MEDIA_SOURCE` (what 100085): byte basso = sorgente corrente, `(val>>16)&0xff` = hasSource. Speciali: `source==7` → niente audio focus; `==16` → non rilasciare. `setAudioMode`: resume→`Instruments.CURRENT_MODE=1` (CAR), pause→`2` (NAVI) via AIDL. L'app partecipa cosi allo switch sorgenti della testata insieme a `SpdManager.requestAudioFocus`/`enterSource`.

## Nota build attuale
In `NTG_062_src/` ci sono 2 classi AGGIUNTE da Claude (NON originali): `DebugLog`/`DebugLog$DumpTask` (dump what-CarInfo, vedi `IMPLEMENTAZIONE_DUMP_CARINFO.md`) e `SystemView` (pagina Sistema Android, vedi [[ntg062-system-page]]). Stato modifiche in [[ntg062-applied-mods]].
