.class Landroidx/media/MediaLibraryService2$MyBrowserService$4;
.super Ljava/lang/Object;
.source "MediaLibraryService2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaLibraryService2$MyBrowserService;->onSearch(Ljava/lang/String;Landroid/os/Bundle;Landroidx/media/MediaBrowserServiceCompat$Result;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

.field final synthetic val$controller:Landroidx/media/MediaSession2$ControllerInfo;

.field final synthetic val$extras:Landroid/os/Bundle;

.field final synthetic val$page:I

.field final synthetic val$pageSize:I

.field final synthetic val$query:Ljava/lang/String;

.field final synthetic val$result:Landroidx/media/MediaBrowserServiceCompat$Result;


# direct methods
.method constructor <init>(Landroidx/media/MediaLibraryService2$MyBrowserService;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;IILandroid/os/Bundle;Landroidx/media/MediaBrowserServiceCompat$Result;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaLibraryService2$MyBrowserService;

    .line 594
    iput-object p1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iput-object p2, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iput-object p3, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->val$query:Ljava/lang/String;

    iput p4, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->val$page:I

    iput p5, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->val$pageSize:I

    iput-object p6, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->val$extras:Landroid/os/Bundle;

    iput-object p7, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->val$result:Landroidx/media/MediaBrowserServiceCompat$Result;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 597
    iget-object v0, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iget-object v0, v0, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-static {v0}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getCallback()Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;

    move-result-object v1

    iget-object v0, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iget-object v0, v0, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    .line 598
    invoke-static {v0}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iget-object v4, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->val$query:Ljava/lang/String;

    iget v5, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->val$page:I

    iget v6, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->val$pageSize:I

    iget-object v7, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->val$extras:Landroid/os/Bundle;

    invoke-virtual/range {v1 .. v7}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;->onGetSearchResult(Landroidx/media/MediaLibraryService2$MediaLibrarySession;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;IILandroid/os/Bundle;)Ljava/util/List;

    move-result-object v0

    .line 600
    .local v0, "searchResult":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    if-nez v0, :cond_0

    .line 601
    iget-object v1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->val$result:Landroidx/media/MediaBrowserServiceCompat$Result;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroidx/media/MediaBrowserServiceCompat$Result;->sendResult(Ljava/lang/Object;)V

    .line 602
    return-void

    .line 604
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$4;->val$result:Landroidx/media/MediaBrowserServiceCompat$Result;

    invoke-static {v0}, Landroidx/media/MediaUtils2;->fromMediaItem2List(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/media/MediaBrowserServiceCompat$Result;->sendResult(Ljava/lang/Object;)V

    .line 605
    return-void
.end method
