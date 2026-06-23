---
name: ntg062-slider
description: NTG_062 — come funziona lo slider a pagine (ViewPager + MyViewPageAdapter), mappa pagine, flusso dati, DVR, pagina nascosta
metadata:
  type: reference
---

`FullscreenActivity` gonfia `activity_fullscreen.xml`: un `LinearLayout` orizzontale con **`ViewPager id_view_page`** (weight 1) + **`DvrPreviewSurfaceView id_preview_surface_view`** (1280px, anteprima telecamera/DVR, va a tutto schermo in retromarcia) + un `LvdsTestView ldvs_test_layout` nascosto (compare con long-press di 5s se `SETTING_DEVELOPER_MODE=1`).

**Adapter**: `com.spd.view.MyViewPageAdapter`.
- **`getCount()` decide quante pagine** (originale = 3 → si vedono solo le posizioni 0,1,2).
- `instantiateItem` usa un packed-switch (indice → view), tutte le view create nel costruttore:
  - **0** → `CarDoorWindowView` (`m_test_view_1`)
  - **1** → `CarMileageSpeedView` (`m_test_view_2`)
  - **2** → `m_navi_frame_layout` (navi, gestita da `NaviManager` — vedi [[ntg062-navigation]])
  - **3** → `CarKeyView` (`m_test_view_3`) — **raggiungibile solo se `getCount()>=4`** (era la pagina nascosta).
- Pagina corrente salvata in SharedPreferences file **"save"**, chiave `"page"`; ripristinata in `onCreate`.

**Flusso dati = PUSH dal servizio CarInfo** (richiede l'AIDL di sistema, vedi [[ntg062-overview]]): callback in `FullscreenActivity` → adapter → view:
- `onUpdateDoors(hood,trunk,FL,FR,RL,RR)` → `CarDoorWindowView.updateBenzCarDoor(...)` (vedi [[ntg062-cardoor-images]])
- `onUpdateSpeed(speed,unit)` / `onUpdateTotalMileage(value,unit)` → `CarMileageSpeedView`

**CarMileageSpeedView** (`mileage_layout.xml`): TextView id `mileage`/`speed`; formati `"<v> KM|MILE"` e `"<v> KM/H|MPH"` (`unit==1` → imperiale).

**CarKeyView** (`key_one_layout.xml`): pannello comandi auto — tasti `car_up`/`p_off`/`sport_esp_off`/`left_key`/`right_key`, 2 manopole (sinistra = key event, destra = luminosità via `SpdManager.setSystemCmd(5,...)`); long-press alterna `viewType` (icona `icon_04`/`icon_08`, mostra/nasconde left/right key). Invia eventi con `CarInfoManager.setKeyEvent` → richiede servizio di sistema.
