.class Landroidx/media/MediaSession2ImplBase$15;
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

.field final synthetic val$playerState:I


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase;I)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase;

    .line 1035
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$15;->this$0:Landroidx/media/MediaSession2ImplBase;

    iput p2, p0, Landroidx/media/MediaSession2ImplBase$15;->val$playerState:I

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

    .line 1038
    iget v0, p0, Landroidx/media/MediaSession2ImplBase$15;->val$playerState:I

    invoke-virtual {p1, v0}, Landroidx/media/MediaSession2$ControllerCb;->onPlayerStateChanged(I)V

    .line 1039
    return-void
.end method
