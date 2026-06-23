.class public final Lcom/spd/carinfo/CarInfo$AirCondition;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AirCondition"
.end annotation


# static fields
.field public static final AC:I = 0x7531

.field public static final AC_MAX:I = 0x7537

.field public static final AIR_3ZONE:I = 0x7566

.field public static final AIR_CONDITIONING_STARTUP_MODE_SETTING:I = 0x7561

.field public static final AIR_CONDITIONING_ZONE_TEMPERATURE:I = 0x755e

.field public static final AIR_ENERGY:I = 0x7588

.field public static final AIR_FILTRATION:I = 0x7574

.field public static final AIR_QUALITY_SENSOR_SETTINGS:I = 0x755d

.field public static final AIR_STRENGTH:I = 0x7545

.field public static final AMB_MODE:I = 0x756f

.field public static final AQS:I = 0x7541

.field public static final ATMOSPHERIC_PRESSURE:I = 0x7555

.field public static final AUTO:I = 0x7532

.field public static final AUTO_2:I = 0x756e

.field public static final AUTO_CYCLE:I = 0x756b

.field public static final AUTO_DEFROST:I = 0x7584

.field public static final AUTO_MAX:I = 0x7538

.field public static final AUTO_WINDOW_STRENGTH:I = 0x7587

.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final CLEAN_AUTO:I = 0x7543

.field public static final CLIMATE_AUTO_KEY_BIND:I = 0x754e

.field public static final CURRENT_AIR_VOLUME_EXTENSION:I = 0x7559

.field public static final DUAL:I = 0x7569

.field public static final ECO:I = 0x7542

.field public static final ENTER_AIR_ACTIVITY:I = 0x7583

.field public static final EXTRAA_CAUTO:I = 0x755b

.field public static final EXTRA_CLIMATE_SWITCH:I = 0x755a

.field public static final EXTRA_WIND_AUTO:I = 0x755c

.field public static final FAST:I = 0x7568

.field public static final FRONT_DEFROST:I = 0x753a

.field public static final FRONT_DEFROST_MAX:I = 0x753f

.field public static final FRONT_HEAT:I = 0x7554

.field public static final FRONT_WINDOW_AUTOMATIC_DEFOGGING:I = 0x7560

.field public static final HEAT:I = 0x7582

.field public static final ID:I = 0x3

.field public static final INNER_TEMPERATURE:I = 0x754c

.field public static final INNER_TEMPERATURE_VALID:I = 0x757b

.field public static final IN_PM25:I = 0x756c

.field public static final ION:I = 0x7551

.field public static final MANUAL_FLAG:I = 0x7550

.field public static final MENU:I = 0x7546

.field public static final NET_AIRCONDITION_STARTUP_MODE:I = 0x7564

.field public static final NORMAL:I = 0x756a

.field public static final OFF:I = 0x7572

.field public static final OFFSET:I = 0x7530

.field public static final OUT_PM25:I = 0x756d

.field public static final OUT_TEMPERATURE:I = 0x7547

.field public static final PM25_PURIFICATION:I = 0x7576

.field public static final POLLEN:I = 0x7553

.field public static final POPUP:I = 0x753e

.field public static final POWER:I = 0x7530

.field public static final PRESET_MODE:I = 0x754d

.field public static final PTC:I = 0x7575

.field public static final QUIT:I = 0x757a

.field public static final REAR_AC:I = 0x7581

.field public static final REAR_AIR_LOCK:I = 0x7540

.field public static final REAR_AUTO:I = 0x7549

.field public static final REAR_DEFROST:I = 0x753d

.field public static final REAR_DEFROST_DEFOG:I = 0x7570

.field public static final REAR_DEFROST_TIME:I = 0x758a

.field public static final REAR_HEAT:I = 0x7557

.field public static final REAR_HEAT_WIND:I = 0x7586

.field public static final REAR_LEFT_AUTO:I = 0x757d

.field public static final REAR_POWER:I = 0x7548

.field public static final REAR_RIGHT_AUTO:I = 0x757e

.field public static final REAR_SYNC:I = 0x7571

.field public static final REAR_TEMP:I = 0x7556

.field public static final REAR_WINDOW_AUTOMATIC_DEFOGGING:I = 0x755f

.field public static final REAR_WIND_LEVEL:I = 0x754b

.field public static final REAR_WIND_MODE:I = 0x754a

.field public static final REAR_ZONE_AIR_CONDITIONER_START:I = 0x7562

.field public static final RECIRCULATION:I = 0x7535

.field public static final RECIRCULATION_AUTO_KEY_BIND:I = 0x754f

.field public static final REMOTE_AIRCONDITION_START:I = 0x7565

.field public static final REQ_CANBOX_DATA:I = 0x7573

.field public static final REST:I = 0x757c

.field public static final SEAT_STEER_SYNC:I = 0x7579

.field public static final SEAT_STEER_SYNC_LEVEL:I = 0x7585

.field public static final SMOG_MODE:I = 0x7578

.field public static final SOFT:I = 0x7567

.field public static final SWING:I = 0x7552

.field public static final SYNC:I = 0x7539

.field public static final SYNC_LEFT_AND_RIGHT_TEMPERATURE_ZONES:I = 0x7558

.field public static final TEMPERATURE:I = 0x7536

.field public static final TEMPERATURE_UNIT:I = 0x7544

.field public static final WARM:I = 0x7577

.field public static final WIND_LEVEL:I = 0x7534

.field public static final WIND_LEVEL_AUTO:I = 0x7589

.field public static final WIND_LEVEL_MAX:I = 0x7563

.field public static final WIND_MODE:I = 0x7533

.field public static final WIND_MODE_RIGHT:I = 0x753b


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 695
    const-class v0, Lcom/spd/carinfo/CarInfo$AirCondition;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$AirCondition;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 694
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
