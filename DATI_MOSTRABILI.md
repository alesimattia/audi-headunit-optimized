# Dati leggibili dal CAN-box — riscontro REALE

Documento di riferimento per decidere **quale informazione mostrare al posto del
chilometraggio** nella seconda pagina dello slider
(view `CarMileageSpeedView`, layout `mileage_layout.xml`, TextView `mileage`/`speed`).

Target: **Audi A5 coupé diesel**, testata Android NTG (`com.spd.xhsntg`).

> Il riscontro proviene dal **monitor continuo PULL+PUSH** descritto in
> [IMPLEMENTAZIONE_DUMP_CARINFO.md](IMPLEMENTAZIONE_DUMP_CARINFO.md) (sorgente
> `ntg_carinfo_log.txt`): unisce PULL periodico + **PUSH live** in una mappa deduplicata,
> filtrando gli zeri. Le righe **`push=`** sono valori **notificati spontaneamente dal box** →
> la prova più forte che quel dato è decodificato. Rilievo con motore acceso e **auto in
> movimento**, `elementi rilevati=372`. I valori `push=` riflettono l'**ultima notifica**
> ricevuta dal box (il PUSH aggiorna solo al cambiamento): un valore può risalire a un istante
> precedente del percorso.

---

## 0. Esito in breve (TL;DR)

