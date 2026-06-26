.class public Lcom/spd/car/CarSensorView;
.super Ljava/lang/Object;
.source "CarSensorView.java"

# Pagina "Sensori/Marcia" (indice 3 dello slider): sostituisce la vecchia CarKeyView.
# Mostra marcia + retromarcia (testo) e i 4 lati (anteriore/posteriore/sinistra/destra)
# con barra grafica (ProgressBar orizzontale, max 8) + valore numerico.
# Dati da CarInfo.ReverseAndAVM (gia registrata in CarInfoManager) letti in PULL ogni
# 300 ms quando la pagina e visibile. Avvio/stop da FullscreenActivity$1.onPageSelected
# (indice 3). Costruita in codice come com.spd.xhsntg.SystemView (nessun file layout).
# Blueprint leggibile: NTG_062_src/java/com/spd/car/CarSensorView.java


# static fields
.field static sCtx:Landroid/content/Context;

.field static sGearText:Landroid/widget/TextView;

.field static sRevText:Landroid/widget/TextView;

.field static sFrontBar:Landroid/widget/ProgressBar;

.field static sRearBar:Landroid/widget/ProgressBar;

.field static sLeftBar:Landroid/widget/ProgressBar;

.field static sRightBar:Landroid/widget/ProgressBar;

.field static sFrontText:Landroid/widget/TextView;

.field static sRearText:Landroid/widget/TextView;

.field static sLeftText:Landroid/widget/TextView;

.field static sRightText:Landroid/widget/TextView;

.field static sHandler:Landroid/os/Handler;

.field static sTicker:Ljava/lang/Runnable;

.field static sRunning:Z


# direct methods

