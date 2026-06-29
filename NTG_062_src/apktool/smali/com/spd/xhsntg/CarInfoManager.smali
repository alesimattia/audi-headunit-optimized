.class public Lcom/spd/xhsntg/CarInfoManager;
.super Ljava/lang/Object;
.source "CarInfoManager.java"

# interfaces
.implements Lcom/spd/carinfo/CarInfo$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/spd/xhsntg/CarInfoManager$Callback;
    }
.end annotation


# static fields
.field public static final AUDIO_MODE_CAR:I = 0x1

.field public static final AUDIO_MODE_NAVI:I = 0x2

.field public static final AUDIO_MODE_NAVI_AUDIO:I = 0x3

.field public static final TAG:Ljava/lang/String; = "CarInfoManager"


# instance fields
.field public mCallback:Lcom/spd/xhsntg/CarInfoManager$Callback;

.field private mIsConnected:Z

.field private mSpeed:F

.field private mSpeedUnit:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private updateCarModel(I)V
    .locals 1
    .param p1, "o"    # I

    .line 144
    iget-object v0, p0, Lcom/spd/xhsntg/CarInfoManager;->mCallback:Lcom/spd/xhsntg/CarInfoManager$Callback;

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/spd/xhsntg/CarInfoManager;->mCallback:Lcom/spd/xhsntg/CarInfoManager$Callback;

    invoke-interface {v0, p1}, Lcom/spd/xhsntg/CarInfoManager$Callback;->updateCarModel(I)V

    .line 147
    :cond_0
    return-void
.end method

.method private updateConnected(Z)V
    .locals 3
    .param p1, "connected"    # Z

    .line 137
    const-string v0, "CarInfoManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateConnected:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    iget-object v0, p0, Lcom/spd/xhsntg/CarInfoManager;->mCallback:Lcom/spd/xhsntg/CarInfoManager$Callback;

    if-eqz v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/spd/xhsntg/CarInfoManager;->mCallback:Lcom/spd/xhsntg/CarInfoManager$Callback;

    invoke-interface {v0, p1}, Lcom/spd/xhsntg/CarInfoManager$Callback;->onUpdateConnected(Z)V

    .line 141
    :cond_0
    return-void
.end method

.method private updateMediaSource(II)V
    .locals 3
    .param p1, "source"    # I
    .param p2, "hasSource"    # I

    .line 168
    const-string v0, "CarInfoManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateMediaSource:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",hasSource:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    iget-object v0, p0, Lcom/spd/xhsntg/CarInfoManager;->mCallback:Lcom/spd/xhsntg/CarInfoManager$Callback;

    if-eqz v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/spd/xhsntg/CarInfoManager;->mCallback:Lcom/spd/xhsntg/CarInfoManager$Callback;

    invoke-interface {v0, p1, p2}, Lcom/spd/xhsntg/CarInfoManager$Callback;->onUpdateMediaSource(II)V

    .line 172
    :cond_0
    return-void
.end method

.method private updateSpeed(FI)V
    .locals 1
    .param p1, "speed"    # F
    .param p2, "unit"    # I

    .line 156
    iget-object v0, p0, Lcom/spd/xhsntg/CarInfoManager;->mCallback:Lcom/spd/xhsntg/CarInfoManager$Callback;

    if-eqz v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/spd/xhsntg/CarInfoManager;->mCallback:Lcom/spd/xhsntg/CarInfoManager$Callback;

    invoke-interface {v0, p1, p2}, Lcom/spd/xhsntg/CarInfoManager$Callback;->onUpdateSpeed(FI)V

    .line 159
    :cond_0
    return-void
.end method

.method private updateTotalMileage(II)V
    .locals 1
    .param p1, "mileage"    # I
    .param p2, "unit"    # I

    .line 162
    iget-object v0, p0, Lcom/spd/xhsntg/CarInfoManager;->mCallback:Lcom/spd/xhsntg/CarInfoManager$Callback;

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/spd/xhsntg/CarInfoManager;->mCallback:Lcom/spd/xhsntg/CarInfoManager$Callback;

    invoke-interface {v0, p1, p2}, Lcom/spd/xhsntg/CarInfoManager$Callback;->onUpdateTotalMileage(II)V

    .line 165
    :cond_0
    return-void
.end method


