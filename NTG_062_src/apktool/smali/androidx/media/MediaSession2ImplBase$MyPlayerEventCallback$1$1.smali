.class Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1$1;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Landroidx/media/MediaSession2ImplBase$NotifyRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;

.field final synthetic val$item:Landroidx/media/MediaItem2;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;Landroidx/media/MediaItem2;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;

    .line 1205
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1$1;->this$1:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;

    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1$1;->val$item:Landroidx/media/MediaItem2;

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

    .line 1208
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1$1;->val$item:Landroidx/media/MediaItem2;

    invoke-virtual {p1, v0}, Landroidx/media/MediaSession2$ControllerCb;->onCurrentMediaItemChanged(Landroidx/media/MediaItem2;)V

    .line 1209
    return-void
.end method
