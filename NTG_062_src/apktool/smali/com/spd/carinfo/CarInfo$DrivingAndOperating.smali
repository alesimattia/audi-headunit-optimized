.class public final Lcom/spd/carinfo/CarInfo$DrivingAndOperating;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DrivingAndOperating"
.end annotation


# static fields
.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final ID:I = 0xd

.field public static final OFFSET:I = 0x1fbd0


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 2874
    const-class v0, Lcom/spd/carinfo/CarInfo$DrivingAndOperating;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$DrivingAndOperating;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 2873
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
