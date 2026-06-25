---
name: ntg062-dvr-tuning
description: NTG_062 — superficie di controllo DVR (AIDL IDVRService, SettingInfo) e cosa serve per migliorare qualità/FPS/apertura. Per la Fase 2 ottimizzazioni.
metadata:
  type: reference
---

Il **DVR è un servizio ESTERNO** (`com.spd.dvr`, action `com.spd.service.dvrservice`; il client si registra come `"com.spd.spddvr"`/`com.spd.spddvr`). L'app `com.spd.xhsntg` è solo **client AIDL** via `IDVRService`, wrappato in `com/spd/xhsntg/DvrHelper`. La cattura (risoluzione/fps/codec/bitrate) la fa il **servizio + hardware camera**, non quest'app. Oggi l'app chiama **solo** `startPreviewByChannel(0, surface)` (anteprima canale 0) — **non imposta mai** la qualità.

**SIGNIFICATO DEL CANALE 0 (confermato dall'utente, giu 2026)**: il `DvrPreviewSurfaceView` ha `custom:dvr_channel="0"` (layout `activity_fullscreen.xml`) e `video_mode` default = 1 (RECORD/preview). Il **canale 0 è il BYPASS dell'ingresso video LVDS del display originale dell'auto** (la testata mostra nel riquadro destro esattamente cio che mostrava il display di fabbrica). **In retromarcia** quel canale 0 commuta sulla **retrocamera**: la commutazione avviene a livello HARDWARE/servizio DVR, NON nell'APK. `ReverseBroadcast` (`com.spd.action.ntg.reverse.START`/`.STOP`, key `reverse`) si limita a portare `FullscreenActivity` in primo piano (`startNTG` con extra reverse) e a notificare i `Callback.onReverseState`; l'app continua a fare preview dello stesso canale 0 — non cambia mai canale per la retromarcia. Flusso preview app: `FullscreenActivity.checkPreviewShow()` → `setDvrChannel(1,0)` in resume+servizio connesso; `onPause` → `setDvrChannel(0,0)` (chiude). `DvrPreviewSurfaceView.checkDvrChannel`: mode 1 → `startPreviewByChannel(0,surface)` / stop `dvrControlCmd(1001,...)`; mode 2 (playback) → `setPlaybackSurface` + `dvrControlCmd(1004/1007,...)`.

**Superficie AIDL utile (già wrappata in `DvrHelper`)**:
- `getSettingInfo()` / `setSettingInfo(SettingInfo)` — leggi/scrivi le impostazioni DVR.
- `setCameraDeviceParam(csi, channel, type, value)` / `getCameraDeviceParam(csi, channel, type)` — parametri a livello camera.
- `sendSettingCommand(msg, arg0, arg1)`, `dvrControlCmd(cmd, arg0, arg1)`.
- `startPreviewByChannel(channel, surface)`, `setPlaybackSurface(surface)`.
- `dvrControlCmd` noti (da `DvrPreviewSurfaceView`): **1001** stop preview, **1004** playstate, **1007** stop playback, **1010** seek.

**Superficie AVM/retro/radar di `IDVRService` NON wrappata in `DvrHelper`** (capacita non sfruttate: `getReverseInfo()`→`ReverseAVMInfo` con radar parcheggio 4 lati/AVM/linee guida/auto-park/porte/LVDS, `registerReverseInfoCallback`, `get/setAvmConfigParam`, car-model-pay): mappata in [[ntg062-architecture-ipc]] — fonte piu ricca di parametri-auto extra senza l'AIDL CAN, ma dipende dall'hardware AVM.

**`SettingInfo`** (`com.spd.dvr.entity.aidl`, tutti `int` = indici il cui significato lo decide il servizio): `recoderRatio` (risoluzione registrazione), `mainStream`/`subStream`/`subRatio`, `codecFormat` (H.264/H.265), `fileFormat`, `previewRatio`, `preViewCount`/`recoderCount`, `recoderTime`, `segmentSize`, `waterMask`, `remoteMonitor`, `audioRecord`, `gSensor`, `autoRecoder`, `savePath`/`selectedPath`, `delayShutdown`, `lowVoltage`, `subRecoderSwitch`.

**Per migliorare qualità/FPS** (Fase 2): leggere `getSettingInfo()` corrente, poi `setSettingInfo()` con `recoderRatio`/`mainStream`/`codecFormat` ai valori massimi supportati (+ eventualmente `setCameraDeviceParam`). **MA i valori validi li definisce il servizio esterno** → serve decompilare **`com.spd.dvr`** (l'utente lo fornisce: es. `adb pull`) per mappare int→risoluzione/fps/codec/bitrate. Senza mappa, impostare valori è indovinare (rischio: registrazione rotta). Limite ultimo = hardware camera.

**Dove applicare**: in `FullscreenActivity` (es. dopo `onServiceConnected`) aggiungere chiamate `DvrHelper.setSettingInfo(...)`/`setCameraDeviceParam(...)` coi valori mappati; poi **verificare che la registrazione funzioni** (file riproducibili, no crash servizio).

**Velocità di apertura** (lato client, guadagno marginale): oggi `startService` in `onCreate`, `bindService` in `onStart`, preview quando `m_service_connect_flag && m_resume_flag && surface pronta`. Anticipare il bind aiuta poco: il costo dominante (bind + warm-up camera/encoder) è nel servizio esterno.

Vedi modifiche già fatte in [[ntg062-applied-mods]], workflow build in [[ntg062-modding-build]].
