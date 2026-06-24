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
- **`compile_sign_align.sh` · `zipalign.py` · `uber-apk-signer.jar` · `debug.keystore`** — toolchain build+firma+zipalign.
- **[`DATI_MOSTRABILI.md`](DATI_MOSTRABILI.md)** — catalogo dei dati CarInfo (`what`) mostrabili al posto del chilometraggio + come sostituirli.
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
- A2 (rimozione UI debug LVDS) e B1 (anticipo bind DVR): impatto trascurabile.
- **Fase 2 — qualità/FPS DVR**: in attesa dell'APK del servizio esterno `com.spd.dvr` (la cattura
  video la fa quel servizio; quest'app è solo client AIDL). Vedi `.claude/memory/ntg062-dvr-tuning.md`.

## Analisi componenti rimovibili

Mappa dei componenti rimovibili, ordinata per rapporto guadagno/rischio.

### Quadro generale
Su **1639 classi di libreria** presenti nello smali, solo **96 sono raggiungibili** dal codice dell'app. L'app usa di fatto **solo `androidx.viewpager.widget`** (lo slider), che trascina un sottoinsieme minimo di `core`/`customview`/`collection`/`annotation`. Tutto il resto è zavorra importata dall'umbrella `legacy-support-v4`.

### Tier 1 — Codice libreria morto · ~11 MB smali, rischio zero
Moduli interi **0 classi raggiungibili / N totali** → cancellabili in blocco (cartelle):

| Modulo | classi | note |
|---|---|---|
| `androidx/media` | 434 | il più pesante (3.7 MB), MediaSession/MediaBrowser mai usati |
| `android/support/v4` | 178 | vecchia support-lib, tiene in vita `androidx/media` |
| `androidx/fragment` | 87 | l'app non usa Fragment |
| `androidx/lifecycle` | 76 | — |
| `androidx/legacy` | 43 | l'umbrella stessa |
| `androidx/loader` | 35 | — |
| `swiperefreshlayout`, `drawerlayout`, `slidingpanelayout`, `coordinatorlayout`, `cursoradapter`, `documentfile`, `print`, `arch`, `asynclayoutinflater`, `interpolator`, `localbroadcastmanager`, `versionedparcelable` | ~290 | tutti 0-raggiungibili |

Questo è il **vero grande taglio**: ~1543 classi morte → il `classes.dex` (oggi 2.2 MB) si riduce drasticamente.

> ⚠️ I moduli **parziali** (`core`, `viewpager`, `customview`, `collection`, `annotation`) **NON** vanno cancellati interi: solo alcune classi al loro interno sono morte, ma rimuoverle una a una è chirurgico e a basso rendimento → li lascerei intatti.

### Tier 2 — Componenti app nascosti/diagnostici
- **`LvdsTestView`** (5 file: classe + 4 inner) — è una **schermata di test LVDS di fabbrica**, nel layout è `android:visibility="gone"` e non è referenziata da nessun'altra classe. Rimozione pulita: 5 smali + 1 riga in [activity_fullscreen.xml](NTG_062_src/apktool/res/layout/activity_fullscreen.xml#L8) + l'`@id`. Era l'opzione "A2" deprioritizzata in memoria.
- **`DebugLog` + `DebugLog$DumpTask`** — logging di debug, agganciato a `MyViewPageAdapter` e `FullscreenActivity$1`. Rimovibile ma richiede edit ai due chiamanti; tienilo solo se ti serve per il logcat sulla testata (TODO aperto).

### Tier 3 — Feature rimovibili solo se l'hardware non c'è
- **Stack DVR/dashcam** (~400 KB): `com/spd/dvr/*` + `DvrHelper*` + `DvrPreviewSurfaceView`, agganciato a `FullscreenActivity`. Rimovibile **solo se non hai una dashcam** collegata.
- **`ReverseBroadcast` + retrocamera**: rimovibile solo se non usi la retrocamera via questa app.
- **Stub navi `WeCarNaviFrameManager`/`AmapAutoNaviFrameManager`**: già neutralizzati a no-op, ma referenziati 24 volte da `NaviManager` → rimozione completa chirurgica e a guadagno minimo. **Lascerei come sono.**

### Tier 4 — Asset (ricomprimere, non rimuovere)
- **`bg.png` ≈ 1.5 MB**: è di gran lunga il file più pesante dell'intero APK (lo sfondo). Non si rimuove ma **downscale/ricompressione** (es. WebP o ridimensionamento alla risoluzione target) è il singolo intervento più efficace sugli asset.

---

**Raccomandazione**: il **Tier 1** è il taglio da fare per primo — massimo peso, zero rischio funzionale (sono classi provatamente irraggiungibili) — più il **Tier 2 LvdsTestView**. Tier 3 dipende dall'hardware (dashcam/retrocamera).

