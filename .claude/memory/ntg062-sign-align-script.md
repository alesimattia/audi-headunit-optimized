---
name: ntg062-sign-align-script
description: NTG_062 — script riutilizzabile sign_align.sh (zipalign + firma) nella root del progetto: come si usa e perché ogni passo serve
metadata:
  type: reference
---

Nella **root del progetto** (`/Users/alesimattia/Downloads/Android car/`) ci sono strumenti pronti per ri-firmare/allineare un APK modificato:
- `sign_align.sh` — wrapper principale (eseguibile).
- `zipalign.py` — zipalign auto-contenuto in Python (fallback, nessun SDK).
- `uber-apk-signer.jar` — firmatario ufficiale-comunità (zipalign + v1/v2/v3 integrati).
- `debug.keystore` — chiave di **debug** (alias `androiddebugkey`, pass `android`). NON per Google Play; riusata per avere firma coerente tra build (così aggiorni senza disinstallare tra i *tuoi* APK).

## Uso
```
apktool b <progetto> -o NTG_mod.apk        # ricompila l'APK modificato
./sign_align.sh NTG_mod.apk                # -> NTG_mod-aligned-signed.apk (allineato + firmato)
# oppure: ./sign_align.sh in.apk out.apk
```
Verifica: `uber` stampa "signature verified [v3]"; in alternativa `jarsigner -verify out.apk` ("jar verified") o rilancia `python3 zipalign.py` (controlla che le voci STORED siano 4-allineate).

## Come funziona
- Se `uber-apk-signer.jar` è presente → **zipalign + firma v1/v2/v3** (consigliato; v3 va bene su Android 9). Altrimenti **fallback**: `jarsigner` (v1) + `zipalign.py`.
- Crea `debug.keystore` la prima volta, poi lo riusa.
- Usa il JDK Homebrew (`/opt/homebrew/Cellar/openjdk/*/bin`): gli stub `/usr/bin/java|keytool|jarsigner` falliscono ("Unable to locate a Java Runtime"). Richiede anche `python3`.

## Perché (il senso di ogni passo)
- **Firma obbligatoria**: Android NON installa un APK non firmato, anche senza Play Store. Non serve una chiave Play, basta quella di debug locale.
- **zipalign**: allinea a 4 byte i dati delle voci **non compresse (STORED)**, in primis `resources.arsc`, così Android li mappa in memoria (mmap) direttamente → meno RAM e UI più reattiva. Le voci DEFLATED non si allineano (vengono decompresse). Su API 28 è best practice (non obbligatorio); con `targetSdk >= 30` `resources.arsc` DEVE essere STORED+allineato.
- **Ordine firma/allineamento**: per la firma **v1** lo zipalign va fatto DOPO la firma (sposta offset, non contenuti → la v1 resta valida); per **v2/v3** lo zipalign va fatto PRIMA e la firma è alignment-aware → `uber` gestisce l'ordine corretto da solo.

## Per l'app NTG specificamente
Prima di firmare/installare con questo script su un'app come `com.spd.xhsntg`: rimuovere `sharedUserId="android.uid.system"` dal manifest (Strada C, vedi [[ntg062-overview]]) altrimenti una firma diversa NON installa; e **disinstallare l'originale** (firma vendor diversa). Workflow completo decompila/ricompila in [[ntg062-modding-build]]; stato modifiche in [[ntg062-applied-mods]].
