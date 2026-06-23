.class Landroidx/media/MediaBrowser2$SubscribeCallback$1;
.super Ljava/lang/Object;
.source "MediaBrowser2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaBrowser2$SubscribeCallback;->onChildrenLoaded(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaBrowser2$SubscribeCallback;

.field final synthetic val$itemCount:I

.field final synthetic val$notifyChildrenChangedOptions:Landroid/os/Bundle;

.field final synthetic val$parentId:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroidx/media/MediaBrowser2$SubscribeCallback;Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaBrowser2$SubscribeCallback;

    .line 520
    iput-object p1, p0, Landroidx/media/MediaBrowser2$SubscribeCallback$1;->this$1:Landroidx/media/MediaBrowser2$SubscribeCallback;

    iput-object p2, p0, Landroidx/media/MediaBrowser2$SubscribeCallback$1;->val$parentId:Ljava/lang/String;

    iput p3, p0, Landroidx/media/MediaBrowser2$SubscribeCallback$1;->val$itemCount:I

    iput-object p4, p0, Landroidx/media/MediaBrowser2$SubscribeCallback$1;->val$notifyChildrenChangedOptions:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 523
    iget-object v0, p0, Landroidx/media/MediaBrowser2$SubscribeCallback$1;->this$1:Landroidx/media/MediaBrowser2$SubscribeCallback;

    iget-object v0, v0, Landroidx/media/MediaBrowser2$SubscribeCallback;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v0}, Landroidx/media/MediaBrowser2;->getCallback()Landroidx/media/MediaBrowser2$BrowserCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaBrowser2$SubscribeCallback$1;->this$1:Landroidx/media/MediaBrowser2$SubscribeCallback;

    iget-object v1, v1, Landroidx/media/MediaBrowser2$SubscribeCallback;->this$0:Landroidx/media/MediaBrowser2;

    iget-object v2, p0, Landroidx/media/MediaBrowser2$SubscribeCallback$1;->val$parentId:Ljava/lang/String;

    iget v3, p0, Landroidx/media/MediaBrowser2$SubscribeCallback$1;->val$itemCount:I

    iget-object v4, p0, Landroidx/media/MediaBrowser2$SubscribeCallback$1;->val$notifyChildrenChangedOptions:Landroid/os/Bundle;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroidx/media/MediaBrowser2$BrowserCallback;->onChildrenChanged(Landroidx/media/MediaBrowser2;Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 525
    return-void
.end method
