.class Landroidx/media/MediaSession2ImplBase$9;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Landroidx/media/MediaSession2ImplBase$NotifyRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase;->notifySearchResultChanged(Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;ILandroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2ImplBase;

.field final synthetic val$extras:Landroid/os/Bundle;

.field final synthetic val$itemCount:I

.field final synthetic val$query:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase;Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase;

    .line 864
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$9;->this$0:Landroidx/media/MediaSession2ImplBase;

    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase$9;->val$query:Ljava/lang/String;

    iput p3, p0, Landroidx/media/MediaSession2ImplBase$9;->val$itemCount:I

    iput-object p4, p0, Landroidx/media/MediaSession2ImplBase$9;->val$extras:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Landroidx/media/MediaSession2$ControllerCb;)V
    .locals 3
    .param p1, "callback"    # Landroidx/media/MediaSession2$ControllerCb;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 867
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$9;->val$query:Ljava/lang/String;

    iget v1, p0, Landroidx/media/MediaSession2ImplBase$9;->val$itemCount:I

    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase$9;->val$extras:Landroid/os/Bundle;

    invoke-virtual {p1, v0, v1, v2}, Landroidx/media/MediaSession2$ControllerCb;->onSearchResultChanged(Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 868
    return-void
.end method
