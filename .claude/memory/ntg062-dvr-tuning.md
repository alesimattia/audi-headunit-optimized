---
name: ntg062-dvr-tuning
description: NTG_062 — superficie di controllo DVR (AIDL IDVRService, SettingInfo) e cosa serve per migliorare qualità/FPS/apertura. Per la Fase 2 ottimizzazioni.
metadata:
  type: reference
---

Il **DVR è un servizio ESTERNO** (`com.spd.dvr`, action `com.spd.service.dvrservice`; il client si registra come `"com.spd.spddvr"`/`com.spd.spddvr`). L'app `com.spd.xhsntg` è solo **client AIDL** via `IDVRService`, wrappato in `com/spd/xhsntg/DvrHelper`. La cattura (risoluzione/fps/codec/bitrate) la fa il **servizio + hardware camera**, non quest'app. Oggi l'app chiama **solo** `startPreviewByChannel(0, surface)` (anteprima canale 0) — **non imposta mai** la qualità.

**Superficie AIDL utile (già wrappata in `DvrHelper`)**:
- `getSettingInfo()` / `setSettingInfo(SettingInfo)` — leggi/scrivi le impostazioni DVR.
- `setCameraDeviceParam(csi, channel, type, value)` / `getCameraDeviceParam(csi, channel, type)` — parametri a livello camera.
- `sendSettingCommand(msg, arg0, arg1)`, `dvrControlCmd(cmd, arg0, arg1)`.
- `startPreviewByChannel(channel, surface)`, `setPlaybackSurface(surface)`.
- `dvrControlCmd` noti (da `DvrPreviewSurfaceView`): **1001** stop preview, **1004** playstate, **1007** stop playback, **1010** seek.

**`SettingInfo`** (`com.spd.dvr.entity.aidl`, tutti `int` = indici il cui significato lo decide il servizio): `recoderRatio` (risoluzione registrazione), `mainStream`/`subStream`/`subRatio`, `codecFormat` (H.264/H.265), `fileFormat`, `previewRatio`, `preViewCount`/`recoderCount`, `recoderTime`, `segmentSize`, `waterMask`, `remoteMonitor`, `audioRecord`, `gSensor`, `autoRecoder`, `savePath`/`selectedPath`, `delayShutdown`, `lowVoltage`, `subRecoderSwitch`.

**Per migliorare qualità/FPS** (Fase 2): leggere `getSettingInfo()` corrente, poi `setSettingInfo()` con `recoderRatio`/`mainStream`/`codecFormat` ai valori massimi supportati (+ eventualmente `setCameraDeviceParam`). **MA i valori validi li definisce il servizio esterno** → serve decompilare **`com.spd.dvr`** (l'utente lo fornisce: es. `adb pull`) per mappare int→risoluzione/fps/codec/bitrate. Senza mappa, impostare valori è indovinare (rischio: registrazione rotta). Limite ultimo = hardware camera.

**Dove applicare**: in `FullscreenActivity` (es. dopo `onServiceConnected`) aggiungere chiamate `DvrHelper.setSettingInfo(...)`/`setCameraDeviceParam(...)` coi valori mappati; poi **verificare che la registrazione funzioni** (file riproducibili, no crash servizio).

**Velocità di apertura** (lato client, guadagno marginale): oggi `startService` in `onCreate`, `bindService` in `onStart`, preview quando `m_service_connect_flag && m_resume_flag && surface pronta`. Anticipare il bind aiuta poco: il costo dominante (bind + warm-up camera/encoder) è nel servizio esterno.

Vedi modifiche già fatte in [[ntg062-applied-mods]], workflow build in [[ntg062-modding-build]].
