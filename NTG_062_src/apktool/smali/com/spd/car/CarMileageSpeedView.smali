.class public Lcom/spd/car/CarMileageSpeedView;
.super Landroid/widget/FrameLayout;
.source "CarMileageSpeedView.java"


# instance fields
.field private mHighBeam:Landroid/widget/ImageView;

.field private mLowBeam:Landroid/widget/ImageView;

.field private mPositionLight:Landroid/widget/ImageView;

.field private mRpmBar:Landroid/widget/ProgressBar;

.field private mRpmValue:Landroid/widget/TextView;

.field private mSpeed:Landroid/widget/TextView;

.field private mTyreAngle:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 24
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/spd/car/CarMileageSpeedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 28
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/spd/car/CarMileageSpeedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .line 32
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    invoke-direct {p0}, Lcom/spd/car/CarMileageSpeedView;->initView()V

    .line 35
    return-void
.end method

.method private initView()V
    .locals 2

    .line 38
    invoke-virtual {p0}, Lcom/spd/car/CarMileageSpeedView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f070003

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 41
    const v0, 0x7f050050

    invoke-virtual {p0, v0}, Lcom/spd/car/CarMileageSpeedView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/spd/car/CarMileageSpeedView;->mSpeed:Landroid/widget/TextView;

    # barra RPM (ProgressBar nativa) + valore centrale
    const v0, 0x7f05005f

    invoke-virtual {p0, v0}, Lcom/spd/car/CarMileageSpeedView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/spd/car/CarMileageSpeedView;->mRpmBar:Landroid/widget/ProgressBar;

    const v0, 0x7f050060

    invoke-virtual {p0, v0}, Lcom/spd/car/CarMileageSpeedView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/spd/car/CarMileageSpeedView;->mRpmValue:Landroid/widget/TextView;

    # volante-indicatore
    const v0, 0x7f050061

    invoke-virtual {p0, v0}, Lcom/spd/car/CarMileageSpeedView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/spd/car/CarMileageSpeedView;->mTyreAngle:Landroid/widget/ImageView;

    # icone stato luci
    const v0, 0x7f05005d

    invoke-virtual {p0, v0}, Lcom/spd/car/CarMileageSpeedView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/spd/car/CarMileageSpeedView;->mPositionLight:Landroid/widget/ImageView;

    const v0, 0x7f050062

    invoke-virtual {p0, v0}, Lcom/spd/car/CarMileageSpeedView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/spd/car/CarMileageSpeedView;->mHighBeam:Landroid/widget/ImageView;

    const v0, 0x7f05005e

    invoke-virtual {p0, v0}, Lcom/spd/car/CarMileageSpeedView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/spd/car/CarMileageSpeedView;->mLowBeam:Landroid/widget/ImageView;

    .line 42
    return-void
.end method


# virtual methods
# Contachilometri RIMOSSO dalla pagina (2026-07-16): metodo reso no-op. Il what 100013 viene
# ancora instradato dalla catena CarInfo ma qui e' ignorato (evita NPE sulla view rimossa).
.method public updateMileage(II)V
    .locals 0
    .param p1, "value"    # I
    .param p2, "unit"    # I

    return-void
.end method

.method public updateSpeed(FI)V
    .locals 3
    .param p1, "speed"    # F
    .param p2, "unit"    # I

    .line 45
    iget-object v0, p0, Lcom/spd/car/CarMileageSpeedView;->mSpeed:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x1

    if-ne p2, v2, :cond_0

    const-string v2, "MPH"

    goto :goto_0

    :cond_0
    const-string v2, "KM/H"

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    return-void
.end method

# Aggiorna la barra RPM: clamp del valore in [0,4500], progresso sulla ProgressBar e testo centrale.
.method public updateRpm(I)V
    .locals 3
    .param p1, "rpm"    # I

    # clamp inferiore a 0
    if-gez p1, :cond_0

    const/4 p1, 0x0

    :cond_0
    # clamp superiore a 4500
    const/16 v0, 0x1194

    if-le p1, v0, :cond_1

    const/16 p1, 0x1194

    :cond_1
    iget-object v0, p0, Lcom/spd/car/CarMileageSpeedView;->mRpmBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    iget-object v0, p0, Lcom/spd/car/CarMileageSpeedView;->mRpmValue:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " RPM"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

# Aggiorna l'indicatore volante. L'indicatore riflette l'angolo REALE DELLE RUOTE, non del volante.
# p1 e' il valore grezzo dal box (ANGLE 140057): radianti del VOLANTE (~0 in rettilineo, max ~0.96
# nel rilievo, ben sotto il fondo corsa). Conversione:
#   1) radianti volante -> gradi volante  (x 57.29578)
#   2) gradi volante -> gradi ruote        (/ rapporto di sterzo)
# Rapporto di sterzo = fondo corsa volante (~840 gradi/lato, cioe' 2 giri + 120 gradi) diviso
# fondo corsa ruote (~40 gradi/lato) = 21:1 -> fattore inverso 40/840 = 0.047619.
# La rotazione risultante e' limitata a +/-40 gradi (fondo corsa ruote).
# NB: scala derivata, non misurata: il fondo corsa non e' stato registrato nel rilievo. Per la
# taratura esatta serve un rilievo girando il volante fino a fondo corsa nei due sensi.
.method public updateTyreAngle(F)V
    .locals 3
    .param p1, "angle"    # F

    const v0, 0x42652ee1    # 57.29578 (rad -> gradi volante)

    mul-float v0, p1, v0

    const v1, 0x3d430c31    # 0.047619 (= 40/840, gradi volante -> gradi ruote)

    mul-float v0, v0, v1

    # clamp superiore a +40 gradi
    const v1, 0x42200000    # 40.0

    cmpg-float v2, v0, v1

    if-lez v2, :cond_0

    move v0, v1

    :cond_0
    # clamp inferiore a -40 gradi
    const v1, 0xc2200000    # -40.0

    cmpg-float v2, v0, v1

    if-gez v2, :cond_1

    move v0, v1

    :cond_1
    iget-object v1, p0, Lcom/spd/car/CarMileageSpeedView;->mTyreAngle:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setRotation(F)V

    return-void
.end method

# Accende/spegne l'icona luci di posizione variando l'alpha (1.0 acceso, 0.3 spento).
.method public updatePositionLight(Z)V
    .locals 2
    .param p1, "on"    # Z

    iget-object v0, p0, Lcom/spd/car/CarMileageSpeedView;->mPositionLight:Landroid/widget/ImageView;

    if-eqz p1, :cond_0

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    const v1, 0x3e99999a    # 0.3f

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(F)V

    return-void
.end method

# Accende/spegne l'icona canale luci/abbaglianti (110000) variando l'alpha (1.0 acceso, 0.3 spento).
.method public updateHighBeam(Z)V
    .locals 2
    .param p1, "on"    # Z

    iget-object v0, p0, Lcom/spd/car/CarMileageSpeedView;->mHighBeam:Landroid/widget/ImageView;

    if-eqz p1, :cond_0

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    const v1, 0x3e99999a    # 0.3f

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(F)V

    return-void
.end method

# Accende/spegne l'icona fari anabbaglianti variando l'alpha (1.0 acceso, 0.3 spento).
.method public updateLowBeam(Z)V
    .locals 2
    .param p1, "on"    # Z

    iget-object v0, p0, Lcom/spd/car/CarMileageSpeedView;->mLowBeam:Landroid/widget/ImageView;

    if-eqz p1, :cond_0

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    const v1, 0x3e99999a    # 0.3f

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(F)V

    return-void
.end method
