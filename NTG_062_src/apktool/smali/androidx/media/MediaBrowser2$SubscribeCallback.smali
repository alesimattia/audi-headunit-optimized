.class Landroidx/media/MediaBrowser2$SubscribeCallback;
.super Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;
.source "MediaBrowser2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaBrowser2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SubscribeCallback"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaBrowser2;


# direct methods
.method private constructor <init>(Landroidx/media/MediaBrowser2;)V
    .locals 0

    .line 489
    iput-object p1, p0, Landroidx/media/MediaBrowser2$SubscribeCallback;->this$0:Landroidx/media/MediaBrowser2;

    invoke-direct {p0}, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroidx/media/MediaBrowser2;Landroidx/media/MediaBrowser2$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/media/MediaBrowser2;
    .param p2, "x1"    # Landroidx/media/MediaBrowser2$1;

    .line 489
    invoke-direct {p0, p1}, Landroidx/media/MediaBrowser2$SubscribeCallback;-><init>(Landroidx/media/MediaBrowser2;)V

    return-void
.end method


# virtual methods
.method public onChildrenLoaded(Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .param p1, "parentId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;)V"
        }
    .end annotation

    .line 502
    .local p2, "children":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/media/MediaBrowserCompat$MediaItem;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroidx/media/MediaBrowser2$SubscribeCallback;->onChildrenLoaded(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;)V

    .line 503
    return-void
.end method

.method public onChildrenLoaded(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "parentId"    # Ljava/lang/String;
    .param p3, "options"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .line 509
    .local p2, "children":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/media/MediaBrowserCompat$MediaItem;>;"
    if-eqz p3, :cond_0

    const-string v0, "android.media.browse.extra.ITEM_COUNT"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 510
    const-string v0, "android.media.browse.extra.ITEM_COUNT"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .local v0, "itemCount":I
    :goto_0
    goto :goto_1

    .line 511
    .end local v0    # "itemCount":I
    :cond_0
    if-eqz p2, :cond_1

    .line 512
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0

    .line 515
    .restart local v0    # "itemCount":I
    :goto_1
    nop

    .line 518
    iget-object v1, p0, Landroidx/media/MediaBrowser2$SubscribeCallback;->this$0:Landroidx/media/MediaBrowser2;

    .line 519
    invoke-virtual {v1}, Landroidx/media/MediaBrowser2;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/media/MediaBrowserCompat;->getNotifyChildrenChangedOptions()Landroid/os/Bundle;

    move-result-object v1

    .line 520
    .local v1, "notifyChildrenChangedOptions":Landroid/os/Bundle;
    iget-object v2, p0, Landroidx/media/MediaBrowser2$SubscribeCallback;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v2}, Landroidx/media/MediaBrowser2;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Landroidx/media/MediaBrowser2$SubscribeCallback$1;

    invoke-direct {v3, p0, p1, v0, v1}, Landroidx/media/MediaBrowser2$SubscribeCallback$1;-><init>(Landroidx/media/MediaBrowser2$SubscribeCallback;Ljava/lang/String;ILandroid/os/Bundle;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 527
    return-void

    .line 515
    .end local v0    # "itemCount":I
    .end local v1    # "notifyChildrenChangedOptions":Landroid/os/Bundle;
    :cond_1
    return-void
.end method

.method public onError(Ljava/lang/String;)V
    .locals 1
    .param p1, "parentId"    # Ljava/lang/String;

    .line 492
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0}, Landroidx/media/MediaBrowser2$SubscribeCallback;->onChildrenLoaded(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;)V

    .line 493
    return-void
.end method

.method public onError(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "parentId"    # Ljava/lang/String;
    .param p2, "options"    # Landroid/os/Bundle;

    .line 497
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Landroidx/media/MediaBrowser2$SubscribeCallback;->onChildrenLoaded(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;)V

    .line 498
    return-void
.end method
