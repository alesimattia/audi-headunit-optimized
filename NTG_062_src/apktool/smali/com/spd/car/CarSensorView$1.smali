.class Lcom/spd/car/CarSensorView$1;
.super Ljava/lang/Object;
.source "CarSensorView.java"

# Runnable ticker: chiama CarSensorView.refresh() e si ri-posta a 300 ms finche sRunning.

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/car/CarSensorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    invoke-static {}, Lcom/spd/car/CarSensorView;->refresh()V

    sget-boolean v0, Lcom/spd/car/CarSensorView;->sRunning:Z

    if-eqz v0, :cond_stop

    sget-object v0, Lcom/spd/car/CarSensorView;->sHandler:Landroid/os/Handler;

    if-eqz v0, :cond_stop

    const-wide/16 v1, 0x12c       # 300 ms

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_stop
    return-void
.end method
