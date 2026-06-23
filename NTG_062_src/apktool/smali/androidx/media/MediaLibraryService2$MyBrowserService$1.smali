.class Landroidx/media/MediaLibraryService2$MyBrowserService$1;
.super Ljava/lang/Object;
.source "MediaLibraryService2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaLibraryService2$MyBrowserService;->onLoadChildren(Ljava/lang/String;Landroidx/media/MediaBrowserServiceCompat$Result;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

.field final synthetic val$controller:Landroidx/media/MediaSession2$ControllerInfo;

.field final synthetic val$options:Landroid/os/Bundle;

.field final synthetic val$parentId:Ljava/lang/String;

.field final synthetic val$result:Landroidx/media/MediaBrowserServiceCompat$Result;


# direct methods
.method constructor <init>(Landroidx/media/MediaLibraryService2$MyBrowserService;Landroid/os/Bundle;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroidx/media/MediaBrowserServiceCompat$Result;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaLibraryService2$MyBrowserService;

    .line 522
    iput-object p1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iput-object p2, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$options:Landroid/os/Bundle;

    iput-object p3, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iput-object p4, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$parentId:Ljava/lang/String;

    iput-object p5, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$result:Landroidx/media/MediaBrowserServiceCompat$Result;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 525
    iget-object v0, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$options:Landroid/os/Bundle;

    if-eqz v0, :cond_2

    .line 526
    iget-object v0, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$options:Landroid/os/Bundle;

    iget-object v1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iget-object v1, v1, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-virtual {v1}, Landroidx/media/MediaLibraryService2;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 528
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$options:Landroid/os/Bundle;

    const-string v1, "android.media.browse.extra.PAGE"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 529
    .local v0, "page":I
    iget-object v1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$options:Landroid/os/Bundle;

    const-string v2, "android.media.browse.extra.PAGE_SIZE"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    move v8, v1

    .line 530
    .local v8, "pageSize":I
    if-lez v0, :cond_0

    if-lez v8, :cond_0

    .line 532
    iget-object v1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iget-object v1, v1, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-static {v1}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getCallback()Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iget-object v2, v2, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    .line 533
    invoke-static {v2}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iget-object v4, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$parentId:Ljava/lang/String;

    iget-object v7, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$options:Landroid/os/Bundle;

    move v5, v0

    move v6, v8

    invoke-virtual/range {v1 .. v7}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;->onGetChildren(Landroidx/media/MediaLibraryService2$MediaLibrarySession;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;IILandroid/os/Bundle;)Ljava/util/List;

    move-result-object v1

    .line 535
    .local v1, "children":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    iget-object v2, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$result:Landroidx/media/MediaBrowserServiceCompat$Result;

    invoke-static {v1}, Landroidx/media/MediaUtils2;->fromMediaItem2List(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/media/MediaBrowserServiceCompat$Result;->sendResult(Ljava/lang/Object;)V

    .line 536
    return-void

    .line 537
    .end local v1    # "children":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$options:Landroid/os/Bundle;

    const-string v2, "androidx.media.MEDIA_BROWSER2_SUBSCRIBE"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 540
    iget-object v1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$options:Landroid/os/Bundle;

    const-string v2, "androidx.media.MEDIA_BROWSER2_SUBSCRIBE"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 541
    iget-object v1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iget-object v1, v1, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-static {v1}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getCallback()Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iget-object v2, v2, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-static {v2}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iget-object v4, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$parentId:Ljava/lang/String;

    iget-object v5, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$options:Landroid/os/Bundle;

    const-string v6, "androidx.media.argument.EXTRAS"

    .line 542
    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v5

    .line 541
    invoke-virtual {v1, v2, v3, v4, v5}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;->onSubscribe(Landroidx/media/MediaLibraryService2$MediaLibrarySession;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/BadParcelableException; {:try_start_0 .. :try_end_0} :catch_0

    .line 543
    return-void

    .line 547
    .end local v0    # "page":I
    .end local v8    # "pageSize":I
    :cond_1
    goto :goto_0

    .line 545
    :catch_0
    move-exception v0

    .line 549
    :cond_2
    :goto_0
    iget-object v0, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iget-object v0, v0, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-static {v0}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getCallback()Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;

    move-result-object v1

    iget-object v0, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iget-object v0, v0, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    .line 550
    invoke-static {v0}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iget-object v4, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$parentId:Ljava/lang/String;

    const/4 v5, 0x1

    const v6, 0x7fffffff

    const/4 v7, 0x0

    invoke-virtual/range {v1 .. v7}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;->onGetChildren(Landroidx/media/MediaLibraryService2$MediaLibrarySession;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;IILandroid/os/Bundle;)Ljava/util/List;

    move-result-object v0

    .line 553
    .local v0, "children":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    iget-object v1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$1;->val$result:Landroidx/media/MediaBrowserServiceCompat$Result;

    invoke-static {v0}, Landroidx/media/MediaUtils2;->fromMediaItem2List(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/media/MediaBrowserServiceCompat$Result;->sendResult(Ljava/lang/Object;)V

    .line 554
    return-void
.end method
