.class Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;
.super Landroidx/media/BaseMediaPlayer$PlayerEventCallback;
.source "MediaSession2ImplBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaSession2ImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MyPlayerEventCallback"
.end annotation


# instance fields
.field private final mSession:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/media/MediaSession2ImplBase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroidx/media/MediaSession2ImplBase;)V
    .locals 1
    .param p1, "session"    # Landroidx/media/MediaSession2ImplBase;

    .line 1177
    invoke-direct {p0}, Landroidx/media/BaseMediaPlayer$PlayerEventCallback;-><init>()V

    .line 1178
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->mSession:Ljava/lang/ref/WeakReference;

    .line 1179
    return-void
.end method

.method synthetic constructor <init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaSession2ImplBase$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/media/MediaSession2ImplBase;
    .param p2, "x1"    # Landroidx/media/MediaSession2ImplBase$1;

    .line 1174
    invoke-direct {p0, p1}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;-><init>(Landroidx/media/MediaSession2ImplBase;)V

    return-void
.end method

.method static synthetic access$300(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroidx/media/MediaSession2ImplBase;Landroidx/media/DataSourceDesc;)Landroidx/media/MediaItem2;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;
    .param p1, "x1"    # Landroidx/media/MediaSession2ImplBase;
    .param p2, "x2"    # Landroidx/media/DataSourceDesc;

    .line 1174
    invoke-direct {p0, p1, p2}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->getMediaItem(Landroidx/media/MediaSession2ImplBase;Landroidx/media/DataSourceDesc;)Landroidx/media/MediaItem2;

    move-result-object v0

    return-object v0
.end method

.method private getMediaItem(Landroidx/media/MediaSession2ImplBase;Landroidx/media/DataSourceDesc;)Landroidx/media/MediaItem2;
    .locals 5
    .param p1, "session"    # Landroidx/media/MediaSession2ImplBase;
    .param p2, "dsd"    # Landroidx/media/DataSourceDesc;

    .line 1377
    invoke-virtual {p1}, Landroidx/media/MediaSession2ImplBase;->getPlaylistAgent()Landroidx/media/MediaPlaylistAgent;

    move-result-object v0

    .line 1378
    .local v0, "agent":Landroidx/media/MediaPlaylistAgent;
    if-nez v0, :cond_1

    .line 1379
    sget-boolean v1, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v1, :cond_0

    .line 1380
    const-string v1, "MS2ImplBase"

    const-string v2, "Session is closed"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1382
    :cond_0
    const/4 v1, 0x0

    return-object v1

    .line 1384
    :cond_1
    invoke-virtual {v0, p2}, Landroidx/media/MediaPlaylistAgent;->getMediaItem(Landroidx/media/DataSourceDesc;)Landroidx/media/MediaItem2;

    move-result-object v1

    .line 1385
    .local v1, "item":Landroidx/media/MediaItem2;
    if-nez v1, :cond_2

    .line 1386
    sget-boolean v2, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v2, :cond_2

    .line 1387
    const-string v2, "MS2ImplBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not find matching item for dsd="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/util/NoSuchElementException;

    invoke-direct {v4}, Ljava/util/NoSuchElementException;-><init>()V

    invoke-static {v2, v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1391
    :cond_2
    return-object v1
.end method

.method private getSession()Landroidx/media/MediaSession2ImplBase;
    .locals 4

    .line 1369
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->mSession:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaSession2ImplBase;

    .line 1370
    .local v0, "session":Landroidx/media/MediaSession2ImplBase;
    if-nez v0, :cond_0

    sget-boolean v1, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v1, :cond_0

    .line 1371
    const-string v1, "MS2ImplBase"

    const-string v2, "Session is closed"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1373
    :cond_0
    return-object v0
.end method


# virtual methods
.method public onBufferingStateChanged(Landroidx/media/BaseMediaPlayer;Landroidx/media/DataSourceDesc;I)V
    .locals 9
    .param p1, "mpb"    # Landroidx/media/BaseMediaPlayer;
    .param p2, "dsd"    # Landroidx/media/DataSourceDesc;
    .param p3, "state"    # I

    .line 1305
    invoke-direct {p0}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->getSession()Landroidx/media/MediaSession2ImplBase;

    move-result-object v6

    .line 1306
    .local v6, "session":Landroidx/media/MediaSession2ImplBase;
    if-eqz v6, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 1309
    :cond_0
    invoke-virtual {v6}, Landroidx/media/MediaSession2ImplBase;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v7

    new-instance v8, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;

    move-object v0, v8

    move-object v1, p0

    move-object v2, v6

    move-object v3, p2

    move-object v4, p1

    move v5, p3

    invoke-direct/range {v0 .. v5}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;-><init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroidx/media/MediaSession2ImplBase;Landroidx/media/DataSourceDesc;Landroidx/media/BaseMediaPlayer;I)V

    invoke-interface {v7, v8}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1326
    return-void

    .line 1307
    :cond_1
    :goto_0
    return-void
