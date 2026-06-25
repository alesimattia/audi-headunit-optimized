.class public Lcom/spd/xhsntg/DebugLog;
.super Ljava/lang/Object;
.source "DebugLog.java"


# Dump one-shot in PULL di tutti i parametri CarInfo leggibili.
# A differenza della versione precedente (monitor live agganciato a onCarInfoDataChanged)
# qui i valori si leggono on-demand con CarInfo.get(what,arg,def) e si scrive il file
# UNA sola volta (sovrascrittura), all'apertura della pagina debug.

# static fields
# sText / sScroll: package-private cosi DumpTask (stesso package) puo aggiornarli.
.field static sScroll:Landroid/widget/ScrollView;

.field static sText:Landroid/widget/TextView;

.field private static sFile:Ljava/io/File;

# flag anti-rientro: evita dump sovrapposti se la pagina viene riaperta mentre uno e in corso
.field static sRunning:Z

# arg corrente della scansione indicizzata: DumpTask lo imposta in un loop 0..N prima di ogni
# probe, e probe lo usa come parametro 'arg' di CarInfo.get() (sedili/ruote/porte/zone/camere).
.field static sArg:I


# direct methods

# Avvia il dump su un thread di background (chiamato dal main thread).
# Usato da: com.spd.xhsntg.FullscreenActivity$1.onPageSelected
.method public static dumpAll()V
    .locals 3

    sget-boolean v0, Lcom/spd/xhsntg/DebugLog;->sRunning:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/spd/xhsntg/DebugLog;->sRunning:Z

    new-instance v0, Lcom/spd/xhsntg/DebugLog$DumpTask;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/spd/xhsntg/DebugLog$DumpTask;-><init>(ILjava/lang/String;)V

    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    return-void
.end method

# Legge un singolo what come int, float e string; se almeno uno restituisce un valore
# "utile" (non sentinella e non zero/vuoto) accoda una riga a sb e ritorna 1, altrimenti 0.
# I default-sentinella distinguono "il servizio ha risposto 0" da "non disponibile".
# Chiamato da: com.spd.xhsntg.DebugLog$DumpTask.run
.method static probe(Ljava/lang/StringBuilder;Lcom/spd/carinfo/CarInfo;Ljava/lang/String;I)I
    .locals 12
    .param p0, "sb"      # Ljava/lang/StringBuilder;
    .param p1, "ci"      # Lcom/spd/carinfo/CarInfo;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "what"    # I

    # --- lettura int (sentinella = Integer.MIN_VALUE) ---
    sget v0, Ljava/lang/Integer;->MIN_VALUE:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    # arg per tutte le get() di questa probe: impostato da DumpTask (loop scansione indicizzata).
    sget v2, Lcom/spd/xhsntg/DebugLog;->sArg:I

    invoke-virtual {p1, p3, v2, v1}, Lcom/spd/carinfo/CarInfo;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    # --- lettura float (sentinella = NaN) ---
    sget v3, Ljava/lang/Float;->NaN:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {p1, p3, v2, v3}, Lcom/spd/carinfo/CarInfo;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3


    # --- lettura string (sentinella = "NA") ---
    const-string v4, "NA"

    invoke-virtual {p1, p3, v2, v4}, Lcom/spd/carinfo/CarInfo;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;


    # --- lettura bundle (sentinella = nuovo Bundle vuoto) ---
    # get(what,0,defBundle) ritorna un Bundle; size() forza l'unparcel del binder.
    # keepBundle (v11) = e davvero un Bundle non vuoto. v9 = bundle utile (o null).
    new-instance v9, Landroid/os/Bundle;

    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p1, p3, v2, v9}, Lcom/spd/carinfo/CarInfo;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    const/4 v11, 0x0

    instance-of v10, v9, Landroid/os/Bundle;

    if-eqz v10, :cond_bdone

    check-cast v9, Landroid/os/Bundle;

    invoke-virtual {v9}, Landroid/os/Bundle;->size()I

    move-result v10

    if-eqz v10, :cond_bdone

    const/4 v11, 0x1

    goto :goto_bdone

    :cond_bdone
    const/4 v9, 0x0

    :goto_bdone

    # --- keepInt = (iv != MIN_VALUE)  [P1: rimosso filtro 'zero', ridondante con la sentinella] ---
    const/4 v5, 0x0


    sget v6, Ljava/lang/Integer;->MIN_VALUE:I

    if-eq v1, v6, :cond_int

    const/4 v5, 0x1

    :cond_int

    # --- keepFloat = !isNaN(fv)  [P1: rimosso filtro 'zero', ridondante con la sentinella NaN] ---
    const/4 v6, 0x0


    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-nez v7, :cond_float

    const/4 v6, 0x1

    :cond_float

    # --- keepStr = sv!=null && !sv.equals("NA") && len>0  [P1: rimosso filtro 'sv=="0"'] ---
    const/4 v7, 0x0


    if-eqz v4, :cond_str

    const-string v8, "NA"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_str

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_str

    const/4 v7, 0x1

    :cond_str

    # se nulla di utile -> scarta
    if-nez v5, :cond_keep

    if-nez v6, :cond_keep

    if-nez v7, :cond_keep

    if-nez v11, :cond_keep

    const/4 v0, 0x0

    return v0

    :cond_keep
    # --- accoda riga: NAME what=<dec> int=.. float=.. str=.. ---
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, " what="

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    # P3: " arg=N" solo se arg>0 (le righe globali arg=0 restano nel formato originale)
    if-eqz v2, :cond_noarg

    const-string v8, " arg="

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_noarg
    const-string v8, " int="

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v5, :cond_pi

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_pf

    :cond_pi
    const-string v8, "-"

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_pf
    const-string v8, " float="

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v6, :cond_pfd

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    goto :goto_ps

    :cond_pfd
    const-string v8, "-"

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_ps
    const-string v8, " str="

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v7, :cond_psd

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_bundle

    :cond_psd
    const-string v8, "-"

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_bundle
    const-string v8, " bundle="

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v11, :cond_pbd

    invoke-virtual {v9}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_nl

    :cond_pbd
    const-string v8, "-"

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_nl
    const-string v8, "\n"

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v0, 0x1

    return v0
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

    const-string v2, "Dump parametri CarInfo: generato all'apertura di questa pagina.\nAttendere il completamento..."

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    sput-object v1, Lcom/spd/xhsntg/DebugLog;->sText:Landroid/widget/TextView;

    sput-object v0, Lcom/spd/xhsntg/DebugLog;->sScroll:Landroid/widget/ScrollView;

    return-object v0
.end method

# Scrive l'intero contenuto sul file in SOVRASCRITTURA (un solo snapshot, niente append).
# Tutto in try/catchall: se il permesso storage e negato il dump resta comunque a schermo.
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

    const-string v2, "ntg_carinfo_log.txt"

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
