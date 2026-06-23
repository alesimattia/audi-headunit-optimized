.class public Lcom/spd/dvr/utils/DataUtil;
.super Ljava/lang/Object;
.source "DataUtil.java"


# static fields
.field public static final ADAS_CHANNL:I = 0x4

.field public static final ANGLEADJ_FRAGMENT_TYPE:I = 0x1

.field public static final AR_CHANNL:I = 0x5

.field public static final AUX_CHANNL:I = 0x6

.field public static final CALIBASSIS_FRAGMENT_TYPE:I = 0x6

.field public static final CAMERA_COUNT:I = 0x8

.field public static final CARSETTING_FRAGMENT_TYPE:I = 0x2

.field public static final CMD_BASE:I = 0x3e8

.field public static final CSI_0:I = 0x0

.field public static final CSI_1:I = 0x1

.field public static final DVR_ACTIVATION_MSG:I = 0x7d9

.field public static final DVR_AVMSTATE_CMD:I = 0x3f1

.field public static final DVR_DEVICESTATE_MSG:I = 0x7d5

.field public static final DVR_FORMAT_CMD:I = 0x3f0

.field public static final DVR_FORMAT_MSG:I = 0x7d6

.field public static final DVR_HASUSB_MSG:I = 0x7d7

.field public static final DVR_MICSTATE_CMD:I = 0x3eb

.field public static final DVR_MICSTATE_MSG:I = 0x7d2

.field public static final DVR_NOTIFY_MSG:I = 0x7d8

.field public static final DVR_PLAYNEXT_CMD:I = 0x3ed

.field public static final DVR_PLAYPREV_CMD:I = 0x3ee

.field public static final DVR_PLAYSTATE_CMD:I = 0x3ec

.field public static final DVR_PLAYSTATE_MSG:I = 0x7d3

.field public static final DVR_PLAYTIME_MSG:I = 0x7d4

.field public static final DVR_PREVIEW_CMD:I = 0x3e9

.field public static final DVR_PREVIEW_MSG:I = 0x7d1

.field public static final DVR_RECORDER_CMD:I = 0x3e8

.field public static final DVR_RECORDER_MSG:I = 0x7d0

.field public static final DVR_RELEASE_CMD:I = 0x3ef

.field public static final DVR_SEEKTO_CMD:I = 0x3f2

.field public static final DVR_TAKEPICTURE_CMD:I = 0x3ea

.field public static final DVR_TAKE_PICTURE_MSG:I = 0x7da

.field public static final KEY_AVM_STEERING_SIGNAL:Ljava/lang/String; = "KEY_AVM_STEERING_SIGNAL"

.field public static final KEY_AVM_STEERING_TIME:Ljava/lang/String; = "KEY_AVM_STEERING_TIME"

.field public static final KEY_AVM_TRAJECTORY_SELECTION:Ljava/lang/String; = "KEY_AVM_TRAJECTORY_SELECTION"

.field public static final MSG_BASE:I = 0x7d0

.field public static final PANORSETTING_FRAGMENT_TYPE:I = 0x3

.field public static final PLAYBACK_FRAGMENT_TYPE:I = 0x8

.field public static final RECORD_FRAGMENT_TYPE:I = 0x7

.field public static final REVERSE_CHANNL:I = 0x7

.field public static final REVERSE_PARA_TRACK_MODE:Ljava/lang/String; = "REVERSE_PARA_TRACK_MODE"

.field public static final SERVICE_CMD_AVM_REVERSE_CHECK:I = 0x6d

.field public static final SERVICE_CMD_AVM_REVERSE_DELAY:I = 0x6a

.field public static final SERVICE_CMD_AVM_STATUS:I = 0x6c

.field public static final SERVICE_CMD_BASE:I = 0x64

.field public static final SERVICE_CMD_BREAK:I = 0x71

.field public static final SERVICE_CMD_CSI_ERROR:I = 0x67

.field public static final SERVICE_CMD_CSI_PARAMS_CHG:I = 0x69

.field public static final SERVICE_CMD_CSI_REOPEN:I = 0x68

.field public static final SERVICE_CMD_HDMI_ERRSTATUS:I = 0x6b

