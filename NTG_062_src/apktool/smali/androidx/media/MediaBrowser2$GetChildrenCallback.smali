.class Landroidx/media/MediaBrowser2$GetChildrenCallback;
.super Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;
.source "MediaBrowser2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaBrowser2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GetChildrenCallback"
.end annotation


# instance fields
.field private final mPage:I

.field private final mPageSize:I

.field private final mParentId:Ljava/lang/String;

.field final synthetic this$0:Landroidx/media/MediaBrowser2;


# direct methods
.method constructor <init>(Landroidx/media/MediaBrowser2;Ljava/lang/String;II)V
    .locals 0
    .param p2, "parentId"    # Ljava/lang/String;
    .param p3, "page"    # I
    .param p4, "pageSize"    # I

    .line 535
    iput-object p1, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback;->this$0:Landroidx/media/MediaBrowser2;

    .line 536
    invoke-direct {p0}, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;-><init>()V

    .line 537
    iput-object p2, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback;->mParentId:Ljava/lang/String;

    .line 538
    iput p3, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback;->mPage:I

    .line 539
    iput p4, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback;->mPageSize:I

    .line 540
    return-void
.end method

.method static synthetic access$500(Landroidx/media/MediaBrowser2$GetChildrenCallback;)I
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaBrowser2$GetChildrenCallback;

    .line 530
    iget v0, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback;->mPage:I

    return v0
.end method

.method static synthetic access$600(Landroidx/media/MediaBrowser2$GetChildrenCallback;)I
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaBrowser2$GetChildrenCallback;

    .line 530
    iget v0, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback;->mPageSize:I

    return v0
.end method

.method static synthetic access$700(Landroidx/media/MediaBrowser2$GetChildrenCallback;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaBrowser2$GetChildrenCallback;

    .line 530
    iget-object v0, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback;->mParentId:Ljava/lang/String;

    return-object v0
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

    .line 554
    .local p2, "children":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/media/MediaBrowserCompat$MediaItem;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroidx/media/MediaBrowser2$GetChildrenCallback;->onChildrenLoaded(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;)V

    .line 555
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

    .line 561
    .local p2, "children":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/media/MediaBrowserCompat$MediaItem;>;"
    if-nez p2, :cond_0

    .line 562
    const/4 v0, 0x0

    .local v0, "items":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    goto :goto_1

    .line 564
    .end local v0    # "items":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 565
    .restart local v0    # "items":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 566
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    invoke-static {v2}, Landroidx/media/MediaUtils2;->createMediaItem2(Landroid/support/v4/media/MediaBrowserCompat$MediaItem;)Landroidx/media/MediaItem2;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 565
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 569
    .end local v1    # "i":I
    :cond_1
    :goto_1
    iget-object v1, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback;->this$0:Landroidx/media/MediaBrowser2;

    invoke-static {v1, p3}, Landroidx/media/MediaBrowser2;->access$400(Landroidx/media/MediaBrowser2;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    .line 570
    .local v1, "extras":Landroid/os/Bundle;
    iget-object v2, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v2}, Landroidx/media/MediaBrowser2;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;

    invoke-direct {v3, p0, p1, v0, v1}, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;-><init>(Landroidx/media/MediaBrowser2$GetChildrenCallback;Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 582
    return-void
.end method

.method public onError(Ljava/lang/String;)V
    .locals 1
    .param p1, "parentId"    # Ljava/lang/String;

    .line 544
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0}, Landroidx/media/MediaBrowser2$GetChildrenCallback;->onChildrenLoaded(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;)V

    .line 545
    return-void
.end method

.method public onError(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "parentId"    # Ljava/lang/String;
    .param p2, "options"    # Landroid/os/Bundle;

    .line 549
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Landroidx/media/MediaBrowser2$GetChildrenCallback;->onChildrenLoaded(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;)V

    .line 550
    return-void
.end method
