---
name: ntg062-carinfo-data
description: NTG_062 — dizionario dati CarInfo (what codes), come si aggiunge/sostituisce un dato mostrato, classi registrate vs non registrate
metadata:
  type: reference
---

Il flusso dati telemetrici (vedi [[ntg062-slider]]) passa per l'AIDL `ICarInfoAidlInterface`:
- **PUSH**: `registerCallback(pkg, ids[], cb)` → callback generici `onCarInfoIntChanged/Float/String/BundleChanged(what, value, unit)`. `what` = costante intera definita in `com.spd.carinfo.CarInfo` (file enorme, ~175KB, raggruppato in classi annidate per range).
- **PULL**: anche `getInt/getFloat/getString/getBundle(what, arg)` → si può *interrogare* un valore on-demand, non solo riceverlo.

**Smistamento app**: `CarInfoManager.onCarInfoDataChanged(what, obj, unit)` ha uno `switch` che gestisce SOLO pochi `what` (speed 140062, unit 10006, doors 50001, total mileage 100013, media source 100085, car model 170004) e **ignora tutto il resto**, pur ricevendolo.

**Classi registrate** in `CarInfoManager` (init, riga ~34) → questi range arrivano già in push:
- `Instruments` = **100xxx / 101xxx** (telemetria principale + flag config per-brand)
- `Vehicles` = 170xxx · `ReverseAndAVM` = 140xxx · `Doors` = 50xxx · `General` (es. UNIT_SPEED=10006)

**Classi NON registrate** (per usarle va aggiunto il CLASS_NAME all'array `ids[]` in `CarInfoManager`):
- `AirCondition` = **30xxx** (es. `OUT_TEMPERATURE`=30023 temp esterna)
- `Battery` = **160xxx** (es. `VOLTAGE`=160013 tensione batteria) — quasi tutto EV, irrilevante per diesel
- `Maintenance` = **120xxx** (es. `REMAINING_MAINTENANCE_MILEAGE`=120081)
- `Lights` = 110xxx

**Valori telemetrici mostrabili più utili per diesel A5** (tutti in `Instruments`, già ricevuti):
- 100002 `INSTANTANEOUS_FUEL` (consumo istantaneo) · 100003 `AVERAGE_FUEL` (medio)
- 100045 `REMAIN_FUEL` · 100232 `FUEL_LEVEL` (livello %) · 100011 `FUEL_RECHARGE_MILEAGE` (autonomia km) · 100148 `FUEL_CONSUMPTION_RANGE`
- 100058 `OIL_TEMPERATURE` · 100059 `COOLANT_TEMPERATURE` (temp acqua)
- 100042 `ENGINE_TACHOMETER` / 100004 `TACHOMETER` (giri) · 100043 `INSTANTANEOUS_SPEED`
- 100001 `AVERAGE_SPEED` · 100015 `SINCE_REFUELING_DISTANCE`

**Per sostituire il dato mostrato al posto del mileage** (vista `CarMileageSpeedView`, `mileage_layout.xml`, TextView id `mileage`):
opzione minima = in `CarInfoManager.onCarInfoDataChanged` cambiare/aggiungere il `case` dal `what` voluto e instradarlo a `updateTotalMileage`/`updateMileage`. La view formatta `"<value> <unit>"`; l'unità (`unit==1` imperiale) va adattata al nuovo dato.

**Caveat forte (onestà tecnica)**: è firmware generico multi-brand. Che un dato `what` *arrivi davvero* dipende dal CAN-box e da cosa decodifica per la specifica Audi — molti `what` sono per altri marchi e non verranno mai popolati. Inoltre sotto **Strada C** (no privilegi di sistema, vedi [[ntg062-overview]]) il servizio CarInfo potrebbe non collegarsi affatto → schermate a dati vuoti. Da validare con logcat su testata.

---

## RISCONTRO EMPIRICO (dump reale CAN-box, `ntg_carinfo_log.txt`)
Dump PULL one-shot su ~2271 `what` (`getInt/Float/String`), su Audi A5 reale, quadro ACC, **20 valori non nulli**. Il PULL **bypassa la registrazione classi** (i `30xxx` AirCondition compaiono pur non essendo registrati) → **un `what` nullo significa che il box NON lo decodifica**, non un problema lato app.

- **Box**: `CANBOX_VERSION` 10004 = `YT-A4Q5-GD-Hx V212,L-5,DBF,L33,0201` → profilo decoder **Audi A4/Q5** (corretto per A5, stessa piattaforma). `L-5,DBF,L33` = banchi/profili, potenzialmente riconfigurabili.
- **DISPONIBILI (affidabili)**: `ENGINE_TACHOMETER` 100042 (giri) · `CURRENT_SPEED` 140062 · `ANGLE` 140057 (sterzo) · `ACC` 140086 · `POSITON_LIGHT` 140059 · `KEY_BRIGHTNESS` 100006 (dimmer) · clima completo `WIND_LEVEL` 30004 / `WIND_MODE` 30003 / `DUAL` 30057 / `POWER`+`OFFSET` 30000 · `MEDIA_SOURCE` 100085 · `CURRENT_MODEL` 170004 · `CAR_AUX_EVENT_TYPE` 100281 · flag config `AUDI_*`/`BENZ_*` 120xxx (default firmware, non telemetria).
- **ASSENTI ma SOLO probabilmente** (int/float, sarebbero stati catturati se popolati): carburante (100002/3/45, 100232, 100011), temp acqua/olio (100059/100058), temp esterna (30023), retromarcia/PDC, batteria 160xxx.

### CORREZIONE — il dump NON sonda i Bundle (il chilometraggio C'È)
Il criterio del dump era `int!=0 / float!=0 / stringa non vuota` → **i `what` di tipo Bundle sono stati saltati**, non risultano "assenti". L'app legge proprio via `getBundle`:
- **`TOTAL_RECHARGE_MILEAGE` 100013** = **chilometraggio totale** → Bundle con chiavi `"value"` + `KEY_UNIT`. Letto in [CarInfoManager.java:71-74](../../NTG_062_src/java/com/spd/xhsntg/CarInfoManager.java#L71) (pull a connessione) e case 100013 (push). **Quindi il mileage SU QUESTA A5 arriva** (confermato dall'utente: l'app originale lo mostra). Il piano "sostituire/usare il dato mileage" è di nuovo valido.
- **`Doors.OPENED` 50001** = stato porte/cofano/baule, anch'esso Bundle.
- Per sapere la disponibilità reale dei Bundle serve estendere la sonda con `getBundle` sui codici candidati (l'attuale overlay int/float/string non basta).
- **CVT Multitronic** (A5 dell'utente, niente rapporti fissi): 1103 giri @ 68 km/h è veritiero → i valori del dump sono genuini, non stale.

- **Implicazioni**: parametri come carburante/temperature *probabilmente* non si sbloccano via APK (serve riconfig/firmware box, box diverso, o OBD-II parallelo), ma mileage e porte sono già disponibili.
