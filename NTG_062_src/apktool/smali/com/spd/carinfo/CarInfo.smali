.class public final Lcom/spd/carinfo/CarInfo;
.super Ljava/lang/Object;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/spd/carinfo/CarInfo$Other;,
        Lcom/spd/carinfo/CarInfo$CarPhone;,
        Lcom/spd/carinfo/CarInfo$Vehicles;,
        Lcom/spd/carinfo/CarInfo$Battery;,
        Lcom/spd/carinfo/CarInfo$Wipers;,
        Lcom/spd/carinfo/CarInfo$ReverseAndAVM;,
        Lcom/spd/carinfo/CarInfo$DrivingAndOperating;,
        Lcom/spd/carinfo/CarInfo$DriverAssistance;,
        Lcom/spd/carinfo/CarInfo$Lighting;,
        Lcom/spd/carinfo/CarInfo$Instruments;,
        Lcom/spd/carinfo/CarInfo$SteeringWheel;,
        Lcom/spd/carinfo/CarInfo$Mirrors;,
        Lcom/spd/carinfo/CarInfo$WheelsAndTires;,
        Lcom/spd/carinfo/CarInfo$Windows;,
        Lcom/spd/carinfo/CarInfo$Doors;,
        Lcom/spd/carinfo/CarInfo$Seats;,
        Lcom/spd/carinfo/CarInfo$AirCondition;,
        Lcom/spd/carinfo/CarInfo$Keys;,
        Lcom/spd/carinfo/CarInfo$General;,
        Lcom/spd/carinfo/CarInfo$Base;,
        Lcom/spd/carinfo/CarInfo$H;,
        Lcom/spd/carinfo/CarInfo$Callback;
    }
.end annotation


# static fields
.field public static final ACTION_AIR_ACTIVITY:Ljava/lang/String; = "com.spd.aircondition.ACTION_ACTIVITY"

.field public static final ACTION_AIR_FLOAT_AVM:Ljava/lang/String; = "com.spd.aircondition.ACTION_FLOAT_AVM"

.field public static final ACTION_AIR_FLOAT_BUTTON:Ljava/lang/String; = "com.spd.aircondition.ACTION_FLOAT_BUTTON"

.field public static final ACTION_AIR_FLOAT_DOOR:Ljava/lang/String; = "com.spd.aircondition.ACTION_FLOAT_DOOR"

.field public static final ACTION_AIR_FLOAT_WINDOW:Ljava/lang/String; = "com.spd.aircondition.ACTION_FLOAT_WINDOW"

.field public static final ACTION_AIR_SERVICE:Ljava/lang/String; = "com.spd.aircondition.ACTION_SERVICE"

.field public static final ACTION_CARINFO_UI_ACTIVITY:Ljava/lang/String; = "com.spd.carinfo.ui.ACTION_ACTIVITY"

.field public static final BAND_AM:I = 0x3e8

.field public static final BAND_AM1:I = 0x3e9

.field public static final BAND_AM2:I = 0x3ea

.field public static final BAND_AM3:I = 0x3eb

.field public static final BAND_FM:I = 0x0

.field public static final BAND_FM1:I = 0x1

.field public static final BAND_FM2:I = 0x2

.field public static final BAND_FM3:I = 0x3

.field public static final BUTTON_ACTION_MASK:I = 0xf

.field public static final CD_STATUS_BUSY:I = 0x7

.field public static final CD_STATUS_EJECT:I = 0x3

.field public static final CD_STATUS_ERROR:I = 0xa

.field public static final CD_STATUS_INSERT:I = 0x5

.field public static final CD_STATUS_INVALID:I = 0xb

.field public static final CD_STATUS_LOADING:I = 0x4

.field public static final CD_STATUS_PLAY:I = 0x1

.field public static final CD_STATUS_READING:I = 0x0

.field public static final CD_STATUS_SELECT_TO_EJECT:I = 0x9

.field public static final CD_STATUS_SELECT_TO_LOAD:I = 0x8

.field public static final CD_STATUS_STOP:I = 0x2

.field public static final CD_STATUS_WAIT:I = 0x6

.field public static final DATE_KEY_DAY:Ljava/lang/String; = "day"

.field public static final DATE_KEY_MODE:Ljava/lang/String; = "mode"

.field public static final DATE_KEY_MONTH:Ljava/lang/String; = "month"

.field public static final DATE_KEY_YEAR:Ljava/lang/String; = "year"

