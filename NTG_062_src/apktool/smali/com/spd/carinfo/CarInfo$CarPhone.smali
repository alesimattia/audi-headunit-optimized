.class public final Lcom/spd/carinfo/CarInfo$CarPhone;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CarPhone"
.end annotation


# static fields
.field public static final BT_PAIR_PASSWORD:I = 0x2bf2f

.field public static final BT_PHONE_NAME:I = 0x2bf30

.field public static final CALL_TIME_CHANGED:I = 0x2bf27

.field public static final CAR_PHONE_MIC_MUTE:I = 0x2bf25

.field public static final CAR_PHONE_NUMBER:I = 0x2bf22

.field public static final CAR_PHONE_SEND_CDMT:I = 0x2bf23

.field public static final CAR_PHONE_STATUS:I = 0x2bf21

.field public static final CAR_PHONE_TYPE:I = 0x2bf24

.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final ID:I = 0x12

.field public static final OFFSET:I = 0x2bf20

.field public static final ONSTAR_CALL_VALID_DATE_CHANGED:I = 0x2bf29

.field public static final ONSTAR_CONTROL_COMMAND:I = 0x2bf31

.field public static final ONSTAR_LOCAL_NUMBER:I = 0x2bf2e

.field public static final ONSTAR_OUTBOUND_NUMBER:I = 0x2bf32

.field public static final ONSTAR_REMAINDER_TIME:I = 0x2bf28

.field public static final ONSTAR_STATUS:I = 0x2bf33

.field public static final ONSTAR_TTS_INFO:I = 0x2bf2d

.field public static final ONSTAR_WARN_INFO:I = 0x2bf2b

.field public static final ONSTAR_WARN_STATUS:I = 0x2bf2a

.field public static final PHONE_CAR_ACCEPT:I = 0x2

.field public static final PHONE_CAR_CLOSE:I = 0x0

.field public static final PHONE_CAR_HANGUP:I = 0x3

.field public static final PHONE_CAR_START:I = 0x1

.field public static final PHONE_STATUS_DAILING:I = 0x3

.field public static final PHONE_STATUS_INCOMING:I = 0x2

.field public static final PHONE_STATUS_OFF:I = 0x0

.field public static final PHONE_STATUS_ON:I = 0x1

.field public static final PHONE_STATUS_TALKING:I = 0x4

.field public static final RX_ONSTAR_NUMBER:I = 0x2bf2c

.field public static final TRULY_CALL_COMMING:I = 0x2bf26


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 3101
    const-class v0, Lcom/spd/carinfo/CarInfo$CarPhone;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$CarPhone;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 3100
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
