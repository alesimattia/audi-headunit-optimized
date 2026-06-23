.class public final Lcom/spd/carinfo/CarInfo$Keys;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Keys"
.end annotation


# static fields
.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final ID:I = 0x2

.field public static final KEY_IN:I = 0x4e21

.field public static final OFFSET:I = 0x4e20


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 686
    const-class v0, Lcom/spd/carinfo/CarInfo$Keys;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$Keys;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 685
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