.field public static final SERVICE_CMD_RADAR_WARNING:I = 0x6e

.field public static final SERVICE_CMD_REVERSE:I = 0x64

.field public static final SERVICE_CMD_SLEEP:I = 0x66

.field public static final SERVICE_CMD_STOP_RADAR_FOCUS:I = 0x6f

.field public static final SERVICE_CMD_STOP_REMOTE_MONITOR:I = 0x70

.field public static final SERVICE_CMD_TRUNLIGHT:I = 0x65

.field public static final SETTING_AUDIO_RECORD:I = 0x3

.field public static final SETTING_AVM_2D_3D_SWITCH_MODE:Ljava/lang/String; = "SETTING_AVM_2D_3D_SWTICH_MODE"

.field public static final SETTING_AVM_ALARM_LIGHT_AUTO:Ljava/lang/String; = "SETTING_AVM_ALARM_LIGHT_AUTO"

.field public static final SETTING_AVM_BOOT_LOOK_AROUND:Ljava/lang/String; = "SETTING_AVM_BOOT_LOOK_AROUND"

.field public static final SETTING_AVM_CAR_MODEL_COLOR:Ljava/lang/String; = "SETTING_AVM_CAR_MODEL_COLOR"

.field public static final SETTING_AVM_CAR_MODEL_SHAPE:Ljava/lang/String; = "SETTING_AVM_CAR_MODEL_SHAPE"

.field public static final SETTING_AVM_CAR_NON_BLACK_BOTTOM:Ljava/lang/String; = "SETTING_AVM_CAR_NON_BLACK_BOTTOM"

.field public static final SETTING_AVM_CAR_PLATE_BG_COLOR:Ljava/lang/String; = "SETTING_AVM_CAR_PLATE_BG_COLOR"

.field public static final SETTING_AVM_CAR_PLATE_FONT_COLOR:Ljava/lang/String; = "SETTING_AVM_CAR_PLATE_FONT_COLOR"

.field public static final SETTING_AVM_CAR_PLATE_NUMBER:Ljava/lang/String; = "SETTING_AVM_CAR_PLATE_NUMBER"

.field public static final SETTING_AVM_CAR_RULER:Ljava/lang/String; = "SETTING_AVM_CAR_RULER"

.field public static final SETTING_AVM_LR_AND_REVERS_DATA:Ljava/lang/String; = "SETTING_AVM_LR_AND_REVERS_DATA"

.field public static final SETTING_AVM_LR_LIGHT_AUTO:Ljava/lang/String; = "SETTING_AVM_LR_LIGHT_AUTO"

.field public static final SETTING_AVM_LR_LIGHT_SPEED:Ljava/lang/String; = "SETTING_AVM_LR_LIGHT_SPEED"

.field public static final SETTING_AVM_REVERSE_TIMEOUT:Ljava/lang/String; = "SETTING_AVM_REVERSE_TIMEOUT"

.field public static final SETTING_AVM_REVERS_AUTO:Ljava/lang/String; = "SETTING_AVM_REVERS_AUTO"

.field public static final SETTING_CAR_ANGLE:I = 0x3

.field public static final SETTING_CAR_COLOR:I = 0x1

.field public static final SETTING_CAR_LENS:I = 0x5

.field public static final SETTING_CAR_MODEL:I = 0x0

.field public static final SETTING_CAR_SENSITIVE:I = 0x4

.field public static final SETTING_CAR_TRACE:I = 0x2

.field public static final SETTING_DELAY_SHUT:I = 0x6

.field public static final SETTING_G_SENSOR:I = 0x4

.field public static final SETTING_LOW_VOL:I = 0x7

.field public static final SETTING_RECORDER_TIME:I = 0x0

.field public static final SETTING_REMOTE_MONITOR:I = 0x2

.field public static final SETTING_SAVE_PATH:I = 0x6

.field public static final SETTING_SAVE_TIME:I = 0x7

.field public static final SETTING_USB_PATH:I = 0x5

.field public static final SETTING_WATER_MASK:I = 0x1

.field public static final SPLITSELECT_FRAGMENT_TYPE:I = 0x4

.field public static final SPLITSETTING_FRAGMENT_TYPE:I = 0x5


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
