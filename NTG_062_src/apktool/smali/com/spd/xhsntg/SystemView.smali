.class public Lcom/spd/xhsntg/SystemView;
.super Ljava/lang/Object;
.source "SystemView.java"


# Pagina "Sistema": mostra parametri della headunit Android (NON dati CAN).
# Costruita interamente in codice (stesso approccio di com.spd.xhsntg.DebugLog).
# Layout: TableLayout a 2 colonne -> etichette a sinistra (piccolo padding) e
# valori tutti incolonnati (la colonna 1 parte dopo l'etichetta piu lunga,
# quindi i valori restano allineati verticalmente qualunque sia la loro lunghezza).
# Righe: RAM usata/libera (MB) + barra full-width; Ram usage app (PSS); Carico CPU
# (globale, riga nascosta se /proc/stat non leggibile); Temp CPU (thermal_zone0,
# fallback batteria, stessa etichetta).
# Aggiornamento periodico ogni 1 s via Handler+Runnable, avviato/fermato da
# com.spd.xhsntg.FullscreenActivity$1.onPageSelected quando si entra/esce dall'indice 5.


# static fields
.field static sCtx:Landroid/content/Context;

# Le TextView qui sotto sono le celle VALORE (colonna 1); le etichette sono statiche.
.field static sRamText:Landroid/widget/TextView;

.field static sBar:Landroid/widget/ProgressBar;

.field static sAppText:Landroid/widget/TextView;

.field static sCpuText:Landroid/widget/TextView;

.field static sTempText:Landroid/widget/TextView;

.field static sHandler:Landroid/os/Handler;

.field static sTicker:Ljava/lang/Runnable;

.field static sRunning:Z

# baseline per il calcolo del delta CPU tra due campioni di /proc/stat
.field static sPrevTotal:J

.field static sPrevIdle:J


# direct methods

# Costruisce la vista della pagina Sistema e inizializza handler/ticker.
# Chiamato da: com.spd.view.MyViewPageAdapter.<init>
.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 7
    .param p0, "ctx"    # Landroid/content/Context;

    sput-object p0, Lcom/spd/xhsntg/SystemView;->sCtx:Landroid/content/Context;

    # contenitore: tabella a 2 colonne, sfondo nero, piccolo padding
    new-instance v0, Landroid/widget/TableLayout;

    invoke-direct {v0, p0}, Landroid/widget/TableLayout;-><init>(Landroid/content/Context;)V

    const/high16 v1, -0x1000000   # 0xFF000000 nero

    invoke-virtual {v0, v1}, Landroid/widget/TableLayout;->setBackgroundColor(I)V

    const/16 v1, 0x10             # 16px padding (piccolo)

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/TableLayout;->setPadding(IIII)V

    # --- riga RAM (etichetta + valore) ---
    new-instance v1, Landroid/widget/TableRow;

    invoke-direct {v1, p0}, Landroid/widget/TableRow;-><init>(Landroid/content/Context;)V

    const-string v2, "RAM"

    invoke-static {v0, p0, v2, v1}, Lcom/spd/xhsntg/SystemView;->fillRow(Landroid/widget/TableLayout;Landroid/content/Context;Ljava/lang/String;Landroid/widget/TableRow;)Landroid/widget/TextView;

    move-result-object v2

    sput-object v2, Lcom/spd/xhsntg/SystemView;->sRamText:Landroid/widget/TextView;

    # --- barra di riempimento (ProgressBar orizzontale full-width, max 100) ---
    new-instance v2, Landroid/widget/ProgressBar;

    const/4 v3, 0x0

    const v4, 0x1010078          # android.R.attr.progressBarStyleHorizontal

    invoke-direct {v2, p0, v3, v4}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 v3, 0x64            # max = 100

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setMax(I)V

    sput-object v2, Lcom/spd/xhsntg/SystemView;->sBar:Landroid/widget/ProgressBar;

    new-instance v3, Landroid/widget/TableLayout$LayoutParams;

    const/4 v4, -0x1            # MATCH_PARENT

    const/4 v5, -0x2           # WRAP_CONTENT

    invoke-direct {v3, v4, v5}, Landroid/widget/TableLayout$LayoutParams;-><init>(II)V

    const/16 v4, 0x8

    iput v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    const/16 v4, 0x18

    iput v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {v0, v2, v3}, Landroid/widget/TableLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # --- riga Ram usage app ---
    new-instance v1, Landroid/widget/TableRow;

    invoke-direct {v1, p0}, Landroid/widget/TableRow;-><init>(Landroid/content/Context;)V

    const-string v2, "Ram usage app"

    invoke-static {v0, p0, v2, v1}, Lcom/spd/xhsntg/SystemView;->fillRow(Landroid/widget/TableLayout;Landroid/content/Context;Ljava/lang/String;Landroid/widget/TableRow;)Landroid/widget/TextView;

    move-result-object v2

    sput-object v2, Lcom/spd/xhsntg/SystemView;->sAppText:Landroid/widget/TextView;

    # --- riga Carico CPU ---
    new-instance v1, Landroid/widget/TableRow;

    invoke-direct {v1, p0}, Landroid/widget/TableRow;-><init>(Landroid/content/Context;)V

    const-string v2, "Carico CPU"

    invoke-static {v0, p0, v2, v1}, Lcom/spd/xhsntg/SystemView;->fillRow(Landroid/widget/TableLayout;Landroid/content/Context;Ljava/lang/String;Landroid/widget/TableRow;)Landroid/widget/TextView;

    move-result-object v2

    sput-object v2, Lcom/spd/xhsntg/SystemView;->sCpuText:Landroid/widget/TextView;

    # --- riga Temp CPU ---
    new-instance v1, Landroid/widget/TableRow;

    invoke-direct {v1, p0}, Landroid/widget/TableRow;-><init>(Landroid/content/Context;)V

    const-string v2, "Temp CPU"

    invoke-static {v0, p0, v2, v1}, Lcom/spd/xhsntg/SystemView;->fillRow(Landroid/widget/TableLayout;Landroid/content/Context;Ljava/lang/String;Landroid/widget/TableRow;)Landroid/widget/TextView;

    move-result-object v2

    sput-object v2, Lcom/spd/xhsntg/SystemView;->sTempText:Landroid/widget/TextView;

    # handler sul main looper + ticker
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/spd/xhsntg/SystemView;->sHandler:Landroid/os/Handler;

    new-instance v1, Lcom/spd/xhsntg/SystemView$1;

    invoke-direct {v1}, Lcom/spd/xhsntg/SystemView$1;-><init>()V

    sput-object v1, Lcom/spd/xhsntg/SystemView;->sTicker:Ljava/lang/Runnable;

    return-object v0
