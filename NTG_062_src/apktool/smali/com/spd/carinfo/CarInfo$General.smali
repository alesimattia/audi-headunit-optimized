.class public final Lcom/spd/carinfo/CarInfo$General;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "General"
.end annotation


# static fields
.field public static final ALC:I = 0x2734

.field public static final AMPLIFITER_ENABLED:I = 0x2727

.field public static final AMPLIFITER_TYPE:I = 0x2721

.field public static final AMPLIFITER_VOLUME:I = 0x2736

.field public static final AMPLIFITER_VOLUME_MUTE:I = 0x2737

.field public static final ASL:I = 0x2725

.field public static final AUDIO_PLT:I = 0x272e

.field public static final AUX:I = 0x273c

.field public static final BOSE_CENTERPOINT:I = 0x272c

.field public static final BUZZER_SWITCH:I = 0x2730

.field public static final CANBOX_VERSION:I = 0x2714

.field public static final CAR_KEY_BEEP:I = 0x2739

.field public static final CAR_NAVI_TTS:I = 0x273a

.field public static final CAR_NAVI_VOLUME:I = 0x2738

.field public static final CAR_SOURCE:I = 0x273b

.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final DATE:I = 0x2712

.field public static final DBB:I = 0x2735

.field public static final DRIVER_SOUND:I = 0x272d

.field public static final EQ_FADER_BALANCE:I = 0x271d

.field public static final EQ_SETTINGS:I = 0x271f

.field public static final FACTORY_RESET:I = 0x2713

.field public static final ID:I = 0x1

.field public static final KEYCODE_EVENT:I = 0x273d

.field public static final LANGUAGE:I = 0x2710

.field public static final OFFSET:I = 0x2710

.field public static final ORG_CAR_HOST_ON:I = 0x272a

.field public static final ORG_CAR_HOST_STATUS:I = 0x272b

.field public static final RESTORE_FACTORY_SETTINGS:I = 0x272f

.field public static final SCREEN_X_Y:I = 0x2729

.field public static final SEND_CAN_BOX_DATA:I = 0x2774

.field public static final SPEED_VOLUME:I = 0x271e

.field public static final SPEED_VOLUME_ENABLED:I = 0x2726

.field public static final STM32_VERSION:I = 0x2732

.field public static final STM8_VERSION:I = 0x2733

.field public static final SURROUND_STEREO_SOUND:I = 0x2724

.field public static final THEME_COLOR:I = 0x2722

.field public static final TIME:I = 0x2711

.field public static final UNIT_ELECTRIC_CONSUMPTION:I = 0x2718

.field public static final UNIT_FUEL_CONSUMPTION:I = 0x271a

.field public static final UNIT_MILEAGE:I = 0x2715

.field public static final UNIT_SPEED:I = 0x2716

.field public static final UNIT_SYSTEM:I = 0x2731

.field public static final UNIT_TEMPERTURE:I = 0x2717

.field public static final UNIT_TIRE_PRESS:I = 0x271b

.field public static final UNIT_VOLUME:I = 0x2719

.field public static final VIN:I = 0x2720

.field public static final VOLUME:I = 0x271c

.field public static final VOLUME_MUTE:I = 0x2728

.field public static final WARNING_SENSOR_VOLUME:I = 0x2723


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 630
    const-class v0, Lcom/spd/carinfo/CarInfo$General;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$General;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 629
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
