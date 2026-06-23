.class Landroidx/media/MediaLibraryService2$MyBrowserService$2;
.super Ljava/lang/Object;
.source "MediaLibraryService2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaLibraryService2$MyBrowserService;->onLoadItem(Ljava/lang/String;Landroidx/media/MediaBrowserServiceCompat$Result;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

.field final synthetic val$controller:Landroidx/media/MediaSession2$ControllerInfo;

.field final synthetic val$itemId:Ljava/lang/String;

.field final synthetic val$result:Landroidx/media/MediaBrowserServiceCompat$Result;


# direct methods
.method constructor <init>(Landroidx/media/MediaLibraryService2$MyBrowserService;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroidx/media/MediaBrowserServiceCompat$Result;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaLibraryService2$MyBrowserService;

    .line 562
    iput-object p1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$2;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iput-object p2, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$2;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iput-object p3, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$2;->val$itemId:Ljava/lang/String;

    iput-object p4, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$2;->val$result:Landroidx/media/MediaBrowserServiceCompat$Result;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 565
    iget-object v0, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$2;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iget-object v0, v0, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-static {v0}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getCallback()Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$2;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iget-object v1, v1, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    .line 566
    invoke-static {v1}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$2;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iget-object v3, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$2;->val$itemId:Ljava/lang/String;

    .line 565
    invoke-virtual {v0, v1, v2, v3}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;->onGetItem(Landroidx/media/MediaLibraryService2$MediaLibrarySession;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;)Landroidx/media/MediaItem2;

    move-result-object v0

    .line 567
    .local v0, "item":Landroidx/media/MediaItem2;
    if-nez v0, :cond_0

    .line 568
    iget-object v1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$2;->val$result:Landroidx/media/MediaBrowserServiceCompat$Result;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroidx/media/MediaBrowserServiceCompat$Result;->sendResult(Ljava/lang/Object;)V

    goto :goto_0

    .line 570
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$2;->val$result:Landroidx/media/MediaBrowserServiceCompat$Result;

    invoke-static {v0}, Landroidx/media/MediaUtils2;->createMediaItem(Landroidx/media/MediaItem2;)Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/media/MediaBrowserServiceCompat$Result;->sendResult(Ljava/lang/Object;)V

    .line 572
    :goto_0
    return-void
.end method
