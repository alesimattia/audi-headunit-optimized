.class Landroidx/media/MediaSessionLegacyStub$8;
.super Ljava/lang/Object;
.source "MediaSessionLegacyStub.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSessionLegacyStub;->disconnect(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSessionLegacyStub;

.field final synthetic val$controllerInfo:Landroidx/media/MediaSession2$ControllerInfo;


# direct methods
.method constructor <init>(Landroidx/media/MediaSessionLegacyStub;Landroidx/media/MediaSession2$ControllerInfo;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSessionLegacyStub;

    .line 399
    iput-object p1, p0, Landroidx/media/MediaSessionLegacyStub$8;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iput-object p2, p0, Landroidx/media/MediaSessionLegacyStub$8;->val$controllerInfo:Landroidx/media/MediaSession2$ControllerInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 402
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub$8;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v0, v0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 403
    return-void

    .line 405
    :cond_0
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub$8;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v0, v0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$8;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v1, v1, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaSessionLegacyStub$8;->val$controllerInfo:Landroidx/media/MediaSession2$ControllerInfo;

    invoke-virtual {v0, v1, v2}, Landroidx/media/MediaSession2$SessionCallback;->onDisconnected(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;)V

    .line 406
    return-void
.end method