.field public static final DRIVING_COMPUTER_PAGE1:I = 0x0

.field public static final DRIVING_COMPUTER_PAGE2:I = 0x1

.field public static final EQ_KEY_BALANCE:Ljava/lang/String; = "balance"

.field public static final EQ_KEY_BASS:Ljava/lang/String; = "bass"

.field public static final EQ_KEY_FADER:Ljava/lang/String; = "fader"

.field public static final EQ_KEY_MIDTONE:Ljava/lang/String; = "midtone"

.field public static final EQ_KEY_TREBLE:Ljava/lang/String; = "treble"

.field public static final FAILED:I = 0x0

.field public static final FALG_AC_AUTO:I = 0x2

.field public static final FLAG_AC_OFF:I = 0x0

.field public static final FLAG_AC_ON:I = 0x1

.field public static final FLAG_AUTO:I = 0x80

.field public static final FLAG_AVM_VIDEO_360:I = 0x0

.field public static final FLAG_AVM_VIDEO_FRONT:I = 0x1

.field public static final FLAG_AVM_VIDEO_FRONT_LEFT:I = 0x5

.field public static final FLAG_AVM_VIDEO_FRONT_RIGHT:I = 0x6

.field public static final FLAG_AVM_VIDEO_LEFT:I = 0x3

.field public static final FLAG_AVM_VIDEO_REAR:I = 0x2

.field public static final FLAG_AVM_VIDEO_REAR_LEFT:I = 0x7

.field public static final FLAG_AVM_VIDEO_REAR_RIGHT:I = 0x8

.field public static final FLAG_AVM_VIDEO_RIGHT:I = 0x4

.field public static final FLAG_BUTTON_DOWN:I = 0x20000

.field public static final FLAG_BUTTON_MASK:I = 0xf0000

.field public static final FLAG_BUTTON_UP:I = 0x10000

.field public static final FLAG_DATA_VALID:I = 0xff0000

.field public static final FLAG_DATA_VALID_OFF:I = 0x100000

.field public static final FLAG_DATA_VALID_ON:I = 0x110000

.field public static final FLAG_DATA_VALID_VALUE:I = 0xffff

.field public static final FLAG_DECREASE:I = 0x4000

.field public static final FLAG_DOWN:I = 0x40

.field public static final FLAG_INCREASE:I = 0x2000

.field public static final FLAG_MIDDLE:I = 0x20

.field public static final FLAG_RECIRCULATION_AUTO:I = 0x2

.field public static final FLAG_RECIRCULATION_DEFAULT:I = 0x3

.field public static final FLAG_RECIRCULATION_INNER:I = 0x1

.field public static final FLAG_RECIRCULATION_OUTER:I = 0x0

.field public static final FLAG_SWITCH:I = 0x1000

.field public static final FLAG_UP:I = 0x10

.field public static final FRONT_RADAR_ENABLE:Ljava/lang/String; = "frontRadarEnable"

.field public static final KEY_ACTION:Ljava/lang/String; = "action"

.field public static final KEY_AUDIO_TYPE:Ljava/lang/String; = "audioType"

.field public static final KEY_BATTERY_FAULT:Ljava/lang/String; = "batteryFaultInfo"

.field public static final KEY_BATTERY_INFO:Ljava/lang/String; = "batteryInfo"

.field public static final KEY_CARBODY_FAULT:Ljava/lang/String; = "carBodyFaultInfo"

.field public static final KEY_CARBODY_INFO:Ljava/lang/String; = "carBodyInfo"

.field public static final KEY_DEVICE:Ljava/lang/String; = "device"

.field public static final KEY_ELECTRIC_TRUNK:Ljava/lang/String; = "electricTrunk"

.field public static final KEY_ELECTRIC_TRUNK_MOVE_DIRECT:Ljava/lang/String; = "electricTrunkMoveDirect"

.field public static final KEY_FRONT_LEFT:Ljava/lang/String; = "frontLeft"

.field public static final KEY_FRONT_RIGHT:Ljava/lang/String; = "frontRight"

.field public static final KEY_FUNCTION_ENABLE:Ljava/lang/String; = "functionEnable"

.field public static final KEY_HOOD:Ljava/lang/String; = "hood"

.field public static final KEY_LEVEL:Ljava/lang/String; = "level"

.field public static final KEY_MAX:Ljava/lang/String; = "max"

