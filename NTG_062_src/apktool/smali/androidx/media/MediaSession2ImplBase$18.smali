.class Landroidx/media/MediaSession2ImplBase$18;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Landroidx/media/MediaSession2ImplBase$NotifyRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase;->notifyPlaylistChangedOnExecutor(Landroidx/media/MediaPlaylistAgent;Ljava/util/List;Landroidx/media/MediaMetadata2;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2ImplBase;

.field final synthetic val$list:Ljava/util/List;

.field final synthetic val$metadata:Landroidx/media/MediaMetadata2;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase;Ljava/util/List;Landroidx/media/MediaMetadata2;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase;

    .line 1072
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$18;->this$0:Landroidx/media/MediaSession2ImplBase;

    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase$18;->val$list:Ljava/util/List;

    iput-object p3, p0, Landroidx/media/MediaSession2ImplBase$18;->val$metadata:Landroidx/media/MediaMetadata2;

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

    .line 1075
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$18;->val$list:Ljava/util/List;

    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$18;->val$metadata:Landroidx/media/MediaMetadata2;

    invoke-virtual {p1, v0, v1}, Landroidx/media/MediaSession2$ControllerCb;->onPlaylistChanged(Ljava/util/List;Landroidx/media/MediaMetadata2;)V

    .line 1076
    return-void
.end method
