.class Landroidx/media/MediaBrowser2$GetChildrenCallback$1;
.super Ljava/lang/Object;
.source "MediaBrowser2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaBrowser2$GetChildrenCallback;->onChildrenLoaded(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaBrowser2$GetChildrenCallback;

.field final synthetic val$extras:Landroid/os/Bundle;

.field final synthetic val$items:Ljava/util/List;

.field final synthetic val$parentId:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroidx/media/MediaBrowser2$GetChildrenCallback;Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaBrowser2$GetChildrenCallback;

    .line 570
    iput-object p1, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;->this$1:Landroidx/media/MediaBrowser2$GetChildrenCallback;

    iput-object p2, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;->val$parentId:Ljava/lang/String;

    iput-object p3, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;->val$items:Ljava/util/List;

    iput-object p4, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;->val$extras:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 573
    iget-object v0, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;->this$1:Landroidx/media/MediaBrowser2$GetChildrenCallback;

    iget-object v0, v0, Landroidx/media/MediaBrowser2$GetChildrenCallback;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v0}, Landroidx/media/MediaBrowser2;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    .line 574
    .local v0, "browser":Landroid/support/v4/media/MediaBrowserCompat;
    if-nez v0, :cond_0

    .line 575
    return-void

    .line 577
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;->this$1:Landroidx/media/MediaBrowser2$GetChildrenCallback;

    iget-object v1, v1, Landroidx/media/MediaBrowser2$GetChildrenCallback;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v1}, Landroidx/media/MediaBrowser2;->getCallback()Landroidx/media/MediaBrowser2$BrowserCallback;

    move-result-object v2

    iget-object v1, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;->this$1:Landroidx/media/MediaBrowser2$GetChildrenCallback;

    iget-object v3, v1, Landroidx/media/MediaBrowser2$GetChildrenCallback;->this$0:Landroidx/media/MediaBrowser2;

    iget-object v4, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;->val$parentId:Ljava/lang/String;

    iget-object v1, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;->this$1:Landroidx/media/MediaBrowser2$GetChildrenCallback;

    invoke-static {v1}, Landroidx/media/MediaBrowser2$GetChildrenCallback;->access$500(Landroidx/media/MediaBrowser2$GetChildrenCallback;)I

    move-result v5

    iget-object v1, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;->this$1:Landroidx/media/MediaBrowser2$GetChildrenCallback;

    invoke-static {v1}, Landroidx/media/MediaBrowser2$GetChildrenCallback;->access$600(Landroidx/media/MediaBrowser2$GetChildrenCallback;)I

    move-result v6

    iget-object v7, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;->val$items:Ljava/util/List;

    iget-object v8, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;->val$extras:Landroid/os/Bundle;

    invoke-virtual/range {v2 .. v8}, Landroidx/media/MediaBrowser2$BrowserCallback;->onGetChildrenDone(Landroidx/media/MediaBrowser2;Ljava/lang/String;IILjava/util/List;Landroid/os/Bundle;)V

    .line 579
    iget-object v1, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;->this$1:Landroidx/media/MediaBrowser2$GetChildrenCallback;

    invoke-static {v1}, Landroidx/media/MediaBrowser2$GetChildrenCallback;->access$700(Landroidx/media/MediaBrowser2$GetChildrenCallback;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaBrowser2$GetChildrenCallback$1;->this$1:Landroidx/media/MediaBrowser2$GetChildrenCallback;

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/media/MediaBrowserCompat;->unsubscribe(Ljava/lang/String;Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;)V

    .line 580
    return-void
.end method
