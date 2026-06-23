.class Landroidx/media/MediaBrowser2$GetLibraryRootCallback$1;
.super Ljava/lang/Object;
.source "MediaBrowser2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaBrowser2$GetLibraryRootCallback;->onConnected()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaBrowser2$GetLibraryRootCallback;


# direct methods
.method constructor <init>(Landroidx/media/MediaBrowser2$GetLibraryRootCallback;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaBrowser2$GetLibraryRootCallback;

    .line 461
    iput-object p1, p0, Landroidx/media/MediaBrowser2$GetLibraryRootCallback$1;->this$1:Landroidx/media/MediaBrowser2$GetLibraryRootCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 465
    iget-object v0, p0, Landroidx/media/MediaBrowser2$GetLibraryRootCallback$1;->this$1:Landroidx/media/MediaBrowser2$GetLibraryRootCallback;

    iget-object v0, v0, Landroidx/media/MediaBrowser2$GetLibraryRootCallback;->this$0:Landroidx/media/MediaBrowser2;

    invoke-static {v0}, Landroidx/media/MediaBrowser2;->access$000(Landroidx/media/MediaBrowser2;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 466
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaBrowser2$GetLibraryRootCallback$1;->this$1:Landroidx/media/MediaBrowser2$GetLibraryRootCallback;

    iget-object v2, v2, Landroidx/media/MediaBrowser2$GetLibraryRootCallback;->this$0:Landroidx/media/MediaBrowser2;

    invoke-static {v2}, Landroidx/media/MediaBrowser2;->access$100(Landroidx/media/MediaBrowser2;)Ljava/util/HashMap;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaBrowser2$GetLibraryRootCallback$1;->this$1:Landroidx/media/MediaBrowser2$GetLibraryRootCallback;

    invoke-static {v3}, Landroidx/media/MediaBrowser2$GetLibraryRootCallback;->access$300(Landroidx/media/MediaBrowser2$GetLibraryRootCallback;)Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/media/MediaBrowserCompat;

    move-object v1, v2

    .line 467
    .local v1, "browser":Landroid/support/v4/media/MediaBrowserCompat;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 468
    if-nez v1, :cond_0

    .line 470
    return-void

    .line 472
    :cond_0
    iget-object v0, p0, Landroidx/media/MediaBrowser2$GetLibraryRootCallback$1;->this$1:Landroidx/media/MediaBrowser2$GetLibraryRootCallback;

    iget-object v0, v0, Landroidx/media/MediaBrowser2$GetLibraryRootCallback;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v0}, Landroidx/media/MediaBrowser2;->getCallback()Landroidx/media/MediaBrowser2$BrowserCallback;

    move-result-object v0

    iget-object v2, p0, Landroidx/media/MediaBrowser2$GetLibraryRootCallback$1;->this$1:Landroidx/media/MediaBrowser2$GetLibraryRootCallback;

    iget-object v2, v2, Landroidx/media/MediaBrowser2$GetLibraryRootCallback;->this$0:Landroidx/media/MediaBrowser2;

    iget-object v3, p0, Landroidx/media/MediaBrowser2$GetLibraryRootCallback$1;->this$1:Landroidx/media/MediaBrowser2$GetLibraryRootCallback;

    .line 473
    invoke-static {v3}, Landroidx/media/MediaBrowser2$GetLibraryRootCallback;->access$300(Landroidx/media/MediaBrowser2$GetLibraryRootCallback;)Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v4/media/MediaBrowserCompat;->getRoot()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Landroid/support/v4/media/MediaBrowserCompat;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    .line 472
    invoke-virtual {v0, v2, v3, v4, v5}, Landroidx/media/MediaBrowser2$BrowserCallback;->onGetLibraryRootDone(Landroidx/media/MediaBrowser2;Landroid/os/Bundle;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 474
    return-void

    .line 467
    .end local v1    # "browser":Landroid/support/v4/media/MediaBrowserCompat;
    :catchall_0
    move-exception v2

    .restart local v1    # "browser":Landroid/support/v4/media/MediaBrowserCompat;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method
