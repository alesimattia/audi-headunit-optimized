.class public final Lcom/spd/carinfo/CarInfo$Wipers;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Wipers"
.end annotation


# static fields
.field public static final AUTO_WIPING_IN_RAIN:I = 0x249f1

.field public static final BIND_HEAD_LIGHT:I = 0x249f6

.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final CLEAN_FLUID:I = 0x249f4

.field public static final ID:I = 0xf

.field public static final MAINTAIN_POSITION:I = 0x249f3

.field public static final OFFSET:I = 0x249f0

.field public static final RAIN_LIGHT_SENSOR_FORMAT:I = 0x249f5

.field public static final REAR_WIPING_ON_REVERSE:I = 0x249f2

.field public static final WIPER_SPEED_GRADE:I = 0x249f7


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 2990
    const-class v0, Lcom/spd/carinfo/CarInfo$Wipers;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$Wipers;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 2989
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