.field public static final KEY_MIN:Ljava/lang/String; = "min"

.field public static final KEY_MOTOR_FAULT:Ljava/lang/String; = "motorFaultInfo"

.field public static final KEY_MOTOR_INFO:Ljava/lang/String; = "motorInfo"

.field public static final KEY_NAMES:Ljava/lang/String; = "names"

.field public static final KEY_PACKAGE_NAME:Ljava/lang/String; = "packageName"

.field public static final KEY_PARK_DIRECT:Ljava/lang/String; = "direct"

.field public static final KEY_PARK_POS:Ljava/lang/String; = "pos"

.field public static final KEY_PARK_PROCESS:Ljava/lang/String; = "process"

.field public static final KEY_PARK_STATUS:Ljava/lang/String; = "status"

.field public static final KEY_PARK_UI:Ljava/lang/String; = "parkUI"

.field public static final KEY_REAR_LEFT:Ljava/lang/String; = "rearLeft"

.field public static final KEY_REAR_RIGHT:Ljava/lang/String; = "rearRight"

.field public static final KEY_STATE:Ljava/lang/String; = "state"

.field public static final KEY_STEP:Ljava/lang/String; = "step"

.field public static final KEY_SUNROOF:Ljava/lang/String; = "sunroof"

.field public static final KEY_TRUNK:Ljava/lang/String; = "trunk"

.field public static final KEY_TYPE:Ljava/lang/String; = "type"

.field public static final KEY_UNIT:Ljava/lang/String; = "unit"

.field public static final KEY_VALUE:Ljava/lang/String; = "value"

.field public static final KEY_VALUES:Ljava/lang/String; = "values"

.field public static final KEY_X:Ljava/lang/String; = "x"

.field public static final KEY_Y:Ljava/lang/String; = "y"

.field public static final OFF:I = 0x0

.field public static final ON:I = 0x1

.field public static final PLAY_BOX_SHOWS:I = 0x1

.field public static final RADAR_DISP_COLOR:I = 0x2

.field public static final RADAR_DISP_DISTANCE:I = 0x1

.field public static final RADAR_DISP_LEVEL:I = 0x0

.field public static final RADAR_DISP_MAX:I = 0x3

.field public static final RADAR_KEY_DISPLAY_TYPE:Ljava/lang/String; = "displayType"

.field public static final RADAR_KEY_ENABLE:Ljava/lang/String; = "enable"

.field public static final RADAR_KEY_MAX_VALUE:Ljava/lang/String; = "maxValue"

.field public static final RADAR_KEY_NUM:Ljava/lang/String; = "radarNum"

.field public static final RADAR_KEY_VALUE:Ljava/lang/String; = "value"

.field public static final RADAR_MAX_NUM:I = 0x5

.field public static final SEAT_DRIVER:I = 0x0

.field public static final SEAT_PASSENGER:I = 0x1

.field public static final SEAT_REAR:I = 0x4

.field public static final SEAT_REAR_LEFT:I = 0x2

.field public static final SEAT_REAR_RIGHT:I = 0x3

.field public static final SUCCESS:I = 0x1

.field public static final SWITCH:I = 0x2

.field private static final TAG:Ljava/lang/String; = "CarInfo"

.field public static final TEMP_HI:F = 254.0f

.field public static final TEMP_LO:F = 0.0f

.field public static final TEMP_NOUSE:F = 255.0f

.field public static final TEMP_OUT_INVALID:F = -1000.0f

.field public static final TEMP_UNITS_CENTIGRADE:I = 0x0

.field public static final TEMP_UNITS_FAHRENHEIT:I = 0x1

.field public static final TEMP_UNITS_LEVEL:I = 0x2

.field public static final TIME_KEY_CLOCK:Ljava/lang/String; = "clock"

.field public static final TIME_KEY_HOUR:Ljava/lang/String; = "hour"

.field public static final TIME_KEY_MINUTE:Ljava/lang/String; = "minute"

.field public static final TIME_KEY_MODE:Ljava/lang/String; = "mode"

.field public static final TIME_KEY_SECOND:Ljava/lang/String; = "second"

.field public static final TIME_KEY_SET:Ljava/lang/String; = "set"

.field public static final WINDOW_ALL:I = 0x0

.field public static final WINDOW_FRONT_LEFT:I = 0x1

.field public static final WINDOW_FRONT_RIGHT:I = 0x2

.field public static final WINDOW_REAR_LEFT:I = 0x3

