.class Landroidx/media/MediaSession2ImplBase$16;
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

.field final synthetic val$bufferingState:I

.field final synthetic val$item:Landroidx/media/MediaItem2;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaItem2;I)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase;

    .line 1044
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$16;->this$0:Landroidx/media/MediaSession2ImplBase;

    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase$16;->val$item:Landroidx/media/MediaItem2;

    iput p3, p0, Landroidx/media/MediaSession2ImplBase$16;->val$bufferingState:I

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

    .line 1047
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$16;->val$item:Landroidx/media/MediaItem2;

    iget v1, p0, Landroidx/media/MediaSession2ImplBase$16;->val$bufferingState:I

    invoke-virtual {p1, v0, v1}, Landroidx/media/MediaSession2$ControllerCb;->onBufferingStateChanged(Landroidx/media/MediaItem2;I)V

    .line 1048
    return-void
.end method