# virtual methods
.method public init(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .line 27
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v0

    # registrazione classe Doors rimossa insieme alla pagina porte; array 5->4
    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    sget-object v2, Lcom/spd/carinfo/CarInfo$ReverseAndAVM;->CLASS_NAME:Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Lcom/spd/carinfo/CarInfo$General;->CLASS_NAME:Ljava/lang/String;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    sget-object v2, Lcom/spd/carinfo/CarInfo$Instruments;->CLASS_NAME:Ljava/lang/String;

    const/4 v3, 0x2

    aput-object v2, v1, v3

    sget-object v2, Lcom/spd/carinfo/CarInfo$Vehicles;->CLASS_NAME:Ljava/lang/String;

    const/4 v3, 0x3

    aput-object v2, v1, v3

    invoke-virtual {v0, p1, v1, p0}, Lcom/spd/carinfo/CarInfo;->init(Landroid/content/Context;[Ljava/lang/String;Lcom/spd/carinfo/CarInfo$Callback;)V

    .line 28
    return-void
.end method

.method public isConnected()Z
    .locals 1

    .line 49
    iget-boolean v0, p0, Lcom/spd/xhsntg/CarInfoManager;->mIsConnected:Z

    return v0
.end method

.method public onCarInfoConnectedChanged(Z)V
    .locals 14
    .param p1, "b"    # Z

    .line 54
    iput-boolean p1, p0, Lcom/spd/xhsntg/CarInfoManager;->mIsConnected:Z

    .line 55
    invoke-direct {p0, p1}, Lcom/spd/xhsntg/CarInfoManager;->updateConnected(Z)V

    .line 56
    if-eqz p1, :cond_6

    # blocco pull porte rimosso (pagina porte eliminata); v3=0 serve ai blocchi successivi
    .line 57
    const/4 v3, 0x0

    .line 66
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v1

    const v2, 0x2231e

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/spd/carinfo/CarInfo;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iput v1, p0, Lcom/spd/xhsntg/CarInfoManager;->mSpeed:F

    .line 67
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v1

    const/16 v2, 0x2716

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/spd/carinfo/CarInfo;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Lcom/spd/xhsntg/CarInfoManager;->mSpeedUnit:I

    .line 68
    iget v1, p0, Lcom/spd/xhsntg/CarInfoManager;->mSpeed:F

    iget v2, p0, Lcom/spd/xhsntg/CarInfoManager;->mSpeedUnit:I

    invoke-direct {p0, v1, v2}, Lcom/spd/xhsntg/CarInfoManager;->updateSpeed(FI)V

    .line 70
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v1

    const v2, 0x186ad

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v1, v2, v3, v4}, Lcom/spd/carinfo/CarInfo;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroid/os/Bundle;

    .line 71
    const-string v1, "value"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 72
    .local v1, "value":I
    const-string v2, "unit"

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 73
    .local v2, "unit":I
    invoke-direct {p0, v1, v2}, Lcom/spd/xhsntg/CarInfoManager;->updateTotalMileage(II)V

    .line 75
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v4

    const v11, 0x29814

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v4, v11, v3, v12}, Lcom/spd/carinfo/CarInfo;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 76
    .local v4, "carModel":I
    invoke-direct {p0, v4}, Lcom/spd/xhsntg/CarInfoManager;->updateCarModel(I)V

    .line 78
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v11

    const v12, 0x186f5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v11, v12, v3, v13}, Lcom/spd/carinfo/CarInfo;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 79
    .local v3, "source":I
    and-int/lit16 v11, v3, 0xff

    .line 80
    .local v11, "newSource":I
    shr-int/lit8 v12, v3, 0x10

    and-int/lit16 v12, v12, 0xff

    .line 81
    .local v12, "hasSource":I
    invoke-direct {p0, v11, v12}, Lcom/spd/xhsntg/CarInfoManager;->updateMediaSource(II)V

    .line 83
    .end local v1    # "value":I
    .end local v2    # "unit":I
    .end local v3    # "source":I
    .end local v4    # "carModel":I
    .end local v11    # "newSource":I
    .end local v12    # "hasSource":I
    :cond_6
    return-void
.end method

