---
name: ntg062-system-page
description: NTG_062 — 6a pagina "Sistema" che mostra parametri headunit Android (RAM/CPU/temp) senza root, costruita in smali a mano
metadata:
  type: project
---

**Scopo**: pagina slider che mostra parametri della **headunit Android** (NON dati CAN), realizzabili sotto Strada C (no root, no platform key). Lavoro del **2026-06-24**.

**STATO: TESTATA OK SUL DISPOSITIVO** (2026-06-25). Compilata, installata come **package distinto** dall'app di sistema originale (vedi punto 11 di [[ntg062-applied-mods]]) e **funziona correttamente SENZA permessi system ne root**. Conferma pratica che la Strada C regge per questa pagina: RAM/CPU/temp via API standard non richiedono privilegi. (NB: questo valida solo i parametri Android di SystemView; i dati CAN via AIDL restano un capitolo a parte, vedi [[ntg062-carinfo-data]].)

**Decisioni utente**: CPU = **globale**, e se `/proc/stat` non leggibile la **riga sparisce** (nessun fallback ad app-process). Testi etichette a sinistra con piccolo padding, **valori incolonnati** (per questo si usa `TableLayout`).

⚠️ **AGGIORNAMENTI (2026-06-29)**:
- **Indice cambiato**: dopo la rimozione delle pagine porte (punto 16) e sensori (punto 17 di [[ntg062-applied-mods]]) la pagina Sistema è ora all'**indice 3** (era 5). `FullscreenActivity$1.onPageSelected` la avvia/ferma a `p1==3` (debug a 2).
- **Font 19sp** su tutta la pagina (era 18): in `fillRow` i due `const/high16 ... 0x41900000` (18.0f) sono diventati **`0x41980000`** (19.0f).
- **Nuova riga "Freq CPU"**: campo `sFreqText`, metodo `updateFreq()` legge `/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq` (kHz→MHz via `readLine`+`parseLong`), "--" se non leggibile. È **cpu0** (cluster little), valore singolo.
- **Temperature dinamiche, una riga per zona**: la singola riga "Temp CPU" (campo `sTempText`, RIMOSSO) è sostituita da `buildTempRows(table,ctx)` che enumera `/sys/class/thermal/thermal_zone0..9`: per ogni `temp` leggibile crea una riga "Temp <type>" (type letto da `.../typeN`, fallback "zone N"). Celle valore + percorsi paralleli in due `ArrayList` statici **`sTempViews`**/**`sTempPaths`**; `updateTemps()` itera e mostra "NN °C" / "--". Se nessuna zona leggibile, una sola riga "Temp batteria" con percorso sentinella **"BATTERY"** (→ `readBatteryTemp`). `readCpuTemp()` generalizzato in **`readTempPath(String)`**; aggiunto helper **`readLine(String)`** (prima riga trimmata o null).
- **ScrollView**: `createView` ora ritorna uno `ScrollView` che avvolge il `TableLayout` (le righe temperatura possono superare l'altezza del display, specie a 800x480). `setCpuRowVisibility` (via `getParent` della cella) resta valido: lo ScrollView avvolge la tabella, non le righe.
- `refresh()` ora chiama anche `updateFreq()` e `updateTemps()`. Ticker `$1` invariato. ⚠️ STAGED, da ricompilare.

**File nuovi**:
- `smali/com/spd/xhsntg/SystemView.smali` — pagina costruita in codice (stesso pattern della pagina debug/dump CarInfo — classe `DebugLog`, doc `IMPLEMENTAZIONE_DUMP_CARINFO.md`). `TableLayout` 2 colonne (etichetta | valore) → valori allineati a prescindere dalla lunghezza. `fillRow(TableLayout,Context,String,TableRow)` costruisce ogni riga e ritorna la cella valore. Righe: **RAM** ("`<used> MB usata / <avail> MB libera`" + `ProgressBar` orizzontale full-width % usata) · **Ram usage app** (PSS via `Debug.MemoryInfo.getTotalPss()`/1024) · **Carico CPU** (delta `/proc/stat`, riga `GONE` se non leggibile) · **Temp CPU** (`/sys/class/thermal/thermal_zone0/temp`, fallback `ACTION_BATTERY_CHANGED`/`EXTRA_TEMPERATURE`, stessa etichetta). Refresh 1 s via `Handler` main looper + `Runnable`. `start()`/`stop()` idempotenti. Hide riga CPU = `setCpuRowVisibility` su `sCpuText.getParent()` (la TableRow).
- `smali/com/spd/xhsntg/SystemView$1.smali` — il `Runnable` ticker: chiama `SystemView.refresh()` e si ri-posta a 1000 ms finche `sRunning`.

**File modificati**:
- `MyViewPageAdapter.smali`: nuovo campo `m_test_view_5`; `createView` in `<init>`; `getCount 0x5→0x6`; `:pswitch_5` + voce nella packed-switch.
- `FullscreenActivity$1.onPageSelected`: indice 5 → `SystemView.start()`, altrimenti `SystemView.stop()` (il ticker non gira fuori pagina).

**Dettagli tecnici / rischi da validare su testata**:
- **Carico CPU globale**: da Android 8 `/proc/stat` e spesso negato (hidepid/SELinux) → la riga probabilmente sparira. Comportamento voluto.
- **Barra**: stile via `android.R.attr.progressBarStyleHorizontal` = **0x1010078** (costruttore `ProgressBar(Context,AttributeSet,int)`). Se la barra appare come spinner circolare, e questo id l'unico knob da verificare.
- **margini barra**: i campi `topMargin/bottomMargin` referenziati via `Landroid/view/ViewGroup$MarginLayoutParams;` (classe dichiarante), non via la sottoclasse.
- **Restore pagina**: se l'app riapre direttamente sulla pagina Sistema senza che `onPageSelected` scatti, il refresh potrebbe non auto-avviarsi finche non si scorre. ✅ **RISOLTO 2026-06-30** (punto 19 di [[ntg062-applied-mods]]): `FullscreenActivity` ha nuovo campo `m_view_pager` e `onResume` chiama `SystemView.start()` se `getCurrentItem()==3`.
- ⚠️ **I/O termico ora PIGRO (2026-06-30, A1 punto 19 [[ntg062-applied-mods]])**: `buildTempRows` (le ~20 letture `/sys/class/thermal/*`) **NON** e piu in `createView` (girava in onCreate sul cold-start) ma in `start()` via nuovo `ensureTempRows()` (guardia statica `sTempRowsBuilt`; nuovo campo `sTable` salva la tabella in createView). Quindi le righe temperatura si costruiscono solo entrando nella pagina Sistema (o via la rete di sicurezza onResume sopra). `updateTemps` gia null-guarda `sTempViews` → se non costruite, nessuna riga e nessun crash.
- Niente permessi nuovi nel manifest (RAM/CPU/temp/batteria non li richiedono).