.end method

# Riempie una TableRow [etichetta | valore], la aggiunge a parent e ritorna la cella valore.
.method private static fillRow(Landroid/widget/TableLayout;Landroid/content/Context;Ljava/lang/String;Landroid/widget/TableRow;)Landroid/widget/TextView;
    .locals 4
    .param p0, "parent"    # Landroid/widget/TableLayout;
    .param p1, "ctx"       # Landroid/content/Context;
    .param p2, "label"     # Ljava/lang/String;
    .param p3, "row"       # Landroid/widget/TableRow;

    # --- cella etichetta (sinistra) ---
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v1, 0x41900000    # 18.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v1, 0x0

    const/16 v2, 0xc              # padding verticale 12px

    const/16 v3, 0x18            # gap 24px verso la colonna valore

    invoke-virtual {v0, v1, v2, v3, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p3, v0}, Landroid/widget/TableRow;->addView(Landroid/view/View;)V

    # --- cella valore (colonna allineata) ---
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v1, 0x41900000    # 18.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v1, 0x0

    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {p3, v0}, Landroid/widget/TableRow;->addView(Landroid/view/View;)V

    invoke-virtual {p0, p3}, Landroid/widget/TableLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method

# Avvia il refresh periodico (idempotente). Chiamato da FullscreenActivity$1.
.method public static start()V
    .locals 2

    sget-boolean v0, Lcom/spd/xhsntg/SystemView;->sRunning:Z

    if-eqz v0, :cond_go

    return-void

    :cond_go
    sget-object v0, Lcom/spd/xhsntg/SystemView;->sHandler:Landroid/os/Handler;

    if-nez v0, :cond_have

    return-void

    :cond_have
    const/4 v0, 0x1

    sput-boolean v0, Lcom/spd/xhsntg/SystemView;->sRunning:Z

    # azzera la baseline CPU cosi il primo delta riparte pulito
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/spd/xhsntg/SystemView;->sPrevTotal:J

    sput-wide v0, Lcom/spd/xhsntg/SystemView;->sPrevIdle:J

    sget-object v0, Lcom/spd/xhsntg/SystemView;->sHandler:Landroid/os/Handler;

    sget-object v1, Lcom/spd/xhsntg/SystemView;->sTicker:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

