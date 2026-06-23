.class Landroidx/media/MediaBrowser2$2;
.super Ljava/lang/Object;
.source "MediaBrowser2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaBrowser2;->getLibraryRoot(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaBrowser2;

.field final synthetic val$extras:Landroid/os/Bundle;


# direct methods
.method constructor <init>(Landroidx/media/MediaBrowser2;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaBrowser2;

    .line 203
    iput-object p1, p0, Landroidx/media/MediaBrowser2$2;->this$0:Landroidx/media/MediaBrowser2;

    iput-object p2, p0, Landroidx/media/MediaBrowser2$2;->val$extras:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 208
    new-instance v0, Landroid/support/v4/media/MediaBrowserCompat;

    iget-object v1, p0, Landroidx/media/MediaBrowser2$2;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v1}, Landroidx/media/MediaBrowser2;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaBrowser2$2;->this$0:Landroidx/media/MediaBrowser2;

    .line 209
    invoke-virtual {v2}, Landroidx/media/MediaBrowser2;->getSessionToken()Landroidx/media/SessionToken2;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/media/SessionToken2;->getComponentName()Landroid/content/ComponentName;

    move-result-object v2

    new-instance v3, Landroidx/media/MediaBrowser2$GetLibraryRootCallback;

    iget-object v4, p0, Landroidx/media/MediaBrowser2$2;->this$0:Landroidx/media/MediaBrowser2;

    iget-object v5, p0, Landroidx/media/MediaBrowser2$2;->val$extras:Landroid/os/Bundle;

    invoke-direct {v3, v4, v5}, Landroidx/media/MediaBrowser2$GetLibraryRootCallback;-><init>(Landroidx/media/MediaBrowser2;Landroid/os/Bundle;)V

    iget-object v4, p0, Landroidx/media/MediaBrowser2$2;->val$extras:Landroid/os/Bundle;

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/support/v4/media/MediaBrowserCompat;-><init>(Landroid/content/Context;Landroid/content/ComponentName;Landroid/support/v4/media/MediaBrowserCompat$ConnectionCallback;Landroid/os/Bundle;)V

    .line 211
    .local v0, "newBrowser":Landroid/support/v4/media/MediaBrowserCompat;
    iget-object v1, p0, Landroidx/media/MediaBrowser2$2;->this$0:Landroidx/media/MediaBrowser2;

    invoke-static {v1}, Landroidx/media/MediaBrowser2;->access$000(Landroidx/media/MediaBrowser2;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 212
    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaBrowser2$2;->this$0:Landroidx/media/MediaBrowser2;

    invoke-static {v2}, Landroidx/media/MediaBrowser2;->access$100(Landroidx/media/MediaBrowser2;)Ljava/util/HashMap;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaBrowser2$2;->val$extras:Landroid/os/Bundle;

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 214
    invoke-virtual {v0}, Landroid/support/v4/media/MediaBrowserCompat;->connect()V

    .line 215
    return-void

    .line 213
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method
