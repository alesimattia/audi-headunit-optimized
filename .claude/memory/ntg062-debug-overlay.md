---
name: ntg062-debug-overlay
description: NTG_062 — build diagnostica con 5ª pagina overlay che logga tutti i what di CarInfo a schermo e su file Download
metadata:
  type: project
---

**Scopo**: scoprire quali `what` di CarInfo (vedi [[ntg062-carinfo-data]]) la testata invia davvero sull'Audi A5, dato che logcat su Android 9 senza root è inaccessibile. Lavoro del **2026-06-23**.

**Consegnato**: `NTG_062_audi_it_debug.apk` (root progetto) — `apktool b` + `sign_align.sh` → zipalign + firma **v1/v2/v3** (debug key), verificato `signature verified [v3]`.

**Modifiche applicate** (oltre a quelle in [[ntg062-applied-mods]]):
1. **Nuova classe** `smali/com/spd/xhsntg/DebugLog.smali** (scritta a mano):
   - `add(I,Object,I)` — formatta `what=<n> val=<String.valueOf(value)> unit=<n>`, accoda a uno `StringBuilder` statico (cap 20000→15000 char), scrive su file e aggiorna la TextView.
   - `createView(Context):View` — costruisce in codice `ScrollView`(sfondo nero)+`TextView`(bianco `0xFFFFFFFF`, 12sp) e li tiene in field statici.
   - `writeFile(String)` — append a `Environment.getExternalStoragePublicDirectory(DIRECTORY_DOWNLOADS)/ntg_carinfo_log.txt` con `FileWriter(...,true)`, tutto in `try/catchall` (se permesso negato, l'overlay funziona comunque).
2. `CarInfoManager.onCarInfoDataChanged`: inserita `invoke-static {p1,p2,p3} DebugLog->add` **prima dello switch** → logga TUTTI i `what`, non solo i 6 gestiti. (Gira su main thread: la callback arriva da `Handler(getMainLooper())` di `CarInfo`, quindi update UI diretto, niente Runnable.)
3. `MyViewPageAdapter`: `getCount 0x4→0x5`; in `<init>` `m_test_view_4 = DebugLog.createView(ctx)` (riusato il field già esistente ma inutilizzato); aggiunto `:pswitch_4` + voce nella `packed-switch` → **5ª pagina (indice 4) = overlay**.
4. `AndroidManifest.xml`: aggiunti `WRITE_EXTERNAL_STORAGE` + `READ_EXTERNAL_STORAGE`.
5. `FullscreenActivity.onCreate`: `requestPermissions({WRITE_EXTERNAL_STORAGE}, 1)` subito dopo `super.onCreate` (runtime grant API 28). Se l'utente non concede, niente file ma overlay ok.

**Uso lato utente**: scorri fino alla **5ª pagina** per vedere i dati live; il file `Download/ntg_carinfo_log.txt` (memoria interna, niente SD esterna) si copia su USB. Se la pagina/ il file restano vuoti → CarInfo non sta consegnando dati (probabile effetto Strada C, vedi [[ntg062-overview]]).

**Trappola incontrata**: i commenti smali vanno con `#`, NON con `.line <testo>` (`.line` vuole solo un numero → apktool fallisce con "no viable alternative at input").
