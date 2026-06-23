.class public final Lcom/spd/carinfo/CarInfo$Other;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Other"
.end annotation


# static fields
.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final ID:I = 0x13

.field public static final OFFSET:I = 0x2e630

.field public static final RELEASE_AUDIO_FOCUS:I = 0x2e633

.field public static final REQUEST_AUDIO_FOCUS:I = 0x2e632

.field public static final RUI_POWER_MODE:I = 0x2e631


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 3139
    const-class v0, Lcom/spd/carinfo/CarInfo$Other;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$Other;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 3138
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
