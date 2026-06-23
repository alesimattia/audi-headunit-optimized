# NTG_062 — app modificata (`com.spd.xhsntg`) + sorgenti

App launcher per testate Android **Mercedes/Audi NTG**, decompilata da `NTG_062.apk` e modificata
(Audi A5 / italiano / alleggerita). Niente root né chiave di piattaforma → installata come app
normale (Strada C, vedi Note).

## Struttura della cartella
- **`NTG_062.apk`** — APK originale del vendor (fonte di verità, ri-decodificabile).
- **`NTG_062_audi_it_aligned.apk`** — build modificata, zipallineata + firma v1/v2/v3 (da installare).
- **`NTG_062_src/`** — sorgenti decompilati:
  - `apktool/` — smali + risorse + manifest. **Qui si modifica e si ricompila.**
  - `java/` — Java leggibile (jadx), solo per consultazione (`java/com/spd/`).
- **`sign_align.sh` · `zipalign.py` · `uber-apk-signer.jar` · `debug.keystore`** — toolchain firma+zipalign.
- **`.claude/memory/ntg062-*.md`** — contesto, trappole e dettagli per modifiche future.

## Modifiche e ottimizzazioni applicate (questa sessione)

### Funzionali / UI
1. **4ª pagina abilitata** — `MyViewPageAdapter.getCount()` 3→4: la pagina nascosta `CarKeyView`
   (pannello comandi auto) diventa scorribile.
2. **Sagoma auto = solo Audi (tipo `_02`, berlina/A5)** — tenuti i 15 `carinfo_audi_car_door_*_02`;
   eliminati l'intera famiglia `benz` + audi `_00/_01/_03` (**165 file, ~6.5 MB**) e le righe in
   `public.xml`; tipo fissato a 2 in `CarDoorWindowView.smali`; `src` di
   `carinfo_benz_car_door_layout.xml` ripuntati su audi `_02`.
3. **Testi in italiano** — tradotte 7 stringhe app in `values/strings.xml`
   (`app_name→Auto`, `app_name_navigation→Navigazione`, `carinfo_mileage→Chilometraggio`,
   `carinfo_speed→Velocità`, ecc.).
4. **Solo lingua italiana** — eliminate **112** cartelle `res/values-<lingua>`, tenuta solo `values-it`
   (forza l'italiano via fallback sul default).
5. **Installabile via sideload** — rimosso `android:sharedUserId="android.uid.system"` dal manifest.
6. **Sfondo `car_info_bg` rimosso** — tolto l'`<ImageView>` da `mileage_layout.xml` e `key_one_layout.xml`,
   eliminato `car_info_bg.png` + voce `public.xml`. Le schermate restano sul nero del ViewPager.

### Ottimizzazioni velocità / peso
7. **Rimosso l'SDK Tencent WeCar/TAES + gson** (~**725 classi, ~5 MB** di smali) — `WeCarNaviFrameManager`
   ridotto a stub no-op; eliminati `smali/com/tencent`, `smali/com/google`, le inner-class, gli asset
   `assets/cross_tip_*.png` (70) e `assets/component_config*.json`. Dex più piccolo → caricamento classi
   e RAM ridotti. `NaviManager`/`AmapAutoNaviFrameManager` non toccati (i ref a Tencent erano costanti
   `static final` già inlined dal compilatore).
8. **PNG ottimizzati** (`optipng` lossless, `-strip all`) — −151 KB.
9. **Rimosso completamente anche AMap Auto** — `AmapAutoNaviFrameManager` ridotto a stub; eliminati le
   inner-class, `GuideInfoExtraKey`, gli asset `assets/a_map_auto_tip_*.png` (29); ripuliti i placeholder
   di `navi_layout.xml`. La pagina navigazione diventa un **riquadro statico** che al tap lancia
   `SETTING_NAVI_APP` (es. Google Maps) — **niente più pannello live** (era alimentato solo da AMap).
10. **Rimosse 3 stringhe navi inutilizzate** (`distance_metre_after`, `distance_kilometer_after`,
    `enter`) da `values/strings.xml`, `values-it/strings.xml` e `public.xml`.

### Stato build (IMPORTANTE)
- `NTG_062_audi_it_aligned.apk` (consegnato) contiene i punti **1–8**. Dimensione: **10.5 MB → 3.28 MB**.
- I punti **9–10 (rimozione AMap + stringhe)** sono **solo nei sorgenti `NTG_062_src/`**, NON ancora
  ricompilati: entreranno nell'APK alla prossima build.

### Non fatto / scartato
- Trimming di `androidx` (14 MB): troppo intrecciato per la rimozione manuale (servirebbe R8).
- A2 (rimozione UI debug LVDS) e B1 (anticipo bind DVR): impatto trascurabile.
- **Fase 2 — qualità/FPS DVR**: in attesa dell'APK del servizio esterno `com.spd.dvr` (la cattura
  video la fa quel servizio; quest'app è solo client AIDL). Vedi `.claude/memory/ntg062-dvr-tuning.md`.

## Ricompilare → firmare → installare
```sh
cd "/Users/alesimattia/Downloads/Android car"
rm -rf NTG_062_src/apktool/build NTG_062_src/apktool/dist   # OBBLIGATORIO se hai cancellato risorse
apktool b NTG_062_src/apktool -o NTG_mod.apk
./sign_align.sh NTG_mod.apk                                 # -> zipalign + firma v1/v2/v3
# installa: disinstalla prima l'originale (firma diversa), poi sideload dell'APK firmato
```

## Note importanti
- **App di sistema** firmata col certificato del vendor: per installare una build ri-firmata è stato
  rimosso `sharedUserId` (Strada C) → si installa come app normale ma **perde i privilegi di sistema**
  (la telemetria CarInfo — km/velocità/porte — può restare vuota; possibile crash all'avvio da verificare
  sulla testata).
- **Trappola cache apktool**: se cancelli risorse, fai `rm -rf NTG_062_src/apktool/build` prima di
  `apktool b`, altrimenti i file eliminati riappaiono nell'APK.
- Dettagli, trappole e superficie di tuning DVR: `.claude/memory/ntg062-*.md`.
