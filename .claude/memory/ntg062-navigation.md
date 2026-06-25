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
**PAGINA MAPPA/NAVI RIMOSSA INTERAMENTE** (richiesta utente: togliere la "terza pagina, quella con la mappa"). Eliminato l'intero package `smali/com/spd/navi/` (`NaviManager`, `NaviManager$1/$2`, `AmapAutoNaviFrameManager`, `WeCarNaviFrameManager`), il layout `res/layout/navi_layout.xml`, i drawable `navi_bg.png`/`navi_tip.png`, la stringa `app_name_navigation` (da `values/` e `values-it/`) e tutte le relative voci `public.xml`. Nell'adapter (vedi [[ntg062-slider]]) rimossi i campi/creazione navi; `initManager()`/`uninitManager()` resi **no-op**. **Conseguenza**: non esiste piu il punto di avvio di Google Maps via `SETTING_NAVI_APP` che era su quella pagina (la navigazione esterna va lanciata altrimenti). Resta orfano (innocuo) il campo costante `navi_layout` in `com/spd/xhsntg/R$layout.smali`.

### Storia precedente (pre-rimozione, per contesto)
Prima erano state rimosse **entrambe** le navigazioni integrate: WeCar (Fase 1) e AMap. Gli stub no-op `Amap*`/`WeCar*NaviFrameManager` e `NaviManager` (riquadro statico con tap → `SETTING_NAVI_APP`) **non esistono piu** dopo la rimozione totale qui sopra. Vedi [[ntg062-applied-mods]].
