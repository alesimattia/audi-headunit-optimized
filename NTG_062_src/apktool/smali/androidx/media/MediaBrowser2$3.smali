.class Landroidx/media/MediaBrowser2$3;
.super Landroid/support/v4/media/MediaBrowserCompat$ItemCallback;
.source "MediaBrowser2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaBrowser2;->getItem(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaBrowser2;

.field final synthetic val$mediaId:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroidx/media/MediaBrowser2;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaBrowser2;

    .line 322
    iput-object p1, p0, Landroidx/media/MediaBrowser2$3;->this$0:Landroidx/media/MediaBrowser2;

    iput-object p2, p0, Landroidx/media/MediaBrowser2$3;->val$mediaId:Ljava/lang/String;

    invoke-direct {p0}, Landroid/support/v4/media/MediaBrowserCompat$ItemCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/String;)V
    .locals 2
    .param p1, "itemId"    # Ljava/lang/String;

    .line 336
    iget-object v0, p0, Landroidx/media/MediaBrowser2$3;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v0}, Landroidx/media/MediaBrowser2;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroidx/media/MediaBrowser2$3$2;

    invoke-direct {v1, p0}, Landroidx/media/MediaBrowser2$3$2;-><init>(Landroidx/media/MediaBrowser2$3;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 342
    return-void
.end method

.method public onItemLoaded(Landroid/support/v4/media/MediaBrowserCompat$MediaItem;)V
    .locals 2
    .param p1, "item"    # Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    .line 325
    iget-object v0, p0, Landroidx/media/MediaBrowser2$3;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v0}, Landroidx/media/MediaBrowser2;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroidx/media/MediaBrowser2$3$1;

    invoke-direct {v1, p0, p1}, Landroidx/media/MediaBrowser2$3$1;-><init>(Landroidx/media/MediaBrowser2$3;Landroid/support/v4/media/MediaBrowserCompat$MediaItem;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 332
    return-void
.end method
