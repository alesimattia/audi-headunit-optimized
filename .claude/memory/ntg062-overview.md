---
name: ntg062-overview
description: NTG_062.apk — identità app, hardware target, natura di app di sistema + firma vendor, e perché ri-firma/installazione sono vincolate
metadata:
  type: reference
---

`NTG_062.apk` = pacchetto **`com.spd.xhsntg`**, label "Car Device" (rinominata "Auto" nella build modificata). È un launcher/overlay Android **aftermarket** (vendor cinese) per testate **Mercedes-Benz NTG**. Android 9 / API 28 (min=target=28). Display widescreen automotive: 1280×480, 1920×720, 1024×600, 1600×720, 800×480 (a 800×480 il pager viene nascosto via `setVisibility(GONE)`).

- **Activity launcher**: `com.spd.xhsntg.FullscreenActivity` (MAIN/LAUNCHER, `singleInstance`, tema `FullscreenTheme`). Più un receiver `ReverseBroadcast` per la retrocamera (`com.spd.action.ntg.reverse.START/STOP`).
- **Layout principale** (`activity_fullscreen.xml`): `FrameLayout` → `LinearLayout` orizzontale con **a sinistra il `ViewPager` (slider pagine info-auto)** + **a destra `DvrPreviewSurfaceView` 1280px (riquadro video: canale 0 = bypass display LVDS originale, retrocamera in retromarcia)** + overlay `LvdsTestView` nascosto. Dettagli in [[ntg062-slider]] e [[ntg062-dvr-tuning]].
- **È un'APP DI SISTEMA**: manifest con `android:sharedUserId="android.uid.system"`.
- **Firma**: chiave di **piattaforma del vendor**, self-signed `CN=release, O=Zhantang, OU=Zhantang, C=CN`. SHA-256 `53:04:91:5C:4B:B7:BA:CA:28:77:62:31:99:39:96:FD:E1:BA:FF:CB:BE:65:00:FB:0F:C7:F2:D3:A2:88:8C:B7`; SHA-1 `F1:A5:4A:3F:02:4A:8D:1B:74:D1:FF:1F:74:D3:BE:66:ED:79:31:2E`. **NON** sono le AOSP test-keys → nessuna scorciatoia con chiave pubblica.

**Vincolo chiave per il modding**: finché c'è `sharedUserId="android.uid.system"`, un APK ri-firmato con qualsiasi altra chiave NON può sostituire l'originale → `INSTALL_FAILED_SHARED_USER_INCOMPATIBLE`. Strade possibili:
- **A)** chiave di piattaforma `Zhantang` (non disponibile);
- **B)** testata **rootata** → push in `/system`;
- **C)** **rimuovere `sharedUserId`** → si installa come app normale ma **perde i privilegi di sistema**.

L'utente non ha root né chiave → si usa la **Strada C**. Sotto C, le funzioni che dipendono dal sistema possono non funzionare: telemetria `CarInfo` (km/velocità/porte), `SpdManager` (luminosità/audio focus), scrittura `Settings.System`; possibili schermate a dati vuoti o crash se una chiamata system-only non è gestita. Prima di installare la versione modificata va **disinstallato l'originale** (firma diversa). Dettagli build/firma in [[ntg062-modding-build]]; stato modifiche in [[ntg062-applied-mods]].
