.class Landroidx/media/MediaSession2Stub$2;
.super Ljava/lang/Object;
.source "MediaSession2Stub.java"

# interfaces
.implements Landroidx/media/MediaSession2Stub$Session2Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2Stub;->onCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2Stub;

.field final synthetic val$args:Landroid/os/Bundle;

.field final synthetic val$cb:Landroid/os/ResultReceiver;

.field final synthetic val$customCommand:Landroidx/media/SessionCommand2;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2Stub;Landroidx/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2Stub;

    .line 399
    iput-object p1, p0, Landroidx/media/MediaSession2Stub$2;->this$0:Landroidx/media/MediaSession2Stub;

    iput-object p2, p0, Landroidx/media/MediaSession2Stub$2;->val$customCommand:Landroidx/media/SessionCommand2;

    iput-object p3, p0, Landroidx/media/MediaSession2Stub$2;->val$args:Landroid/os/Bundle;

    iput-object p4, p0, Landroidx/media/MediaSession2Stub$2;->val$cb:Landroid/os/ResultReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Landroidx/media/MediaSession2$ControllerInfo;)V
    .locals 7
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 402
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$2;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v0, v0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v1

    iget-object v0, p0, Landroidx/media/MediaSession2Stub$2;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v0, v0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 403
    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v2

    iget-object v4, p0, Landroidx/media/MediaSession2Stub$2;->val$customCommand:Landroidx/media/SessionCommand2;

    iget-object v5, p0, Landroidx/media/MediaSession2Stub$2;->val$args:Landroid/os/Bundle;

    iget-object v6, p0, Landroidx/media/MediaSession2Stub$2;->val$cb:Landroid/os/ResultReceiver;

    .line 402
    move-object v3, p1

    invoke-virtual/range {v1 .. v6}, Landroidx/media/MediaSession2$SessionCallback;->onCustomCommand(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    .line 404
    return-void
.end method
