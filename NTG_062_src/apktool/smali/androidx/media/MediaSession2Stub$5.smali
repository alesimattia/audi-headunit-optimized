.class Landroidx/media/MediaSession2Stub$5;
.super Ljava/lang/Object;
.source "MediaSession2Stub.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2Stub;->disconnect(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2Stub;

.field final synthetic val$controllerInfo:Landroidx/media/MediaSession2$ControllerInfo;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2Stub;Landroidx/media/MediaSession2$ControllerInfo;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2Stub;

    .line 613
    iput-object p1, p0, Landroidx/media/MediaSession2Stub$5;->this$0:Landroidx/media/MediaSession2Stub;

    iput-object p2, p0, Landroidx/media/MediaSession2Stub$5;->val$controllerInfo:Landroidx/media/MediaSession2$ControllerInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 616
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$5;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v0, v0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 617
    return-void

    .line 619
    :cond_0
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$5;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v0, v0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaSession2Stub$5;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v1, v1, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaSession2Stub$5;->val$controllerInfo:Landroidx/media/MediaSession2$ControllerInfo;

    invoke-virtual {v0, v1, v2}, Landroidx/media/MediaSession2$SessionCallback;->onDisconnected(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;)V

    .line 620
    return-void
.end method
