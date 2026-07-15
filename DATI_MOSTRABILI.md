# Dati leggibili dal CAN-box — riscontro REALE

Documento di riferimento per decidere **quale informazione mostrare al posto del
chilometraggio** nella seconda pagina dello slider
(view `CarMileageSpeedView`, layout `mileage_layout.xml`, TextView `mileage`/`speed`).

Target: **Audi A5 coupé diesel**, testata Android NTG (`com.spd.xhsntg`).

> Il riscontro proviene dal **monitor continuo PULL+PUSH** descritto in
> [IMPLEMENTAZIONE_DUMP_CARINFO.md](IMPLEMENTAZIONE_DUMP_CARINFO.md) (sorgente
> `ntg_carinfo_log.txt`): unisce PULL periodico + **PUSH live** in una mappa deduplicata,
> filtrando gli zeri. Le righe **`push=`** sono valori **notificati spontaneamente dal box** →
> la prova più forte che quel dato è decodificato. I campi **`min=`/`max=`** (nuovi in questa
> cattura) riportano l'escursione osservata del valore durante il rilievo: un `min≠max` prova
> che il dato è **vivo e variabile**, non un valore fermo. Rilievo con motore acceso e **auto
> in movimento**, `elementi rilevati=363`. I valori `push=` riflettono l'**ultima notifica**
> ricevuta dal box (il PUSH aggiorna solo al cambiamento): un valore può risalire a un istante
> precedente del percorso.

---

## 0. Esito in breve (TL;DR)

