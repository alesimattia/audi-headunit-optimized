---
name: ntg062-sign-align-script
description: NTG_062 — script compile_sign_align.sh (build completa + zipalign + firma via uber-apk-signer, schemi v2+v3) nella root del progetto: come si usa e perché ogni passo serve
metadata:
  type: reference
---

Nella **root del progetto** (`/Users/alesimattia/Documents/PROGETTi/audi-headunit-optimized/`, su Windows `a:\aa`) ci sono strumenti pronti per compilare/ri-firmare/allineare l'APK modificato:
- `compile_sign_align.sh` — wrapper principale (eseguibile). Fa **tutto**: pulizia cache + `apktool b` + zipalign + firma. (ex `sign_align.sh`, rinominato il 2026-06-24.)
- `uber-apk-signer.jar` — **firmatario in uso** (v1.3.0). Autocontenuto: zipalign **built-in** + firma. Serve solo un JDK, **nessun Android SDK/build-tools**.
- `debug.keystore` — chiave di **debug** (alias `androiddebugkey`, pass `android`). NON per Google Play; riusata per avere firma coerente tra build (così aggiorni senza disinstallare tra i *tuoi* APK).
- `zipalign.py` — zipalign Python autonomo. **Non più cablato** nello script (uber allinea da sé); resta in repo come utilità separata.

## Firma via uber-apk-signer — schemi v2+v3 (2026-06-25, stato attuale)
Lo script firma con `uber-apk-signer.jar`. **uber NON sa limitarsi a un singolo schema** (niente flag `--vN` come apksigner): di default 1.3.0 applica **v2 + v3** (verificato: `signature verified [v2, v3]`, **niente v1**). Va benissimo per Android 9 / API 28 — lo schema **v3 è stato introdotto proprio in API 28** e v1/JAR non serve sopra API 24.
- L'utente ha **accettato il compromesso** di non poter fare "solo v2 puro" pur di avere il build autocontenuto.
- `zipalign` **built-in di uber funziona su questo Mac Apple Silicon** (estrae un binario `mac-zipalign` in tmp; nessun problema Rosetta riscontrato).
- Comando interno: `java -jar uber-apk-signer.jar --apks IN --ks debug.keystore --ksAlias androiddebugkey --ksPass android --ksKeyPass android --allowResign --out OUTDIR`. uber scrive `<nome>-aligned-signed.apk` **in una cartella** → lo script lo sposta sul nome di output voluto. `--allowResign` serve a ri-firmare APK già firmati (caso `--signOnly`).
- CLAUDE.md aggiornato il 2026-06-25 a *"applica sempre zipalign + firma con uber-apk-signer (schemi v2+v3)"*.

### Storia (per non rifare giri a vuoto)
- Pre-2026-06-25: build con uber-apk-signer (autocontenuto). Funzionava senza SDK.
- 2026-06-25 mattina: brevemente riscritto su **apksigner** per ottenere **v2 puro** → richiede le Android build-tools (`$SDK/build-tools/*/lib/apksigner.jar`), che su questo Mac **mancavano** → falliva. Installate via `brew install --cask android-commandlinetools` + `sdkmanager "build-tools;34.0.0"`, build OK in v2 puro.
- 2026-06-25 sera: su richiesta utente **tornato a uber-apk-signer** (più semplice, niente SDK) accettando v2+v3. Toolchain **disinstallato** (`brew uninstall --cask android-commandlinetools` + rimossa `build-tools/34.0.0`). ⚠️ Se in futuro si rivuole v2 puro → reinstallare le build-tools e ripristinare il path apksigner.

## Uso
```
./compile_sign_align.sh                    # build completa: pulizia cache + apktool b + zipalign + firma v2+v3
                                           # -> NTG_062_audi_it.apk (sovrascritto SEMPRE se esiste)
./compile_sign_align.sh mia_build.apk      # build completa con nome di output scelto
./compile_sign_align.sh --signOnly in.apk [out.apk]   # SOLO zipalign + firma di un APK già costruito
```
La modalità build è il default e sovrascrive sempre l'output; la sola-firma si attiva unicamente col flag `--signOnly`.
Verifica: `java -jar uber-apk-signer.jar -y --apks out.apk --verbose` → deve mostrare `zipalign verified` e `signature verified [v2, v3]`.

## Perché (il senso di ogni passo)
- **Firma obbligatoria**: Android NON installa un APK non firmato, anche senza Play Store. Basta la chiave di debug locale.
- **zipalign**: allinea a 4 byte le voci **STORED** (in primis `resources.arsc`) → Android le mappa in memoria (mmap) direttamente → meno RAM e UI più reattiva. uber lo fa internamente prima di firmare.
- **JDK Homebrew** (`/opt/homebrew/Cellar/openjdk/*/bin`): gli stub `/usr/bin/java|keytool` falliscono ("Unable to locate a Java Runtime").

## Per l'app NTG specificamente
Prima di firmare/installare con questo script su un'app come `com.spd.xhsntg`: rimuovere `sharedUserId="android.uid.system"` dal manifest (Strada C, vedi [[ntg062-overview]]) altrimenti una firma diversa NON installa; e **disinstallare l'originale** (firma vendor diversa). Workflow completo decompila/ricompila in [[ntg062-modding-build]]; stato modifiche in [[ntg062-applied-mods]].

> Nota: l'APK consegnato `NTG_062_audi_it.apk` al 2026-06-25 sera è ancora quello firmato **v2 puro** (apksigner) della mattina; per riportarlo a v2+v3 va ricompilato con lo script attuale (chiedere prima, regola CLAUDE.md "non compilare senza chiedere").
> Nota doc: `README.md` (sezione script + accenni firma) potrebbe essere disallineato rispetto a uber/v2+v3 — da aggiornare se si vuole coerenza.
