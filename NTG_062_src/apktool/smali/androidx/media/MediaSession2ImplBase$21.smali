.class Landroidx/media/MediaSession2ImplBase$21;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Landroidx/media/MediaSession2ImplBase$NotifyRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase;->notifyShuffleModeChangedOnExecutor(Landroidx/media/MediaPlaylistAgent;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2ImplBase;

.field final synthetic val$shuffleMode:I


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase;I)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase;

    .line 1123
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$21;->this$0:Landroidx/media/MediaSession2ImplBase;

    iput p2, p0, Landroidx/media/MediaSession2ImplBase$21;->val$shuffleMode:I

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

    .line 1126
    iget v0, p0, Landroidx/media/MediaSession2ImplBase$21;->val$shuffleMode:I

    invoke-virtual {p1, v0}, Landroidx/media/MediaSession2$ControllerCb;->onShuffleModeChanged(I)V

    .line 1127
    return-void
.end method
