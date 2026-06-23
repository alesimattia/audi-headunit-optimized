.class public Lcom/spd/dvr/utils/AvmConfig;
.super Ljava/lang/Object;
.source "AvmConfig.java"


# instance fields
.field private Fixed:Lcom/spd/dvr/utils/Fixed;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFixed()Lcom/spd/dvr/utils/Fixed;
    .locals 1

    .line 8
    iget-object v0, p0, Lcom/spd/dvr/utils/AvmConfig;->Fixed:Lcom/spd/dvr/utils/Fixed;

    return-object v0
.end method

.method public setFixed(Lcom/spd/dvr/utils/Fixed;)V
    .locals 0
    .param p1, "fixed"    # Lcom/spd/dvr/utils/Fixed;

    .line 12
    iput-object p1, p0, Lcom/spd/dvr/utils/AvmConfig;->Fixed:Lcom/spd/dvr/utils/Fixed;

    .line 13
    return-void
.end method