.method public onCarInfoDataChanged(ILjava/lang/Object;I)V
    .locals 11
    .param p1, "i"    # I
    .param p2, "o"    # Ljava/lang/Object;
    .param p3, "i1"    # I

    .line 87
    const/4 v0, 0x0

    sparse-switch p1, :sswitch_data_0

    goto/16 :goto_6

    .line 127
    :sswitch_0
    move-object v0, p2

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/spd/xhsntg/CarInfoManager;->updateCarModel(I)V

    .line 129
    goto/16 :goto_6

    .line 102
    :sswitch_1
    move-object v0, p2

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lcom/spd/xhsntg/CarInfoManager;->mSpeed:F

    .line 103
    iget v0, p0, Lcom/spd/xhsntg/CarInfoManager;->mSpeed:F

    iget v1, p0, Lcom/spd/xhsntg/CarInfoManager;->mSpeedUnit:I

    invoke-direct {p0, v0, v1}, Lcom/spd/xhsntg/CarInfoManager;->updateSpeed(FI)V

    .line 104
    goto/16 :goto_6

    .line 120
    :sswitch_2
    move-object v0, p2

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 121
    .local v0, "source":I
    and-int/lit16 v1, v0, 0xff

    .line 122
    .local v1, "newSource":I
    shr-int/lit8 v2, v0, 0x10

    and-int/lit16 v2, v2, 0xff

    .line 123
    .local v2, "hasSource":I
    invoke-direct {p0, v1, v2}, Lcom/spd/xhsntg/CarInfoManager;->updateMediaSource(II)V

    .line 125
    .end local v0    # "source":I
    .end local v1    # "newSource":I
    .end local v2    # "hasSource":I
    goto/16 :goto_6

    .line 110
    :sswitch_3
    move-object v1, p2

    check-cast v1, Landroid/os/Bundle;

    .line 111
    .local v1, "bundle":Landroid/os/Bundle;
    if-eqz v1, :cond_0

    .line 112
    const-string v2, "value"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 113
    .local v2, "value":I
    const-string v3, "unit"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 114
    .local v0, "unit":I
    invoke-direct {p0, v2, v0}, Lcom/spd/xhsntg/CarInfoManager;->updateTotalMileage(II)V

    .line 117
    .end local v0    # "unit":I
    .end local v1    # "bundle":Landroid/os/Bundle;
    .end local v2    # "value":I
    :cond_0
    goto/16 :goto_6

    .line 106
    :sswitch_5
    move-object v0, p2

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/spd/xhsntg/CarInfoManager;->mSpeedUnit:I

    .line 107
    iget v0, p0, Lcom/spd/xhsntg/CarInfoManager;->mSpeed:F

    iget v1, p0, Lcom/spd/xhsntg/CarInfoManager;->mSpeedUnit:I

    invoke-direct {p0, v0, v1}, Lcom/spd/xhsntg/CarInfoManager;->updateSpeed(FI)V

    .line 108
    nop

    .line 134
    :goto_6
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x2716 -> :sswitch_5
        0x186ad -> :sswitch_3
        0x186f5 -> :sswitch_2
        0x2231e -> :sswitch_1
        0x29814 -> :sswitch_0
    .end sparse-switch
.end method

.method public setAudioMode(I)V
    .locals 4
    .param p1, "mode"    # I

    .line 39
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 40
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "mode"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 41
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v1

    const v2, 0x187b6

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Lcom/spd/carinfo/CarInfo;->set(ILjava/lang/Object;I)I

    .line 42
    return-void
.end method

.method public setCallback(Lcom/spd/xhsntg/CarInfoManager$Callback;)V
    .locals 0
    .param p1, "cb"    # Lcom/spd/xhsntg/CarInfoManager$Callback;

    .line 177
    iput-object p1, p0, Lcom/spd/xhsntg/CarInfoManager;->mCallback:Lcom/spd/xhsntg/CarInfoManager$Callback;

    .line 178
    return-void
.end method

.method public setKeyEvent(II)V
    .locals 3
    .param p1, "keyCode"    # I
    .param p2, "action"    # I

    .line 45
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x273d

    invoke-virtual {v0, v2, v1, p2}, Lcom/spd/carinfo/CarInfo;->set(ILjava/lang/Object;I)I

    .line 46
    return-void
.end method

.method public unInit()V
    .locals 1

    .line 31
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/spd/carinfo/CarInfo;->uninit()V

    .line 32
    return-void
.end method
