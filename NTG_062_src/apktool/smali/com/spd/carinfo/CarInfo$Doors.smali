.class public final Lcom/spd/carinfo/CarInfo$Doors;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Doors"
.end annotation


# static fields
.field public static final AUTO_LOCK:I = 0xc353

.field public static final AUTO_LOCK_BY_SPEED:I = 0xc356

.field public static final AUTO_LOCK_SHIFT_FROM_P:I = 0xc357

.field public static final AUTO_OPEN_TRUNK:I = 0xc36c

.field public static final AUTO_RELOCK:I = 0xc37a

.field public static final AUTO_RELOCK_TIMER:I = 0xc361

.field public static final AUTO_UNLOCK:I = 0xc366

.field public static final AUTO_UNLOCK_SHIFT_TO_P:I = 0xc358

.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final DOOR_OPENING_OPTION:I = 0xc36f

.field public static final DRIVER_DOOR_OPEN_UNLOCK:I = 0xc35c

.field public static final HANDLE_OPEN_ELEC_TRUNK:I = 0xc36b

.field public static final ID:I = 0x5

.field public static final KEYLESS_ACCESS_BEEP:I = 0xc367

.field public static final KEYLESS_ACCESS_BEEP_VOLUME:I = 0xc381

.field public static final KEYLESS_LOCK_ANSWER_BACK:I = 0xc364

.field public static final LOCK_LIGHT:I = 0xc378

.field public static final LOCK_RESET:I = 0xc37d

.field public static final LOCK_SOUND_SURE:I = 0xc37f

.field public static final LOCK_UNLOCK_FEEDBACK_LIGHT:I = 0xc35f

.field public static final LOCK_UNLOCK_FEEDBACK_TONE:I = 0xc35a

.field public static final LOCK_WARNING_WHEN_DOOR_OPENED:I = 0xc371

.field public static final MOTOR_DRIVEN_FOOT_BOARD:I = 0xc362

.field public static final NEAR_AUTO_UNLOCK:I = 0xc372

.field public static final OFFSET:I = 0xc350

.field public static final OPENED:I = 0xc351

.field public static final OPEN_DOOR_TURN_LIGHT_FLASHING:I = 0xc375

.field public static final POSITION_LIGHT_OFF_AFTER_LOCK:I = 0xc377

.field public static final REMOTE_BUTTON_2_PRESS_UNLOCK:I = 0xc359

.field public static final REMOTE_KEY_2_PRESS_UNLOCK:I = 0xc35b

.field public static final REMOTE_LOCK_FEEDBACK:I = 0xc376

.field public static final REMOTE_OPEN_ELEC_TRUNK:I = 0xc36a

.field public static final REMOTE_START_SYSTEM:I = 0xc368

.field public static final REMOTE_UNLOCK_MODE:I = 0xc365

.field public static final ROOF_MODE:I = 0xc363

.field public static final SINGLE_DOOR_UNLOCK:I = 0xc37b

.field public static final SMART_DOOR_UNLOCK:I = 0xc35d

.field public static final SMART_KEY_SYSTEM:I = 0xc36d

.field public static final SMART_LOCK_AND_START_STOP:I = 0xc35e

.field public static final SUNROOF_CONTROLLED_BY_SPEECH:I = 0xc37e

.field public static final SUNROOF_OPEN_RATIO:I = 0xc37c

.field public static final TRUNK_AUTO_UNLOCK_DISTANCE:I = 0xc373

.field public static final TRUNK_KEYLESS_UNLOCK:I = 0xc374

.field public static final TRUNK_OPENING_DEGREE:I = 0xc380

.field public static final TRUNK_SENSE:I = 0xc354

.field public static final TRUNK_SENSE_DIRECTION:I = 0xc355

.field public static final TRUNK_SENSE_GEAR:I = 0xc360

.field public static final UNLOCK:I = 0xc352

.field public static final UNLOCK_AUTO_OPEN_LIGHT:I = 0xc370

.field public static final UNLOCK_LIGHT:I = 0xc379

.field public static final UNLOCK_ONLY_THE_TRUNK:I = 0xc36e

.field public static final WALK_AWAY_AUTO_LOCK:I = 0xc369


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 829
    const-class v0, Lcom/spd/carinfo/CarInfo$Doors;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$Doors;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 828
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