# Ferma il refresh periodico. Chiamato da FullscreenActivity$1.
.method public static stop()V
    .locals 2

    const/4 v0, 0x0

    sput-boolean v0, Lcom/spd/xhsntg/SystemView;->sRunning:Z

    sget-object v0, Lcom/spd/xhsntg/SystemView;->sHandler:Landroid/os/Handler;

    if-eqz v0, :cond_end

    sget-object v1, Lcom/spd/xhsntg/SystemView;->sTicker:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_end
    return-void
.end method

# Aggiorna tutte le righe. Chiamato dal ticker (main thread).
.method static refresh()V
    .locals 0

    invoke-static {}, Lcom/spd/xhsntg/SystemView;->updateRam()V

    invoke-static {}, Lcom/spd/xhsntg/SystemView;->updateApp()V

    invoke-static {}, Lcom/spd/xhsntg/SystemView;->updateCpu()V

    invoke-static {}, Lcom/spd/xhsntg/SystemView;->updateTemp()V

    return-void
.end method

# Imposta la visibilita dell'intera riga CPU (la TableRow = parent della cella valore).
.method private static setCpuRowVisibility(I)V
    .locals 2
    .param p0, "visibility"    # I

    sget-object v0, Lcom/spd/xhsntg/SystemView;->sCpuText:Landroid/widget/TextView;

    if-eqz v0, :cond_end

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_end

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    :cond_end
    return-void
.end method

