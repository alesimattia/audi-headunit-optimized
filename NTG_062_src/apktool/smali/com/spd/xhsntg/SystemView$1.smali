.class Lcom/spd/xhsntg/SystemView$1;
.super Ljava/lang/Object;
.source "SystemView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/xhsntg/SystemView;
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

# Aggiorna le righe e, se ancora attivo, si ri-posta dopo 1 s.
.method public run()V
    .locals 4

    invoke-static {}, Lcom/spd/xhsntg/SystemView;->refresh()V

    sget-boolean v0, Lcom/spd/xhsntg/SystemView;->sRunning:Z

    if-eqz v0, :cond_end

    sget-object v0, Lcom/spd/xhsntg/SystemView;->sHandler:Landroid/os/Handler;

    if-eqz v0, :cond_end

    sget-object v1, Lcom/spd/xhsntg/SystemView;->sTicker:Ljava/lang/Runnable;

    const-wide/16 v2, 0x3e8        # 1000 ms

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_end
    return-void
.end method
