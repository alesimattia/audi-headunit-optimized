.class public Landroidx/media/MediaBrowser2;
.super Landroidx/media/MediaController2;
.source "MediaBrowser2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/MediaBrowser2$GetChildrenCallback;,
        Landroidx/media/MediaBrowser2$SubscribeCallback;,
        Landroidx/media/MediaBrowser2$GetLibraryRootCallback;,
        Landroidx/media/MediaBrowser2$BrowserCallback;
    }
.end annotation


# static fields
.field static final DEBUG:Z

.field public static final EXTRA_ITEM_COUNT:Ljava/lang/String; = "android.media.browse.extra.ITEM_COUNT"
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field public static final MEDIA_BROWSER2_SUBSCRIBE:Ljava/lang/String; = "androidx.media.MEDIA_BROWSER2_SUBSCRIBE"
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field static final TAG:Ljava/lang/String; = "MediaBrowser2"


# instance fields
.field private final mBrowserCompats:Ljava/util/HashMap;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/os/Bundle;",
            "Landroid/support/v4/media/MediaBrowserCompat;",
            ">;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field private final mSubscribeCallbacks:Ljava/util/HashMap;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Landroidx/media/MediaBrowser2$SubscribeCallback;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 50
    const-string v0, "MediaBrowser2"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Landroidx/media/MediaBrowser2;->DEBUG:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/media/SessionToken2;Ljava/util/concurrent/Executor;Landroidx/media/MediaBrowser2$BrowserCallback;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "token"    # Landroidx/media/SessionToken2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "callback"    # Landroidx/media/MediaBrowser2$BrowserCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 169
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/media/MediaController2;-><init>(Landroid/content/Context;Landroidx/media/SessionToken2;Ljava/util/concurrent/Executor;Landroidx/media/MediaController2$ControllerCallback;)V

    .line 64
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/media/MediaBrowser2;->mLock:Ljava/lang/Object;

    .line 65
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/media/MediaBrowser2;->mBrowserCompats:Ljava/util/HashMap;

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/media/MediaBrowser2;->mSubscribeCallbacks:Ljava/util/HashMap;

    .line 170
    return-void
.end method

