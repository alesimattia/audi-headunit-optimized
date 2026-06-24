---
name: ntg062-modding-build
description: NTG_062 — toolchain e procedura per decompilare/modificare/ricompilare/firmare, con i tranelli di apktool e firma su macOS
metadata:
  type: reference
---

**Decompilare**:
- `jadx -d <out> NTG_062.apk` → Java leggibile (per CAPIRE). Attenzione: jadx ebbe **2 errori** di decompilazione → incrociare con lo smali per i punti critici (es. jadx mostrava solo il ramo "audi" in CarDoorWindowView).
- `apktool d -f -o <out> NTG_062.apk` → smali + risorse decodificate (per MODIFICARE e ricompilare).

**Ricompilare**: `apktool b <proj> -o out.apk` (apktool 3.0.2, usa aapt2). Nota: mette in cache il dex (`build/`) → messaggio "smali has not changed".

⚠️ **TRAPPOLA cache `build/`**: se CANCELLI una risorsa DOPO un build già fatto, apktool la **re-include** dalla cache `build/` (il file ricompare nell'APK pur essendo assente dai sorgenti!). Le risorse cancellate PRIMA del primo build invece spariscono correttamente. Soluzione: `rm -rf <proj>/build <proj>/dist` prima di `apktool b` per forzare una ricompilazione pulita. (Capitato cancellando `car_info_bg.png`: riappariva finché non ho pulito `build/`.)

**Cancellare risorse in sicurezza**: eliminare i file **e** rimuovere le righe `<public type=... name=... id=.../>` da `res/values/public.xml`. aapt2 rispetta i `<public>` per **fissare gli ID** → le risorse tenute mantengono il loro ID e gli ID inlined nello smali restano validi; il `getIdentifier(nome)` è comunque robusto ai cambi di ID. I campi `R$` orfani delle risorse cancellate sono innocui. (Se un layout referenzia staticamente una risorsa cancellata, aapt2 fallisce: vedi Trappola 4 in [[ntg062-cardoor-images]].)

**Firmare senza chiave di piattaforma**: `keytool` → `debug.keystore` (alias `androiddebugkey`, storepass/keypass `android`); poi `jarsigner -sigalg SHA256withRSA -digestalg SHA-256` (firma **v1**, accettata da Android 9). Per zipalign + firma v2/v3 si usa `uber-apk-signer` (zipalign integrato, niente SDK). **Già pronto e automatizzato** in `compile_sign_align.sh` nella root (build completa + firma) → vedi [[ntg062-sign-align-script]] per uso e razionale.

**Quirk macOS**: `/usr/bin/keytool` e `/usr/bin/jarsigner` sono stub che falliscono ("Unable to locate a Java Runtime") → usare brew openjdk in `/opt/homebrew/Cellar/openjdk/26.0.1/bin`. `keytool` 26 in locale IT va in errore su `-printcert` (bug formato) → leggere il certificato di firma con `unzip -p APK META-INF/CERT.RSA | openssl pkcs7 -inform DER -print_certs | openssl x509 -noout -subject -issuer -fingerprint -sha256`.

Tool installati via brew: **jadx 1.5.5**, **apktool 3.0.2** (più openjdk 26 come dipendenza).

**Digressione SCARTATA — non serve d8/baksmali**: per aggiungere codice nuovo si è valutata la via "scrivo in Java e converto in smali" (Java → `.class` via `javac` → dex via **d8** → smali via **baksmali**). Richiederebbe d8 + baksmali + `android.jar` API 28 (per compilare contro il framework) → setup pesante con download di rete, **tutti assenti** su questa macchina (solo jadx/apktool installati). **Scartata**: `apktool b` assembla già lo smali in dex (ha smali integrato) e `compile_sign_align.sh`/`uber-apk-signer` firmano — d8/baksmali **non sono mai necessari** in questa pipeline. Quindi il codice nuovo si **scrive direttamente in smali a mano** e si verifica con `apktool b` (che fa da validatore di sintassi).

⚠️ **Trappola registri 4-bit (smali a mano)**: molte istruzioni hanno operandi a **4 bit** → registro deve stare in **v0–v15**. In particolare `long-to-int`/le conversioni `*-to-*` (formato `12x`: **sia** dest **che** sorgente ≤ v15) e la lista registri di `invoke-*` non-`/range`. Le aritmetiche `add/sub/mul/div-long` (formato `23x`) sono invece a 8 bit e accettano v16+. Errore tipico: `Invalid register: v18. Must be between v0 and v15`. Fix: tenere il valore che entra in un'istruzione 4-bit (e il suo risultato int) in un registro basso, riusando pair liberi. Successo in `SystemView.smali::updateRam()` (pct calcolato in v6 anziché v18). In alternativa usare le varianti `/range` di invoke. Conferma: le build firmate finora (`NTG_062_audi_it*.apk`, `NTG_062_audi_it_debug.apk`) sono tutte prodotte solo con apktool + uber-apk-signer.

✅ **Sorgenti decompilati DUREVOLI** nella root del progetto: `NTG_062_src/apktool/` (smali+risorse editabili, **già con tutte le modifiche applicate**, ricompilabile) e `NTG_062_src/java/` (jadx, solo lettura; app in `java/com/spd/`). Istruzioni in `NTG_062_src/README.md`. Per riprendere le modifiche NON serve ri-decodificare: edita in `NTG_062_src/apktool/`, poi lancia `./compile_sign_align.sh` (fa pulizia cache + `apktool b` + firma in un colpo solo).
