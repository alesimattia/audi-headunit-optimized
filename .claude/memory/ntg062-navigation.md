---
name: ntg062-navigation
description: NTG_062 — schermata navigazione (widget info da broadcast AMap) e logica di avvio app mappe (SETTING_NAVI_APP)
metadata:
  type: reference
---

Pagina 2 dello slider = `navi_layout.xml` + `NaviManager` (+ `AmapAutoNaviFrameManager`, `WeCarNaviFrameManager`). **Non è una mappa vera**: è un widget di info-svolta:
- icona manovra `id_text_navi_cross_icon` + distanza `id_text_navi_cross_distance` (+`_extends` per l'unità) + prossima strada `id_text_navi_cross_name` (+`_extends` = "Enter"/"Entra in").
- Dati **live da AMap Auto** via broadcast `AUTONAVI_STANDARD_BROADCAST_SEND` (parse `KEY_TYPE` 10001 = guida, 10019 = stato navigazione); richiesta via `AUTONAVI_STANDARD_BROADCAST_RECV`. L'icona manovra = `assets/a_map_auto_tip_<iconId>.png`. Il ramo WeCar usa `assets/cross_tip_<id>.png`.

**Comportamento al tocco** (questo è il "avvia navigazione o Google Maps"): legge `Settings.System "SETTING_NAVI_APP"` e lancia quell'app con `getLaunchIntentForPackage(pkg)`; se fallisce apre il selettore (intent `com.spd.action.settingui`, `index 10000`). Quindi apre **qualunque** app di navigazione configurata — anche `com.google.android.apps.maps` se così impostato.

App riconosciute nativamente: `com.autonavi.amapauto` (AMap Auto), `com.tencent.wecarnavi` (WeCar Navi). **Nessun `geo:` o package Google Maps hardcoded in `com.spd`** (quei riferimenti erano nelle librerie androidx).

**Per forzare una specifica app navi**: modificare nello smali le letture di `SETTING_NAVI_APP` (in `NaviManager`/`AmapAutoNaviFrameManager`), oppure impostare quel valore in `Settings.System`. Workflow modifica in [[ntg062-modding-build]].

## STATO ATTUALE (sorgenti `NTG_062_src/`)
**Entrambe** le navigazioni integrate sono state rimosse: WeCar (Fase 1) e **AMap** (richiesta successiva). `AmapAutoNaviFrameManager` e `WeCarNaviFrameManager` sono **stub no-op**; eliminati `GuideInfoExtraKey`, gli asset `a_map_auto_tip_*`/`cross_tip_*`, i broadcast AMap. `NaviManager` è intatto: la pagina navi è ora un **riquadro statico** (`navi_bg` + pin `navi_tip` + "Navigazione") che al tap lancia `SETTING_NAVI_APP` (impostare su `com.google.android.apps.maps` per Google Maps). **Niente pannello live** (era solo AMap). Vedi [[ntg062-applied-mods]] (punto 10) — modifica STAGED, non ancora ricompilata.
