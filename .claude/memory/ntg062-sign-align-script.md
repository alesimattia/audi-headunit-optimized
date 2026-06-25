---
name: ntg062-sign-align-script
description: NTG_062 — script compile_sign_align.sh (build completa + zipalign + firma SOLO v2) nella root del progetto: come si usa e perché ogni passo serve
metadata:
  type: reference
---

Nella **root del progetto** (`/Users/alesimattia/Documents/PROGETTi/audi-headunit-optimized/`, su Windows `a:\aa`) ci sono strumenti pronti per compilare/ri-firmare/allineare l'APK modificato:
- `compile_sign_align.sh` — wrapper principale (eseguibile). Fa **tutto**: pulizia cache + `apktool b` + zipalign + firma. (ex `sign_align.sh`, rinominato il 2026-06-24.)
- `zipalign.py` — zipalign auto-contenuto in Python (fallback se manca lo zipalign dell'SDK).
- `debug.keystore` — chiave di **debug** (alias `androiddebugkey`, pass `android`). NON per Google Play; riusata per avere firma coerente tra build (così aggiorni senza disinstallare tra i *tuoi* APK).
- `uber-apk-signer.jar` — **NON piu' usato dallo script** (firma sempre v1/v2/v3, non sa limitarsi a v2). File lasciato in repo ma fuori dalla pipeline.

## Firma SOLO v2 (2026-06-25)
Su richiesta utente lo script firma **esclusivamente v2** (niente v1/v3/v4; v2 basta per Android 9/API 28). Rimossi i flag `SIGN_V1/V2/V3/V4` e i motori uber/jarsigner. ⚠️ **Contraddice** la regola CLAUDE.md "applica sempre firma v3" → se stabile, aggiornare CLAUDE.md.
- **Motore unico = `apksigner`** (Android SDK build-tools): e' l'unico che firma in v2 puro (`--vN-signing-enabled`). Lo script lo cerca in `${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}}/build-tools/*/lib/apksigner.jar`. **Se manca, lo script ESCE con errore** (non ripiega su schemi non richiesti). ⚠️ Le build precedenti usavano uber-apk-signer → per ottenere solo-v2 serve installare le build-tools sul Mac (vedi [[ntg062-modding-build]]).
- comando: `apksigner sign --ks debug.keystore ... --v1-signing-enabled false --v2-signing-enabled true --v3-signing-enabled false --out OUT ALIGNED` (zipalign PRIMA, perche' apksigner vuole l'APK gia' allineato). Rimuove l'eventuale `OUT.idsig`.

## Uso
```
./compile_sign_align.sh                    # build completa: pulizia cache + apktool b + zipalign + firma v2
                                           # -> NTG_062_audi_it.apk (sovrascritto SEMPRE se esiste)
./compile_sign_align.sh mia_build.apk      # build completa con nome di output scelto
./compile_sign_align.sh --signOnly in.apk [out.apk]   # SOLO zipalign + firma v2 di un APK già costruito
```
La modalità build è il default e sovrascrive sempre l'output; la sola-firma si attiva unicamente col flag `--signOnly`.
Verifica: `apksigner verify --print-certs out.apk` deve mostrare solo "Verified using v2 scheme (APK Signature Scheme v2): true" (v1/v3 false).

## Perché (il senso di ogni passo)
- **Firma obbligatoria**: Android NON installa un APK non firmato, anche senza Play Store. Basta la chiave di debug locale.
- **zipalign**: allinea a 4 byte le voci **STORED** (in primis `resources.arsc`) → Android le mappa in memoria (mmap) direttamente → meno RAM e UI più reattiva. Best practice su API 28.
- **Ordine**: per **v2** lo zipalign va fatto **PRIMA** della firma (apksigner e' alignment-aware e firma sull'APK gia' allineato). [L'ordine inverso serviva solo alla vecchia firma v1, ora rimossa.]
- Usa il JDK Homebrew (`/opt/homebrew/Cellar/openjdk/*/bin`): gli stub `/usr/bin/java|keytool` falliscono ("Unable to locate a Java Runtime"). Per il fallback `zipalign.py` serve `python3`.

## Per l'app NTG specificamente
Prima di firmare/installare con questo script su un'app come `com.spd.xhsntg`: rimuovere `sharedUserId="android.uid.system"` dal manifest (Strada C, vedi [[ntg062-overview]]) altrimenti una firma diversa NON installa; e **disinstallare l'originale** (firma vendor diversa). Workflow completo decompila/ricompila in [[ntg062-modding-build]]; stato modifiche in [[ntg062-applied-mods]].

> Nota: `apktool b` non serve più chiamarlo a mano — `compile_sign_align.sh` (senza argomenti) include già pulizia cache + `apktool b` + firma v2.
> Nota doc: il `README.md` (sezione "Script compile_sign_align.sh" e accenni "firma v1/v2/v3") e' ora **obsoleto** rispetto al solo-v2 — da aggiornare se si vuole coerenza.
