.class Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1;
.super Landroid/os/ResultReceiver;
.source "MediaController2ImplBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->onSessionReady()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;


# direct methods
.method constructor <init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Landroid/os/Handler;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;
    .param p2, "x0"    # Landroid/os/Handler;

    .line 987
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    invoke-direct {p0, p2}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 3
    .param p1, "resultCode"    # I
    .param p2, "resultData"    # Landroid/os/Bundle;

    .line 990
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v0, v0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaController2ImplBase;->access$300(Landroidx/media/MediaController2ImplBase;)Landroid/os/HandlerThread;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 991
    return-void

    .line 993
    :cond_0
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 995
    :pswitch_0
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v0, v0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 996
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v1, v1, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$1300(Landroidx/media/MediaController2ImplBase;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 997
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v1, v1, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/media/MediaController2ImplBase;->access$1400(Landroidx/media/MediaController2ImplBase;Z)V

    .line 998
    monitor-exit v0

    return-void

    .line 1000
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1001
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v0, v0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-virtual {v0, p2}, Landroidx/media/MediaController2ImplBase;->onConnectedNotLocked(Landroid/os/Bundle;)V

    .line 1002
    goto :goto_0

    .line 1000
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 1004
    :pswitch_1
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v0, v0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 1005
    :try_start_2
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v1, v1, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$1300(Landroidx/media/MediaController2ImplBase;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1006
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v1, v1, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroidx/media/MediaController2ImplBase;->access$1400(Landroidx/media/MediaController2ImplBase;Z)V

    .line 1008
    monitor-exit v0

    return-void

    .line 1010
    :cond_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1011
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v0, v0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1$1;

    invoke-direct {v1, p0}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1$1;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1017
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v0, v0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-virtual {v0}, Landroidx/media/MediaController2ImplBase;->close()V

    goto :goto_0

    .line 1010
    :catchall_1
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v1

    .line 1020
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