## Ricompilare → firmare → installare
```sh
cd "/Users/alesimattia/Documents/PROGETTi/audi-headunit-optimized"
./compile_sign_align.sh                  # fa tutto: pulizia cache + apktool b + zipalign + firma v1/v2/v3
                                         # output predefinito: NTG_062_audi_it_aligned.apk
./compile_sign_align.sh mia_build.apk    # come sopra, ma scegli tu il nome di output
# installa: disinstalla prima l'originale (firma diversa), poi sideload dell'APK firmato
```
Dettagli completi dello script: vedi [§ Script `compile_sign_align.sh`](#script-compile_sign_alignsh).

## Script `compile_sign_align.sh`
Script unico per la toolchain di build: **pulizia cache → `apktool b` → zipalign → firma v1/v2/v3**.
Si lancia dalla root del progetto e non richiede l'Android SDK (usa `uber-apk-signer.jar` e il JDK di Homebrew).

### Modalità d'uso
| Comando | Cosa fa | Output |
|---|---|---|
| `./compile_sign_align.sh` | Build completa: pulizia cache + `apktool b` + zipalign + firma | `NTG_062_audi_it_aligned.apk` (default) |
| `./compile_sign_align.sh <output.apk>` | Build completa con **nome di output scelto da te** | `<output.apk>` |
| `./compile_sign_align.sh --signOnly <in.apk> [out.apk]` | **Solo** zipalign + firma di un APK già costruito (no ricompilazione) | `out.apk`, o `<in>-aligned-signed.apk` |

In build (default) l'output viene **sempre sovrascritto** se esiste già. La modalità solo-firma si attiva
unicamente con il flag esplicito `--signOnly` → nessuna ambiguità sul nome di output.

### Cosa fa nel dettaglio
1. **Pulizia cache** — `rm -rf NTG_062_src/apktool/build NTG_062_src/apktool/dist` (evita che i file eliminati riappaiano).
2. **Compilazione** — `apktool b NTG_062_src/apktool` su un APK temporaneo non firmato.
3. **Firma** — se `uber-apk-signer.jar` è presente: **zipalign + firma v1/v2/v3** (consigliato);
   altrimenti fallback auto-contenuto: `jarsigner` (solo v1) + `zipalign.py`.
4. La `debug.keystore` (password `android`) viene creata una volta e riusata → firma coerente tra le build.

### Note
- Chiave di **debug**, NON per Google Play.
- In build l'output esistente viene **sempre sovrascritto**; per firmare senza ricompilare usa `--signOnly`.
- Componenti usati: `compile_sign_align.sh` · `zipalign.py` · `uber-apk-signer.jar` · `debug.keystore`.

## Servizio CarInfo (telemetria veicolo)
**CarInfo** è il sottosistema da cui l'app riceve i dati del veicolo (km, velocità, stato porte,
consumo, temperature…). È un **servizio Android esterno** all'app launcher che fa da ponte tra il
**CAN-box** dell'auto e le app, esposto via AIDL `ICarInfoAidlInterface`.

### Come l'app dialoga col servizio
- **PUSH** — l'app chiama `registerCallback(pkg, ids[], cb)` e riceve le notifiche di cambiamento
  (`onCarInfoIntChanged/Float/String/BundleChanged(what, value, unit)`).
- **PULL** — può interrogare un valore on-demand con `getInt/getFloat/getString/getBundle(what, arg)`.

`what` è un **codice intero** che identifica la grandezza, definito in `com.spd.carinfo.CarInfo`
(file ~175 KB, raggruppato per range).

### Famiglie di dati (range `what`)
| Famiglia | Range | Esempi | Registrata in push? |
|---|---|---|---|
| `Instruments` | 100xxx / 101xxx | velocità, giri, consumo, livello/autonomia carburante, temp acqua/olio | ✅ sì |
| `Vehicles` | 170xxx | modello auto | ✅ sì |
| `ReverseAndAVM` | 140xxx | retromarcia, velocità (140062) | ✅ sì |
| `Doors` | 50xxx | stato porte (50001) | ✅ sì |
| `AirCondition` | 30xxx | temp esterna (30023) | ❌ no — aggiungere il CLASS_NAME a `ids[]` |
| `Maintenance` | 120xxx | km al tagliando (120081) | ❌ no |
| `Battery` | 160xxx | tensione (160013) — quasi tutto EV | ❌ no |
| `Lights` | 110xxx | — | ❌ no |

### Cosa usa l'app oggi
`CarInfoManager.onCarInfoDataChanged(what, obj, unit)` ha uno `switch` che gestisce **solo pochi**
`what` (velocità 140062, unità 10006, porte 50001, km totali 100013, sorgente media 100085,
modello 170004) e **ignora tutto il resto, pur ricevendolo**. Qui sta il margine per "leggere più
parametri auto": per i range già registrati basta aggiungere un `case`; per i range non registrati
va prima aggiunto il loro `CLASS_NAME` all'array `ids[]` in `CarInfoManager`.

➡️ **Catalogo dei dati mostrabili + procedura di sostituzione:** [`DATI_MOSTRABILI.md`](DATI_MOSTRABILI.md)
(consumi, autonomia, temperature, ecc. con i rispettivi `what`, e i passi per mostrarli al posto del chilometraggio).

### Limiti (onestà tecnica)
- **Firmware generico multi-marca**: che un `what` *arrivi davvero* dipende dal CAN-box e da cosa
  decodifica per la specifica **Audi A5**; molti codici sono per altri brand e non verranno mai popolati.
- **Strada C** (firma debug, no privilegi di sistema): il servizio CarInfo potrebbe non collegarsi
  affatto → schermate a dati vuoti. **Da validare con `logcat` sulla testata reale.**
- Dettaglio completo (dizionario `what`, come sostituire il dato del mileage): `.claude/memory/ntg062-carinfo-data.md`.

## Note importanti
- **App di sistema** firmata col certificato del vendor: per installare una build ri-firmata è stato
  rimosso `sharedUserId` (Strada C) → si installa come app normale ma **perde i privilegi di sistema**
  (la telemetria CarInfo — km/velocità/porte — può restare vuota; possibile crash all'avvio da verificare
  sulla testata).
- **Trappola cache apktool**: se cancelli risorse, fai `rm -rf NTG_062_src/apktool/build` prima di
  `apktool b`, altrimenti i file eliminati riappaiono nell'APK.
- Dettagli, trappole e superficie di tuning DVR: `.claude/memory/ntg062-*.md`.
