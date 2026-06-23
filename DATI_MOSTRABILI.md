# Dati leggibili da CarInfo — alternative al chilometraggio (mileage)

Documento di riferimento per decidere **quale informazione mostrare al posto del
chilometraggio** nella seconda pagina dello slider
(view `CarMileageSpeedView`, layout `mileage_layout.xml`, TextView `mileage`/`speed`).

Target: **Audi A5 coupé diesel**, testata Android NTG (`com.spd.xhsntg`).

---

## 1. Come l'app ottiene i dati

I valori dell'auto arrivano dal **servizio di sistema CarInfo** tramite interfaccia
AIDL (`ICarInfoAidlInterface`). Ogni dato è identificato da un **codice numerico
`what`**, definito nella classe `com.spd.carinfo.CarInfo` (raggruppato in
sotto-classi per range numerico). Due meccanismi:

- **PUSH** — l'app si iscrive a una o più *classi* di dati e riceve callback
  `onCarInfoDataChanged(what, valore, unità)` ogni volta che un valore cambia.
  Oggi `CarInfoManager` **riceve già centinaia di valori ma ne usa solo 6**
  (velocità, mileage totale, porte, unità, sorgente media, modello auto);
  **tutto il resto gli arriva ma viene ignorato**.
- **PULL** — `getInt / getFloat / getString / getBundle(what, arg)` permette di
  *interrogare* un valore su richiesta, senza aspettare un cambiamento.

> **Conseguenza pratica:** per mostrare un dato diverso al posto del mileage, nella
> maggior parte dei casi basta **aggiungere/modificare un `case`** in
> `CarInfoManager.onCarInfoDataChanged` e instradarlo alla TextView. Non serve
> cambiare l'iscrizione, perché l'app è già iscritta alle classi più utili.

### Classi a cui l'app è GIÀ iscritta (dati già in arrivo)

| Classe | Range `what` | Contenuto |
|---|---|---|
| `Instruments` | `100xxx` / `101xxx` | Cruscotto: consumi, temperature, giri, velocità, trip… (la più ricca) |
| `Vehicles` | `170xxx` | Modello/stato veicolo |
| `ReverseAndAVM` | `140xxx` | Retromarcia, telecamere, velocità corrente |
| `Doors` | `50xxx` | Stato porte/portellone/cofano |
| `General` | ~`100xx` | Unità di misura, stato generale |

### Classi NON iscritte (serve aggiungerle all'array `ids[]` in `CarInfoManager.init`)

| Classe | Range `what` | Contenuto |
|---|---|---|
| `AirCondition` | `30xxx` | Clima, **temperatura esterna** |
| `Battery` | `160xxx` | Tensione/stato batteria (quasi tutto EV) |
| `Maintenance` | `120xxx` | Manutenzione, km al tagliando |
| `Lights` | `110xxx` | Luci ambiente |

---

## 2. Dati candidati per la sostituzione

Legenda colonna **Stato**:
- ✅ già ricevuto (basta gestire il `case`)
- ➕ richiede di aggiungere la classe all'iscrizione

### 2.1 Carburante e consumi — *i più utili su un diesel*

| Informazione | `what` | Costante | Unità tipica | Stato |
|---|---|---|---|---|
| Consumo **istantaneo** | `100002` | `INSTANTANEOUS_FUEL` | l/100 km | ✅ |
| Consumo **medio** | `100003` | `AVERAGE_FUEL` | l/100 km | ✅ |
| **Autonomia residua** (km percorribili col pieno attuale) | `100011` | `FUEL_RECHARGE_MILEAGE` | km | ✅ |
| Range di consumo/autonomia | `100148` | `FUEL_CONSUMPTION_RANGE` | km | ✅ |
| **Carburante residuo** | `100045` | `REMAIN_FUEL` | litri | ✅ |
| **Livello carburante** | `100232` | `FUEL_LEVEL` | % (o tacche) | ✅ |
| Consumo medio dall'avvio | `100017` | `SINCE_START_AVG_OIL_COMSUMPTION` | l/100 km | ✅ |
| Consumo medio dal rifornimento | `100018` | `SINCE_REFUELING_AVG_OIL_COMSUMPTION` | l/100 km | ✅ |
| Consumo medio lungo termine | `100019` | `LONG_TERM_AVG_OIL_COMSUMPTION` | l/100 km | ✅ |

**Cosa fanno:**
- *Consumo istantaneo* = quanto sta bevendo il motore in questo momento; scende a 0
  in rilascio/decelerazione, utile per guida economica.
- *Consumo medio* = media calcolata dal computer di bordo (di solito resettabile).
- *Autonomia residua* = stima dei km ancora percorribili; è il classico "range"
  che si vede sul quadro Audi.
- *Carburante residuo / livello* = quanto gasolio resta, in litri o in percentuale.
- Le varianti *dall'avvio / dal rifornimento / lungo termine* sono i tre contatori
  separati che Audi gestisce nel Driving Computer (memoria 1, memoria 2, ecc.).

### 2.2 Motore e temperature

