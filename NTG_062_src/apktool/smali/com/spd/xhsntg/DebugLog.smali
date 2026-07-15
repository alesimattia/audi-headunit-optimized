.class public Lcom/spd/xhsntg/DebugLog;
.super Ljava/lang/Object;
.source "DebugLog.java"


# Monitor CONTINUO in PULL dei parametri CarInfo leggibili.
# Non piu' one-shot: una volta aperta la pagina debug, un thread di background ri-legge
# tutti i what (CarInfo.get) a cicli di ~3s e fa UPSERT in sMap (LinkedHashMap) con
# chiave what+arg. I parametri nuovi (che diventano leggibili quando l'utente aziona un
# comando DURANTE la scansione) vengono aggiunti; quelli gia' visti vengono aggiornati al
# valore corrente. La lista e' deduplicata (non cresce all'infinito) e riscritta su file in
# SOVRASCRITTURA ad ogni ciclo. Avvio = dumpAll() (da FullscreenActivity$1, entrando nella
# pagina debug). Il monitor NON si ferma cambiando pagina: gira finche' l'app e' viva
# (reset/stop solo a riavvio app). stop() esiste ma NON e' agganciato (futuro toggle manuale).

# static fields
# sText / sScroll: package-private cosi DumpTask (stesso package) puo aggiornarli.
.field static sScroll:Landroid/widget/ScrollView;

.field static sText:Landroid/widget/TextView;

.field private static sFile:Ljava/io/File;

# flag "il monitor deve continuare": true da dumpAll(); resta true per tutta la vita dell'app
# (stop() lo metterebbe a false ma non e' piu' agganciato al cambio pagina).
.field static sRunning:Z

# arg corrente della scansione indicizzata (0..5): sedili/ruote/porte/zone/finestrini/camere.
.field static sArg:I

# mappa accumulata: chiave "NAME what=X [arg=Y]" -> riga col valore corrente. ConcurrentHashMap
# perche' vi scrivono sia il thread del monitor (PULL) sia il thread binder del callback (PUSH).
# Persistente per la vita del processo (reset solo a riavvio app).
.field static sMap:Ljava/util/concurrent/ConcurrentHashMap;

# mappa what(Integer) -> nome-costante, popolata dalla scansione PULL. Serve a onPush per
# costruire la STESSA chiave del PULL (dedup PUSH+PULL). Anch'essa ConcurrentHashMap.
.field static sNames:Ljava/util/concurrent/ConcurrentHashMap;

# flag "un thread monitor e' vivo": impedisce di avviarne due se si rientra nella pagina
# mentre il vecchio thread sta ancora terminando. Impostato dal thread (run), non da stop().
.field static sBusy:Z

# mappa chiave-riga -> [min, max] (float[2]) dei valori NUMERICI visti nella sessione.
# Permette di mostrare l'intervallo (es. picco RPM, velocita' massima in marcia) invece del
# solo ultimo valore. ConcurrentHashMap: scritta dal thread monitor (probe).
.field static sNum:Ljava/util/concurrent/ConcurrentHashMap;

# file del log eventi PUSH con timestamp (append). Separato dal file dedup: cattura la
# SEQUENZA temporale dei transitori (freccia/retro/freni) per provarne semantica e polarita'.
.field private static sEventFile:Ljava/io/File;

# true all'avvio del monitor: il primo evento riscrive il file eventi (sessione pulita), poi
# si passa in append. Cosi' ogni sessione di diagnosi riparte da un file vuoto.
.field static sEventFresh:Z


# direct methods

