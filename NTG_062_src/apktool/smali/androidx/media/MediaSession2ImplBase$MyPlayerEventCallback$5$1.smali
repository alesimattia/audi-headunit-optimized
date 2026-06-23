.class Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$5$1;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Landroidx/media/MediaSession2ImplBase$NotifyRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$5;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$5;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$5;

    .line 1338
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$5$1;->this$1:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Landroidx/media/MediaSession2$ControllerCb;)V
    .locals 1
    .param p1, "callback"    # Landroidx/media/MediaSession2$ControllerCb;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1341
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$5$1;->this$1:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$5;

    iget v0, v0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$5;->val$speed:F

    invoke-virtual {p1, v0}, Landroidx/media/MediaSession2$ControllerCb;->onPlaybackSpeedChanged(F)V

    .line 1342
    return-void
.end method