.field public static final WINDOW_REAR_RIGHT:I = 0x4

.field public static final WINDOW_SUNROOF:I = 0x5

.field public static final WIND_LEVEL_AUTO:I = 0xfe

.field public static final WIND_MODE_MASK:I = 0xff0

.field public static final WIND_MODE_OPERATE_MASK:I = 0xf000

.field private static mInstance:Lcom/spd/carinfo/CarInfo;


# instance fields
.field private isUnbind:Z

.field private mCallback:Lcom/spd/carinfo/CarInfo$Callback;

.field private mConnection:Landroid/content/ServiceConnection;

.field private mContext:Landroid/content/Context;

.field private mHandler:Lcom/spd/carinfo/CarInfo$H;

.field private mICarInfoAidlCallback:Lcom/spd/carinfo/ICarInfoAidlCallback;

.field private mICarInfoAidlInterface:Lcom/spd/carinfo/ICarInfoAidlInterface;

.field private mIds:[Ljava/lang/String;

.field private mPackageName:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 234
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 286
    new-instance v0, Lcom/spd/carinfo/CarInfo$1;

    invoke-direct {v0, p0}, Lcom/spd/carinfo/CarInfo$1;-><init>(Lcom/spd/carinfo/CarInfo;)V

    iput-object v0, p0, Lcom/spd/carinfo/CarInfo;->mConnection:Landroid/content/ServiceConnection;

    .line 312
    new-instance v0, Lcom/spd/carinfo/CarInfo$2;

    invoke-direct {v0, p0}, Lcom/spd/carinfo/CarInfo$2;-><init>(Lcom/spd/carinfo/CarInfo;)V

    iput-object v0, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlCallback:Lcom/spd/carinfo/ICarInfoAidlCallback;

    .line 235
    return-void
.end method

.method static synthetic access$000(Lcom/spd/carinfo/CarInfo;)Lcom/spd/carinfo/ICarInfoAidlInterface;
    .locals 1
    .param p0, "x0"    # Lcom/spd/carinfo/CarInfo;

    .line 17
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlInterface:Lcom/spd/carinfo/ICarInfoAidlInterface;

    return-object v0
.end method

.method static synthetic access$002(Lcom/spd/carinfo/CarInfo;Lcom/spd/carinfo/ICarInfoAidlInterface;)Lcom/spd/carinfo/ICarInfoAidlInterface;
    .locals 0
    .param p0, "x0"    # Lcom/spd/carinfo/CarInfo;
    .param p1, "x1"    # Lcom/spd/carinfo/ICarInfoAidlInterface;

    .line 17
    iput-object p1, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlInterface:Lcom/spd/carinfo/ICarInfoAidlInterface;

    return-object p1
.end method

.method static synthetic access$100(Lcom/spd/carinfo/CarInfo;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/spd/carinfo/CarInfo;

    .line 17
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo;->mPackageName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/spd/carinfo/CarInfo;)[Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/spd/carinfo/CarInfo;

    .line 17
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo;->mIds:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/spd/carinfo/CarInfo;)Lcom/spd/carinfo/ICarInfoAidlCallback;
    .locals 1
    .param p0, "x0"    # Lcom/spd/carinfo/CarInfo;

    .line 17
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlCallback:Lcom/spd/carinfo/ICarInfoAidlCallback;

    return-object v0
.end method

.method static synthetic access$400(Lcom/spd/carinfo/CarInfo;IIILjava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Lcom/spd/carinfo/CarInfo;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .param p4, "x4"    # Ljava/lang/Object;

    .line 17
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/spd/carinfo/CarInfo;->sendMessage(IIILjava/lang/Object;)V

    return-void
.end method

.method static synthetic access$500(Lcom/spd/carinfo/CarInfo;)Z
    .locals 1
    .param p0, "x0"    # Lcom/spd/carinfo/CarInfo;

    .line 17
    iget-boolean v0, p0, Lcom/spd/carinfo/CarInfo;->isUnbind:Z

    return v0
.end method

.method static synthetic access$600(Lcom/spd/carinfo/CarInfo;)V
    .locals 0
    .param p0, "x0"    # Lcom/spd/carinfo/CarInfo;

    .line 17
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo;->bind()V

    return-void
.end method

.method static synthetic access$700(Lcom/spd/carinfo/CarInfo;)Lcom/spd/carinfo/CarInfo$Callback;
    .locals 1
    .param p0, "x0"    # Lcom/spd/carinfo/CarInfo;

    .line 17
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo;->mCallback:Lcom/spd/carinfo/CarInfo$Callback;

    return-object v0
.end method

.method private bind()V
    .locals 4

    .line 268
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.spd.carinfo.service"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 269
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.spd.carinfo"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 270
    iget-object v1, p0, Lcom/spd/carinfo/CarInfo;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/spd/carinfo/CarInfo;->mConnection:Landroid/content/ServiceConnection;

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 271
    return-void
.end method

.method public static connected()Z
    .locals 1

    .line 477
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/spd/carinfo/CarInfo;->isConnected()Z

    move-result v0

    return v0
.end method

.method public static create(Landroid/content/Context;[Ljava/lang/String;Lcom/spd/carinfo/CarInfo$Callback;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "ids"    # [Ljava/lang/String;
    .param p2, "callback"    # Lcom/spd/carinfo/CarInfo$Callback;

    .line 469
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/spd/carinfo/CarInfo;->init(Landroid/content/Context;[Ljava/lang/String;Lcom/spd/carinfo/CarInfo$Callback;)V

    .line 470
    return-void
.end method

.method public static destroy()V
    .locals 1

    .line 473
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/spd/carinfo/CarInfo;->uninit()V

    .line 474
    return-void
.end method

.method public static getButtonFlag(I)I
    .locals 1
    .param p0, "value"    # I

    .line 54
    const/high16 v0, 0xf0000

    and-int/2addr v0, p0

    return v0
.end method

.method public static instance()Lcom/spd/carinfo/CarInfo;
    .locals 2

    .line 223
    sget-object v0, Lcom/spd/carinfo/CarInfo;->mInstance:Lcom/spd/carinfo/CarInfo;

    if-nez v0, :cond_1

    .line 224
    const-class v0, Lcom/spd/carinfo/CarInfo;

    monitor-enter v0

    .line 225
    :try_start_0
    sget-object v1, Lcom/spd/carinfo/CarInfo;->mInstance:Lcom/spd/carinfo/CarInfo;

    if-nez v1, :cond_0

    .line 226
    new-instance v1, Lcom/spd/carinfo/CarInfo;

    invoke-direct {v1}, Lcom/spd/carinfo/CarInfo;-><init>()V

    sput-object v1, Lcom/spd/carinfo/CarInfo;->mInstance:Lcom/spd/carinfo/CarInfo;

    .line 228
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 231
    :cond_1
    :goto_0
    sget-object v0, Lcom/spd/carinfo/CarInfo;->mInstance:Lcom/spd/carinfo/CarInfo;

    return-object v0
.end method

.method public static openAirFloatButton(Landroid/content/Context;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "enabled"    # Z

    .line 510
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.spd.aircondition.ACTION_FLOAT_BUTTON"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 511
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "value"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 512
    const-string v1, "com.spd.aircondition"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 513
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 514
    return-void
.end method

.method public static openAvmFloatButton(Landroid/content/Context;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "enabled"    # Z

    .line 517
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.spd.aircondition.ACTION_FLOAT_AVM"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 518
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "value"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 519
    const-string v1, "com.spd.aircondition"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 520
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 521
    return-void
.end method

.method private sendMessage(IIILjava/lang/Object;)V
    .locals 1
    .param p1, "what"    # I
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I
    .param p4, "obj"    # Ljava/lang/Object;

    .line 356
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo;->mHandler:Lcom/spd/carinfo/CarInfo$H;

    if-eqz v0, :cond_0

    .line 357
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo;->mHandler:Lcom/spd/carinfo/CarInfo$H;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/spd/carinfo/CarInfo$H;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 359
    :cond_0
    return-void
.end method

.method public static setAirWindowEnabled(Landroid/content/Context;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "enabled"    # Z

    .line 525
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.spd.aircondition.ACTION_FLOAT_WINDOW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 526
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "value"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 527
    const-string v1, "com.spd.aircondition"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 528
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 529
    return-void
.end method

.method public static setButtonFlag(II)I
    .locals 1
    .param p0, "value"    # I
    .param p1, "buttonFlag"    # I

    .line 57
    const v0, -0xf0001

    and-int/2addr v0, p0

    or-int/2addr v0, p1

    return v0
.end method

.method public static setDoorWindowEnabled(Landroid/content/Context;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "enabled"    # Z

    .line 533
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.spd.aircondition.ACTION_FLOAT_DOOR"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 534
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "value"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 535
    const-string v1, "com.spd.aircondition"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 536
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 537
    return-void
.end method

.method public static startAirConditionActivity(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 481
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.spd.aircondition.ACTION_ACTIVITY"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 482
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.spd.aircondition"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 483
    const/high16 v1, 0x10080000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 484
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 485
    return-void
.end method

.method public static startAirConditionService(Landroid/content/Context;I)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "type"    # I

    .line 503
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.spd.aircondition.ACTION_SERVICE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 504
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.spd.aircondition"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 505
    const-string v1, "type"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 506
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 507
    return-void
.end method

.method public static startCarInfoUi(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 488
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.spd.carinfo.ui.ACTION_ACTIVITY"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 489
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.spd.carinfo.ui"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 490
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 491
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 492
    return-void
.end method

.method public static startCarInfoUi(Landroid/content/Context;I)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "type"    # I

    .line 495
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.spd.carinfo.ui.ACTION_ACTIVITY"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 496
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "TYPE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 497
    const-string v1, "com.spd.carinfo.ui"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 498
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 499
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 500
    return-void
.end method

.method private unbind()V
    .locals 2

    .line 274
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo;->mContext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 275
    const-string v0, "CarInfo"

    const-string v1, "unbind context is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    return-void

    .line 278
    :cond_0
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo;->mConnection:Landroid/content/ServiceConnection;

    if-nez v0, :cond_1

    .line 279
    const-string v0, "CarInfo"

    const-string v1, "unbind connection is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    return-void

    .line 282
    :cond_1
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/spd/carinfo/CarInfo;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 283
    return-void
.end method


# virtual methods
.method public get(IILjava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "what"    # I
    .param p2, "arg"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(IITT;)TT;"
        }
    .end annotation

    .line 446
    .local p3, "def":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lcom/spd/carinfo/CarInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 448
    const/4 v0, 0x0

    .line 449
    .local v0, "result":Ljava/lang/Object;, "TT;"
    :try_start_0
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 450
    .local v1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v2, Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 451
    iget-object v2, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlInterface:Lcom/spd/carinfo/ICarInfoAidlInterface;

    invoke-interface {v2, p1, p2}, Lcom/spd/carinfo/ICarInfoAidlInterface;->getInt(II)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    goto :goto_0

    .line 452
    :cond_0
    const-class v2, Ljava/lang/Float;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 453
    iget-object v2, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlInterface:Lcom/spd/carinfo/ICarInfoAidlInterface;

    invoke-interface {v2, p1, p2}, Lcom/spd/carinfo/ICarInfoAidlInterface;->getFloat(II)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    goto :goto_0

    .line 454
    :cond_1
    const-class v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 455
    iget-object v2, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlInterface:Lcom/spd/carinfo/ICarInfoAidlInterface;

    invoke-interface {v2, p1, p2}, Lcom/spd/carinfo/ICarInfoAidlInterface;->getString(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    goto :goto_0

    .line 456
    :cond_2
    const-class v2, Landroid/os/Bundle;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 457
    iget-object v2, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlInterface:Lcom/spd/carinfo/ICarInfoAidlInterface;

    invoke-interface {v2, p1, p2}, Lcom/spd/carinfo/ICarInfoAidlInterface;->getBundle(II)Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    .line 459
    :cond_3
    :goto_0
    return-object v0

    .line 460
    .end local v0    # "result":Ljava/lang/Object;, "TT;"
    .end local v1    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :catch_0
    move-exception v0

    .line 461
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 465
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_4
    return-object p3
.end method

.method public init(Landroid/content/Context;[Ljava/lang/String;Lcom/spd/carinfo/CarInfo$Callback;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "ids"    # [Ljava/lang/String;
    .param p3, "callback"    # Lcom/spd/carinfo/CarInfo$Callback;

    .line 238
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/spd/carinfo/CarInfo;->mContext:Landroid/content/Context;

    .line 239
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/spd/carinfo/CarInfo;->mPackageName:Ljava/lang/String;

    .line 240
    const-string v0, "CarInfo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "init :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/spd/carinfo/CarInfo;->mPackageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ",ids:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    iput-object p2, p0, Lcom/spd/carinfo/CarInfo;->mIds:[Ljava/lang/String;

    .line 242
    iput-object p3, p0, Lcom/spd/carinfo/CarInfo;->mCallback:Lcom/spd/carinfo/CarInfo$Callback;

    .line 243
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/spd/carinfo/CarInfo;->isUnbind:Z

    .line 244
    new-instance v0, Lcom/spd/carinfo/CarInfo$H;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/spd/carinfo/CarInfo$H;-><init>(Lcom/spd/carinfo/CarInfo;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/spd/carinfo/CarInfo;->mHandler:Lcom/spd/carinfo/CarInfo$H;

    .line 245
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo;->bind()V

    .line 246
    return-void
.end method

.method public isConnected()Z
    .locals 1

    .line 419
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlInterface:Lcom/spd/carinfo/ICarInfoAidlInterface;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public set(ILjava/lang/Object;I)I
    .locals 3
    .param p1, "what"    # I
    .param p3, "arg1"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(ITT;I)I"
        }
    .end annotation

    .line 423
    .local p2, "arg0":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lcom/spd/carinfo/CarInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 425
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 426
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v1, Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 427
    iget-object v1, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlInterface:Lcom/spd/carinfo/ICarInfoAidlInterface;

    move-object v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {v1, p1, v2, p3}, Lcom/spd/carinfo/ICarInfoAidlInterface;->setInt(III)V

    goto :goto_0

    .line 428
    :cond_0
    const-class v1, Ljava/lang/Float;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 429
    iget-object v1, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlInterface:Lcom/spd/carinfo/ICarInfoAidlInterface;

    move-object v2, p2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-interface {v1, p1, v2, p3}, Lcom/spd/carinfo/ICarInfoAidlInterface;->setFloat(IFI)V

    goto :goto_0

    .line 430
    :cond_1
    const-class v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 431
    iget-object v1, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlInterface:Lcom/spd/carinfo/ICarInfoAidlInterface;

    move-object v2, p2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1, p1, v2, p3}, Lcom/spd/carinfo/ICarInfoAidlInterface;->setString(ILjava/lang/String;I)V

    goto :goto_0

    .line 432
    :cond_2
    const-class v1, Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 433
    iget-object v1, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlInterface:Lcom/spd/carinfo/ICarInfoAidlInterface;

    move-object v2, p2

    check-cast v2, Landroid/os/Bundle;

    invoke-interface {v1, p1, v2, p3}, Lcom/spd/carinfo/ICarInfoAidlInterface;->setBundle(ILandroid/os/Bundle;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 436
    :cond_3
    :goto_0
    const/4 v1, 0x1

    return v1

    .line 437
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :catch_0
    move-exception v0

    .line 438
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 442
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_4
    const/4 v0, 0x0

    return v0
.end method

.method public uninit()V
    .locals 4

    .line 249
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/spd/carinfo/CarInfo;->isUnbind:Z

    .line 250
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlInterface:Lcom/spd/carinfo/ICarInfoAidlInterface;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 252
    :try_start_0
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlInterface:Lcom/spd/carinfo/ICarInfoAidlInterface;

    iget-object v2, p0, Lcom/spd/carinfo/CarInfo;->mPackageName:Ljava/lang/String;

    iget-object v3, p0, Lcom/spd/carinfo/CarInfo;->mIds:[Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Lcom/spd/carinfo/ICarInfoAidlInterface;->unregisterCallback(Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 255
    goto :goto_0

    .line 253
    :catch_0
    move-exception v0

    .line 254
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 256
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_0
    iput-object v1, p0, Lcom/spd/carinfo/CarInfo;->mICarInfoAidlInterface:Lcom/spd/carinfo/ICarInfoAidlInterface;

    .line 258
    :cond_0
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo;->unbind()V

    .line 259
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo;->mHandler:Lcom/spd/carinfo/CarInfo$H;

    if-eqz v0, :cond_1

    .line 260
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo;->mHandler:Lcom/spd/carinfo/CarInfo$H;

    invoke-virtual {v0, v1}, Lcom/spd/carinfo/CarInfo$H;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 261
    iput-object v1, p0, Lcom/spd/carinfo/CarInfo;->mHandler:Lcom/spd/carinfo/CarInfo$H;

    .line 263
    :cond_1
    iput-object v1, p0, Lcom/spd/carinfo/CarInfo;->mCallback:Lcom/spd/carinfo/CarInfo$Callback;

    .line 264
    iput-object v1, p0, Lcom/spd/carinfo/CarInfo;->mContext:Landroid/content/Context;

    .line 265
    return-void
.end method