# Avvia (o ri-arma) il monitor continuo su un thread di background. Idempotente.
# Usato da: com.spd.xhsntg.FullscreenActivity$1.onPageSelected (entrando nella pagina debug).
.method public static dumpAll()V
    .locals 3

    # ri-arma sempre il flag "deve girare" (vale anche se un thread e' gia' vivo)
    const/4 v0, 0x1

    sput-boolean v0, Lcom/spd/xhsntg/DebugLog;->sRunning:Z

    # crea la mappa una sola volta (accumulo persistente tra aperture)
    sget-object v0, Lcom/spd/xhsntg/DebugLog;->sMap:Ljava/util/concurrent/ConcurrentHashMap;

    if-nez v0, :cond_map

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/spd/xhsntg/DebugLog;->sMap:Ljava/util/concurrent/ConcurrentHashMap;

    :cond_map
    # crea anche la mappa what->nome (serve a onPush per la dedup PUSH+PULL)
    sget-object v0, Lcom/spd/xhsntg/DebugLog;->sNames:Ljava/util/concurrent/ConcurrentHashMap;

    if-nez v0, :cond_names

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/spd/xhsntg/DebugLog;->sNames:Ljava/util/concurrent/ConcurrentHashMap;

    :cond_names
    # crea la mappa min/max dei valori numerici (una sola volta)
    sget-object v0, Lcom/spd/xhsntg/DebugLog;->sNum:Ljava/util/concurrent/ConcurrentHashMap;

    if-nez v0, :cond_num

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/spd/xhsntg/DebugLog;->sNum:Ljava/util/concurrent/ConcurrentHashMap;

    :cond_num
    # ogni avvio monitor riparte con un file eventi pulito (il primo write sovrascrive)
    const/4 v0, 0x1

    sput-boolean v0, Lcom/spd/xhsntg/DebugLog;->sEventFresh:Z

    # se un thread monitor e' gia' vivo, non avviarne un altro: continuera' da solo (sRunning true)
    sget-boolean v0, Lcom/spd/xhsntg/DebugLog;->sBusy:Z

    if-eqz v0, :cond_start

    return-void

    :cond_start
    new-instance v0, Lcom/spd/xhsntg/DebugLog$DumpTask;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/spd/xhsntg/DebugLog$DumpTask;-><init>(ILjava/lang/String;)V

    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    return-void
.end method

# Ferma il monitor: il thread esce al prossimo controllo di sRunning (fine passata o sleep).
# Attualmente NON agganciato (il monitor non si ferma cambiando pagina): lasciato pronto per
# un eventuale toggle manuale o per un aggancio a onDestroy in futuro.
.method public static stop()V
    .locals 1

    const/4 v0, 0x0

    sput-boolean v0, Lcom/spd/xhsntg/DebugLog;->sRunning:Z

    return-void
.end method