# Costruisce la vista e prepara handler/ticker. Chiamato da com.spd.view.MyViewPageAdapter.<init>.
.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;

    sput-object p0, Lcom/spd/car/CarSensorView;->sCtx:Landroid/content/Context;

    # root: LinearLayout verticale, sfondo nero, padding 24
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v1, -0x1000000   # 0xFF000000 nero

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    const/16 v1, 0x18             # 24px padding

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    # riga marcia
    const-string v1, "Marcia: --"

    const/high16 v2, 0x41c00000   # 24.0f

    invoke-static {p0, v1, v2}, Lcom/spd/car/CarSensorView;->makeLabel(Landroid/content/Context;Ljava/lang/String;F)Landroid/widget/TextView;

    move-result-object v1

    sput-object v1, Lcom/spd/car/CarSensorView;->sGearText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    # riga retromarcia
    const-string v1, "Retromarcia: --"

    const/high16 v2, 0x41900000   # 18.0f

    invoke-static {p0, v1, v2}, Lcom/spd/car/CarSensorView;->makeLabel(Landroid/content/Context;Ljava/lang/String;F)Landroid/widget/TextView;

    move-result-object v1

    sput-object v1, Lcom/spd/car/CarSensorView;->sRevText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    # --- Anteriore ---
    new-instance v1, Landroid/widget/ProgressBar;

    const/4 v2, 0x0

    const v3, 0x1010078           # android.R.attr.progressBarStyleHorizontal

    invoke-direct {v1, p0, v2, v3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sput-object v1, Lcom/spd/car/CarSensorView;->sFrontBar:Landroid/widget/ProgressBar;

    const-string v2, "--"

    const/high16 v3, 0x41900000

    invoke-static {p0, v2, v3}, Lcom/spd/car/CarSensorView;->makeLabel(Landroid/content/Context;Ljava/lang/String;F)Landroid/widget/TextView;

    move-result-object v2

    sput-object v2, Lcom/spd/car/CarSensorView;->sFrontText:Landroid/widget/TextView;

    const-string v3, "Anteriore"

    invoke-static {p0, v3, v1, v2}, Lcom/spd/car/CarSensorView;->makeSensorRow(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ProgressBar;Landroid/widget/TextView;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    # --- Posteriore ---
    new-instance v1, Landroid/widget/ProgressBar;

    const/4 v2, 0x0

    const v3, 0x1010078

    invoke-direct {v1, p0, v2, v3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sput-object v1, Lcom/spd/car/CarSensorView;->sRearBar:Landroid/widget/ProgressBar;

    const-string v2, "--"

    const/high16 v3, 0x41900000

    invoke-static {p0, v2, v3}, Lcom/spd/car/CarSensorView;->makeLabel(Landroid/content/Context;Ljava/lang/String;F)Landroid/widget/TextView;

    move-result-object v2

    sput-object v2, Lcom/spd/car/CarSensorView;->sRearText:Landroid/widget/TextView;

    const-string v3, "Posteriore"

    invoke-static {p0, v3, v1, v2}, Lcom/spd/car/CarSensorView;->makeSensorRow(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ProgressBar;Landroid/widget/TextView;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    # --- Sinistra ---
    new-instance v1, Landroid/widget/ProgressBar;

    const/4 v2, 0x0

    const v3, 0x1010078

    invoke-direct {v1, p0, v2, v3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sput-object v1, Lcom/spd/car/CarSensorView;->sLeftBar:Landroid/widget/ProgressBar;

    const-string v2, "--"

    const/high16 v3, 0x41900000

    invoke-static {p0, v2, v3}, Lcom/spd/car/CarSensorView;->makeLabel(Landroid/content/Context;Ljava/lang/String;F)Landroid/widget/TextView;

    move-result-object v2

    sput-object v2, Lcom/spd/car/CarSensorView;->sLeftText:Landroid/widget/TextView;

    const-string v3, "Sinistra"

    invoke-static {p0, v3, v1, v2}, Lcom/spd/car/CarSensorView;->makeSensorRow(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ProgressBar;Landroid/widget/TextView;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    # --- Destra ---
    new-instance v1, Landroid/widget/ProgressBar;

    const/4 v2, 0x0

    const v3, 0x1010078

    invoke-direct {v1, p0, v2, v3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sput-object v1, Lcom/spd/car/CarSensorView;->sRightBar:Landroid/widget/ProgressBar;

    const-string v2, "--"

    const/high16 v3, 0x41900000

    invoke-static {p0, v2, v3}, Lcom/spd/car/CarSensorView;->makeLabel(Landroid/content/Context;Ljava/lang/String;F)Landroid/widget/TextView;

    move-result-object v2

    sput-object v2, Lcom/spd/car/CarSensorView;->sRightText:Landroid/widget/TextView;

    const-string v3, "Destra"

    invoke-static {p0, v3, v1, v2}, Lcom/spd/car/CarSensorView;->makeSensorRow(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ProgressBar;Landroid/widget/TextView;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    # handler sul main looper + ticker
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/spd/car/CarSensorView;->sHandler:Landroid/os/Handler;

    new-instance v1, Lcom/spd/car/CarSensorView$1;

    invoke-direct {v1}, Lcom/spd/car/CarSensorView$1;-><init>()V

    sput-object v1, Lcom/spd/car/CarSensorView;->sTicker:Ljava/lang/Runnable;

    return-object v0
.end method

# Crea una TextView bianca (dimensione data) con padding verticale 12px.
.method private static makeLabel(Landroid/content/Context;Ljava/lang/String;F)Landroid/widget/TextView;
    .locals 3
    .param p0, "ctx"       # Landroid/content/Context;
    .param p1, "text"      # Ljava/lang/String;
    .param p2, "sizeSp"    # F

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 v1, -0x1             # bianco

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v1, 0x0

    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object v0
.end method

# Costruisce una riga orizzontale [etichetta 220px | barra (peso 1, margini 16) | valore 140px].
.method private static makeSensorRow(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ProgressBar;Landroid/widget/TextView;)Landroid/view/View;
    .locals 5
    .param p0, "ctx"      # Landroid/content/Context;
    .param p1, "label"    # Ljava/lang/String;
    .param p2, "bar"      # Landroid/widget/ProgressBar;
    .param p3, "value"    # Landroid/widget/TextView;

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x10            # Gravity.CENTER_VERTICAL

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    # etichetta
    const/high16 v1, 0x41900000  # 18.0f

    invoke-static {p0, p1, v1}, Lcom/spd/car/CarSensorView;->makeLabel(Landroid/content/Context;Ljava/lang/String;F)Landroid/widget/TextView;

    move-result-object v1

    const/16 v2, 0xdc            # larghezza 220px

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setWidth(I)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    # barra: max 8, larghezza 0 con peso 1 (riempie), margini laterali 16
    const/16 v1, 0x8

    invoke-virtual {p2, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, 0x0

    const/4 v3, -0x2             # WRAP_CONTENT

    const/high16 v4, 0x3f800000  # peso 1.0f

    invoke-direct {v1, v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/16 v2, 0x10

    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-virtual {v0, p2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # valore
    const/16 v1, 0x8c            # larghezza 140px

    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setWidth(I)V

    invoke-virtual {v0, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method

# Avvia il polling periodico (idempotente). Chiamato da FullscreenActivity$1.
.method public static start()V
    .locals 2

    sget-boolean v0, Lcom/spd/car/CarSensorView;->sRunning:Z

    if-eqz v0, :cond_go

    return-void

    :cond_go
    sget-object v0, Lcom/spd/car/CarSensorView;->sHandler:Landroid/os/Handler;

    if-nez v0, :cond_have

    return-void

    :cond_have
    const/4 v0, 0x1

    sput-boolean v0, Lcom/spd/car/CarSensorView;->sRunning:Z

    sget-object v0, Lcom/spd/car/CarSensorView;->sHandler:Landroid/os/Handler;

    sget-object v1, Lcom/spd/car/CarSensorView;->sTicker:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

# Ferma il polling periodico. Chiamato da FullscreenActivity$1.
.method public static stop()V
    .locals 2

    const/4 v0, 0x0

    sput-boolean v0, Lcom/spd/car/CarSensorView;->sRunning:Z

    sget-object v0, Lcom/spd/car/CarSensorView;->sHandler:Landroid/os/Handler;

    if-eqz v0, :cond_end

    sget-object v1, Lcom/spd/car/CarSensorView;->sTicker:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_end
    return-void
.end method

# Aggiorna tutte le righe leggendo i what da CarInfo (main thread). Chiamato dal ticker.
.method static refresh()V
    .locals 4

    # marcia (gear)
    const v0, 0x22330            # 140080

    invoke-static {v0}, Lcom/spd/car/CarSensorView;->pullInt(I)I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Marcia: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-gez v0, :cond_gear_val

    const-string v2, "--"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_gear

    :cond_gear_val
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :goto_gear
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/spd/car/CarSensorView;->sGearText:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    # retromarcia (reverse): 1=SI, 0=NO, <0=--
    const v0, 0x222eb           # 140011

    invoke-static {v0}, Lcom/spd/car/CarSensorView;->pullInt(I)I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Retromarcia: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-gez v0, :cond_rev_known

    const-string v2, "--"

    goto :goto_rev_set

    :cond_rev_known
    const/4 v2, 0x1

    if-ne v0, v2, :cond_rev_no

    const-string v2, "SI"

    goto :goto_rev_set

    :cond_rev_no
    const-string v2, "NO"

    :goto_rev_set
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/spd/car/CarSensorView;->sRevText:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    # 4 lati: updateSide(bar, text, whatLevel, whatDist)
    sget-object v0, Lcom/spd/car/CarSensorView;->sFrontBar:Landroid/widget/ProgressBar;

    sget-object v1, Lcom/spd/car/CarSensorView;->sFrontText:Landroid/widget/TextView;

    const v2, 0x222e7           # FRONT_RADAR_LEVEL 140007

    const v3, 0x222f0           # FRONT_RADAR_DISTANCE 140016

    invoke-static {v0, v1, v2, v3}, Lcom/spd/car/CarSensorView;->updateSide(Landroid/widget/ProgressBar;Landroid/widget/TextView;II)V

    sget-object v0, Lcom/spd/car/CarSensorView;->sRearBar:Landroid/widget/ProgressBar;

    sget-object v1, Lcom/spd/car/CarSensorView;->sRearText:Landroid/widget/TextView;

    const v2, 0x222e6           # REAR_RADAR_LEVEL 140006

    const v3, 0x222f1           # REAR_RADAR_DISTANCE 140017

    invoke-static {v0, v1, v2, v3}, Lcom/spd/car/CarSensorView;->updateSide(Landroid/widget/ProgressBar;Landroid/widget/TextView;II)V

    sget-object v0, Lcom/spd/car/CarSensorView;->sLeftBar:Landroid/widget/ProgressBar;

    sget-object v1, Lcom/spd/car/CarSensorView;->sLeftText:Landroid/widget/TextView;

    const v2, 0x222e8           # LEFT_RADAR_LEVEL 140008

    const/4 v3, -0x1            # nessun what distanza

    invoke-static {v0, v1, v2, v3}, Lcom/spd/car/CarSensorView;->updateSide(Landroid/widget/ProgressBar;Landroid/widget/TextView;II)V

    sget-object v0, Lcom/spd/car/CarSensorView;->sRightBar:Landroid/widget/ProgressBar;

    sget-object v1, Lcom/spd/car/CarSensorView;->sRightText:Landroid/widget/TextView;

    const v2, 0x222e9           # RIGHT_RADAR_LEVEL 140009

    const/4 v3, -0x1

    invoke-static {v0, v1, v2, v3}, Lcom/spd/car/CarSensorView;->updateSide(Landroid/widget/ProgressBar;Landroid/widget/TextView;II)V

    return-void
.end method

# Aggiorna una riga: barra dal livello clampato 0..8; testo = distanza ("N cm") se whatDist>=0 e disponibile, altrimenti livello o "--".
.method private static updateSide(Landroid/widget/ProgressBar;Landroid/widget/TextView;II)V
    .locals 4
    .param p0, "bar"          # Landroid/widget/ProgressBar;
    .param p1, "text"         # Landroid/widget/TextView;
    .param p2, "whatLevel"    # I
    .param p3, "whatDist"     # I

    invoke-static {p2}, Lcom/spd/car/CarSensorView;->pullInt(I)I

    move-result v0              # level

    # progress = clamp(level, 0, 8) in v1
    const/16 v1, 0x8

    if-lt v0, v1, :cond_lt8

    goto :goto_setprog          # level >= 8 -> v1 resta 8

    :cond_lt8
    if-gez v0, :cond_uselevel

    const/4 v1, 0x0             # level < 0 -> 0

    goto :goto_setprog

    :cond_uselevel
    move v1, v0                 # 0..7 -> level

    :goto_setprog
    invoke-virtual {p0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    # testo
    if-ltz p3, :cond_textlevel

    invoke-static {p3}, Lcom/spd/car/CarSensorView;->pullInt(I)I

    move-result v2              # dist

    if-ltz v2, :cond_textlevel

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " cm"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_textlevel
    if-gez v0, :cond_lvlnum

    const-string v1, "--"

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_lvlnum
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

# Legge un int da CarInfo in PULL; -1 se non connesso/non disponibile (stesso pattern di CarInfoManager).
.method private static pullInt(I)I
    .locals 4
    .param p0, "what"    # I

    :try_start_0
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, p0, v1, v2}, Lcom/spd/carinfo/CarInfo;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_null

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :cond_null
    const/4 v0, -0x1

    return v0

    :catch_0
    move-exception v0

    const/4 v0, -0x1

    return v0
.end method
