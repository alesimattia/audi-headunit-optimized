.class public final Lcom/spd/carinfo/CarInfo$Mirrors;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Mirrors"
.end annotation


# static fields
.field public static final AUTO_FOLD_REARVIEW:I = 0x13885

.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final FOLD_ON_PARKING:I = 0x13883

.field public static final ID:I = 0x8

.field public static final LOWER_ON_REVERSE:I = 0x13882

.field public static final OFFSET:I = 0x13880

.field public static final REAR_MIRROR_DIMMER:I = 0x13884

.field public static final SYNCHRONOUS_ADJUSTMENT:I = 0x13881


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 934
    const-class v0, Lcom/spd/carinfo/CarInfo$Mirrors;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$Mirrors;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 933
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
