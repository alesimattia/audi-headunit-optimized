---
name: ntg062-slider
description: NTG_062 — come funziona lo slider a pagine (ViewPager + MyViewPageAdapter), mappa pagine, flusso dati, DVR, pagina nascosta
metadata:
  type: reference
---

`FullscreenActivity` gonfia `activity_fullscreen.xml`: un `LinearLayout` orizzontale con **`ViewPager id_view_page`** (weight 1) + **`DvrPreviewSurfaceView id_preview_surface_view`** (larghezza layout **1280px** ma **sovrascritta a runtime** da `FullscreenActivity.getPreviewViewWidth()` in base alla risoluzione — 800@1280×480, 1280@1920×720, 1024@1024×600, 1200@1600×720, **pager nascosto@800×480**, oppure tutto schermo se `SETTING_NTG_FULL_SCREEN=1`; `dvr_channel=0` = bypass del display LVDS originale dell'auto; in retromarcia il canale 0 commuta su retrocamera a livello hardware/servizio, vedi [[ntg062-dvr-tuning]]) + un `LvdsTestView ldvs_test_layout` nascosto.

**LvdsTestView — sblocco long-press (MODIFICATO)**: il touch handler chiama `supportDebugLvds()`; se true, `ACTION_DOWN` programma `mHandler.sendEmptyMessageDelayed(HANDLE_LONG_CLICK=0x3e8, delay)`, `ACTION_UP/CANCEL` lo annulla (il vecchio annullamento per movimento >80px nel ramo `ACTION_MOVE` e stato RIMOSSO: ora `if-gt v5,v7 / if-le v6,v7` sostituiti da `goto :cond_a`); allo scadere `handleMessage` fa `findViewById(R.id.ldvs_test_layout).setVisibility(0)`. Originale: delay 5000ms (`0x1388`) e `supportDebugLvds()` = `Settings.System.getInt(resolver,"SETTING_DEVELOPER_MODE",0)==1`. **Ora**: `supportDebugLvds()` ritorna sempre `true` (vincolo rimosso) e delay = 3000ms (`0xbb8`). Editato sia `apktool/smali/com/spd/xhsntg/FullscreenActivity.smali` (build) sia il `.java` jadx di riferimento. NB: `SETTING_DEVELOPER_MODE` è una chiave in `Settings.System` (provider settings, tabella `system`), impostabile con `adb shell settings put system SETTING_DEVELOPER_MODE 1` o `Settings.System.putInt` (richiede WRITE_SETTINGS).

**Adapter**: `com.spd.view.MyViewPageAdapter`.
- **`getCount()` decide quante pagine** (originale = 3; ora **= 6**).
- `instantiateItem` usa un packed-switch (indice → view), tutte le view create nel costruttore.
- **STATO ATTUALE sorgenti (`NTG_062_src/`)** dopo: abilitazione CarKeyView + pagine debug/Sistema + rimozione navi + aggiunta pagina nera iniziale. `getCount()=0x6`, packed-switch da 0x0:
  - **0** → `m_test_view_0` = **`android.view.View` vuota** (pagina nera: nessuno sfondo, nessuna funzionalita; appare nera perche il ViewPager ha `background=#f000`). Creata `new android/view/View(context)` nel costruttore.
  - **1** → `CarDoorWindowView` (`m_test_view_1`) — porte/finestrini (vedi [[ntg062-cardoor-images]])
  - **2** → `CarMileageSpeedView` (`m_test_view_2`) — km/velocita
  - **3** → `CarSensorView` (`m_test_view_3`, ora `Landroid/view/View;`) — **sensori parcheggio + marcia** (sostituisce la rimossa CarKeyView; barre `ProgressBar` + polling `CarInfo.ReverseAndAVM`)
  - **4** → `m_test_view_4` = debug overlay / dump what-CarInfo a schermo + file in Download (classe `DebugLog`/`DebugLog$DumpTask`; doc `IMPLEMENTAZIONE_DUMP_CARINFO.md` nella root — la memoria `ntg062-debug-overlay` NON esiste, scelta dell'utente)
  - **5** → `m_test_view_5` = pagina Sistema (vedi [[ntg062-system-page]])
- **navi RIMOSSA del tutto**: eliminati campi `m_navi_frame_layout`/`m_navi_manager`, package `com/spd/navi`, layout/risorse navi. I metodi adapter `initManager()`/`uninitManager()` (chiamati da `FullscreenActivity.onStart/onStop`) sono ora **no-op** (`.locals 0`, solo `return-void`). Vedi [[ntg062-navigation]] e [[ntg062-applied-mods]].
- Pagina corrente salvata in SharedPreferences file **"save"**, chiave `"page"`; ripristinata in `onCreate` (`setCurrentItem` clampa: indici shiftati di +1 per la pagina nera = nessun crash).

**Flusso dati = PUSH dal servizio CarInfo** (richiede l'AIDL di sistema, vedi [[ntg062-overview]]): callback in `FullscreenActivity` → adapter → view:
- `onUpdateDoors(hood,trunk,FL,FR,RL,RR)` → `CarDoorWindowView.updateBenzCarDoor(...)` (vedi [[ntg062-cardoor-images]])
- `onUpdateSpeed(speed,unit)` / `onUpdateTotalMileage(value,unit)` → `CarMileageSpeedView`

**CarMileageSpeedView** (`mileage_layout.xml`): TextView id `mileage`/`speed`; formati `"<v> KM|MILE"` e `"<v> KM/H|MPH"` (`unit==1` → imperiale).

**CarSensorView** (indice 3, sostituisce CarKeyView — 2026-06-25): pannello **sensori parcheggio + marcia** costruito in codice (no layout), stile barre grafiche. Marcia + retromarcia (testo) e 4 righe `[etichetta | ProgressBar | valore]` (Anteriore/Posteriore/Sinistra/Destra) leggendo in PULL `CarInfo.ReverseAndAVM` (radar level/distance + GEAR + REVERSE), polling 300 ms (`CarSensorView$1`), start/stop da `FullscreenActivity$1.onPageSelected`. Dettagli e what in [[ntg062-applied-mods]] (punto 15) e [[ntg062-carinfo-data]].

**CarKeyView — RIMOSSA** (tasti `car_up`/`p_off`/`sport_esp_off`/manopole via `CarInfoManager.setKeyEvent`/`SpdManager.setSystemCmd`): non funzionante sulla testata, eliminata insieme a `key_one_layout.xml`. Storica: inviava key event auto e regolava luminosità (manopola destra, `setSystemCmd(5,...)`).
