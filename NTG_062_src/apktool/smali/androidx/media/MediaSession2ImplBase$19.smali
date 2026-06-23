.class Landroidx/media/MediaSession2ImplBase$19;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Landroidx/media/MediaSession2ImplBase$NotifyRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase;->notifyPlaylistMetadataChangedOnExecutor(Landroidx/media/MediaPlaylistAgent;Landroidx/media/MediaMetadata2;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2ImplBase;

.field final synthetic val$metadata:Landroidx/media/MediaMetadata2;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaMetadata2;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase;

    .line 1089
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$19;->this$0:Landroidx/media/MediaSession2ImplBase;

    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase$19;->val$metadata:Landroidx/media/MediaMetadata2;

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

    .line 1092
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$19;->val$metadata:Landroidx/media/MediaMetadata2;

    invoke-virtual {p1, v0}, Landroidx/media/MediaSession2$ControllerCb;->onPlaylistMetadataChanged(Landroidx/media/MediaMetadata2;)V

    .line 1093
    return-void
.end method
