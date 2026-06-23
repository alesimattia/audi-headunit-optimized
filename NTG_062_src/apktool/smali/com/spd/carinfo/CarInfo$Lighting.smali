.class public Lcom/spd/carinfo/CarInfo$Lighting;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Lighting"
.end annotation


# static fields
.field public static final ALL_AREA_LIGHT:I = 0x1adca

.field public static final AMBIENT_LIGHT:I = 0x1adc8

.field public static final ATMO_LIGHT_COLOR:I = 0x1adda

.field public static final ATMO_LIGHT_ENABLE:I = 0x1add7

.field public static final ATMO_LIGHT_FRONT:I = 0x1add8

.field public static final ATMO_LIGHT_REAR:I = 0x1add9

.field public static final ATMO_LIGHT_VALUE:I = 0x1addb

.field public static final AUTOMATIC_HEADLAMP:I = 0x1adb5

.field public static final AUTO_HIGH_BEAM:I = 0x1addc

.field public static final AUTO_INNER_LIGHT_SENSITIVITY:I = 0x1ade5

.field public static final AUTO_SEAT_LIGHT:I = 0x1add2

.field public static final BACKGROUND_LIGHTING:I = 0x1adfa

.field public static final BACKGROUND_LIGHTING_COLOR:I = 0x1adfb

.field public static final CARMODEL_COLOR:I = 0x1adfc

.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final CONVENIENT_SERVICE:I = 0x1add0

.field public static final DAYTIME_RUNNING_LAMPS:I = 0x1adb2

.field public static final DOOR_AMBIENT_LIGHT:I = 0x1adc2

.field public static final DYNAMIC_HEADLAMP_FOLLOW:I = 0x1adc5

.field public static final DYNAMIC_LIGHT_ASSIST:I = 0x1adc4

.field public static final ENV_INDICATOR:I = 0x1add1

.field public static final FIND_CAR_HINT:I = 0x1adf4

.field public static final FIND_CAR_LIGHT_TIME:I = 0x1adf3

.field public static final FIND_CAR_LOW_BEAMS:I = 0x1adf1

.field public static final FIND_CAR_REAR_FOG_LAMP:I = 0x1adf2

.field public static final FIND_CAR_REVERSE_LAMPS:I = 0x1adf0

.field public static final FOOTWELL_LIGHT:I = 0x1adc3

.field public static final FRONT_AMBIENT_LIGHT:I = 0x1adc7

.field public static final FRONT_FOG_LAMPS:I = 0x1adb3

.field public static final FRONT_LIGHT_AUTO_ADJ:I = 0x1add5

.field public static final FRONT_LIGHT_MODE:I = 0x1add6

.field public static final GO_HOME_FUNCTION:I = 0x1adbe

.field public static final GO_HOME_FUNCTION_ENABLED:I = 0x1adec

.field public static final GO_HOME_FUNCTION_LOW_BEAMS:I = 0x1adee

.field public static final GO_HOME_FUNCTION_REAR_FOG_LAMP:I = 0x1adef

.field public static final GO_HOME_FUNCTION_REVERSE_LAMPS:I = 0x1aded

.field public static final HAZARD_WARNING_FLASHERS:I = 0x1adb6

.field public static final HEADLAMP_COLOR:I = 0x1adc9

.field public static final HEADLAMP_COLOR_TYPE:I = 0x1adcb

.field public static final HEADLAMP_DISTANCE_ADJUST:I = 0x1adc0

.field public static final HEADLAMP_HEIGHT:I = 0x1adeb

.field public static final HEADLAMP_HIGH_BEAMS:I = 0x1adb0

.field public static final HEADLAMP_LOW_BEAMS:I = 0x1adb1

.field public static final HEADLAMP_OFF_TIMER:I = 0x1adce

.field public static final HEADLAMP_ON_SENSITIVITY:I = 0x1adcc

.field public static final HIGH_BEAN_LIGHT:I = 0x1addf

.field public static final ID:I = 0xb

.field public static final INSTRUMENT_LIGHT:I = 0x1adbd

.field public static final LAMPS_AUTO_IN_RAIN:I = 0x1adbb

.field public static final LAMPS_SWITCH_ON_TIME:I = 0x1adba

.field public static final LANE_CHANGED_LAMPS:I = 0x1adbc

.field public static final LEAVE_HOME_FUNCTION:I = 0x1adbf

.field public static final LIGHT_NOT_OFF_HINT:I = 0x1adf7

.field public static final LIGHT_OFF_TIMER:I = 0x1adcd

.field public static final LIGHT_OFF_TIMER_DOOR_CLOSE:I = 0x1adf6

.field public static final LIGHT_RESET:I = 0x1adf8

.field public static final LOW_BEAN_LIGHT:I = 0x1adde

.field public static final MOOD_LIGHT_COLOR:I = 0x1ade9

.field public static final MOOD_LIGHT_FRONT:I = 0x1ade7

.field public static final MOOD_LIGHT_LEVEL:I = 0x1adea

.field public static final MOOD_LIGHT_MODE:I = 0x1ade6

.field public static final MOOD_LIGHT_REAR:I = 0x1ade8

.field public static final OFFSET:I = 0x1adb0

.field public static final OUT_LIGHT_OFF_TIMER:I = 0x1adcf

.field public static final OUT_WELCOME_LIGHT:I = 0x1add3

.field public static final OUT_WELCOME_LIGHT_ENABLED:I = 0x1adf5

.field public static final OVERHEAD_LIGHT_OFF_TIME:I = 0x1add4

.field public static final PARKING_LAMPS:I = 0x1adb8

.field public static final POSITON_LIGHT:I = 0x1addd

.field public static final POSITON_LIGH_LEVEL:I = 0x1ade2

.field public static final POWER_SAVER:I = 0x1adf9

.field public static final REAR_FOG_LAMPS:I = 0x1adb4

.field public static final ROOF_AMBIENT_LIGHT:I = 0x1adc6

.field public static final SMART_CORNERING_LIGHTS:I = 0x1ade3

.field public static final SMART_HIGH_BEAM:I = 0x1ade4

.field public static final TRAVEL_MODE:I = 0x1adc1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 2489
    const-class v0, Lcom/spd/carinfo/CarInfo$Lighting;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$Lighting;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 2488
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
