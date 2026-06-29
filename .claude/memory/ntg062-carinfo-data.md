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

**Tassonomia COMPLETA delle classi** (verificata 2026-06-25 leggendo `CarInfo.java`; `ID = what/10000`, ogni classe ha `OFFSET=ID*10000`). Le NON registrate vanno aggiunte all'array `ids[]` in `CarInfoManager.init` per riceverle in push:
- `General`=1 · `Keys`=2 (solo `KEY_IN`) · `AirCondition`=3 (es. OUT_TEMPERATURE) · `Seats`=4 · `Doors`=5 · `Windows`=6 · `WheelsAndTires`=7 · `Mirrors`=8 · `SteeringWheel`=9 (solo `HEATED`) · `Instruments`=10 (+ range 101xxx = flag config per-brand) · `Lighting`=11 (nome reale, **non** "Lights") · `DriverAssistance`=12 (120xxx) · `DrivingAndOperating`=13 (vuota) · `ReverseAndAVM`=14 · `Wipers`=15 · `Battery`=16 (EV, irrilevante diesel) · `Vehicles`=17 · `Other`=19 · più `CarPhone`.
- ⚠️ **CORREZIONE**: non esiste alcuna classe `Maintenance`. Il vecchio appunto "`Maintenance`=120xxx, `REMAINING_MAINTENANCE_MILEAGE`=120081" era **errato**: 120xxx = **`DriverAssistance`** (ADAS) e 120081 = `ASSIST_AUTO_BRAKE`.
- Registrate (già in push, vedi sopra): `ReverseAndAVM`, `General`, `Instruments`, `Vehicles`. ⚠️ **`Doors` NON più registrata dal 2026-06-29** (rimossa con la pagina porte, punto 16 di [[ntg062-applied-mods]]): array `init()` sceso a 4 elementi, `onCarInfoDataChanged` non gestisce più `what 0xc351`/50001.

**Valori telemetrici mostrabili più utili per diesel A5** (tutti in `Instruments`, già ricevuti):
- 100002 `INSTANTANEOUS_FUEL` (consumo istantaneo) · 100003 `AVERAGE_FUEL` (medio)
- 100045 `REMAIN_FUEL` · 100232 `FUEL_LEVEL` (livello %) · 100011 `FUEL_RECHARGE_MILEAGE` (autonomia km) · 100148 `FUEL_CONSUMPTION_RANGE`
- 100058 `OIL_TEMPERATURE` · 100059 `COOLANT_TEMPERATURE` (temp acqua)
- 100042 `ENGINE_TACHOMETER` / 100004 `TACHOMETER` (giri) · 100043 `INSTANTANEOUS_SPEED`
- 100001 `AVERAGE_SPEED` · 100015 `SINCE_REFUELING_DISTANCE`

**Altri dati utili scoperti (2026-06-25), fuori da `Instruments`**:
- **`WheelsAndTires`** (70xxx, NON registrata): `TIRE_PRESS_MONITORING_INFO`=70001, `TIRE_PRESS_WARNING_INFO`=70002, `TIRE_TEMP_MONITORING_INFO`=70007, `TIRE_PRESS_WARNING_TEMP_INFO`=70015 → **TPMS pressione/temperatura gomme** (molto rilevante su Audi; tipicamente Bundle per-ruota).
- **`ReverseAndAVM`** (140xxx, **GIA registrata → arriva già in push**, ma `onCarInfoDataChanged` scarta tutto tranne 140062): `FRONT_RADAR_DISTANCE`=140016, `REAR_RADAR_DISTANCE`=140017, `FRONT/REAR/LEFT/RIGHT_RADAR_LEVEL`=140007/140006/140008/140009 (sensori parcheggio), `GEAR`=140080 (marcia), `IG_STATUS`=140061 (quadro/accensione), `ESP_STATE`=140092, `REVERSE`=140011, `ANGLE`=140057 (sterzo), `HAS_AVM`=140078. → **per mostrarli basta aggiungere un `case` in `CarInfoManager.onCarInfoDataChanged`** (nessuna registrazione extra). NB esiste anche `ReverseAVMInfo` via servizio DVR con gli stessi dati, vedi [[ntg062-architecture-ipc]].
- **`General`** (10xxx): `VIN`=10016, `CANBOX_VERSION`=10004, `STM32_VERSION`=10034/`STM8_VERSION`=10035 (firmware MCU), `KEYCODE_EVENT`=10045 (canale che `CarKeyView` usa per inviare i tasti auto), unità `UNIT_SPEED`=10006/`UNIT_MILEAGE`=10005/`UNIT_TEMPERTURE`=10007/`UNIT_FUEL_CONSUMPTION`=10010/`UNIT_TIRE_PRESS`=10011/`UNIT_SYSTEM`=10033.
- **`DriverAssistance`** (120xxx, NON registrata): flag `AUDI_*` (vedi [[ntg062-architecture-ipc]]), più `ALTITUDE`=120100, `COMPASS`=120101, `CAR_TURBO_ICON`=120195, `AUTO_START_STOP`=120145, blind-spot/AEB ecc.

