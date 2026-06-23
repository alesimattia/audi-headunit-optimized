.class public final Lcom/spd/carinfo/CarInfo$WheelsAndTires;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "WheelsAndTires"
.end annotation


# static fields
.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final ID:I = 0x7

.field public static final LEFT_FRONT_NUMBER_OF_TIRE_PULSES:I = 0x11179

.field public static final LEFT_REAR_NUMBER_OF_TIRE_PULSES:I = 0x1117b

.field public static final NUMBER_OF_PULSES_PER_TIRE:I = 0x11178

.field public static final OFFSET:I = 0x11170

.field public static final RIGHT_FRONTNUMBER_OF_TIRE_PULSES:I = 0x1117a

.field public static final RIGHT_REAR_NUMBER_OF_TIRE_PULSES:I = 0x1117c

.field public static final SPARE_NUMBER_OF_TIRE_PULSES:I = 0x1117d

.field public static final SPEED_WARNING_ENABLED:I = 0x11173

.field public static final SPEED_WARNING_VALUE:I = 0x11174

.field public static final TIRE_PRESS_MONITORING_INFO:I = 0x11171

.field public static final TIRE_PRESS_MONITOR_MODE:I = 0x11175

.field public static final TIRE_PRESS_RESET:I = 0x1117e

.field public static final TIRE_PRESS_UPDATE_TIME:I = 0x11181

.field public static final TIRE_PRESS_WARNING_BAT_INFO:I = 0x11180

.field public static final TIRE_PRESS_WARNING_INFO:I = 0x11172

.field public static final TIRE_PRESS_WARNING_TEMP_INFO:I = 0x1117f

.field public static final TIRE_TEMP_MONITORING_INFO:I = 0x11177

.field public static final TPMS_SET:I = 0x11176


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 909
    const-class v0, Lcom/spd/carinfo/CarInfo$WheelsAndTires;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$WheelsAndTires;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 908
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
