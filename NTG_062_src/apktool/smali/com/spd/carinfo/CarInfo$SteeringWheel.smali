.class public final Lcom/spd/carinfo/CarInfo$SteeringWheel;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SteeringWheel"
.end annotation


# static fields
.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final HEATED:I = 0x15f91

.field public static final ID:I = 0x9

.field public static final OFFSET:I = 0x15f90


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 947
    const-class v0, Lcom/spd/carinfo/CarInfo$SteeringWheel;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$SteeringWheel;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 946
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
