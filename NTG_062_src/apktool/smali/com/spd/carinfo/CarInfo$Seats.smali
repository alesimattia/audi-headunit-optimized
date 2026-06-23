.class public final Lcom/spd/carinfo/CarInfo$Seats;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Seats"
.end annotation


# static fields
.field public static final AUTOMATIC_SEAT_COLDING:I = 0x9c49

.field public static final AUTOMATIC_SEAT_HEATING:I = 0x9c48

.field public static final AUTO_MOVE:I = 0x9c51

.field public static final BELT_WARNING:I = 0x9c56

.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final COLD:I = 0x9c42

.field public static final CO_PILOT_SEAT_BELT_STATUS:I = 0x9c54

.field public static final CUSHION:I = 0x9c59

.field public static final DRIVER_SEAT_REMEMBER:I = 0x9c43

.field public static final FRONT_LEFT_WIND_LEVEL:I = 0x9c4e

.field public static final FRONT_RIGHT_WIND_LEVEL:I = 0x9c4f

.field public static final HEATED:I = 0x9c41

.field public static final ID:I = 0x4

.field public static final LAZYBACK:I = 0x9c58

.field public static final LAZYBACK_LEVE:I = 0x9c5a

.field public static final LUMBAR_SUPPORT:I = 0x9c46

.field public static final MASSAGE:I = 0x9c45

.field public static final NET_AUTO_SEAT_HEATING:I = 0x9c4c

.field public static final NET_START_SEAT_BLOW:I = 0x9c4d

.field public static final OFFSET:I = 0x9c40

.field public static final REMOTE_AUTOMATIC_SEAT_COLDING:I = 0x9c4b

.field public static final REMOTE_AUTOMATIC_SEAT_HEATING:I = 0x9c4a

.field public static final REMOTE_REMEMBER:I = 0x9c44

.field public static final REMOTE_START_SEAT_BLOW:I = 0x9c55

.field public static final SAFE_BELT_SPORTS_MODE:I = 0x9c50

.field public static final SALFTY_BELT:I = 0x9c40

.field public static final SEAT_BACK_POSITION_CHANGE:I = 0x9c53

.field public static final SEAT_COMITY:I = 0x9c57

.field public static final SEAT_POSITION_CHANGE:I = 0x9c52


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 794
    const-class v0, Lcom/spd/carinfo/CarInfo$Seats;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$Seats;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 793
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
