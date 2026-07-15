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

## RISCONTRO EMPIRICO (monitor continuo PULL+PUSH, `carinfo_readable_dedup.log`)
Rilievo dal **monitor PULL+PUSH** (vedi [[ntg062-debug-overlay]] / IMPLEMENTAZIONE_DUMP_CARINFO.md): PULL periodico + **PUSH live**, mappa deduplicata, filtro zeri, motore acceso e **auto in movimento**. **Le righe `push=` = prova più forte di leggibilità** (il box notifica → decodificato anche se valore corrente 0); i `push=` riflettono l'ultima notifica (aggiornata solo al cambiamento). I campi **`min=`/`max=`** (aggiunti dalla cattura 2026-07-14) danno l'escursione osservata: `min≠max` = dato **vivo/variabile**. Sintesi completa in `DATI_MOSTRABILI.md`.

- **Box**: `CANBOX_VERSION` 10004. ⚠️ **La codifica CAMBIA tra i rilievi** e determina quali segnali discreti sono decodificati: rilievo 2026-07-14 = `YT-A4Q5-GD-Hx V212,L-5,8CE,L33,0211`; rilievo precedente = `…,L-5,BA8,L33,0261`. Profilo decoder Audi A4/Q5 (corretto per A5). Il cambio `0261`→`0211`/`BA8`→`8CE` è la prova diretta che ricodificare il box altera il set di dati esposti.
- **LEGGIBILI** (cattura 2026-07-14, `elementi rilevati=363`): `ENGINE_TACHOMETER` 100042 (giri; range **688→1834**, vivo) · `CURRENT_SPEED` 140062 (push; range **1→74 km/h**, vivo) · `TOTAL_RECHARGE_MILEAGE` 100013 Bundle=**220697** (odometro, già mostrato) · `ANGLE` 140057 (sterzo, float; range **-0.79→0.60**, vivo) · `ACC` 140086 · `KEY_BRIGHTNESS` 100006 (dimmer; range 33→61) · `MEDIA_SOURCE` 100085 (=255 nessuna sorgente) · clima completo `TEMPERATURE` 30006 Bundle(setpoint=22.0) / `WIND_LEVEL` 30004 / `WIND_MODE` 30003 / `DUAL` 30057 / `POWER`+`OFFSET` 30000 / `SYNC…ZONES` 30040 / `CURRENT_MODE` 100278 · `OPENED` 50001 Bundle (porte, tutte chiuse) · `TIME`/`DATE` 10001/10002 · `LEFT/RIGHT_RADAR_LEVEL` 140008/140009 (solo `enable=1`, distanze NO) · `CURRENT_MODEL` 170004 · flag `AUDI_*` 120xxx · segnali discreti via PUSH: `REVERSE` **140011** (retromarcia; push=0=non in retro) · `TURN_SIGNAL_LAMP` **140058** (frecce) · `POSITON_LIGHT` **140059** (luci posizione) · `HEADLAMP_HIGH_BEAMS`/`OFFSET` **110000** (push=0 in questa cattura, int=1 nella precedente). **⚠️ `REVERSE` leggibile → possibile auto-attivazione cam. posteriore/PDC** (confermare con retro inserita).
- ⚠️ **LEGGIBILI ma non ri-osservati 2026-07-14** (push-only notificati solo al cambiamento; visti push=1 in rilievo precedente **da fermo**, non ri-notificati con auto in moto → assenza NON conclusiva): `HAND_BRAKE` **120080** · `PARKING` **140010**. Per riconfermarli serve rilievo a veicolo fermo.
- ❌ **NON LEGGIBILE** (0/`null` anche in movimento → conclusivo): **GEAR/selettore marcia `140080`** (≠ REVERSE: posizione D/N/R non decodificata) · `IG_STATUS` 140061 (solo `ACC` risponde) · **RADAR_DISTANCE `140016`/`140017`** e radar ant/post `RADAR_LEVEL 140007`/`140006` (`enable=0`) → motivo per cui `CarSensorView` è **rimossa** (punto 17 di [[ntg062-applied-mods]]) · carburante 100002/3/45/232/**011 autonomia=-0.1** · temp acqua/olio 100059/100058 · temp esterna 30023 (0.0) · `VOLTAGE` 160013 · trip A/B 100150/100249 · vel. media 100001 · TPMS 70001/70007/70002 (0.0) · PM2.5 30060/30061 · `AUTO_PARKING_HINT` 140066 (active=0) · info/fault batteria-motore-carrozzeria 160046-160051 (Bundle `null`).
- **Nota**: liste `ALL_MAKE/MODEL/CANBOX` 170002/170003/170001 e `BENZ_FUNCTION_*`/`AUDI_*` = cataloghi di configurazione firmware multi-brand (nomi in cinese), NON telemetria. `carinfo_logcat.log` = logcat DVR/UI, nessun dato CarInfo.

### Istogramma PUSH puri (`carinfo_events_append.log`, 2026-07-15, 7707 notifiche)
Solo eventi `push=` (notifica spontanea del box). `what` distinti notificati con conteggio ed escursione:
- `ENGINE_TACHOMETER` 100042 — 3457 push, **0→2207** (RPM, dominante)
- `ANGLE` 140057 — 2522 push, **-0.959→0.957** (sterzo; ~0 in rettilineo)
- `CURRENT_SPEED` 140062 — 1353 push, 0→75 km/h
- `KEY_BRIGHTNESS` 100006 — 175, 0→100 · `CANBOX_VERSION` 10004 — 74 (stringa) · `TIME` 10001 — 25 · `DATE` 10002 — 1
- `WIND_MODE` 30003 — 22 (64→128) · `WIND_LEVEL` 30004 — 5 (9→11) · `SYNC…ZONES` 30040 — 6 (0→5) · `POPUP` 30014 — 9 · `POWER/OFFSET` 30000 — 2 · `TEMPERATURE` 30006 — 2
- `TOTAL_RECHARGE_MILEAGE` 100013 — 22
- `TURN_SIGNAL_LAMP` 140058 — 13 (0→3, frecce) · `POSITON_LIGHT` 140059 — 10 (**0→1**) · `REVERSE` 140011 — 5 (**0→1**, retromarcia notificata con valore 1!) · `ACC` 140086 — 2
- `HEADLAMP_HIGH_BEAMS`/canale luci **110000** — 2 (**0→1**, VIVO)
- ⚠️ **`HEADLAMP_LOW_BEAMS` 110001 (anabbaglianti) NON compare** — mai notificato né qui né nel rilievo 2026-07-14. Il box notifica il canale luci su **110000, non 110001**. → l'icona anabbaglianti cablata su 110001 resterà quasi certamente spenta.

### Interpretazione `ANGLE` 140057 e catena sterzo (2026-07-15)
Il grezzo è quasi certamente **radianti del VOLANTE** (non delle ruote, non normalizzato): ≈0 in rettilineo, ~0.03 con micro-correzioni, max **0.96 rad ≈ 55°** di volante nel rilievo (sterzata moderata, NON fondo corsa). Un valore normalizzato ±1=fondo corsa è escluso (0.03 in rettilineo sarebbe 25° di volante, assurdo); road-wheel radians è escluso (0.96 rad=55° supererebbe il fondo corsa ruote). **Dato utente**: volante ≈ 2 giri + 120° = **840°/lato** a fondo corsa; ruote ≈ **40°/lato** → rapporto sterzo **≈21:1**. L'indicatore volante in `CarMileageSpeedView.updateSteeringAngle` mappa raw→gradi ruote (`×57.29578 ×40/840`, clamp ±40°) — vedi [[ntg062-slider]]. ⚠️ **Scala DERIVATA non misurata**: il fondo corsa non è mai stato catturato. Per taratura esatta serve un rilievo girando il volante tutto a sx→centro→tutto a dx e leggere `ANGLE` grezzo agli estremi.

### Bundle sondati dal monitor (il chilometraggio C'È)
Il monitor PULL+PUSH sonda anche `getBundle` → i `what` Bundle compaiono. L'app legge via `getBundle`:
- **`TOTAL_RECHARGE_MILEAGE` 100013** = **chilometraggio totale** → Bundle `"value"` + `KEY_UNIT` (≈220697, cresce col percorso). Letto in [CarInfoManager.java:71-74](../../NTG_062_src/java/com/spd/xhsntg/CarInfoManager.java#L71) (pull a connessione) e case 100013 (push). Piano "sostituire/usare il dato mileage" valido.
- **`Doors.OPENED` 50001** = stato porte/cofano/baule (Bundle, tutti 0=chiusi).
- **`TEMPERATURE` 30006** (Bundle setpoint clima), **TPMS 70001/70007** (Bundle, ma tutti 0.0 → morti).

- **Implicazioni**: carburante/temperature non si sbloccano via APK (serve riconfig/firmware box, box diverso, o OBD-II parallelo); mileage, porte e segnali discreti (retro/luci/frecce/freni) sono disponibili.
