# Memory index — progetto NTG_062 (testata Android Mercedes/Audi)

- [NTG_062 overview](ntg062-overview.md) — cos'è l'app, app di sistema + firma Zhantang, perché la ri-firma è vincolata (Strada A/B/C)
- [Architettura slider](ntg062-slider.md) — ViewPager/MyViewPageAdapter, mappa delle 4 pagine, flusso dati CarInfo, CarKeyView, DVR
- [Dati CarInfo](ntg062-carinfo-data.md) — dizionario what codes, push/pull AIDL, classi registrate, come sostituire il dato del mileage
- [Sistema immagini stato-porte](ntg062-cardoor-images.md) — trappole audi-vs-benz, getIdentifier, tipo default, src statico nel layout
- [Schermata navigazione](ntg062-navigation.md) — widget info da broadcast AMap + avvio app via SETTING_NAVI_APP
- [Tuning DVR](ntg062-dvr-tuning.md) — superficie AIDL/SettingInfo per migliorare qualità/FPS/apertura (Fase 2)
- [Modding & build](ntg062-modding-build.md) — toolchain jadx/apktool/firma + tranelli cancellazione risorse e firma su macOS
- [Script firma+zipalign](ntg062-sign-align-script.md) — `sign_align.sh` riutilizzabile nella root: come si usa e perché
- [Modifiche applicate](ntg062-applied-mods.md) — stato APK consegnato (Audi A5 / IT / alleggerito) + TODO aperti
- [Overlay diagnostico](ntg062-debug-overlay.md) — 5ª pagina che logga i what CarInfo a schermo + file Download (build `_debug`)
- [Pagina Sistema](ntg062-system-page.md) — 6ª pagina con parametri headunit Android (RAM/CPU/temp) senza root, smali a mano, refresh 1s