# Evento PUSH inoltrato da CarInfoManager.onCarInfoDataChanged: fonde il valore nella STESSA
# mappa del PULL (dedup per chiave "NAME what=X"). Gira sul thread binder del callback: sMap e
# sNames sono ConcurrentHashMap. Attivo solo mentre il monitor gira (sRunning) e solo se il
# nome del what e' gia' noto (popolato dalla scansione PULL).
.method static onPush(ILjava/lang/Object;I)V
    .locals 8
    .param p0, "what"     # I
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "unit"     # I

    sget-boolean v0, Lcom/spd/xhsntg/DebugLog;->sRunning:Z

    if-eqz v0, :cond_out

    if-eqz p1, :cond_out

    # --- valStr (v1): espande i Bundle (array inclusi), altrimenti String.valueOf ---
    instance-of v0, p1, Landroid/os/Bundle;

    if-eqz v0, :cond_notbundle

    move-object v0, p1

    check-cast v0, Landroid/os/Bundle;

    invoke-static {v0}, Lcom/spd/xhsntg/DebugLog;->bundleStr(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    goto :goto_haveval

    :cond_notbundle
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_haveval
    # --- name (v2): sNames.get(what), puo' restare null (PUSH precoce non perso: va comunque nel log eventi) ---
    const/4 v2, 0x0

    sget-object v3, Lcom/spd/xhsntg/DebugLog;->sNames:Ljava/util/concurrent/ConcurrentHashMap;

    if-eqz v3, :cond_noname

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object v2, v3

    :cond_noname
    # --- timestamp (v3) HH:mm:ss.SSS ---
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "HH:mm:ss.SSS"

    invoke-direct {v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3, v4}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    # --- riga evento: "<ts> <name|?> what=X push=<val> unit=U\n" -> writeEvent (append) ---
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v2, :cond_qmark

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_lbl

    :cond_qmark
    const-string v5, "?"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_lbl
    const-string v5, " what="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " push="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " unit="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/spd/xhsntg/DebugLog;->writeEvent(Ljava/lang/String;)V

    # --- dedup in sMap solo se il nome e' noto (chiave identica al PULL) ---
    if-eqz v2, :cond_out

    sget-object v6, Lcom/spd/xhsntg/DebugLog;->sMap:Ljava/util/concurrent/ConcurrentHashMap;

    if-eqz v6, :cond_out

    # key (v7) = name + " what=" + what
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " what="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    # line (v5) = key + " push=" + val + " unit=" + unit + "\n"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " push="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " unit="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v7, v5}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_out
    return-void
.end method

# Legge un singolo what (con l'arg corrente sArg) come int/float/string/bundle; se almeno un
# tipo ha valore PLAUSIBILE (non sentinella e non zero/vuoto) fa UPSERT in sMap: chiave
# "NAME what=X [arg=Y]" -> riga col valore corrente. Ritorna void.
# Chiamato da: com.spd.xhsntg.DebugLog$DumpTask.run
.method static probe(Lcom/spd/carinfo/CarInfo;Ljava/lang/String;I)V
    .locals 13
    .param p0, "ci"      # Lcom/spd/carinfo/CarInfo;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "what"    # I

    # arg per tutte le get() di questa probe (loop scansione indicizzata in DumpTask)
    sget v0, Lcom/spd/xhsntg/DebugLog;->sArg:I

    # --- lettura int (sentinella = Integer.MIN_VALUE) ---
    sget v9, Ljava/lang/Integer;->MIN_VALUE:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {p0, p2, v0, v9}, Lcom/spd/carinfo/CarInfo;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v1

    # --- lettura float (sentinella = NaN) ---
    sget v9, Ljava/lang/Float;->NaN:F

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    invoke-virtual {p0, p2, v0, v9}, Lcom/spd/carinfo/CarInfo;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v2

    # --- lettura string (sentinella = "NA") ---
    const-string v9, "NA"

    invoke-virtual {p0, p2, v0, v9}, Lcom/spd/carinfo/CarInfo;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    move-object v3, v9

    # --- lettura bundle (sentinella = Bundle vuoto); v4 = bundle utile o null, v8 = keepBundle ---
    new-instance v9, Landroid/os/Bundle;

    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p0, p2, v0, v9}, Lcom/spd/carinfo/CarInfo;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    const/4 v8, 0x0

    instance-of v10, v9, Landroid/os/Bundle;

    if-eqz v10, :cond_bdone

    check-cast v9, Landroid/os/Bundle;

    invoke-virtual {v9}, Landroid/os/Bundle;->size()I

    move-result v10

    if-eqz v10, :cond_bdone

    const/4 v8, 0x1

    move-object v4, v9

    goto :goto_bdone

    :cond_bdone
    const/4 v4, 0x0

    :goto_bdone

    # --- keepInt (v5): presente (!= MIN_VALUE) e != 0; con arg>0 scarto l'eco iv==arg ---
    const/4 v5, 0x0

    sget v9, Ljava/lang/Integer;->MIN_VALUE:I

    if-eq v1, v9, :cond_int

    if-eqz v1, :cond_int

    if-eqz v0, :cond_int_keep

    if-eq v1, v0, :cond_int

    :cond_int_keep
    const/4 v5, 0x1

    :cond_int

    # --- keepFloat (v6): non NaN e != 0.0 ---
    const/4 v6, 0x0

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v9

    if-nez v9, :cond_float

    const/4 v9, 0x0

    cmpl-float v9, v2, v9

    if-eqz v9, :cond_float

    const/4 v6, 0x1

    :cond_float

    # --- keepStr (v7): non null, != "NA", lunghezza>0 e != "0" ---
    const/4 v7, 0x0

    if-eqz v3, :cond_str

    const-string v9, "NA"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_str

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v9

    if-eqz v9, :cond_str

    const-string v9, "0"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_str

    const/4 v7, 0x1

    :cond_str

    # se nulla di plausibile -> non toccare la mappa
    if-nez v5, :cond_keep

    if-nez v6, :cond_keep

    if-nez v7, :cond_keep

    if-nez v8, :cond_keep

    return-void

    :cond_keep
    # --- key = NAME + " what=" + what [+ " arg=" + arg] ---
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " what="

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_keynoarg

    const-string v9, " arg="

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_keynoarg
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    # --- line = key + " int=.. float=.. str=.. bundle=..\n" ---
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " int="

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v5, :cond_pi

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_pf

    :cond_pi
    const-string v9, "-"

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_pf
    const-string v9, " float="

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v6, :cond_pfd

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    goto :goto_ps

    :cond_pfd
    const-string v9, "-"

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_ps
    const-string v9, " str="

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v7, :cond_psd

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_pb

    :cond_psd
    const-string v9, "-"

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_pb
    const-string v9, " bundle="

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v8, :cond_pbd

    # feature1: espande gli array int[]/float[]/Object[] dentro il Bundle (non piu' [I@hash)
    invoke-static {v4}, Lcom/spd/xhsntg/DebugLog;->bundleStr(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_pnl

    :cond_pbd
    const-string v9, "-"

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_pnl
    # feature3: suffisso min/max se e' stato tenuto un valore numerico (int o float).
    # v0 (ex sArg, non piu' usato) riusato come float del valore corrente.
    if-eqz v5, :cond_mm_flt

    int-to-float v0, v1

    goto :goto_mm_call

    :cond_mm_flt
    if-eqz v6, :cond_mm_none

    move v0, v2

    :goto_mm_call
    invoke-static {v11, v0}, Lcom/spd/xhsntg/DebugLog;->minMaxStr(Ljava/lang/String;F)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_mm_none
    const-string v9, "\n"

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    # --- upsert nella mappa: put(key, line) (nuovo = aggiunge, esistente = aggiorna) ---
    sget-object v9, Lcom/spd/xhsntg/DebugLog;->sMap:Ljava/util/concurrent/ConcurrentHashMap;

    if-eqz v9, :cond_ret

    invoke-virtual {v9, v11, v10}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_ret
    return-void
.end method

# Costruisce il testo completo del file dalla mappa accumulata (header + righe + conteggio).
# Chiamato ad ogni ciclo da com.spd.xhsntg.DebugLog$DumpTask.run.
.method static snapshot(Z)Ljava/lang/String;
    .locals 3
    .param p0, "connected"    # Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "=== NTG_062 CarInfo LIVE monitor ===\nconnected="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, "\ncriterio: monitor continuo. Ogni what+arg con valore PLAUSIBILE (int!=0 non-eco, float!=0.0, stringa non vuota/NA/0, oppure Bundle non vuoto) viene aggiunto la prima volta e aggiornato ai giri successivi. I comandi attivati durante la scansione compaiono appena leggibili. Lista deduplicata per what+arg: non cresce all'infinito. arg 0..5, righe con arg=0 = valore globale.\n\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    # righe accumulate (valori correnti)
    sget-object v1, Lcom/spd/xhsntg/DebugLog;->sMap:Ljava/util/concurrent/ConcurrentHashMap;

    if-eqz v1, :cond_nomap

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_it
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_itend

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_it

    :cond_itend
    const-string v2, "\nelementi rilevati="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/spd/xhsntg/DebugLog;->sMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_nomap
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

# Costruisce la vista della pagina debug (ScrollView nero + TextView bianca).
# Chiamato da: com.spd.view.MyViewPageAdapter.<init>
.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v2, 0x10

    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    const-string v2, "Monitor CarInfo live: aggiornamento continuo mentre la pagina e' aperta.\nAziona luci/marce/comandi per vederli comparire. Log in Download/carinfo_readable_dedup.log.\nAttendere il primo ciclo..."

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    sput-object v1, Lcom/spd/xhsntg/DebugLog;->sText:Landroid/widget/TextView;

    sput-object v0, Lcom/spd/xhsntg/DebugLog;->sScroll:Landroid/widget/ScrollView;

    return-object v0
.end method

# Scrive l'intero contenuto sul file in SOVRASCRITTURA (niente append: la mappa e' gia'
# deduplicata, cosi il file non cresce all'infinito). Tutto in try/catchall: se il permesso
# storage e negato il monitor resta comunque a schermo.
# Chiamato da: com.spd.xhsntg.DebugLog$DumpTask.run
.method static writeFileOverwrite(Ljava/lang/String;)V
    .locals 4
    .param p0, "content"    # Ljava/lang/String;

    :try_start_0
    sget-object v0, Lcom/spd/xhsntg/DebugLog;->sFile:Ljava/io/File;

    if-nez v0, :cond_1

    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_0
    new-instance v1, Ljava/io/File;

    const-string v2, "carinfo_readable_dedup.log"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v1, Lcom/spd/xhsntg/DebugLog;->sFile:Ljava/io/File;

    :cond_1
    new-instance v0, Ljava/io/FileWriter;

    sget-object v1, Lcom/spd/xhsntg/DebugLog;->sFile:Ljava/io/File;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-virtual {v0, p0}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method

# Serializza un Bundle espandendo gli array (int[]/float[]/Object[]): Bundle.toString() stampa
# solo il riferimento (es. value=[I@5f4ec5e) perdendo il contenuto. Cosi' emergono livelli
# radar e i cataloghi ALL_MAKE/ALL_MODEL/ALL_CANBOX (names[]/values[]).
.method static bundleStr(Landroid/os/Bundle;)Ljava/lang/String;
    .locals 6
    .param p0, "b"    # Landroid/os/Bundle;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Bundle[{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    # v1 = first (1 = prima chiave, niente separatore)
    const/4 v1, 0x1

    invoke-virtual {p0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_k
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :goto_end

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-nez v1, :cond_first

    const-string v4, ", "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_first
    const/4 v1, 0x0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    instance-of v5, v4, [I

    if-eqz v5, :cond_notintarr

    check-cast v4, [I

    invoke-static {v4}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v4

    goto :goto_val

    :cond_notintarr
    instance-of v5, v4, [F

    if-eqz v5, :cond_notfloatarr

    check-cast v4, [F

    invoke-static {v4}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    move-result-object v4

    goto :goto_val

    :cond_notfloatarr
    instance-of v5, v4, [Ljava/lang/Object;

    if-eqz v5, :cond_notobjarr

    check-cast v4, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_val

    :cond_notobjarr
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    :goto_val
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_k

    :goto_end
    const-string v1, "}]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

# Appende una riga al file eventi (Download/carinfo_events_append.log). Il primo write dopo l'avvio
# monitor (sEventFresh) sovrascrive: ogni sessione riparte pulita, poi si accumula in append.
# Tutto in try/catchall (permesso storage negato -> no-op).
.method static writeEvent(Ljava/lang/String;)V
    .locals 5
    .param p0, "line"    # Ljava/lang/String;

    :try_start_0
    sget-object v0, Lcom/spd/xhsntg/DebugLog;->sEventFile:Ljava/io/File;

    if-nez v0, :cond_have

    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_dir

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_dir
    new-instance v1, Ljava/io/File;

    const-string v2, "carinfo_events_append.log"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v1, Lcom/spd/xhsntg/DebugLog;->sEventFile:Ljava/io/File;

    :cond_have
    # append = true, tranne il primo write dopo l'avvio (sovrascrive e azzera il flag)
    const/4 v2, 0x1

    sget-boolean v3, Lcom/spd/xhsntg/DebugLog;->sEventFresh:Z

    if-eqz v3, :cond_app

    const/4 v2, 0x0

    const/4 v3, 0x0

    sput-boolean v3, Lcom/spd/xhsntg/DebugLog;->sEventFresh:Z

    :cond_app
    new-instance v3, Ljava/io/FileWriter;

    sget-object v4, Lcom/spd/xhsntg/DebugLog;->sEventFile:Ljava/io/File;

    invoke-direct {v3, v4, v2}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-virtual {v3, p0}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method

# Aggiorna min/max (sNum) per la chiave e ritorna " min=<min> max=<max>". Restituisce ""
# se la mappa non e' pronta. Chiamata da probe con il valore numerico corrente.
.method static minMaxStr(Ljava/lang/String;F)Ljava/lang/String;
    .locals 5
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "v"      # F

    sget-object v0, Lcom/spd/xhsntg/DebugLog;->sNum:Ljava/util/concurrent/ConcurrentHashMap;

    if-nez v0, :cond_have

    const-string v0, ""

    return-object v0

    :cond_have
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [F

    if-nez v1, :cond_upd

    # prima volta: new float[]{v, v}
    const/4 v2, 0x2

    new-array v1, v2, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v2, 0x1

    aput p1, v1, v2

    invoke-virtual {v0, p0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_fmt

    :cond_upd
    # min (idx 0)
    const/4 v2, 0x0

    aget v3, v1, v2

    cmpg-float v4, p1, v3

    if-gez v4, :cond_max

    aput p1, v1, v2

    :cond_max
    # max (idx 1)
    const/4 v2, 0x1

    aget v3, v1, v2

    cmpl-float v4, p1, v3

    if-lez v4, :goto_fmt

    aput p1, v1, v2

    :goto_fmt
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " min="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    aget v3, v1, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " max="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x1

    aget v3, v1, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
