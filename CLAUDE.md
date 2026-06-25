# Progetto
Backup di un'applicazione per android 9.0 car headunit

# Caratteristiche
- automobile di destinazione: Audi A5 coupè
- carburante: diesel
- lingua: italiano
- destinazione: android 9 api level 28, no root
- non si intende pubblicare l'applicazione nel Google Play Store
- non si intende utilizzare applicazioni di navigazione diverse da Google Maps

# Obiettivo
- Ridurre il più possibile il footprint dell'applicazione mantenendo solo il necessario per la specifica auto indicata.
- Ottimizzare il codice per ottenere tempi di risposta veloci
- Implementare nuove funzionalità 
- Debloat di spyware o app cinesi
- Leggere ulteriori parametri automobile (magari tramite CANbus) oltre a quelli già mostrati

# Regole comportamentali per Claude
- Quando scopri dettagli rilevanti dell'architettura o caratteristiche dell'applicazione di partenza ossia NTG_062.apk salva una memoria Claude locale su ciò che hai scoperto o integrala in una memoria locale esistente
- Non compilare l'apk senza avermelo chiesto 
- Pulisci sempre la cache di build prima di ricompilare
- applica sempre zipalign + firma con uber-apk-signer (schemi v2+v3) quando compili l'applicazione
- Il PC windows con nome PC-030 va utilizzato solo per progettazione e scrittura del codice, non compilare app e non installare software aggiuntivo senza autorizzazione