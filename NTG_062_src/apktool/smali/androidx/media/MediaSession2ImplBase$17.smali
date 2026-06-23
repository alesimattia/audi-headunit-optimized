.class Landroidx/media/MediaSession2ImplBase$17;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Landroidx/media/MediaSession2ImplBase$NotifyRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase;->notifyPlayerUpdatedNotLocked(Landroidx/media/BaseMediaPlayer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2ImplBase;

.field final synthetic val$speed:F


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase;F)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase;

    .line 1053
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$17;->this$0:Landroidx/media/MediaSession2ImplBase;

    iput p2, p0, Landroidx/media/MediaSession2ImplBase$17;->val$speed:F

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

    .line 1056
    iget v0, p0, Landroidx/media/MediaSession2ImplBase$17;->val$speed:F

    invoke-virtual {p1, v0}, Landroidx/media/MediaSession2$ControllerCb;->onPlaybackSpeedChanged(F)V

    .line 1057
    return-void
.end method
