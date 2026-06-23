.class Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3$1;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Landroidx/media/MediaSession2ImplBase$NotifyRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;

    .line 1292
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3$1;->this$1:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;

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

    .line 1295
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3$1;->this$1:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;

    iget v0, v0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;->val$state:I

    invoke-virtual {p1, v0}, Landroidx/media/MediaSession2$ControllerCb;->onPlayerStateChanged(I)V

    .line 1296
    return-void
.end method
