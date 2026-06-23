---
name: ntg062-applied-mods
description: NTG_062 — obiettivi utente e modifiche già applicate nell'APK consegnato (Audi A5 / italiano / alleggerito), con i TODO aperti
metadata:
  type: project
---

**Contesto utente**: possiede un'**Audi A5**, testata Android **NTG**, **senza root né chiave di piattaforma**; vuole l'app in **italiano** e **leggera/veloce**. Lavoro svolto il **2026-06-23**.

**Consegnato**: `NTG_062_audi_it_aligned.apk` (zipallineato, firma v1/v2/v3) in `/Users/alesimattia/Downloads/Android car/` — **3.9 MB** (da 10.5 MB). Prodotto anche un artifact-diagramma dello slider. (Le build intermedie e la cartella `NTG_062_extracted/` sono state rimosse perché ridondanti; gli asset originali restano comunque in `NTG_062.apk`.)

**Modifiche applicate** al progetto apktool (tutte verificate nell'APK finale):
1. `MyViewPageAdapter.smali` `getCount()`: `0x3 → 0x4` → abilita la pagina 3 = `CarKeyView` (4ª schermata, prima nascosta). Vedi [[ntg062-slider]].
2. `CarDoorWindowView.smali` `resetBenzCarDoorIcon`: inserito `const/4 v0, 0x2` subito dopo il `getInt` di `SETTING_BENZ_CAR_TYPE` → **fissa il tipo auto a 2** (Audi berlina/coupé ≈ A5).
3. Tenuti solo i 15 file `carinfo_audi_car_door_*_02`; eliminati l'intera famiglia benz + audi `_00/_01/_03` (**165 file, 6.49 MB**) e rimosse le relative righe da `public.xml`. Vedi [[ntg062-cardoor-images]].
4. Ripuntati i 7 `android:src` di `carinfo_benz_car_door_layout.xml` da benz non-tipizzato → audi `_02` (fix build, Trappola 4).
5. Tradotte 7 stringhe app in `res/values/strings.xml`: `app_name→Auto`, `app_name_navigation→Navigazione`, `carinfo_mileage→Chilometraggio`, `carinfo_speed→Velocità`, `enter→"Entra in"`, `distance_metre_after→"metri e poi"`, `distance_kilometer_after→"km e poi"`.
6. Eliminate tutte le `res/values-<lingua>` tranne `values-it` (**112 rimosse**) → forza l'italiano (fallback sul default tradotto).
7. Rimosso `sharedUserId` da `AndroidManifest.xml` (Strada C, vedi [[ntg062-overview]]).
8. Rimosso lo sfondo `car_info_bg` (un quasi-bianco su cui il testo bianco era illeggibile): tolto l'`<ImageView>` da `mileage_layout.xml` E `key_one_layout.xml`, eliminato `car_info_bg.png` + voce `public.xml`. Ora le schermate restano sul nero del ViewPager (`#f000`) senza creare alcuna immagine. Richiesto `rm -rf build/` per via della cache apktool (vedi [[ntg062-modding-build]]).
9. **Ottimizzazione velocità/peso (Fase 1)**: rimosso l'SDK **Tencent WeCar/TAES + gson** (~725 classi, ~5 MB di smali). `WeCarNaviFrameManager` ridotto a **stub** (4 metodi no-op: `<init>`/`setFrameLayout`/`initFrameManager`/`uninitFrameManager`); eliminati `smali/com/tencent`, `smali/com/google`, le inner-class `WeCarNaviFrameManager$*`, gli asset `cross_tip_*.png` (70) e `component_config*.json`. **`NaviManager`/`AmapAutoNaviFrameManager` NON toccati**: i loro presunti riferimenti a Tencent erano **costanti `static final` già inlined dal compilatore** (insight chiave: nello smali le final-constant NON sono ref di classe → l'unico vero referente di `com/tencent` era `WeCarNaviFrameManager`). AMap + pannello live intatti. + PNG ottimizzati con `optipng` (−151 KB). Vedi [[ntg062-dvr-tuning]] per la Fase 2.

10. **Rimozione COMPLETA anche di AMap** (l'utente non usa né WeCar né AMap, vuole Google Maps): `AmapAutoNaviFrameManager` ridotto a stub no-op (stesso pattern di WeCar), eliminati le inner-class `AmapAutoNaviFrameManager$*`, `GuideInfoExtraKey.smali` e i 29 `assets/a_map_auto_tip_*.png` (la cartella `assets/` ora è vuota). Ripuliti i placeholder di `navi_layout.xml` (" abce"/" efg"/"hhhhhh" → ""). Risultato: il pannello navi diventa un **riquadro statico** (sfondo + pin + "Navigazione") che al tap lancia `SETTING_NAVI_APP` (Google Maps) — **niente più indicazioni live** (erano alimentate da AMap). `NaviManager` NON toccato (chiama gli stub). Rimosse anche le 3 stringhe navi ora inutilizzate (`distance_metre_after`/`distance_kilometer_after`/`enter`) da `values/strings.xml`, `values-it/strings.xml` e `public.xml` (verificato: 0 usi reali per ID nello smali; `app_name_navigation` invece mantenuta perché usata dal layout). ⚠️ **STAGED in `NTG_062_src/`, NON ancora ricompilato** (su richiesta dell'utente).

APK consegnato finale (`NTG_062_audi_it_aligned.apk`): zipallineato + firma v1/v2/v3, **~3.3 MB** (da 10.5 MB). **NB**: questo APK include i punti 1–9 (WeCar rimosso) ma **NON ancora la rimozione AMap (punto 10)**, che è solo nei sorgenti finché non si ricompila (`rm -rf NTG_062_src/apktool/build` → `apktool b` → `./sign_align.sh`).

**Sorgenti durevoli** (con tutte le modifiche già applicate) in `NTG_062_src/` nella root: edita lì e ricompila, niente più ri-decodifica. Workflow in [[ntg062-modding-build]] e `NTG_062_src/README.md`.

**TODO / aperto**:
- **Non testato su testata** (nessun device in sessione). Rischi sotto Strada C: telemetria vuota / tasti inerti / possibile crash all'avvio se una chiamata system-only non è gestita. Prossimo passo: **logcat** dalla testata; se crasha, neutralizzare le chiamate di sistema non gestite.
- Firma/allineamento: OK — ogni build è già **zipallineata + v1/v2/v3** via `./sign_align.sh`.
- **Fase 2 ottimizzazioni DVR** (in attesa dell'APK `com.spd.dvr` dall'utente): mappare i valori validi e forzare qualità/fps migliori. Superficie di tuning in [[ntg062-dvr-tuning]].
- Opzionali deprioritizzati: A2 (rimozione UI debug LVDS) e B1 (anticipo bind DVR) — impatto marginale, non ancora fatti.
