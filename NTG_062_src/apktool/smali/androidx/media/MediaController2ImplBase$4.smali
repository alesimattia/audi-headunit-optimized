.class Landroidx/media/MediaController2ImplBase$4;
.super Landroid/os/ResultReceiver;
.source "MediaController2ImplBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaController2ImplBase;->connectToSession(Landroid/support/v4/media/session/MediaSessionCompat$Token;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaController2ImplBase;


# direct methods
.method constructor <init>(Landroidx/media/MediaController2ImplBase;Landroid/os/Handler;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaController2ImplBase;
    .param p2, "x0"    # Landroid/os/Handler;

    .line 886
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase$4;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-direct {p0, p2}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 2
    .param p1, "resultCode"    # I
    .param p2, "resultData"    # Landroid/os/Bundle;

    .line 889
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$4;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaController2ImplBase;->access$300(Landroidx/media/MediaController2ImplBase;)Landroid/os/HandlerThread;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 890
    return-void

    .line 892
    :cond_0
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 894
    :pswitch_0
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$4;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-virtual {v0, p2}, Landroidx/media/MediaController2ImplBase;->onConnectedNotLocked(Landroid/os/Bundle;)V

    .line 895
    goto :goto_0

    .line 897
    :pswitch_1
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$4;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroidx/media/MediaController2ImplBase$4$1;

    invoke-direct {v1, p0}, Landroidx/media/MediaController2ImplBase$4$1;-><init>(Landroidx/media/MediaController2ImplBase$4;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 903
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$4;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-virtual {v0}, Landroidx/media/MediaController2ImplBase;->close()V

    .line 906
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