Il CAN-box montato è un **`YT-A4Q5-GD-Hx V212`** con codifica `…,BA8,L33,0261`: decoder con
**profilo generico Audi A4/Q5** (corretto per l'A5, stessa piattaforma).

- ✅ **Leggibili:** velocità, **giri motore**, **chilometraggio totale** (già mostrato), clima
  completo (temp impostata, ventola, modalità, doppia zona, sync zone), orologio/data, stato
  porte, **radar laterali** (flag presenza), identità veicolo/modello, versione CAN-box,
  **retromarcia** (`REVERSE`), **freno a mano** (`HAND_BRAKE`), **freno stazionamento**
  (`PARKING`), **frecce** (`TURN_SIGNAL_LAMP`), **luci di posizione** (`POSITON_LIGHT`),
  **abbaglianti/canale 110000** (`HEADLAMP_HIGH_BEAMS`), **angolo sterzo** (`ANGLE`),
  luminosità tasti (`KEY_BRIGHTNESS`).
- ❌ **NON leggibili** (`0.0` / `-0.1` / `null`): tutto il **carburante** (consumo
  istantaneo/medio, livello, residuo, **autonomia** = `-0.1`), **tutte le temperature**
  (refrigerante, olio, **esterna**), **tensione batteria**, **marcia (selettore GEAR)**, trip
  parziali A/B, velocità media, **pressione/temp gomme (TPMS)**, PM2.5, radar
  anteriore/posteriore (`enable=0`), info/fault di batteria-motore-carrozzeria (tutti `null`),
  manutenzione.

> **Distinzione importante:** è decodificato il **segnale di retromarcia** (`REVERSE 140011`),
> **non** il **selettore di marcia** (`GEAR 140080`, non popolato). `HAND_BRAKE` e `PARKING`
> sono notificati via PUSH (valore osservato `=1`): il valore risale probabilmente all'avvio da
> fermo, prima della marcia (il PUSH non ri-notifica finché non cambia). Che carburante,
> consumi e temperature restino a `0` **in movimento** è la prova più netta che non sono
> decodificati.

**Conseguenza pratica:** con `REVERSE` leggibile, l'attivazione automatica di **telecamera
posteriore / PDC in retromarcia** è plausibile (da confermare con un rilievo a marcia
effettivamente inserita: nel rilievo `push=0` = non in retro).

---

## 1. Come l'app ottiene i dati (e perché "iscritto" ≠ "popolato")

I valori arrivano dal servizio di sistema **CarInfo** via AIDL (`ICarInfoAidlInterface`).
Ogni dato ha un **codice `what`** (classe `com.spd.carinfo.CarInfo`). Due meccanismi:

- **PUSH** — il box notifica `onCarInfoDataChanged(what, valore, unità)` ad ogni cambiamento.
  Il monitor lo intercetta (registrazione allargata a 19 classi) → **ogni riga `push=` è la
  prova che il box decodifica quel `what`**, anche se il suo valore corrente è 0.
- **PULL** — `getInt / getFloat / getString / getBundle(what, arg)` interroga on-demand.
  **Bypassa l'iscrizione alle classi** → raggiunge qualsiasi `what`.

> **Perché il PUSH è dirimente:** un `0` nel solo PULL non distingue "decodificato ma a riposo"
> da "non decodificato". Se il box **invia** un `what`, quel dato è **provabilmente leggibile**,
> e cattura i **transitori** (freccia, retro, luci) che cadono tra due passate PULL. Il servizio
> CarInfo **si collega** (`connected=true`; chilometraggio, porte, clima reali) → l'unica
> incertezza resta **per-`what`**.

---

## 2. Cosa il box legge (valori presenti nel monitor)

Unità di sistema = metriche (`UNIT_* = 0` → km/h, km, °C).

> **Riscontro dall'app originale.** L'app di fabbrica mostra correttamente giri, velocità,
> contachilometri e stato porte — coerente coi canali qui popolati.

### 2.1 Telemetria viva
| Informazione | `what` | Costante | Valore nel monitor | Note |
|---|---|---|---|---|
| **Giri motore** | `100042` | `ENGINE_TACHOMETER` | **630** (push `646`) | RPM. Unico dato *motore* vivo. Ha riga `push=` → notificato. |
| **Velocità** | `140062` | `CURRENT_SPEED` | `float=1.0` (push `0.0`) | Ha riga `push=` → decodificata. Il valore nel dump è basso pur in movimento (istante catturato a bassa velocità): la velocità è comunque letta (l'app di fabbrica la mostra). |
| **Chilometraggio totale** | `100013` | `TOTAL_RECHARGE_MILEAGE` (Bundle) | **value=220675** | Odometro. **È il dato già mostrato** al posto `mileage`. |

### 2.2 Climatizzatore (classe `AirCondition`, 30xxx)
| Informazione | `what` | Costante | Valore | Note |
|---|---|---|---|---|
| **Temperatura impostata** | `30006` | `TEMPERATURE` (Bundle) | **value=24.0** (min 16, max 30.5, step 0.5) | *Setpoint* utente, **non** un sensore. |
| Climatizzatore acceso | `30000` | `POWER` / `OFFSET` | 1 | |
| Velocità ventola | `30004` | `WIND_LEVEL` | 3 (un arg=5) | |
| Distribuzione aria | `30003` | `WIND_MODE` | 128 | bitmask bocchette |
| Doppia zona | `30057` | `DUAL` | 2 | |
| Sync zone temp. | `30040` | `SYNC_LEFT_AND_RIGHT_TEMPERATURE_ZONES` | push=0 | notificato → decodificato |

### 2.3 Stato veicolo / sistema
| Informazione | `what` | Costante | Valore | Note |
|---|---|---|---|---|
| Stato porte/cofano/baule | `50001` | `OPENED` (Bundle) | tutti 0 = **chiusi** | Il box lo espone. L'app **non lo mostra**: classe `Doors` non registrata e nessun case `50001`. |
| Orologio | `10001` | `TIME` (Bundle) | 17:22 | |
| Data | `10002` | `DATE` (Bundle) | 2026-07-13 | |
| Radar parcheggio **laterali** | `140008`/`140009` | `LEFT/RIGHT_RADAR_LEVEL` | `enable=1` | Solo *flag di presenza*: **distanze non popolate**. Anteriore/posteriore (`140007`/`140006`) `enable=0`. |
| Accensione / ACC | `140086` | `ACC` | 1 | |
| Modello veicolo | `170004` | `CURRENT_MODEL` | 135790594 | id interno |
| Tipo auto originale | `120298` | `AUDI_FUNCITON_ORIGIN_CAR_TYPE` | 2 | flag config Audi |
| Versione CAN-box | `10004` | `CANBOX_VERSION` | `YT-A4Q5-GD-Hx V212,L-5,BA8,L33,0261` | identifica hardware/codifica |

### 2.4 Segnali discreti
Tutti confermati da riga `push=` (notifica del box) e/o PULL non nullo.

| Informazione | `what` | Costante | Valore nel monitor | Note |
|---|---|---|---|---|
| **Freno a mano** | `120080` | `HAND_BRAKE` | **push=1** | Notificato → decodificato. Valore risalente probabilmente all'avvio da fermo (PUSH non ri-notificato). |
| **Freno stazionamento/parcheggio** | `140010` | `PARKING` | **push=1** | Notificato → decodificato. Come sopra. |
| **Retromarcia** | `140011` | `REVERSE` | push=0 · PULL int=1 | Notificato → decodificato. `push=0` = non in retro al momento. **Sblocca potenzialmente cam. posteriore/PDC.** |
| **Frecce / indicatori** | `140058` | `TURN_SIGNAL_LAMP` | push=0 · PULL int=2 | Notificato → decodificato. |
| **Luci di posizione** | `140059` | `POSITON_LIGHT` | push=0 · PULL int=1 | Notificato → decodificato. |
| **Abbaglianti / canale 110000** | `110000` | `HEADLAMP_HIGH_BEAMS` / `OFFSET` | int=1 (OFFSET push=0) | Collisione nomi sul `what` 110000; comunque non nullo/notificato. |
| **Angolo sterzo** | `140057` | `ANGLE` | float=-0.0129… | Ruote ~dritte. Dato continuo, potenzialmente utile. |
| Luminosità tasti | `100006` | `KEY_BRIGHTNESS` | int=27 (push=0) | Dimmer pulsantiera. |

---

## 3. Cosa il box NON legge (per non perderci tempo)

Compaiono con `0.0` / `-0.1` / `null`, oppure **assenti** dal monitor (filtro zeri) pur col
PUSH attivo → il box **non li decodifica** per questa Audi.

### 3.1 Carburante e consumi
| Informazione | `what` | Costante | Valore |
|---|---|---|---|
| Consumo istantaneo | `100002` | `INSTANTANEOUS_FUEL` | Bundle value=0.0 |
| Consumo medio | `100003` | `AVERAGE_FUEL` | Bundle value=0.0 |
| **Autonomia residua** | `100011` | `FUEL_RECHARGE_MILEAGE` | Bundle **value=-0.1** (= non disponibile) |
| Carburante residuo | `100045` | `REMAIN_FUEL` | assente (0) |
| Livello carburante | `100232` | `FUEL_LEVEL` | assente (0) |

### 3.2 Temperature
| Informazione | `what` | Costante | Valore |
|---|---|---|---|
| Temp. liquido refrigerante | `100059` | `COOLANT_TEMPERATURE` | assente (0) — non decodificata |
| Temp. olio motore | `100058` | `OIL_TEMPERATURE` | assente (0) |
| **Temperatura esterna** | `30023` | `OUT_TEMPERATURE` | Bundle value=0.0 |

### 3.3 Discreti non popolati
| Informazione | `what` | Costante | Valore | Nota |
|---|---|---|---|---|
| **Marcia (selettore)** | `140080` | `GEAR` | assente (0) | ≠ `REVERSE`: la posizione D/N/R **non** è decodificata. |
| Quadro / accensione | `140061` | `IG_STATUS` | assente (0) | Risponde solo `ACC` (`140086`) = 1. |
| Anabbaglianti / DRL | `110001`/`110002` | `HEADLAMP_LOW_BEAMS`, `DAYTIME_RUNNING_LAMPS` | assenti | Solo posizione + canale 110000 attivi. |

### 3.4 Altri dati non popolati
| Informazione | `what` | Costante | Valore |
|---|---|---|---|
| Tensione batteria | `160013` | `VOLTAGE` | assente (0) |
| Velocità media | `100001` | `AVERAGE_SPEED` | Bundle value=0.0 |
| Trip A / Trip B | `100150`/`100249` | `TRIP_A/B_DISTANCE` | Bundle value=0.0 |
| Pressione/temp/warning gomme (TPMS) | `70001`/`70007`/`70002` | `TIRE_PRESS/TEMP_MONITORING_INFO`, `TIRE_PRESS_WARNING_INFO` | Bundle tutti 0.0 / 0 |
| PM2.5 interno/esterno | `30060`/`30061` | `IN_PM25`/`OUT_PM25` | Bundle level=0 value=0 |
| Info/fault batteria-motore-carrozzeria | `160050`/`160049`/`160051`/`160046`-`160048` | `BATTERY/MOTOR/CARBODY_INFO`, `*_FAULT_INFO` | Bundle `null` (telemetria EV, irrilevante diesel) |
| Manutenzione (km al tagliando) | — | — | *Classe `Maintenance` inesistente*; `120081` = `ASSIST_AUTO_BRAKE`. |

---

## 4. Raccomandazione

I dati "ricchi" mancanti (carburante, temperature, autonomia) sono **morti**: non sbloccabili
via APK. Candidati da instradare nello slot `mileage`/`speed` (in ordine di utilità reale):

1. **Giri motore** (`100042`, vivo, con `push`) — dato motore vivo. **Questo APK non lo legge**
   (nessun `case 100042` in `CarInfoManager`) → candidato più pulito. L'app di fabbrica lo
   mostra altrove, ma dentro *questo* slider sarebbe nuovo.
2. **Angolo sterzo** (`140057`, float continuo) — dinamico; utile solo come gadget.
3. **Stato retromarcia / freno a mano / frecce / luci** (§2.4) — leggibili: più che come testo
   nello slot mileage, sono utili come **logica** (es. auto-attivazione telecamera in retro via
   `REVERSE 140011`, indicatori luci).
4. *(Marginale)* **Temperatura impostata clima** (`30006`, 24.0 °C) — è il setpoint utente,
   basso valore informativo.

> **In pratica:** ciò che è utile e *vivo* (velocità, giri, contachilometri, porte) l'app di
> fabbrica lo mostra già; il valore aggiunto da APK sui numeri di telemetria è limitato, mentre
> i **segnali discreti** (retro, freni, luci, frecce) sono sfruttabili per logiche/automazioni.

**Per ottenere carburante / temperature / consumi servirebbe hardware o firmware, non l'APK:**
- un **CAN-box con profilo Audi più completo** o una **codifica diversa** del box (la codifica
  incide su cosa viene decodificato: altre codifiche potrebbero esporre più telemetria);
- un **dongle OBD-II** (BLE) letto da un percorso companion, in parallelo al CAN-box.

---

## 5. Metodo (come rifare/estendere il rilievo)

Il monitor continuo PULL+PUSH ([IMPLEMENTAZIONE_DUMP_CARINFO.md](IMPLEMENTAZIONE_DUMP_CARINFO.md))
tiene ogni `what+arg` con valore **plausibile** (non nullo) e accetta **sempre** i PUSH: le
righe `push=` sono la prova di leggibilità più forte e catturano i transitori.

Uno **zero (o l'assenza) in un singolo rilievo non è distinguibile da "non supportato"**: un
`what` che compare popolato in **almeno uno** stato è leggibile. Per completare la mappa,
rilevare in stati diversi:
- **motore acceso, auto in movimento** (stato del rilievo attuale);
- **da fermo a motore acceso** (per leggere freni/stazionamento nello stato di riposo);
- **in retromarcia effettiva** (per confermare polarità di `REVERSE` → radar/telecamere);
- **luci/frecce/porte azionate** (in parte catturate via PUSH).

---

## 6. Come sostituire concretamente il dato (riferimento tecnico)

1. In `CarInfoManager.onCarInfoDataChanged(what, obj, unit)` aggiungere/modificare il `case`
   con il `what` voluto (**vivo**, es. `ENGINE_TACHOMETER` = `100042`).
2. Instradarlo alla view (`updateTotalMileage`/`updateMileage`); la view formatta
   `"<valore> <unità>"` → adattare l'unità (es. `RPM`, `°C`, `°` per l'angolo).
3. Se il dato è un **Bundle** (mileage `100013`, clima `30006`, porte `50001`), leggere le
   chiavi del Bundle (`value` + `KEY_UNIT`), non `getInt`.
4. Se il dato è in una classe **non registrata**, aggiungere il relativo `CLASS_NAME` all'array
   `ids[]` nella `init(...)` di `CarInfoManager` **oppure** leggerlo in PULL on-demand.
5. (Opzionale) Tradurre l'etichetta in `res/values/strings.xml`.
