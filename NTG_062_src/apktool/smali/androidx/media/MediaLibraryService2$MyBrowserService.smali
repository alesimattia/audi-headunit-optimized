.class Landroidx/media/MediaLibraryService2$MyBrowserService;
.super Landroidx/media/MediaBrowserServiceCompat;
.source "MediaLibraryService2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaLibraryService2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyBrowserService"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaLibraryService2;


# direct methods
.method private constructor <init>(Landroidx/media/MediaLibraryService2;)V
    .locals 0

    .line 481
    iput-object p1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-direct {p0}, Landroidx/media/MediaBrowserServiceCompat;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroidx/media/MediaLibraryService2;Landroidx/media/MediaLibraryService2$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/media/MediaLibraryService2;
    .param p2, "x1"    # Landroidx/media/MediaLibraryService2$1;

    .line 481
    invoke-direct {p0, p1}, Landroidx/media/MediaLibraryService2$MyBrowserService;-><init>(Landroidx/media/MediaLibraryService2;)V

    return-void
.end method

.method private getController()Landroidx/media/MediaSession2$ControllerInfo;
    .locals 8

    .line 619
    iget-object v0, p0, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-static {v0}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v0

    .line 620
    .local v0, "session":Landroidx/media/MediaLibraryService2$MediaLibrarySession;
    invoke-virtual {v0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getConnectedControllers()Ljava/util/List;

    move-result-object v1

    .line 622
    .local v1, "controllers":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaSession2$ControllerInfo;>;"
    invoke-virtual {p0}, Landroidx/media/MediaLibraryService2$MyBrowserService;->getCurrentBrowserInfo()Landroidx/media/MediaSessionManager$RemoteUserInfo;

    move-result-object v2

    .line 623
    .local v2, "info":Landroidx/media/MediaSessionManager$RemoteUserInfo;
    const/4 v3, 0x0

    if-nez v2, :cond_0

    .line 624
    return-object v3

    .line 627
    :cond_0
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_2

    .line 630
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/media/MediaSession2$ControllerInfo;

    .line 631
    .local v5, "controller":Landroidx/media/MediaSession2$ControllerInfo;
    invoke-virtual {v5}, Landroidx/media/MediaSession2$ControllerInfo;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2}, Landroidx/media/MediaSessionManager$RemoteUserInfo;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 632
    invoke-virtual {v5}, Landroidx/media/MediaSession2$ControllerInfo;->getUid()I

    move-result v6

    invoke-virtual {v2}, Landroidx/media/MediaSessionManager$RemoteUserInfo;->getUid()I

    move-result v7

    if-ne v6, v7, :cond_1

    .line 633
    return-object v5

    .line 627
    .end local v5    # "controller":Landroidx/media/MediaSession2$ControllerInfo;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 636
    .end local v4    # "i":I
    :cond_2
    return-object v3
.end method


# virtual methods
.method public onCustomAction(Ljava/lang/String;Landroid/os/Bundle;Landroidx/media/MediaBrowserServiceCompat$Result;)V
    .locals 0
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "extras"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            "Landroidx/media/MediaBrowserServiceCompat$Result<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .line 616
    .local p3, "result":Landroidx/media/MediaBrowserServiceCompat$Result;, "Landroidx/media/MediaBrowserServiceCompat$Result<Landroid/os/Bundle;>;"
    return-void
.end method

