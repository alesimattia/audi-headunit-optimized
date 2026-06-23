.class Landroidx/media/MediaBrowser2$3$1;
.super Ljava/lang/Object;
.source "MediaBrowser2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaBrowser2$3;->onItemLoaded(Landroid/support/v4/media/MediaBrowserCompat$MediaItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaBrowser2$3;

.field final synthetic val$item:Landroid/support/v4/media/MediaBrowserCompat$MediaItem;


# direct methods
.method constructor <init>(Landroidx/media/MediaBrowser2$3;Landroid/support/v4/media/MediaBrowserCompat$MediaItem;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaBrowser2$3;

    .line 325
    iput-object p1, p0, Landroidx/media/MediaBrowser2$3$1;->this$1:Landroidx/media/MediaBrowser2$3;

    iput-object p2, p0, Landroidx/media/MediaBrowser2$3$1;->val$item:Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 328
    iget-object v0, p0, Landroidx/media/MediaBrowser2$3$1;->this$1:Landroidx/media/MediaBrowser2$3;

    iget-object v0, v0, Landroidx/media/MediaBrowser2$3;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v0}, Landroidx/media/MediaBrowser2;->getCallback()Landroidx/media/MediaBrowser2$BrowserCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaBrowser2$3$1;->this$1:Landroidx/media/MediaBrowser2$3;

    iget-object v1, v1, Landroidx/media/MediaBrowser2$3;->this$0:Landroidx/media/MediaBrowser2;

    iget-object v2, p0, Landroidx/media/MediaBrowser2$3$1;->this$1:Landroidx/media/MediaBrowser2$3;

    iget-object v2, v2, Landroidx/media/MediaBrowser2$3;->val$mediaId:Ljava/lang/String;

    iget-object v3, p0, Landroidx/media/MediaBrowser2$3$1;->val$item:Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    .line 329
    invoke-static {v3}, Landroidx/media/MediaUtils2;->createMediaItem2(Landroid/support/v4/media/MediaBrowserCompat$MediaItem;)Landroidx/media/MediaItem2;

    move-result-object v3

    .line 328
    invoke-virtual {v0, v1, v2, v3}, Landroidx/media/MediaBrowser2$BrowserCallback;->onGetItemDone(Landroidx/media/MediaBrowser2;Ljava/lang/String;Landroidx/media/MediaItem2;)V

    .line 330
    return-void
.end method