Il CAN-box montato è un **`YT-A4Q5-GD-Hx V212`** con codifica `…,L-5,8CE,L33,0211`: decoder con
**profilo generico Audi A4/Q5** (corretto per l'A5, stessa piattaforma).

> ⚠️ **La codifica del box è cambiata rispetto al rilievo precedente** (era `…,BA8,L33,0261`,
> ora `…,8CE,L33,0211`). La codifica incide su quali segnali discreti vengono decodificati:
> alcuni segnali visti prima potrebbero non comparire più e viceversa (vedi §2.4 e §3.3).

- ✅ **Leggibili:** **velocità** (osservata 1→74 km/h), **giri motore** (688→1834),
  **chilometraggio totale** (già mostrato), **angolo sterzo** (escursione reale), clima
  completo (temp impostata, ventola, modalità, doppia zona, sync zone), orologio/data, stato
  porte, **radar laterali** (solo flag presenza), identità veicolo/modello, versione CAN-box,
  **retromarcia** (`REVERSE`), **frecce** (`TURN_SIGNAL_LAMP`), **luci di posizione**
  (`POSITON_LIGHT`), luminosità tasti (`KEY_BRIGHTNESS`), sorgente media, canale luci `110000`.
- ⚠️ **Leggibili ma NON osservati in questa cattura (visti in un rilievo precedente a veicolo
  fermo):** **freno a mano** (`HAND_BRAKE 120080`), **freno stazionamento** (`PARKING 140010`).
  Sono segnali push-only notificati solo al cambiamento: con auto già in movimento non sono
  stati ri-notificati. La loro assenza qui non prova la non-leggibilità (vedi §2.4).
- ❌ **NON leggibili** (`0.0` / `-0.1` / `null` / assenti): tutto il **carburante** (consumo
  istantaneo/medio, livello, residuo, **autonomia** = `-0.1`), **tutte le temperature**
  (refrigerante, olio, **esterna** = `0.0`), **tensione batteria**, **marcia (selettore GEAR)**,
  trip parziali A/B, velocità media, **pressione/temp gomme (TPMS)**, PM2.5, radar
  anteriore/posteriore (`enable=0`), info/fault di batteria-motore-carrozzeria (tutti `null`),
  manutenzione.

> **Distinzione importante:** è decodificato il **segnale di retromarcia** (`REVERSE 140011`),
> **non** il **selettore di marcia** (`GEAR 140080`, non popolato). Che carburante, consumi e
> temperature restino a `0` **in movimento** è la prova più netta che non sono decodificati.

**Conseguenza pratica:** con `REVERSE` leggibile, l'attivazione automatica di **telecamera
posteriore / PDC in retromarcia** è plausibile (da confermare con un rilievo a marcia
effettivamente inserita: in questa cattura `push=0` = non in retro).

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
| **Giri motore** | `100042` | `ENGINE_TACHOMETER` | **int=904** (range **688→1834**) | RPM. Unico dato *motore* vivo; l'escursione min/max prova che varia col regime. |
| **Velocità** | `140062` | `CURRENT_SPEED` | `float=2.0` (range **1.0→74.0**, push=0.0) | Ha riga `push=` → decodificata. Il range prova che l'auto ha davvero viaggiato fino a 74 km/h: dato pienamente vivo. |
| **Chilometraggio totale** | `100013` | `TOTAL_RECHARGE_MILEAGE` (Bundle) | **value=220697** | Odometro. **È il dato già mostrato** al posto `mileage`. |
| **Angolo sterzo** | `140057` | `ANGLE` | `float=-0.0315` (range **-0.79→0.60**, push=0.0) | Valore continuo normalizzato; l'escursione prova che segue lo sterzo. Potenzialmente utile. |

### 2.2 Climatizzatore (classe `AirCondition`, 30xxx)
| Informazione | `what` | Costante | Valore | Verdetto |
|---|---|---|---|---|
| **Temperatura impostata** (setpoint) | `30006` | `TEMPERATURE` (Bundle) | **value=22.0** (min 16, max 30.5, step 0.5) | ✅ leggibile — è ciò che imposti tu, **non** un sensore |
| Climatizzatore acceso | `30000` | `POWER` / `OFFSET` | 1 | ✅ leggibile |
| Velocità ventola (0–9) | `30004` | `WIND_LEVEL` | 9 | ✅ leggibile |
| Distribuzione aria (bocchette) | `30003` | `WIND_MODE` | 80 (min 80, max 128) | ✅ leggibile — bitmask da decodificare |
| Doppia zona | `30057` | `DUAL` | 2 | ✅ leggibile |
| Sync zone temp. | `30040` | `SYNC_LEFT_AND_RIGHT_TEMPERATURE_ZONES` | push=0 | ✅ leggibile (notificato → decodificato) |
| Modalità corrente HVAC | `100278` | `CURRENT_MODE` (Bundle) | mode=2, auxFirstRow=2 | ✅ leggibile |
| **Temperatura ESTERNA** | `30023` | `OUT_TEMPERATURE` | value=0.0 | ❌ **morta** (vedi §3.2) |
| **Temperatura ABITACOLO** | `30028` | `INNER_TEMPERATURE` | assente | ❌ quasi certamente morta (da confermare con PULL mirata) |
| PM2.5 interno/esterno | `30060`/`30061` | `IN_PM25`/`OUT_PM25` | 0 | ❌ morta (vedi §3.4) |
| AC / AUTO / ricircolo / ECO / defrost | `30001/2/5/18/10…` | vedi tabella sotto | assenti | ❓ 0 nel rilievo → da verificare toggolando i comandi (Prova D, §7) |

> **Conseguenza pratica del clima:** senza sensori ambientali (né esterna né abitacolo), un
> eventuale dashboard clima mostra **setpoint e stato dei comandi** — rispecchia il pannello
> clima fisico, non fornisce misure reali. Il "calcolato/combinato" possibile è limitato al
> **decoding del bitmask bocchette** (`WIND_MODE`) e alla composizione L/R della doppia zona.
> Se **INNER_TEMPERATURE (30028)** risultasse ≠0 in una PULL mirata → cambierebbe il quadro
> (sarebbe l'unico sensore ambientale reale). Il protocollo per confermarlo è in **§7**.

#### Riferimento `what` completo classe `AirCondition` (ID=3)
| Costante | `what` (dec) | hex | Cosa |
|---|---|---|---|
| POWER / OFFSET | 30000 | 0x7530 | clima ON/OFF |
| AC | 30001 | 0x7531 | compressore A/C |
| AUTO | 30002 | 0x7532 | modalità AUTO |
| WIND_MODE | 30003 | 0x7533 | **distribuzione bocchette** (da mappare) |
| WIND_LEVEL | 30004 | 0x7534 | **livello ventola** (da mappare) |
| RECIRCULATION | 30005 | 0x7535 | ricircolo |
| TEMPERATURE | 30006 | 0x7536 | **setpoint** (Bundle, per zona via `arg`) |
| SYNC | 30009 | 0x7539 | sync (variante) |
| FRONT_DEFROST | 30010 | 0x753a | sbrinamento anteriore |
| WIND_MODE_RIGHT | 30011 | 0x753b | distribuzione lato destro |
| REAR_DEFROST | 30013 | 0x753d | sbrinamento posteriore |
| ECO | 30018 | 0x7542 | modalità ECO |
| OUT_TEMPERATURE | 30023 | 0x7547 | temp esterna (0 = morto) |
| INNER_TEMPERATURE | 30028 | 0x754c | temp abitacolo (assente = morto) |
| SYNC_LEFT_AND_RIGHT… | 30040 | 0x7558 | sync zone L/R |
| DUAL | 30057 | 0x7569 | doppia zona |
| CURRENT_MODE | 100278 | 0x187f6 | modalità HVAC (Bundle, classe Instruments) |

### 2.3 Stato veicolo / sistema
| Informazione | `what` | Costante | Valore | Note |
|---|---|---|---|---|
| Stato porte/cofano/baule | `50001` | `OPENED` (Bundle) | tutti 0 = **chiusi** | Il box lo espone. L'app **non lo mostra**: classe `Doors` non registrata e nessun case `50001`. |
| Orologio | `10001` | `TIME` (Bundle) | 19:33 | |
| Data | `10002` | `DATE` (Bundle) | 2026-07-14 | |
| Radar parcheggio **laterali** | `140008`/`140009` | `LEFT/RIGHT_RADAR_LEVEL` | `enable=1` | Solo *flag di presenza*: **distanze non popolate** (`value=[0,0,0,0,0]`). Anteriore/posteriore (`140007`/`140006`) `enable=0`. |
| Accensione / ACC | `140086` | `ACC` | 1 (push=0) | |
| Sorgente media | `100085` | `MEDIA_SOURCE` | 255 | 255 = nessuna sorgente attiva |
| Modello veicolo | `170004` | `CURRENT_MODEL` | 135790594 | id interno |
| Tipo auto originale | `120298` | `AUDI_FUNCITON_ORIGIN_CAR_TYPE` | 2 | flag config Audi |
| Versione CAN-box | `10004` | `CANBOX_VERSION` | `YT-A4Q5-GD-Hx V212,L-5,8CE,L33,0211` | identifica hardware/codifica |

> Nota: liste `ALL_MAKE` `170002`, `ALL_MODEL` `170003`, `ALL_CANBOX` `170001` e i vari
> `BENZ_FUNCTION_*` / `AUDI_*` presenti nel monitor sono **cataloghi di configurazione**
> del firmware multi-brand (nomi in cinese), **non** telemetria del veicolo.

### 2.4 Segnali discreti
| Informazione | `what` | Costante | Valore nel monitor | Note |
|---|---|---|---|---|
| **Retromarcia** | `140011` | `REVERSE` | push=0 · PULL int=1 | Notificato → decodificato. `push=0` = non in retro al momento. **Sblocca potenzialmente cam. posteriore/PDC.** |
| **Frecce / indicatori** | `140058` | `TURN_SIGNAL_LAMP` | push=3 · PULL int=1/2 | Notificato → decodificato. |
| **Luci di posizione** | `140059` | `POSITON_LIGHT` | push=0 · PULL int=1 | Notificato → decodificato. |
| **Canale luci 110000** | `110000` | `HEADLAMP_HIGH_BEAMS` / `OFFSET` | push=0 | Collisione nomi sul `what` 110000; notificato ma valore 0 (in questa cattura, a differenza del rilievo precedente int=1). |
| Luminosità tasti | `100006` | `KEY_BRIGHTNESS` | int=40 (range 33→61, push=0) | Dimmer pulsantiera; l'escursione prova che segue il dimmer. |
| **Freno a mano** | `120080` | `HAND_BRAKE` | ⚠️ **assente in questa cattura** | Confermato leggibile in un rilievo precedente **da fermo** (push=1). Push-only: con auto in moto non ri-notificato → assenza non conclusiva. |
| **Freno stazionamento** | `140010` | `PARKING` | ⚠️ **assente in questa cattura** | Come sopra: visto push=1 a veicolo fermo, non ri-notificato in moto. |

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
| **Temperatura abitacolo** | `30028` | `INNER_TEMPERATURE` | assente — da confermare con PULL mirata (§7) |

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
| Radar assist / auto-brake | `140066`/`120260` | `AUTO_PARKING_HINT`, `BENZ_FUNCTION_AUTO_BRAKE` | Bundle active=0 / tutti 0 |
| Manutenzione (km al tagliando) | — | — | *Classe `Maintenance` inesistente*; `120081` = `ASSIST_AUTO_BRAKE`. |

---

## 4. Raccomandazione

I dati "ricchi" mancanti (carburante, temperature, autonomia) sono **morti**: non sbloccabili
via APK. Candidati da instradare nello slot `mileage`/`speed` (in ordine di utilità reale):

1. **Giri motore** (`100042`, vivo, escursione 688→1834) — dato motore vivo. **Questo APK non lo
   legge** (nessun `case 100042` in `CarInfoManager`) → candidato più pulito. L'app di fabbrica
   lo mostra altrove, ma dentro *questo* slider sarebbe nuovo.
2. **Angolo sterzo** (`140057`, float continuo, escursione reale) — dinamico; utile solo come gadget.
3. **Stato retromarcia / frecce / luci** (§2.4) — leggibili: più che come testo nello slot
   mileage, sono utili come **logica** (es. auto-attivazione telecamera in retro via
   `REVERSE 140011`, indicatori luci).
4. *(Marginale)* **Temperatura impostata clima** (`30006`, 22.0 °C) — è il setpoint utente,
   basso valore informativo.

> **In pratica:** ciò che è utile e *vivo* (velocità, giri, contachilometri, porte) l'app di
> fabbrica lo mostra già; il valore aggiunto da APK sui numeri di telemetria è limitato, mentre
> i **segnali discreti** (retro, luci, frecce) sono sfruttabili per logiche/automazioni.

**Per ottenere carburante / temperature / consumi servirebbe hardware o firmware, non l'APK:**
- un **CAN-box con profilo Audi più completo** o una **codifica diversa** del box (la codifica
  incide su cosa viene decodificato: come mostra il cambio `0261`→`0211` tra i due rilievi, altre
  codifiche espongono set di segnali diversi);
- un **dongle OBD-II** (BLE) letto da un percorso companion, in parallelo al CAN-box.

---

## 5. Metodo (come rifare/estendere il rilievo)

Il monitor continuo PULL+PUSH ([IMPLEMENTAZIONE_DUMP_CARINFO.md](IMPLEMENTAZIONE_DUMP_CARINFO.md))
tiene ogni `what+arg` con valore **plausibile** (non nullo) e accetta **sempre** i PUSH: le
righe `push=` sono la prova di leggibilità più forte e catturano i transitori. I campi
`min=`/`max=` distinguono un dato **vivo** (min≠max) da uno fermo.

Uno **zero (o l'assenza) in un singolo rilievo non è distinguibile da "non supportato"**: un
`what` che compare popolato in **almeno uno** stato è leggibile. Per completare la mappa,
rilevare in stati diversi:
- **motore acceso, auto in movimento** (stato del rilievo attuale, `elementi rilevati=363`);
- **da fermo a motore acceso** (per leggere freni/stazionamento nello stato di riposo →
  è così che `HAND_BRAKE`/`PARKING` furono osservati in precedenza);
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

---

## 7. Rilievo mirato CLIMA — protocollo di cattura

Obiettivo: stabilire **quali comandi del climatizzatore il CAN-box decodifica davvero** e
**mappare i valori** di distribuzione aria/ventola, per costruire un eventuale dashboard clima
su dati certi (vedi §2.2). Target: Audi A5 coupé, testata `com.spd.xhsntg`.

> Il monitor PULL+PUSH è **già installato** (vedi
> [IMPLEMENTAZIONE_DUMP_CARINFO.md](IMPLEMENTAZIONE_DUMP_CARINFO.md)). Non serve ricompilare.

### 7.1 Cosa un dashboard clima può contenere concretamente
- **Setpoint** grande (es. 22.0 °C); se doppia zona, sinistra/destra separate *(da verificare:
  nel rilievo solo la zona guida dava 22.0)*;
- **Ventola** come barra 0–9;
- **Distribuzione aria**: icone bocchette (viso/piedi/parabrezza) — richiede di **decodificare
  WIND_MODE** (mappare i valori 80…128 premendo i tasti e osservando);
- **Chip di stato**: Clima ON, AUTO, DUAL, SYNC, ricircolo, ECO, defrost — *solo quelli che
  risultano davvero decodificati*;
- **Orologio/data** in testata;
- Temperatura esterna/abitacolo mostrate come **"n/d"** (oppure omesse), per onestà.

### 7.2 Come funziona la lettura (leggere prima di iniziare)
- Il file `Download/ntg_carinfo_log.txt` è una **mappa deduplicata**, **riscritta ogni ~3 s**:
  per ogni `what` tiene **l'ultimo valore** letto più i campi `min=`/`max=` (escursione vista).
- Conseguenza: per **mappare** valori che cambiano (modalità bocchette, livelli ventola) NON
  basta la cattura finale. Devi leggere il valore **subito dopo ogni singola azione**, dando al
  monitor **~5 s** per aggiornare.
- Dove leggere il valore corrente: sulla **pagina debug** dell'app (indice 2, la 3ª) c'è la
  vista live che mostra le stesse righe del file. In alternativa copi il file dopo ogni passo.
- Un comando **acceso** compare con un valore ≠0; **spento** può restare all'ultimo valore o
  sparire (filtro zeri). Ai fini del rilievo conta che il `what` **compaia con valore sensato
  quando il comando è ON** → quello prova che è decodificato.

### 7.3 Setup
1. Quadro **acceso** (accensione inserita; motore facoltativo — il clima risponde comunque).
2. Apri l'app, vai alla **pagina debug (indice 2)**: parte il monitor.
3. Tieni a portata il **pannello clima fisico** dell'auto.

I `what` da tenere d'occhio sono nella tabella di riferimento della classe `AirCondition` in §2.2.

### 7.4 Sequenza di prove (compila le tabelle)

#### Prova A — Setpoint doppia zona
1. Attiva **DUAL**. 2. Imposta lato **guida = 18°**, lato **passeggero = 26°**. Attendi 5 s.
3. Leggi le righe `TEMPERATURE what=30006 arg=…`: annota il `value` per ciascun `arg`.

| arg | value letto | zona presunta |
|---|---|---|
| arg=0 (globale) | | |
| arg=1 | | |
| arg=2 | | |
| arg=… | | |

→ Serve a capire **se entrambe le zone si popolano** e **quale `arg` = quale lato**.

#### Prova B — Livelli ventola
Porta la ventola su ogni livello, attendi 5 s, leggi `WIND_LEVEL what=30004 int=…`.

| Ventola impostata | int letto |
|---|---|
| minimo / 1 | |
| metà | |
| massimo | |
| AUTO (se presente) | |

#### Prova C — Distribuzione bocchette (mappa WIND_MODE)
Per ogni modalità premi il tasto corrispondente, attendi 5 s, leggi `WIND_MODE what=30003 int=…`
(e, se presente, `WIND_MODE_RIGHT 30011`).

| Bocchette selezionate | WIND_MODE int | WIND_MODE_RIGHT int |
|---|---|---|
| viso | | |
| viso + piedi | | |
| piedi | | |
| piedi + parabrezza | | |
| parabrezza (defrost) | | |
| AUTO | | |

#### Prova D — Comandi ON/OFF (quali sono decodificati)
Accendi ciascun comando uno alla volta, attendi 5 s, annota se il suo `what` **compare** e con
quale valore. Se non compare mai → non decodificato.

| Comando | `what` | Compare? (S/N) | Valore ON |
|---|---|---|---|
| AC (compressore) | 30001 | | |
| AUTO | 30002 | | |
| Ricircolo | 30005 | | |
| ECO | 30018 | | |
| Defrost anteriore | 30010 | | |
| Defrost posteriore | 30013 | | |
| Sync zone | 30040 | | |

#### Prova E — Sensori ambientali (conferma negativa)
Senza fare nulla di speciale, controlla se compaiono con valore ≠0:

| Dato | `what` | Valore | Vivo? |
|---|---|---|---|
| Temp esterna | 30023 | | |
| Temp abitacolo | 30028 | | |

Se **INNER_TEMPERATURE (30028)** risultasse ≠0/presente → segnalarlo subito: cambierebbe il
progetto (unico sensore reale disponibile).

### 7.5 Cosa riportare
- Il file `Download/ntg_carinfo_log.txt` finale, **oppure** le tabelle sopra compilate.
- In particolare servono: la **mappa WIND_MODE** (Prova C), **quali comandi compaiono** (Prova D),
  e se le **due zone** setpoint si popolano (Prova A).

Con questi dati si costruisce il dashboard clima sui soli comandi realmente decodificati e con le
icone bocchette corrette.
