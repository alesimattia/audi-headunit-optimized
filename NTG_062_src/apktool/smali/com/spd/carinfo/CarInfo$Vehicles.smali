.class public final Lcom/spd/carinfo/CarInfo$Vehicles;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Vehicles"
.end annotation


# static fields
.field public static final ALL_CANBOX:I = 0x29811

.field public static final ALL_MAKE:I = 0x29812

.field public static final ALL_MODEL:I = 0x29813

.field public static final CARINFO_SETTINGS_ENABLED:I = 0x29815

.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final CURRENT_MODEL:I = 0x29814

.field public static final ID:I = 0x11

.field public static final OFFSET:I = 0x29810


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 3088
    const-class v0, Lcom/spd/carinfo/CarInfo$Vehicles;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$Vehicles;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 3087
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
