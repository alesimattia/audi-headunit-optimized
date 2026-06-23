.class public Lcom/spd/dvr/utils/Fixed;
.super Ljava/lang/Object;
.source "Fixed.java"


# instance fields
.field private CarColor:I

.field private CustomID:I

.field private LensType:I

.field private PrductID:I

.field private SensorType:I

.field private TraceType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCarColor()I
    .locals 1

    .line 29
    iget v0, p0, Lcom/spd/dvr/utils/Fixed;->CarColor:I

    return v0
.end method

.method public getCustomID()I
    .locals 1

    .line 13
    iget v0, p0, Lcom/spd/dvr/utils/Fixed;->CustomID:I

    return v0
.end method

.method public getLensType()I
    .locals 1

    .line 37
    iget v0, p0, Lcom/spd/dvr/utils/Fixed;->LensType:I

    return v0
.end method

.method public getPrductID()I
    .locals 1

    .line 21
    iget v0, p0, Lcom/spd/dvr/utils/Fixed;->PrductID:I

    return v0
.end method

.method public getSensorType()I
    .locals 1

    .line 45
    iget v0, p0, Lcom/spd/dvr/utils/Fixed;->SensorType:I

    return v0
.end method

.method public getTraceType()I
    .locals 1

    .line 53
    iget v0, p0, Lcom/spd/dvr/utils/Fixed;->TraceType:I

    return v0
.end method

.method public setCarColor(I)V
    .locals 0
    .param p1, "carColor"    # I

    .line 33
    iput p1, p0, Lcom/spd/dvr/utils/Fixed;->CarColor:I

    .line 34
    return-void
.end method

.method public setCustomID(I)V
    .locals 0
    .param p1, "customID"    # I

    .line 17
    iput p1, p0, Lcom/spd/dvr/utils/Fixed;->CustomID:I

    .line 18
    return-void
.end method

.method public setLensType(I)V
    .locals 0
    .param p1, "lensType"    # I

    .line 41
    iput p1, p0, Lcom/spd/dvr/utils/Fixed;->LensType:I

    .line 42
    return-void
.end method

.method public setPrductID(I)V
    .locals 0
    .param p1, "prductID"    # I

    .line 25
    iput p1, p0, Lcom/spd/dvr/utils/Fixed;->PrductID:I

    .line 26
    return-void
.end method

.method public setSensorType(I)V
    .locals 0
    .param p1, "sensorType"    # I

    .line 49
    iput p1, p0, Lcom/spd/dvr/utils/Fixed;->SensorType:I

    .line 50
    return-void
.end method

.method public setTraceType(I)V
    .locals 0
    .param p1, "traceType"    # I

    .line 57
    iput p1, p0, Lcom/spd/dvr/utils/Fixed;->TraceType:I

    .line 58
    return-void
.end method
