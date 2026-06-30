---
name: ntg062-slider
description: NTG_062 — come funziona lo slider a pagine (ViewPager + MyViewPageAdapter), mappa pagine, flusso dati, DVR, pagina nascosta
metadata:
  type: reference
---

`FullscreenActivity` gonfia `activity_fullscreen.xml`: un `LinearLayout` orizzontale con **`ViewPager id_view_page`** (weight 1) + **`DvrPreviewSurfaceView id_preview_surface_view`** (larghezza layout **1280px** ma **sovrascritta a runtime** da `FullscreenActivity.getPreviewViewWidth()` in base alla risoluzione — 800@1280×480, 1280@1920×720, 1024@1024×600, 1200@1600×720, **pager nascosto@800×480**, oppure tutto schermo se `SETTING_NTG_FULL_SCREEN=1`; `dvr_channel=0` = bypass del display LVDS originale dell'auto; in retromarcia il canale 0 commuta su retrocamera a livello hardware/servizio, vedi [[ntg062-dvr-tuning]]) + un `LvdsTestView ldvs_test_layout` nascosto.

**LvdsTestView — sblocco long-press (MODIFICATO)**: il touch handler chiama `supportDebugLvds()`; se true, `ACTION_DOWN` programma `mHandler.sendEmptyMessageDelayed(HANDLE_LONG_CLICK=0x3e8, delay)`, `ACTION_UP/CANCEL` lo annulla (il vecchio annullamento per movimento >80px nel ramo `ACTION_MOVE` e stato RIMOSSO: ora `if-gt v5,v7 / if-le v6,v7` sostituiti da `goto :cond_a`); allo scadere `handleMessage` rende visibile la `LvdsTestView`. ⚠️ **2026-06-30 (S3 del punto 18 [[ntg062-applied-mods]])**: la `LvdsTestView` non è più inflata in `setContentView` ma **pigramente da un `ViewStub`** (`activity_fullscreen.xml`: `id ldvs_test_stub`=0x7f05005c, `inflatedId`=`ldvs_test_layout`=0x7f05003f, `layout=@layout/lvds_stub_content`). `handleMessage`: se `findViewById(ldvs_test_layout)`==null infla lo stub (`((ViewStub)findViewById(0x7f05005c)).inflate()`), poi `setVisibility(0)`; re-entrante. Originale: delay 5000ms (`0x1388`) e `supportDebugLvds()` = `Settings.System.getInt(resolver,"SETTING_DEVELOPER_MODE",0)==1`. **Ora**: `supportDebugLvds()` ritorna sempre `true` (vincolo rimosso) e delay = 3000ms (`0xbb8`). Editato sia `apktool/smali/com/spd/xhsntg/FullscreenActivity.smali` (build) sia il `.java` jadx di riferimento. NB: `SETTING_DEVELOPER_MODE` è una chiave in `Settings.System` (provider settings, tabella `system`), impostabile con `adb shell settings put system SETTING_DEVELOPER_MODE 1` o `Settings.System.putInt` (richiede WRITE_SETTINGS).

**Adapter**: `com.spd.view.MyViewPageAdapter`.
- **`getCount()` decide quante pagine** (originale = 3; ora **= 4** dopo rimozione pagine porte+sensori, vedi punti 16-17 di [[ntg062-applied-mods]]).
- `instantiateItem` usa un packed-switch (indice → view), tutte le view create nel costruttore.
- **STATO ATTUALE sorgenti (`NTG_062_src/`)** dopo: rimozione navi + pagina nera iniziale + **rimozione pagina porte (CarDoorWindowView)** + **rimozione pagina sensori/marcia (CarSensorView)** con rinumerazione 0-3. `getCount()=0x4`, packed-switch da 0x0 (suffisso campo = indice pagina):
  - **0** → `m_test_view_0` = **`android.view.View` vuota** (pagina nera: nessuno sfondo, nessuna funzionalita; appare nera perche il ViewPager ha `background=#f000`). Creata `new android/view/View(context)` nel costruttore.
  - **1** → `CarMileageSpeedView` (`m_test_view_1`) — km/velocita
  - **2** → `m_test_view_2` = debug overlay / dump what-CarInfo a schermo + file in Download (classe `DebugLog`/`DebugLog$DumpTask`; doc `IMPLEMENTAZIONE_DUMP_CARINFO.md` nella root)
  - **3** → `m_test_view_3` = pagina Sistema (vedi [[ntg062-system-page]])
- **`FullscreenActivity$1.onPageSelected`** aggiornato allo shift: debug indice **2** (`DebugLog.dumpAll`), Sistema indice **3** (`SystemView.start/stop`). Il blocco start/stop di CarSensorView è stato **rimosso**.
- **CarDoorWindowView RIMOSSA** (2026-06-29): vedi punto 16 di [[ntg062-applied-mods]] (porte/finestrini). Eliminati classe+`$1`, `carinfo_benz_car_door_layout.xml`, 15 PNG `carinfo_audi_car_door_*_02`, `MyViewPageAdapter.updateDoors`, `CarInfoManager.updateDoors`/case 0xc351/registrazione `CarInfo$Doors`, `onUpdateDoors` da Callback e FullscreenActivity. Orfani innocui: 7 id `id_car_door_*`, campi `R$*`, classe SDK `CarInfo$Doors` (serve a `DebugLog$DumpTask`).
- **CarSensorView RIMOSSA** (2026-06-29): vedi punto 17 di [[ntg062-applied-mods]]. Era la pagina che aveva sostituito CarKeyView; rimossa perche marcia/PDC non sono leggibili sull'Audi (GEAR `140080`, RADAR_DISTANCE `140016/140017` non popolati — vedi [[ntg062-carinfo-data]]). Eliminati `CarSensorView.smali`+`$1` e il relativo start/stop. `CarInfoManager` NON toccato (leggeva in PULL diretto; `ReverseAndAVM` resta registrata per la velocita).
- **navi RIMOSSA del tutto**: eliminati campi `m_navi_frame_layout`/`m_navi_manager`, package `com/spd/navi`, layout/risorse navi. I metodi adapter `initManager()`/`uninitManager()` (chiamati da `FullscreenActivity.onStart/onStop`) sono ora **no-op** (`.locals 0`, solo `return-void`). Vedi [[ntg062-navigation]] e [[ntg062-applied-mods]].
- Pagina corrente salvata in SharedPreferences file **"save"**, chiave `"page"`; ripristinata in `onCreate` (`setCurrentItem` clampa: indici shiftati di +1 per la pagina nera = nessun crash).

**Flusso dati = PUSH dal servizio CarInfo** (richiede l'AIDL di sistema, vedi [[ntg062-overview]]): callback in `FullscreenActivity` → adapter → view:
- `onUpdateDoors(hood,trunk,FL,FR,RL,RR)` → `CarDoorWindowView.updateBenzCarDoor(...)` (vedi [[ntg062-cardoor-images]])
- `onUpdateSpeed(speed,unit)` / `onUpdateTotalMileage(value,unit)` → `CarMileageSpeedView`

**CarMileageSpeedView** (`mileage_layout.xml`): TextView id `mileage`/`speed`; formati `"<v> KM|MILE"` e `"<v> KM/H|MPH"` (`unit==1` → imperiale).

**CarSensorView — RIMOSSA** (2026-06-29, vedi punto 17 di [[ntg062-applied-mods]]). Storica: era il pannello **sensori parcheggio + marcia** costruito in codice (no layout), barre `ProgressBar`, leggeva in PULL `CarInfo.ReverseAndAVM` (radar level/distance + GEAR + REVERSE), polling 300 ms. Tolta perche quei dati non sono leggibili sull'Audi A5 (GEAR/RADAR_DISTANCE non popolati dal CAN-box — vedi [[ntg062-carinfo-data]]).

**CarKeyView — RIMOSSA** (tasti `car_up`/`p_off`/`sport_esp_off`/manopole via `CarInfoManager.setKeyEvent`/`SpdManager.setSystemCmd`): non funzionante sulla testata, eliminata insieme a `key_one_layout.xml`. Storica: inviava key event auto e regolava luminosità (manopola destra, `setSystemCmd(5,...)`).