# RAM totale/disponibile via ActivityManager.MemoryInfo; valore = "usata MB / libera MB", barra = % usata.
.method private static updateRam()V
    .locals 20

    :try_start_0
    sget-object v0, Lcom/spd/xhsntg/SystemView;->sCtx:Landroid/content/Context;

    if-eqz v0, :cond_end

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    new-instance v1, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v1}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    iget-wide v2, v1, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    iget-wide v4, v1, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    sub-long v6, v2, v4            # used = total - avail

    const-wide/32 v8, 0x100000    # 1048576 byte = 1 MB

    div-long v10, v6, v8          # usedMB

    div-long v12, v4, v8          # availMB

    const-wide/16 v8, 0x64        # 100 (riusa v8/v9)

    mul-long v6, v6, v8           # used * 100 -> v6/v7

    div-long v6, v6, v2           # / total -> v6/v7

    long-to-int v6, v6            # pct -> v6 (registro basso: long-to-int e invoke sono a 4 bit)

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " MB usata / "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " MB libera"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v0, Lcom/spd/xhsntg/SystemView;->sRamText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget-object v0, Lcom/spd/xhsntg/SystemView;->sBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v6}, Landroid/widget/ProgressBar;->setProgress(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_0

    :cond_end
    return-void

    :catch_0
    move-exception v0

    return-void
.end method

# Memoria del solo processo app (PSS in KB -> MB). /proc/self -> sempre leggibile.
.method private static updateApp()V
    .locals 3

    :try_start_0
    new-instance v0, Landroid/os/Debug$MemoryInfo;

    invoke-direct {v0}, Landroid/os/Debug$MemoryInfo;-><init>()V

    invoke-static {v0}, Landroid/os/Debug;->getMemoryInfo(Landroid/os/Debug$MemoryInfo;)V

    invoke-virtual {v0}, Landroid/os/Debug$MemoryInfo;->getTotalPss()I

    move-result v0

    div-int/lit16 v0, v0, 0x400   # KB -> MB

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " MB"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/spd/xhsntg/SystemView;->sAppText:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method

# Carico CPU globale dal delta di /proc/stat tra due campioni.
# Se il file non e leggibile (hidepid/SELinux su Android 8+) la riga viene nascosta.
.method private static updateCpu()V
    .locals 16

    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/FileReader;

    const-string v2, "/proc/stat"

    invoke-direct {v1, v2}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    if-eqz v1, :cond_fail

    const-string v8, "cpu"

    invoke-virtual {v1, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_fail

    new-instance v2, Ljava/util/StringTokenizer;

    invoke-direct {v2, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    const-wide/16 v3, 0x0         # total

    const-wide/16 v5, 0x0         # idle

    const/4 v7, 0x0              # idx

    :goto_loop
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v8

    if-eqz v8, :goto_endloop

    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v9

    add-long/2addr v3, v9         # total += val

    add-int/lit8 v7, v7, 0x1      # idx++

    const/4 v8, 0x4              # idle = token idx 4

    if-eq v7, v8, :cond_addidle

    const/4 v8, 0x5             # iowait = token idx 5

    if-eq v7, v8, :cond_addidle

    goto :goto_loop

    :cond_addidle
    add-long/2addr v5, v9         # idle += val

    goto :goto_loop

    :goto_endloop
    sget-wide v9, Lcom/spd/xhsntg/SystemView;->sPrevTotal:J

    sget-wide v11, Lcom/spd/xhsntg/SystemView;->sPrevIdle:J

    sput-wide v3, Lcom/spd/xhsntg/SystemView;->sPrevTotal:J

    sput-wide v5, Lcom/spd/xhsntg/SystemView;->sPrevIdle:J

    const-wide/16 v13, 0x0

    cmp-long v15, v9, v13

    if-nez v15, :cond_compute

    # primo campione: niente delta ancora, riga visibile in attesa
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/spd/xhsntg/SystemView;->setCpuRowVisibility(I)V

    sget-object v0, Lcom/spd/xhsntg/SystemView;->sCpuText:Landroid/widget/TextView;

    const-string v1, "..."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_compute
    sub-long v3, v3, v9           # deltaTotal

    sub-long v5, v5, v11          # deltaIdle

    sub-long v9, v3, v5           # busy = deltaTotal - deltaIdle

    const-wide/16 v11, 0x64

    mul-long v9, v9, v11          # busy * 100

    div-long v9, v9, v3           # / deltaTotal (ArithmeticException se delta 0 -> catch)

    long-to-int v2, v9           # pct

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/spd/xhsntg/SystemView;->setCpuRowVisibility(I)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "%"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v0, Lcom/spd/xhsntg/SystemView;->sCpuText:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :cond_fail
    const/16 v0, 0x8             # View.GONE

    invoke-static {v0}, Lcom/spd/xhsntg/SystemView;->setCpuRowVisibility(I)V

    return-void

    :catch_0
    move-exception v0

    const/16 v0, 0x8             # View.GONE

    invoke-static {v0}, Lcom/spd/xhsntg/SystemView;->setCpuRowVisibility(I)V

    return-void
.end method

# Temperatura: prova la CPU (thermal_zone0), altrimenti fallback batteria, stesso valore mostrato.
.method private static updateTemp()V
    .locals 4

    invoke-static {}, Lcom/spd/xhsntg/SystemView;->readCpuTemp()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_have

    invoke-static {}, Lcom/spd/xhsntg/SystemView;->readBatteryTemp()F

    move-result v0

    :cond_have
    sget-object v1, Lcom/spd/xhsntg/SystemView;->sTempText:Landroid/widget/TextView;

    if-eqz v1, :cond_ret

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_show

    const-string v2, "--"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_show
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " °C"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_ret
    return-void
.end method

# Legge /sys/class/thermal/thermal_zone0/temp; ritorna gradi C o Float.NaN se non disponibile.
# Valori >1000 sono in milli-gradi (li divide per 1000), altrimenti gia in gradi.
.method private static readCpuTemp()F
    .locals 6

    const-string v0, "/sys/class/thermal/thermal_zone0/temp"

    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, v0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    if-eqz v0, :cond_fail

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_0

    const-wide/16 v3, 0x3e8       # 1000

    cmp-long v5, v1, v3

    if-lez v5, :cond_asis

    long-to-float v0, v1

    const/high16 v1, 0x447a0000   # 1000.0f

    div-float v0, v0, v1

    return v0

    :cond_asis
    long-to-float v0, v1

    return v0

    :cond_fail
    sget v0, Ljava/lang/Float;->NaN:F

    return v0

    :catch_0
    move-exception v0

    sget v0, Ljava/lang/Float;->NaN:F

    return v0
.end method

# Temperatura via sticky ACTION_BATTERY_CHANGED (decimi di grado -> gradi). NaN se assente.
.method private static readBatteryTemp()F
    .locals 3

    :try_start_0
    sget-object v0, Lcom/spd/xhsntg/SystemView;->sCtx:Landroid/content/Context;

    if-eqz v0, :cond_fail

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_fail

    const-string v1, "temperature"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_fail

    int-to-float v0, v0

    const/high16 v1, 0x41200000   # 10.0f

    div-float v0, v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :cond_fail
    sget v0, Ljava/lang/Float;->NaN:F

    return v0

    :catch_0
    move-exception v0

    sget v0, Ljava/lang/Float;->NaN:F

    return v0
.end method