| Informazione | `what` | Costante | Unità tipica | Stato |
|---|---|---|---|---|
| **Temp. liquido refrigerante** ("temp. acqua") | `100059` | `COOLANT_TEMPERATURE` | °C | ✅ |
| Temp. olio motore | `100058` | `OIL_TEMPERATURE` | °C | ✅ |
| **Giri motore** (contagiri) | `100042` | `ENGINE_TACHOMETER` | RPM | ✅ |
| Contagiri (alternativa) | `100004` | `TACHOMETER` | RPM | ✅ |
| **Temperatura esterna** | `30023` | `OUT_TEMPERATURE` | °C | ➕ (classe `AirCondition`) |
| **Tensione batteria** | `160013` | `VOLTAGE` | V | ➕ (classe `Battery`) |

**Cosa fanno:**
- *Temp. refrigerante* = temperatura del motore; utile a freddo (motore non in
  temperatura) e per accorgersi di surriscaldamenti.
- *Temp. olio* = più indicativa per la guida sportiva; non sempre esposta dal CAN.
- *Giri motore* = RPM, dato vivo e gradevole da vedere accanto alla velocità.
- *Temperatura esterna* = il classico termometro esterno (utile per allerta ghiaccio).
- *Tensione batteria* = salute dell'impianto elettrico (≈14 V motore acceso,
  ≈12,4 V spento); utile diagnostico, ma molti CAN-box non lo passano sui diesel.

### 2.3 Velocità e viaggio (trip)

| Informazione | `what` | Costante | Unità tipica | Stato |
|---|---|---|---|---|
| Velocità istantanea | `100043` | `INSTANTANEOUS_SPEED` | km/h | ✅ |
| **Velocità media** | `100001` | `AVERAGE_SPEED` | km/h | ✅ |
| Velocità media dall'avvio | `100020` | `SINCE_START_AVG_SPEED` | km/h | ✅ |
| Velocità media dal rifornimento | `100021` | `SINCE_REFUELING_AVG_SPEED` | km/h | ✅ |
| Velocità media lungo termine | `100022` | `LONG_TERM_AVG_SPEED` | km/h | ✅ |
| **Distanza dal rifornimento** | `100015` | `SINCE_REFUELING_DISTANCE` | km | ✅ |
| Tempo di viaggio dal rifornimento | `100023` | `SINCE_REFUELING_TRAVELLING_TIME` | min | ✅ |

**Cosa fanno:**
- *Velocità media* = la media del computer di bordo (diversa dal tachimetro).
- *Distanza dal rifornimento* = km percorsi dall'ultimo pieno → utile abbinata al
  consumo medio.
- *Tempo di viaggio* = durata complessiva del tragitto in corso.

### 2.4 Manutenzione

| Informazione | `what` | Costante | Unità tipica | Stato |
|---|---|---|---|---|
| **Km al prossimo tagliando** | `120081` | `REMAINING_MAINTENANCE_MILEAGE` | km | ➕ (classe `Maintenance`) |

*Cosa fa:* km mancanti al prossimo intervento di manutenzione programmata (service).

---

## 3. Raccomandazione per Audi A5 diesel

I dati più "sicuri" da trovare popolati e più utili nella vita reale:

1. **Autonomia residua** (`100011`) — sostituto naturale del mileage.
2. **Consumo istantaneo** (`100002`) o **medio** (`100003`).
3. **Temperatura liquido refrigerante** (`100059`).
4. **Temperatura esterna** (`30023`) — richiede di aggiungere la classe `AirCondition`.

Si potrebbe anche mostrarne **due** affiancati riusando la TextView `speed`
(es. *autonomia* al posto di mileage + *consumo istantaneo* al posto di speed).

---

## 4. Avvertenza importante (da leggere prima di scrivere codice)

Questo è **firmware generico multi-marca**. Che un dato `what` *arrivi davvero*
dipende dal **CAN-box** della testata e da cosa riesce a decodificare per la
**specifica Audi**: molti codici esistono solo per altri brand e non saranno mai
popolati. Inoltre, l'APK è installato **senza privilegi di sistema** ("Strada C"):
in quel caso il servizio CarInfo potrebbe **non collegarsi affatto** → schermate a
dati vuoti.

> **Metodo corretto:** prima di scegliere, montare una build "diagnostica" che
> logga *tutti* i `what` + valore + unità effettivamente ricevuti, guidare l'auto e
> vedere quali campi sono realmente popolati e con quale unità. Solo su quelli reali
> ha senso decidere cosa mostrare.

---

## 5. Come sostituire concretamente il dato (riferimento tecnico)

1. In `CarInfoManager.onCarInfoDataChanged(what, obj, unit)` aggiungere/modificare
   il `case` con il `what` desiderato (es. `CarInfo.Instruments.FUEL_RECHARGE_MILEAGE`).
2. Instradarlo alla view chiamando un metodo tipo `updateMileage(valore, unità)`
   (la view formatta `"<valore> <unità>"`; adattare l'unità al nuovo dato — es.
   `°C`, `V`, `l/100km`, `RPM`).
3. Se il dato è in una classe **non iscritta** (`30xxx`, `120xxx`, `160xxx`,
   `110xxx`), aggiungere il relativo `CLASS_NAME` all'array `ids[]` nella
   `CarInfo...init(...)` dentro `CarInfoManager`.
4. (Opzionale) Tradurre l'etichetta in `res/values/strings.xml` come già fatto per
   `carinfo_mileage` → "Chilometraggio".
