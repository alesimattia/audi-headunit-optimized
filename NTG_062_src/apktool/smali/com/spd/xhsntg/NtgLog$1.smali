.class Lcom/spd/xhsntg/NtgLog$1;
.super Landroid/os/Handler;
.source "NtgLog.java"

# Handler sul thread di background (HandlerThread "NtgLog"): delega la scrittura a NtgLog.handle.


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/xhsntg/NtgLog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>(Landroid/os/Looper;)V
    .locals 0
    .param p1, "looper"    # Landroid/os/Looper;

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 0
    .param p1, "msg"    # Landroid/os/Message;

    invoke-static {p1}, Lcom/spd/xhsntg/NtgLog;->handle(Landroid/os/Message;)V

    return-void
.end method
