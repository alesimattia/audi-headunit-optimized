.class public final Lcom/spd/carinfo/CarInfo$Windows;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Windows"
.end annotation


# static fields
.field public static final ANTI_PINCH_WARNING:I = 0xea65

.field public static final AUTO_CLOSE_SUN_BLIND_BY_LOCK:I = 0xea67

.field public static final AUTO_CLOSE_WINDOWS_BY_LOCK:I = 0xea66

.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final FRONT:I = 0xea63

.field public static final FRONT_LEFT:I = 0xea6b

.field public static final FRONT_RIGHT:I = 0xea6a

.field public static final ID:I = 0x6

.field public static final OFFSET:I = 0xea60

.field public static final QUICK_OPEN:I = 0xea62

.field public static final RAINING_AUTO_CLOSE_WINDOWS:I = 0xea6f

.field public static final REAR:I = 0xea64

.field public static final REAR_LEFT:I = 0xea6d

.field public static final REAR_RIGHT:I = 0xea6c

.field public static final REMOTE_CLOSE_MODE:I = 0xea6e

.field public static final SUNROOF:I = 0xea61

.field public static final VENTILATE_MODE:I = 0xea68

.field public static final WINDOW_CONTROL:I = 0xea69


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 886
    const-class v0, Lcom/spd/carinfo/CarInfo$Windows;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$Windows;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 885
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
