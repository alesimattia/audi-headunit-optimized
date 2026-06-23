.class Landroidx/media/MediaSession2ImplBase$10;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Landroidx/media/MediaSession2ImplBase$NotifyRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase;->notifyAgentUpdatedNotLocked(Landroidx/media/MediaPlaylistAgent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2ImplBase;

.field final synthetic val$newPlaylist:Ljava/util/List;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase;Ljava/util/List;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase;

    .line 982
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$10;->this$0:Landroidx/media/MediaSession2ImplBase;

    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase$10;->val$newPlaylist:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Landroidx/media/MediaSession2$ControllerCb;)V
    .locals 2
    .param p1, "callback"    # Landroidx/media/MediaSession2$ControllerCb;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 985
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$10;->val$newPlaylist:Ljava/util/List;

    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$10;->this$0:Landroidx/media/MediaSession2ImplBase;

    .line 986
    invoke-virtual {v1}, Landroidx/media/MediaSession2ImplBase;->getPlaylistMetadata()Landroidx/media/MediaMetadata2;

    move-result-object v1

    .line 985
    invoke-virtual {p1, v0, v1}, Landroidx/media/MediaSession2$ControllerCb;->onPlaylistChanged(Ljava/util/List;Landroidx/media/MediaMetadata2;)V

    .line 987
    return-void
.end method
