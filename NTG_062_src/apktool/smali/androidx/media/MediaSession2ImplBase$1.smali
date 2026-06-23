.class Landroidx/media/MediaSession2ImplBase$1;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Landroidx/media/MediaSession2ImplBase$NotifyRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase;->updatePlayer(Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaPlaylistAgent;Landroidx/media/VolumeProviderCompat;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2ImplBase;

.field final synthetic val$info:Landroidx/media/MediaController2$PlaybackInfo;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaController2$PlaybackInfo;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase;

    .line 205
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$1;->this$0:Landroidx/media/MediaSession2ImplBase;

    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase$1;->val$info:Landroidx/media/MediaController2$PlaybackInfo;

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

    .line 208
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$1;->val$info:Landroidx/media/MediaController2$PlaybackInfo;

    invoke-virtual {p1, v0}, Landroidx/media/MediaSession2$ControllerCb;->onPlaybackInfoChanged(Landroidx/media/MediaController2$PlaybackInfo;)V

    .line 209
    return-void
.end method