.end method

.method public onCurrentDataSourceChanged(Landroidx/media/BaseMediaPlayer;Landroidx/media/DataSourceDesc;)V
    .locals 3
    .param p1, "player"    # Landroidx/media/BaseMediaPlayer;
    .param p2, "dsd"    # Landroidx/media/DataSourceDesc;

    .line 1184
    invoke-direct {p0}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->getSession()Landroidx/media/MediaSession2ImplBase;

    move-result-object v0

    .line 1185
    .local v0, "session":Landroidx/media/MediaSession2ImplBase;
    if-nez v0, :cond_0

    .line 1186
    return-void

    .line 1188
    :cond_0
    invoke-virtual {v0}, Landroidx/media/MediaSession2ImplBase;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;

    invoke-direct {v2, p0, p2, v0, p1}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;-><init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroidx/media/DataSourceDesc;Landroidx/media/MediaSession2ImplBase;Landroidx/media/BaseMediaPlayer;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1213
    return-void
.end method

.method public onMediaPrepared(Landroidx/media/BaseMediaPlayer;Landroidx/media/DataSourceDesc;)V
    .locals 3
    .param p1, "mpb"    # Landroidx/media/BaseMediaPlayer;
    .param p2, "dsd"    # Landroidx/media/DataSourceDesc;

    .line 1217
    invoke-direct {p0}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->getSession()Landroidx/media/MediaSession2ImplBase;

    move-result-object v0

    .line 1218
    .local v0, "session":Landroidx/media/MediaSession2ImplBase;
    if-eqz v0, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 1221
    :cond_0
    invoke-virtual {v0}, Landroidx/media/MediaSession2ImplBase;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;

    invoke-direct {v2, p0, v0, p2, p1}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;-><init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroidx/media/MediaSession2ImplBase;Landroidx/media/DataSourceDesc;Landroidx/media/BaseMediaPlayer;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1276
    return-void

    .line 1219
    :cond_1
    :goto_0
    return-void
.end method

.method public onPlaybackSpeedChanged(Landroidx/media/BaseMediaPlayer;F)V
    .locals 3
    .param p1, "mpb"    # Landroidx/media/BaseMediaPlayer;
    .param p2, "speed"    # F

    .line 1330
    invoke-direct {p0}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->getSession()Landroidx/media/MediaSession2ImplBase;

    move-result-object v0

    .line 1331
    .local v0, "session":Landroidx/media/MediaSession2ImplBase;
    if-nez v0, :cond_0

    .line 1332
    return-void

    .line 1334
    :cond_0
    invoke-virtual {v0}, Landroidx/media/MediaSession2ImplBase;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$5;

    invoke-direct {v2, p0, v0, p1, p2}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$5;-><init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroidx/media/MediaSession2ImplBase;Landroidx/media/BaseMediaPlayer;F)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1346
    return-void
.end method

.method public onPlayerStateChanged(Landroidx/media/BaseMediaPlayer;I)V
    .locals 3
    .param p1, "player"    # Landroidx/media/BaseMediaPlayer;
    .param p2, "state"    # I

    .line 1280
    invoke-direct {p0}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->getSession()Landroidx/media/MediaSession2ImplBase;

    move-result-object v0

    .line 1281
    .local v0, "session":Landroidx/media/MediaSession2ImplBase;
    if-nez v0, :cond_0

    .line 1282
    return-void

    .line 1284
    :cond_0
    invoke-virtual {v0}, Landroidx/media/MediaSession2ImplBase;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;

    invoke-direct {v2, p0, v0, p2, p1}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;-><init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroidx/media/MediaSession2ImplBase;ILandroidx/media/BaseMediaPlayer;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1300
    return-void
.end method

.method public onSeekCompleted(Landroidx/media/BaseMediaPlayer;J)V
    .locals 9
    .param p1, "mpb"    # Landroidx/media/BaseMediaPlayer;
    .param p2, "position"    # J

    .line 1350
    invoke-direct {p0}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->getSession()Landroidx/media/MediaSession2ImplBase;

    move-result-object v6

    .line 1351
    .local v6, "session":Landroidx/media/MediaSession2ImplBase;
    if-nez v6, :cond_0

    .line 1352
    return-void

    .line 1354
    :cond_0
    invoke-virtual {v6}, Landroidx/media/MediaSession2ImplBase;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v7

    new-instance v8, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$6;

    move-object v0, v8

    move-object v1, p0

    move-object v2, v6

    move-object v3, p1

    move-wide v4, p2

    invoke-direct/range {v0 .. v5}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$6;-><init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroidx/media/MediaSession2ImplBase;Landroidx/media/BaseMediaPlayer;J)V

    invoke-interface {v7, v8}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1366
    return-void
.end method
