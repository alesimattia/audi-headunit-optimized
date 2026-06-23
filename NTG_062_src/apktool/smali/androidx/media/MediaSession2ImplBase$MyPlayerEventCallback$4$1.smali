.class Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4$1;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Landroidx/media/MediaSession2ImplBase$NotifyRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;

.field final synthetic val$item:Landroidx/media/MediaItem2;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;Landroidx/media/MediaItem2;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;

    .line 1318
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4$1;->this$1:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;

    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4$1;->val$item:Landroidx/media/MediaItem2;

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

    .line 1321
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4$1;->val$item:Landroidx/media/MediaItem2;

    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4$1;->this$1:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;

    iget v1, v1, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;->val$state:I

    invoke-virtual {p1, v0, v1}, Landroidx/media/MediaSession2$ControllerCb;->onBufferingStateChanged(Landroidx/media/MediaItem2;I)V

    .line 1322
    return-void
.end method