.method static synthetic access$000(Landroidx/media/MediaBrowser2;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaBrowser2;

    .line 48
    iget-object v0, p0, Landroidx/media/MediaBrowser2;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100(Landroidx/media/MediaBrowser2;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaBrowser2;

    .line 48
    iget-object v0, p0, Landroidx/media/MediaBrowser2;->mBrowserCompats:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$400(Landroidx/media/MediaBrowser2;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaBrowser2;
    .param p1, "x1"    # Landroid/os/Bundle;

    .line 48
    invoke-direct {p0, p1}, Landroidx/media/MediaBrowser2;->getExtrasWithoutPagination(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method private getBrowserCompat(Landroid/os/Bundle;)Landroid/support/v4/media/MediaBrowserCompat;
    .locals 2
    .param p1, "extras"    # Landroid/os/Bundle;

    .line 432
    iget-object v0, p0, Landroidx/media/MediaBrowser2;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 433
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaBrowser2;->mBrowserCompats:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/media/MediaBrowserCompat;

    monitor-exit v0

    return-object v1

    .line 434
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getExtrasWithoutPagination(Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 1
    .param p1, "extras"    # Landroid/os/Bundle;

    .line 438
    if-nez p1, :cond_0

    .line 439
    const/4 v0, 0x0

    return-object v0

    .line 441
    :cond_0
    invoke-virtual {p0}, Landroidx/media/MediaBrowser2;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 443
    :try_start_0
    const-string v0, "android.media.browse.extra.PAGE"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 444
    const-string v0, "android.media.browse.extra.PAGE_SIZE"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/BadParcelableException; {:try_start_0 .. :try_end_0} :catch_0

    .line 447
    goto :goto_0

    .line 445
    :catch_0
    move-exception v0

    .line 448
    :goto_0
    return-object p1
.end method


# virtual methods
.method public close()V
    .locals 3

    .line 174
    iget-object v0, p0, Landroidx/media/MediaBrowser2;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 175
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaBrowser2;->mBrowserCompats:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/media/MediaBrowserCompat;

    .line 176
    .local v2, "browser":Landroid/support/v4/media/MediaBrowserCompat;
    invoke-virtual {v2}, Landroid/support/v4/media/MediaBrowserCompat;->disconnect()V

    .line 177
    .end local v2    # "browser":Landroid/support/v4/media/MediaBrowserCompat;
    goto :goto_0

    .line 178
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaBrowser2;->mBrowserCompats:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 180
    invoke-super {p0}, Landroidx/media/MediaController2;->close()V

    .line 181
    monitor-exit v0

    .line 182
    return-void

    .line 181
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method getCallback()Landroidx/media/MediaBrowser2$BrowserCallback;
    .locals 1

    .line 428
    invoke-super {p0}, Landroidx/media/MediaController2;->getCallback()Landroidx/media/MediaController2$ControllerCallback;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaBrowser2$BrowserCallback;

    return-object v0
.end method

.method bridge synthetic getCallback()Landroidx/media/MediaController2$ControllerCallback;
    .locals 1

    .line 48
    invoke-virtual {p0}, Landroidx/media/MediaBrowser2;->getCallback()Landroidx/media/MediaBrowser2$BrowserCallback;

    move-result-object v0

    return-object v0
.end method

.method public getChildren(Ljava/lang/String;IILandroid/os/Bundle;)V
    .locals 3
    .param p1, "parentId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "page"    # I
    .param p3, "pageSize"    # I
    .param p4, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 294
    if-eqz p1, :cond_2

    .line 297
    const/4 v0, 0x1

    if-lt p2, v0, :cond_1

    if-lt p3, v0, :cond_1

    .line 300
    invoke-virtual {p0}, Landroidx/media/MediaBrowser2;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    .line 301
    .local v0, "browser":Landroid/support/v4/media/MediaBrowserCompat;
    if-nez v0, :cond_0

    .line 302
    return-void

    .line 305
    :cond_0
    invoke-static {p4}, Landroidx/media/MediaUtils2;->createBundle(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    .line 306
    .local v1, "options":Landroid/os/Bundle;
    const-string v2, "android.media.browse.extra.PAGE"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 307
    const-string v2, "android.media.browse.extra.PAGE_SIZE"

    invoke-virtual {v1, v2, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 308
    new-instance v2, Landroidx/media/MediaBrowser2$GetChildrenCallback;

    invoke-direct {v2, p0, p1, p2, p3}, Landroidx/media/MediaBrowser2$GetChildrenCallback;-><init>(Landroidx/media/MediaBrowser2;Ljava/lang/String;II)V

    invoke-virtual {v0, p1, v1, v2}, Landroid/support/v4/media/MediaBrowserCompat;->subscribe(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;)V

    .line 309
    return-void

    .line 298
    .end local v0    # "browser":Landroid/support/v4/media/MediaBrowserCompat;
    .end local v1    # "options":Landroid/os/Bundle;
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Neither page nor pageSize should be less than 1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 295
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "parentId shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getItem(Ljava/lang/String;)V
    .locals 2
    .param p1, "mediaId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 318
    invoke-virtual {p0}, Landroidx/media/MediaBrowser2;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    .line 319
    .local v0, "browser":Landroid/support/v4/media/MediaBrowserCompat;
    if-nez v0, :cond_0

    .line 320
    return-void

    .line 322
    :cond_0
    new-instance v1, Landroidx/media/MediaBrowser2$3;

    invoke-direct {v1, p0, p1}, Landroidx/media/MediaBrowser2$3;-><init>(Landroidx/media/MediaBrowser2;Ljava/lang/String;)V

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/media/MediaBrowserCompat;->getItem(Ljava/lang/String;Landroid/support/v4/media/MediaBrowserCompat$ItemCallback;)V

    .line 344
    return-void
.end method

.method public getLibraryRoot(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 192
    invoke-direct {p0, p1}, Landroidx/media/MediaBrowser2;->getBrowserCompat(Landroid/os/Bundle;)Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    .line 193
    .local v0, "browser":Landroid/support/v4/media/MediaBrowserCompat;
    if-eqz v0, :cond_0

    .line 195
    invoke-virtual {p0}, Landroidx/media/MediaBrowser2;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaBrowser2$1;

    invoke-direct {v2, p0, p1, v0}, Landroidx/media/MediaBrowser2$1;-><init>(Landroidx/media/MediaBrowser2;Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 203
    :cond_0
    invoke-virtual {p0}, Landroidx/media/MediaBrowser2;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaBrowser2$2;

    invoke-direct {v2, p0, p1}, Landroidx/media/MediaBrowser2$2;-><init>(Landroidx/media/MediaBrowser2;Landroid/os/Bundle;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 218
    :goto_0
    return-void
.end method

.method public getSearchResult(Ljava/lang/String;IILandroid/os/Bundle;)V
    .locals 3
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "page"    # I
    .param p3, "pageSize"    # I
    .param p4, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 392
    invoke-virtual {p0}, Landroidx/media/MediaBrowser2;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    .line 393
    .local v0, "browser":Landroid/support/v4/media/MediaBrowserCompat;
    if-nez v0, :cond_0

    .line 394
    return-void

    .line 396
    :cond_0
    invoke-static {p4}, Landroidx/media/MediaUtils2;->createBundle(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    .line 397
    .local v1, "options":Landroid/os/Bundle;
    const-string v2, "androidx.media.argument.PAGE"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 398
    const-string v2, "androidx.media.argument.PAGE_SIZE"

    invoke-virtual {v1, v2, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 399
    new-instance v2, Landroidx/media/MediaBrowser2$5;

    invoke-direct {v2, p0, p2, p3, p4}, Landroidx/media/MediaBrowser2$5;-><init>(Landroidx/media/MediaBrowser2;IILandroid/os/Bundle;)V

    invoke-virtual {v0, p1, v1, v2}, Landroid/support/v4/media/MediaBrowserCompat;->search(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat$SearchCallback;)V

    .line 424
    return-void
.end method

.method public search(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 356
    invoke-virtual {p0}, Landroidx/media/MediaBrowser2;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    .line 357
    .local v0, "browser":Landroid/support/v4/media/MediaBrowserCompat;
    if-nez v0, :cond_0

    .line 358
    return-void

    .line 360
    :cond_0
    new-instance v1, Landroidx/media/MediaBrowser2$4;

    invoke-direct {v1, p0}, Landroidx/media/MediaBrowser2$4;-><init>(Landroidx/media/MediaBrowser2;)V

    invoke-virtual {v0, p1, p2, v1}, Landroid/support/v4/media/MediaBrowserCompat;->search(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat$SearchCallback;)V

    .line 378
    return-void
.end method

.method public subscribe(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 5
    .param p1, "parentId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 230
    if-eqz p1, :cond_2

    .line 233
    invoke-virtual {p0}, Landroidx/media/MediaBrowser2;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    .line 234
    .local v0, "browser":Landroid/support/v4/media/MediaBrowserCompat;
    if-nez v0, :cond_0

    .line 235
    return-void

    .line 237
    :cond_0
    new-instance v1, Landroidx/media/MediaBrowser2$SubscribeCallback;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Landroidx/media/MediaBrowser2$SubscribeCallback;-><init>(Landroidx/media/MediaBrowser2;Landroidx/media/MediaBrowser2$1;)V

    .line 238
    .local v1, "callback":Landroidx/media/MediaBrowser2$SubscribeCallback;
    iget-object v2, p0, Landroidx/media/MediaBrowser2;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 239
    :try_start_0
    iget-object v3, p0, Landroidx/media/MediaBrowser2;->mSubscribeCallbacks:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 240
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaBrowser2$SubscribeCallback;>;"
    if-nez v3, :cond_1

    .line 241
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object v3, v4

    .line 242
    iget-object v4, p0, Landroidx/media/MediaBrowser2;->mSubscribeCallbacks:Ljava/util/HashMap;

    invoke-virtual {v4, p1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    :cond_1
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 245
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaBrowser2$SubscribeCallback;>;"
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 247
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 248
    .local v2, "options":Landroid/os/Bundle;
    const-string v3, "androidx.media.argument.EXTRAS"

    invoke-virtual {v2, v3, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 249
    const-string v3, "androidx.media.MEDIA_BROWSER2_SUBSCRIBE"

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 250
    invoke-virtual {v0, p1, v2, v1}, Landroid/support/v4/media/MediaBrowserCompat;->subscribe(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;)V

    .line 251
    return-void

    .line 245
    .end local v2    # "options":Landroid/os/Bundle;
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 231
    .end local v0    # "browser":Landroid/support/v4/media/MediaBrowserCompat;
    .end local v1    # "callback":Landroidx/media/MediaBrowser2$SubscribeCallback;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "parentId shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public unsubscribe(Ljava/lang/String;)V
    .locals 5
    .param p1, "parentId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 263
    if-eqz p1, :cond_3

    .line 266
    invoke-virtual {p0}, Landroidx/media/MediaBrowser2;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    .line 267
    .local v0, "browser":Landroid/support/v4/media/MediaBrowserCompat;
    if-nez v0, :cond_0

    .line 268
    return-void

    .line 272
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaBrowser2;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 273
    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaBrowser2;->mSubscribeCallbacks:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 274
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaBrowser2$SubscribeCallback;>;"
    if-nez v2, :cond_1

    .line 275
    monitor-exit v1

    return-void

    .line 277
    :cond_1
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_2

    .line 278
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;

    invoke-virtual {v0, p1, v4}, Landroid/support/v4/media/MediaBrowserCompat;->unsubscribe(Ljava/lang/String;Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;)V

    .line 277
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 280
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaBrowser2$SubscribeCallback;>;"
    .end local v3    # "i":I
    :cond_2
    monitor-exit v1

    .line 281
    return-void

    .line 280
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 264
    .end local v0    # "browser":Landroid/support/v4/media/MediaBrowserCompat;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "parentId shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
