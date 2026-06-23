.class Landroidx/media/MediaBrowser2$5;
.super Landroid/support/v4/media/MediaBrowserCompat$SearchCallback;
.source "MediaBrowser2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaBrowser2;->getSearchResult(Ljava/lang/String;IILandroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaBrowser2;

.field final synthetic val$extras:Landroid/os/Bundle;

.field final synthetic val$page:I

.field final synthetic val$pageSize:I


# direct methods
.method constructor <init>(Landroidx/media/MediaBrowser2;IILandroid/os/Bundle;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaBrowser2;

    .line 399
    iput-object p1, p0, Landroidx/media/MediaBrowser2$5;->this$0:Landroidx/media/MediaBrowser2;

    iput p2, p0, Landroidx/media/MediaBrowser2$5;->val$page:I

    iput p3, p0, Landroidx/media/MediaBrowser2$5;->val$pageSize:I

    iput-object p4, p0, Landroidx/media/MediaBrowser2$5;->val$extras:Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/support/v4/media/MediaBrowserCompat$SearchCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "extrasSent"    # Landroid/os/Bundle;

    .line 415
    iget-object v0, p0, Landroidx/media/MediaBrowser2$5;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v0}, Landroidx/media/MediaBrowser2;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroidx/media/MediaBrowser2$5$2;

    invoke-direct {v1, p0, p1}, Landroidx/media/MediaBrowser2$5$2;-><init>(Landroidx/media/MediaBrowser2$5;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 422
    return-void
.end method

.method public onSearchResult(Ljava/lang/String;Landroid/os/Bundle;Ljava/util/List;)V
    .locals 2
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "extrasSent"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;)V"
        }
    .end annotation

    .line 403
    .local p3, "items":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/media/MediaBrowserCompat$MediaItem;>;"
    iget-object v0, p0, Landroidx/media/MediaBrowser2$5;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v0}, Landroidx/media/MediaBrowser2;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroidx/media/MediaBrowser2$5$1;

    invoke-direct {v1, p0, p3, p1}, Landroidx/media/MediaBrowser2$5$1;-><init>(Landroidx/media/MediaBrowser2$5;Ljava/util/List;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 411
    return-void
.end method