**Per sostituire il dato mostrato al posto del mileage** (vista `CarMileageSpeedView`, `mileage_layout.xml`, TextView id `mileage`):
opzione minima = in `CarInfoManager.onCarInfoDataChanged` cambiare/aggiungere il `case` dal `what` voluto e instradarlo a `updateTotalMileage`/`updateMileage`. La view formatta `"<value> <unit>"`; l'unità (`unit==1` imperiale) va adattata al nuovo dato.

**Caveat forte (onestà tecnica)**: è firmware generico multi-brand. Che un dato `what` *arrivi davvero* dipende dal CAN-box e da cosa decodifica per la specifica Audi — molti `what` sono per altri marchi e non verranno mai popolati. ✅ **Il servizio CarInfo SI collega sotto Strada C** — confermato sulla testata utente (2026-06-25): porte/velocità mostrano **dati reali** senza privilegi system (vedi [[ntg062-overview]]). Quindi l'incertezza residua è solo **per-`what`** (il CAN-box Audi decodifica quel dato?), NON se il servizio/AIDL funziona.

---

## RISCONTRO EMPIRICO (dump reale CAN-box, `ntg_carinfo_log.txt`)
Dump PULL one-shot su ~2271 `what` (`getInt/Float/String`), su Audi A5 reale, quadro ACC, **20 valori non nulli**. Il PULL **bypassa la registrazione classi** (i `30xxx` AirCondition compaiono pur non essendo registrati) → **un `what` nullo significa che il box NON lo decodifica**, non un problema lato app.

- **Box**: `CANBOX_VERSION` 10004 = `YT-A4Q5-GD-Hx V212,L-5,DBF,L33,0201` → profilo decoder **Audi A4/Q5** (corretto per A5, stessa piattaforma). `L-5,DBF,L33` = banchi/profili, potenzialmente riconfigurabili.
- **DISPONIBILI (affidabili)**: `ENGINE_TACHOMETER` 100042 (giri) · `CURRENT_SPEED` 140062 · `ANGLE` 140057 (sterzo) · `ACC` 140086 · `POSITON_LIGHT` 140059 · `KEY_BRIGHTNESS` 100006 (dimmer) · clima completo `WIND_LEVEL` 30004 / `WIND_MODE` 30003 / `DUAL` 30057 / `POWER`+`OFFSET` 30000 · `MEDIA_SOURCE` 100085 · `CURRENT_MODEL` 170004 · `CAR_AUX_EVENT_TYPE` 100281 · flag config `AUDI_*`/`BENZ_*` 120xxx (default firmware, non telemetria).
- **ASSENTI ma SOLO probabilmente** (int/float, sarebbero stati catturati se popolati): carburante (100002/3/45, 100232, 100011), temp acqua/olio (100059/100058), temp esterna (30023), retromarcia/PDC, batteria 160xxx.
- ✅ **CONFERMATO NON LEGGIBILE sull'Audi A5 dell'utente (2026-06-29)**: **GEAR / current gear `140080`**, **RADAR_DISTANCE `140016`/`140017`** (sensori parcheggio cm) e i **RADAR_LEVEL `140006`-`140009`** non sono popolati dal CAN-box → restavano a 0 a schermo. È il motivo per cui la pagina `CarSensorView` (sensori+marcia) è stata **rimossa** (punto 17 di [[ntg062-applied-mods]]). Morale: di `ReverseAndAVM` (140xxx) questo box decodifica di fatto solo `CURRENT_SPEED 140062`, `ANGLE 140057`, `ACC 140086`, `POSITON_LIGHT 140059` (vedi DISPONIBILI sopra), NON marcia/PDC.

### CORREZIONE — il dump NON sonda i Bundle (il chilometraggio C'È)
Il criterio del dump era `int!=0 / float!=0 / stringa non vuota` → **i `what` di tipo Bundle sono stati saltati**, non risultano "assenti". L'app legge proprio via `getBundle`:
- **`TOTAL_RECHARGE_MILEAGE` 100013** = **chilometraggio totale** → Bundle con chiavi `"value"` + `KEY_UNIT`. Letto in [CarInfoManager.java:71-74](../../NTG_062_src/java/com/spd/xhsntg/CarInfoManager.java#L71) (pull a connessione) e case 100013 (push). **Quindi il mileage SU QUESTA A5 arriva** (confermato dall'utente: l'app originale lo mostra). Il piano "sostituire/usare il dato mileage" è di nuovo valido.
- **`Doors.OPENED` 50001** = stato porte/cofano/baule, anch'esso Bundle.
- Per sapere la disponibilità reale dei Bundle serve estendere la sonda con `getBundle` sui codici candidati (l'attuale overlay int/float/string non basta).
- **CVT Multitronic** (A5 dell'utente, niente rapporti fissi): 1103 giri @ 68 km/h è veritiero → i valori del dump sono genuini, non stale.

- **Implicazioni**: parametri come carburante/temperature *probabilmente* non si sbloccano via APK (serve riconfig/firmware box, box diverso, o OBD-II parallelo), ma mileage e porte sono già disponibili.