.method public onGetRoot(Ljava/lang/String;ILandroid/os/Bundle;)Landroidx/media/MediaBrowserServiceCompat$BrowserRoot;
    .locals 6
    .param p1, "clientPackageName"    # Ljava/lang/String;
    .param p2, "clientUid"    # I
    .param p3, "extras"    # Landroid/os/Bundle;

    .line 485
    invoke-static {p3}, Landroidx/media/MediaUtils2;->isDefaultLibraryRootHint(Landroid/os/Bundle;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 489
    sget-object v0, Landroidx/media/MediaSessionService2;->sDefaultBrowserRoot:Landroidx/media/MediaBrowserServiceCompat$BrowserRoot;

    return-object v0

    .line 491
    :cond_0
    invoke-direct {p0}, Landroidx/media/MediaLibraryService2$MyBrowserService;->getController()Landroidx/media/MediaSession2$ControllerInfo;

    move-result-object v0

    .line 492
    .local v0, "controller":Landroidx/media/MediaSession2$ControllerInfo;
    iget-object v1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-static {v1}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v1

    .line 504
    .local v1, "session":Landroidx/media/MediaLibraryService2$MediaLibrarySession;
    invoke-virtual {v1}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getCallback()Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;

    move-result-object v2

    invoke-virtual {v2, v1, v0, p3}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;->onGetLibraryRoot(Landroidx/media/MediaLibraryService2$MediaLibrarySession;Landroidx/media/MediaSession2$ControllerInfo;Landroid/os/Bundle;)Landroidx/media/MediaLibraryService2$LibraryRoot;

    move-result-object v2

    .line 506
    .local v2, "libraryRoot":Landroidx/media/MediaLibraryService2$LibraryRoot;
    if-nez v2, :cond_1

    .line 507
    const/4 v3, 0x0

    return-object v3

    .line 509
    :cond_1
    new-instance v3, Landroidx/media/MediaBrowserServiceCompat$BrowserRoot;

    invoke-virtual {v2}, Landroidx/media/MediaLibraryService2$LibraryRoot;->getRootId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Landroidx/media/MediaLibraryService2$LibraryRoot;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroidx/media/MediaBrowserServiceCompat$BrowserRoot;-><init>(Ljava/lang/String;Landroid/os/Bundle;)V

    return-object v3
.end method

.method public onLoadChildren(Ljava/lang/String;Landroidx/media/MediaBrowserServiceCompat$Result;)V
    .locals 1
    .param p1, "parentId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/media/MediaBrowserServiceCompat$Result<",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;>;)V"
        }
    .end annotation

    .line 514
    .local p2, "result":Landroidx/media/MediaBrowserServiceCompat$Result;, "Landroidx/media/MediaBrowserServiceCompat$Result<Ljava/util/List<Landroid/support/v4/media/MediaBrowserCompat$MediaItem;>;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroidx/media/MediaLibraryService2$MyBrowserService;->onLoadChildren(Ljava/lang/String;Landroidx/media/MediaBrowserServiceCompat$Result;Landroid/os/Bundle;)V

    .line 515
    return-void
.end method

.method public onLoadChildren(Ljava/lang/String;Landroidx/media/MediaBrowserServiceCompat$Result;Landroid/os/Bundle;)V
    .locals 9
    .param p1, "parentId"    # Ljava/lang/String;
    .param p3, "options"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/media/MediaBrowserServiceCompat$Result<",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;>;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .line 520
    .local p2, "result":Landroidx/media/MediaBrowserServiceCompat$Result;, "Landroidx/media/MediaBrowserServiceCompat$Result<Ljava/util/List<Landroid/support/v4/media/MediaBrowserCompat$MediaItem;>;>;"
    invoke-virtual {p2}, Landroidx/media/MediaBrowserServiceCompat$Result;->detach()V

    .line 521
    invoke-direct {p0}, Landroidx/media/MediaLibraryService2$MyBrowserService;->getController()Landroidx/media/MediaSession2$ControllerInfo;

    move-result-object v6

    .line 522
    .local v6, "controller":Landroidx/media/MediaSession2$ControllerInfo;
    iget-object v0, p0, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-static {v0}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v7

    new-instance v8, Landroidx/media/MediaLibraryService2$MyBrowserService$1;

    move-object v0, v8

    move-object v1, p0

    move-object v2, p3

    move-object v3, v6

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Landroidx/media/MediaLibraryService2$MyBrowserService$1;-><init>(Landroidx/media/MediaLibraryService2$MyBrowserService;Landroid/os/Bundle;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroidx/media/MediaBrowserServiceCompat$Result;)V

    invoke-interface {v7, v8}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 556
    return-void
.end method

