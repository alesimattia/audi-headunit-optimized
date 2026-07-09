# Dati leggibili dal CAN-box — riscontro REALE (dump a motore acceso)

Documento di riferimento per decidere **quale informazione mostrare al posto del
chilometraggio** nella seconda pagina dello slider
(view `CarMileageSpeedView`, layout `mileage_layout.xml`, TextView `mileage`/`speed`).

Target: **Audi A5 coupé diesel**, testata Android NTG (`com.spd.xhsntg`).

> ⚠️ **Questo documento non è più teorico.** È basato sul **dump reale** del servizio
> CarInfo (`canbus_listener_log.txt` → `Download/ntg_carinfo_log.txt`), un PULL one-shot
> su **2271 codici `what`**, acquisito **con motore acceso** e auto ferma. Le disponibilità
> qui sotto sono ciò che il CAN-box **restituisce davvero**, non ciò che l'app *potrebbe*
> ricevere in teoria.

---

## 0. Esito in breve (TL;DR)

Il CAN-box montato è un **`YT-A4Q5-GD-Hx V212`**: un decoder con **profilo generico Audi
A4/Q5** (corretto per l'A5, stessa piattaforma) che però **decodifica pochissimo** della
telemetria di questa vettura.

- ✅ **Leggibili davvero:** velocità, **giri motore**, stato climatizzatore (temperatura
  impostata, ventola, modalità), **chilometraggio totale** (già mostrato), orologio/data,
  stato porte, abilitazione radar laterali, identità veicolo.
- ❌ **NON leggibili** (tornano `0`/vuoto **anche a motore acceso**): tutto il **carburante**
  (consumo istantaneo/medio, livello, residuo, **autonomia**), **tutte le temperature**
  (liquido refrigerante, olio, **esterna**), **tensione batteria**, **marcia**,
  **retromarcia**, **luci** (anabbaglianti/posizione/fendinebbia/DRL), **frecce/indicatori**,
  freno a mano/pedale, trip parziali, pressione gomme (TPMS), manutenzione.

> **Test attivo (auto accesa, ferma).** Durante il rilievo sono state inserite le marce
> **R / D / N**, accese **luci e frecce** e acceso il **clima**. Nel dump **il clima compare**
> (→ il box lo decodifica), mentre **marcia, retromarcia, luci e frecce restano a `0`** pur
> essendo state azionate: è la prova che il box **non li decodifica**, non un semplice "valore
> a riposo".

**Conseguenza diretta:** le quattro sostituzioni consigliate nella vecchia versione di
questo documento (autonomia residua, consumo, temperatura acqua, temperatura esterna)
**sono tutte morte su questo box**. Vanno abbandonate. Vedi §3.

---

## 1. Come l'app ottiene i dati (e perché "iscritto" ≠ "popolato")

I valori arrivano dal servizio di sistema **CarInfo** via AIDL (`ICarInfoAidlInterface`).
Ogni dato ha un **codice `what`** (classe `com.spd.carinfo.CarInfo`). Due meccanismi:

- **PUSH** — l'app si iscrive a *classi* di dati e riceve `onCarInfoDataChanged(what, valore,
  unità)` ad ogni cambiamento. `CarInfoManager` è iscritto a poche classi ma **usa solo pochi
  `what`** (velocità, mileage totale, sorgente media, modello, unità) e ignora il resto.
- **PULL** — `getInt / getFloat / getString / getBundle(what, arg)` interroga un valore
  on-demand. **Il PULL bypassa l'iscrizione alle classi**: il dump qui usato è un PULL, quindi
  raggiunge *qualsiasi* `what` a prescindere dalle classi registrate.

> **Perché il dump è la verità:** siccome il PULL raggiunge tutti i `what`, se un codice torna
> `0`/vuoto **non è un problema lato app né di iscrizione** → è il **CAN-box che non lo
> decodifica** per questa Audi. Il servizio CarInfo **si collega** (confermato:
> `connected=true`, e chilometraggio `220412` + stato porte arrivano reali) → l'unica
> incertezza è **per-`what`**.

> **Attenzione al vecchio ✅.** Nella versione precedente "✅ già ricevuto" significava solo
> *"l'app è iscritta alla classe"*, **non** *"il valore è popolato"*. Il dump dimostra che quasi
> tutti quei ✅ erano in realtà a zero.

---

## 2. Cosa il box legge DAVVERO (valori popolati nel dump)

Valori effettivamente presenti nel dump a motore acceso. Unità di sistema = metriche
(`UNIT_* = 0` → km/h, km, °C).

> **Riscontro dall'app originale.** L'app di fabbrica mostra correttamente **giri, velocità,
> contachilometri e stato porte** — esattamente i canali che qui risultano popolati. Conferma
> indipendente che questi (e solo questi) sono decodificati dal box.

### 2.1 Telemetria viva
| Informazione | `what` | Costante | Valore nel dump | Note |
|---|---|---|---|---|
| **Giri motore** | `100042` | `ENGINE_TACHOMETER` | **640** | RPM, minimo a caldo. Unico dato *motore* vivo. |
| **Velocità** | `140062` | `CURRENT_SPEED` | 0.0 (auto ferma) | L'app la legge da qui (come Float) per la TextView `speed` — confermato in `CarInfoManager` (case `140062`). Nel dump è 0 perché l'auto è ferma → **questo dump non dimostra se la velocità sia viva in marcia**: serve un dump in movimento. |
| **Chilometraggio totale** | `100013` | `TOTAL_RECHARGE_MILEAGE` (Bundle) | **value=220412** | Odometro. **È il dato già mostrato** al posto `mileage`. |

### 2.2 Climatizzatore (classe `AirCondition`, 30xxx) — l'unico blocco "ricco" popolato
| Informazione | `what` | Costante | Valore | Note |
|---|---|---|---|---|
| **Temperatura impostata** | `30006` | `TEMPERATURE` (Bundle) | **value=23.0** (min 16, max 30.5, step 0.5) | È il *setpoint* scelto dall'utente, **non** un sensore. |
| Climatizzatore acceso | `30000` | `POWER` / `OFFSET` | 1 | |
| Velocità ventola | `30004` | `WIND_LEVEL` | 3 | |
| Distribuzione aria | `30003` | `WIND_MODE` | 128 | bitmask bocchette |
| Doppia zona | `30057` | `DUAL` | 2 | |

### 2.3 Stato veicolo / sistema
| Informazione | `what` | Costante | Valore | Note |
|---|---|---|---|---|
| Stato porte/cofano/baule | `50001` | `OPENED` (Bundle) | tutti 0 = **chiusi** | Il box lo espone (lettura valida, auto chiusa). Ma l'app **non lo mostra più**: la classe `Doors` non è più registrata (`init` a 4 classi) e il case `50001` è stato rimosso con la pagina porte. |
| Orologio | `10001` | `TIME` (Bundle) | 07:48 | |
| Data | `10002` | `DATE` (Bundle) | 2026-06-29 | |
| Radar parcheggio laterali | `140008`/`140009` | `LEFT/RIGHT_RADAR_LEVEL` | `enable=1` | Solo *flag di presenza*: le **distanze non sono popolate**. |
| Accensione / ACC | `140086` | `ACC` | 1 | |
| Modello veicolo | `170004` | `CURRENT_MODEL` | 135790594 | id interno |
| Versione CAN-box | `10004` | `CANBOX_VERSION` | `YT-A4Q5-GD-Hx V212,L-5,9A8,L33,0211` | identifica hardware/profilo |

---

## 3. Cosa il box NON legge (per non perderci tempo)

Tutti tornano `0`/vuoto **con motore acceso** → il box **non li decodifica** per questa Audi.

### 3.1 Carburante e consumi — *tutti morti*
| Informazione | `what` | Costante | Valore nel dump |
|---|---|---|---|
| Consumo istantaneo | `100002` | `INSTANTANEOUS_FUEL` | Bundle value=0.0 |
| Consumo medio | `100003` | `AVERAGE_FUEL` | Bundle value=0.0 |
| **Autonomia residua** | `100011` | `FUEL_RECHARGE_MILEAGE` | Bundle **value=-0.1** (= non disponibile) |
| Carburante residuo | `100045` | `REMAIN_FUEL` | 0 |
| Livello carburante | `100232` | `FUEL_LEVEL` | 0 |
| Range consumo | `100148` | `FUEL_CONSUMPTION_RANGE` | 0 |

### 3.2 Temperature — *tutte morte*
| Informazione | `what` | Costante | Valore |
|---|---|---|---|
| Temp. liquido refrigerante | `100059` | `COOLANT_TEMPERATURE` | 0 (nessun Bundle) — **decisivo: a motore acceso salirebbe** |
| Temp. olio motore | `100058` | `OIL_TEMPERATURE` | 0 |
| **Temperatura esterna** | `30023` | `OUT_TEMPERATURE` | Bundle value=0.0 |

### 3.3 Comandi/segnali discreti — *azionati nel test, comunque a `0`*
Sono stati **fisicamente azionati** durante il rilievo e sono comunque rimasti a `0`: non è
uno "stato a riposo", è **assenza di decodifica**.

| Informazione | `what` | Costante | Valore | Nota |
|---|---|---|---|---|
| **Marcia** | `140080` | `GEAR` | 0 | Inserite **R / D / N** → sempre 0. |
| **Retromarcia** | `140011` | `REVERSE` | 0 | Retromarcia inserita → 0. ⚠️ Impatta l'attivazione automatica della **telecamera posteriore / PDC**. |
| **Luci** | `110000`/`110001`/`110045`/`110002` | `HEADLAMP_HIGH/LOW_BEAMS`, `POSITON_LIGHT`, `DAYTIME_RUNNING_LAMPS` | 0 | Luci accese → **tutti** i canali luci (110xxx) a 0. |
| **Frecce / indicatori** | `140058` | `TURN_SIGNAL_LAMP` | 0 | Frecce azionate → 0. |
| Quadro / accensione | `140061` | `IG_STATUS` | 0 | Risponde solo `ACC` (`140086`) = 1. |
| Freno a mano / pedale | `120080`/`140030` | `HAND_BRAKE` / `FOOT_BRAKE` | 0 | |

### 3.4 Altri dati non popolati
| Informazione | `what` | Costante | Valore |
|---|---|---|---|
| Tensione batteria | `160013` | `VOLTAGE` | 0 |
| Velocità media | `100001` | `AVERAGE_SPEED` | Bundle value=0.0 |
| Distanza dal rifornimento | `100015` | `SINCE_REFUELING_DISTANCE` | 0 |
| Trip A / Trip B | `100150`/`100249` | `TRIP_A/B_DISTANCE` | Bundle value=0.0 |
| Pressione/temp gomme (TPMS) | `70001`/`70007` | `TIRE_PRESS/TEMP_MONITORING_INFO` | Bundle tutti 0.0 |
| Manutenzione (km al tagliando) | — | — | *La classe `Maintenance` non esiste*; `120081` = `ASSIST_AUTO_BRAKE` (ADAS), = 0. |

---

## 4. Raccomandazione (rivista sui dati reali)

La vecchia classifica (autonomia → consumo → temp acqua → temp esterna) **non è più
proponibile**: nessuno di quei dati è leggibile su questo box.

**Cosa si può realmente mostrare di nuovo e utile:**

1. **Giri motore** (`100042` = 640 nel dump) — dato motore vivo. **Questo APK non lo legge**
   (nessun `case 100042` in `CarInfoManager`, nessun altro lettore nei sorgenti), quindi è il
   candidato più pulito da instradare nello slot `mileage`/`speed`. NB: l'app **di fabbrica**
   lo mostra già altrove → non è un dato "invisibile", ma dentro lo slider di *questa* app
   sarebbe nuovo.
2. *(Marginale)* **Temperatura impostata clima** (`30006`, 23.0 °C) — leggibile, ma è il
   valore che l'utente ha appena impostato: informazione a basso valore.
3. Il resto dei dati vivi è **già mostrato** (chilometraggio, velocità) o **triviale**
   (orologio/data).

> **In pratica le opzioni sono poche:** tutto ciò che è davvero utile (velocità, giri,
> contachilometri, porte) l'app di fabbrica **lo mostra già**; ciò che manca (carburante,
> temperature, autonomia) **non è decodificato**. Il valore aggiunto realistico modificando
> l'APK è quindi limitato → vedi le strade hardware qui sotto.

**Per ottenere carburante / temperature / consumi servirebbe hardware o firmware, non
l'APK:**
- un **CAN-box con profilo Audi più completo** o un **box diverso**;
- un **dongle OBD-II** (BLE) letto da un percorso companion, in parallelo al CAN-box.

Nessuna di queste strade si sblocca modificando solo l'applicazione.

---

## 5. Metodo (come rifare/estendere il rilievo)

Il dump usato adotta il criterio dichiarato nel suo header ("tengo ogni coppia `what`+`arg`
con almeno un valore presente, zeri inclusi"): utile per la mappatura ma verboso
(~13.600 righe). Per una **mappa di sola leggibilità** conviene un criterio che scarti gli
zeri (tenendo solo valori non nulli/non-default).

Uno **zero non è distinguibile da "non supportato"** in un singolo dump: un `what` che
compare popolato in **almeno uno** stato è leggibile. Per completare la mappa, ripetere il
dump in stati diversi:
- **motore acceso** (fatto — questo dump);
- **in marcia** (velocità/trip/consumo se mai popolati);
- **in retromarcia** (radar/telecamere);
- **porte/luci aperte** (stato carrozzeria).

---

## 6. Come sostituire concretamente il dato (riferimento tecnico)

1. In `CarInfoManager.onCarInfoDataChanged(what, obj, unit)` aggiungere/modificare il `case`
   con il `what` voluto (**vivo**, es. `ENGINE_TACHOMETER` = `100042`).
2. Instradarlo alla view (`updateTotalMileage`/`updateMileage`); la view formatta
   `"<valore> <unità>"` → adattare l'unità (es. `RPM`, `°C`).
3. Se il dato è un **Bundle** (mileage `100013`, clima `30006`, porte `50001`), leggere le
   chiavi del Bundle (`value` + `KEY_UNIT`), non `getInt`.
4. Se il dato è in una classe **non registrata** (es. `AirCondition` 30xxx per il clima),
   aggiungere il relativo `CLASS_NAME` all'array `ids[]` nella `init(...)` di
   `CarInfoManager` **oppure** leggerlo in PULL on-demand.
5. (Opzionale) Tradurre l'etichetta in `res/values/strings.xml`.