.method public onLoadItem(Ljava/lang/String;Landroidx/media/MediaBrowserServiceCompat$Result;)V
    .locals 3
    .param p1, "itemId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/media/MediaBrowserServiceCompat$Result<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;)V"
        }
    .end annotation

    .line 560
    .local p2, "result":Landroidx/media/MediaBrowserServiceCompat$Result;, "Landroidx/media/MediaBrowserServiceCompat$Result<Landroid/support/v4/media/MediaBrowserCompat$MediaItem;>;"
    invoke-virtual {p2}, Landroidx/media/MediaBrowserServiceCompat$Result;->detach()V

    .line 561
    invoke-direct {p0}, Landroidx/media/MediaLibraryService2$MyBrowserService;->getController()Landroidx/media/MediaSession2$ControllerInfo;

    move-result-object v0

    .line 562
    .local v0, "controller":Landroidx/media/MediaSession2$ControllerInfo;
    iget-object v1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-static {v1}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaLibraryService2$MyBrowserService$2;

    invoke-direct {v2, p0, v0, p1, p2}, Landroidx/media/MediaLibraryService2$MyBrowserService$2;-><init>(Landroidx/media/MediaLibraryService2$MyBrowserService;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroidx/media/MediaBrowserServiceCompat$Result;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 574
    return-void
.end method

.method public onSearch(Ljava/lang/String;Landroid/os/Bundle;Landroidx/media/MediaBrowserServiceCompat$Result;)V
    .locals 15
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "extras"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            "Landroidx/media/MediaBrowserServiceCompat$Result<",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;>;)V"
        }
    .end annotation

    .local p3, "result":Landroidx/media/MediaBrowserServiceCompat$Result;, "Landroidx/media/MediaBrowserServiceCompat$Result<Ljava/util/List<Landroid/support/v4/media/MediaBrowserCompat$MediaItem;>;>;"
    move-object v9, p0

    move-object/from16 v10, p2

    .line 579
    invoke-virtual/range {p3 .. p3}, Landroidx/media/MediaBrowserServiceCompat$Result;->detach()V

    .line 580
    invoke-direct {v9}, Landroidx/media/MediaLibraryService2$MyBrowserService;->getController()Landroidx/media/MediaSession2$ControllerInfo;

    move-result-object v11

    .line 581
    .local v11, "controller":Landroidx/media/MediaSession2$ControllerInfo;
    iget-object v0, v9, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-virtual {v0}, Landroidx/media/MediaLibraryService2;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v10, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 583
    :try_start_0
    const-string v0, "androidx.media.argument.PAGE"

    invoke-virtual {v10, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 584
    .local v0, "page":I
    const-string v1, "androidx.media.argument.PAGE_SIZE"

    invoke-virtual {v10, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    move v12, v1

    .line 585
    .local v12, "pageSize":I
    if-lez v0, :cond_1

    if-gtz v12, :cond_0

    goto :goto_0

    .line 594
    :cond_0
    iget-object v1, v9, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-static {v1}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v13

    new-instance v14, Landroidx/media/MediaLibraryService2$MyBrowserService$4;

    move-object v1, v14

    move-object v2, v9

    move-object v3, v11

    move-object/from16 v4, p1

    move v5, v0

    move v6, v12

    move-object v7, v10

    move-object/from16 v8, p3

    invoke-direct/range {v1 .. v8}, Landroidx/media/MediaLibraryService2$MyBrowserService$4;-><init>(Landroidx/media/MediaLibraryService2$MyBrowserService;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;IILandroid/os/Bundle;Landroidx/media/MediaBrowserServiceCompat$Result;)V

    invoke-interface {v13, v14}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 610
    .end local v0    # "page":I
    .end local v12    # "pageSize":I
    move-object/from16 v3, p1

    goto :goto_1

    .line 586
    .restart local v0    # "page":I
    .restart local v12    # "pageSize":I
    :cond_1
    :goto_0
    iget-object v1, v9, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-static {v1}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaLibraryService2$MyBrowserService$3;
    :try_end_0
    .catch Landroid/os/BadParcelableException; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v3, p1

    :try_start_1
    invoke-direct {v2, v9, v11, v3, v10}, Landroidx/media/MediaLibraryService2$MyBrowserService$3;-><init>(Landroidx/media/MediaLibraryService2$MyBrowserService;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Landroid/os/BadParcelableException; {:try_start_1 .. :try_end_1} :catch_0

    .line 610
    .end local v0    # "page":I
    .end local v12    # "pageSize":I
    :goto_1
    goto :goto_2

    .line 608
    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    move-object/from16 v3, p1

    .line 611
    :goto_2
    return-void
.end method
