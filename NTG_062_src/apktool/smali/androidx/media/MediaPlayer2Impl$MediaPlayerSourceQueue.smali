.class Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaPlayer2Impl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MediaPlayerSourceQueue"
.end annotation


# instance fields
.field mQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;",
            ">;"
        }
    .end annotation
.end field

.field mSurface:Landroid/view/Surface;

.field mVolume:F

.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;)V
    .locals 3

    .line 2065
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2061
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    .line 2062
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mVolume:F

    .line 2066
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    new-instance v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;-><init>(Landroidx/media/MediaPlayer2Impl;Landroidx/media/DataSourceDesc;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2067
    return-void
.end method


# virtual methods
.method declared-synchronized attachAuxEffect(I)V
    .locals 1
    .param p1, "effectId"    # I

    monitor-enter p0

    .line 2356
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->attachAuxEffect(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2357
    monitor-exit p0

    return-void

    .line 2355
    .end local p1    # "effectId":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized deselectTrack(I)V
    .locals 1
    .param p1, "index"    # I

    monitor-enter p0

    .line 2376
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->deselectTrack(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2377
    monitor-exit p0

    return-void

    .line 2375
    .end local p1    # "index":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized getAudioSessionId()I
    .locals 1

    monitor-enter p0

    .line 2352
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getAudioSessionId()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getBufferedPosition()J
    .locals 5

    monitor-enter p0

    .line 2149
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    .line 2150
    .local v0, "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    iget-object v1, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    int-to-long v1, v1

    iget-object v3, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mBufferedPercentage:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    int-to-long v3, v3

    mul-long/2addr v1, v3

    const-wide/16 v3, 0x64

    div-long/2addr v1, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v1

    .line 2148
    .end local v0    # "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getBufferingState()I
    .locals 2

    monitor-enter p0

    .line 2475
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    iget v0, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mBufferingState:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getCurrentPlayer()Landroid/media/MediaPlayer;
    .locals 2

    monitor-enter p0

    .line 2070
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    iget-object v0, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getCurrentPosition()J
    .locals 2

    monitor-enter p0

    .line 2141
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    int-to-long v0, v0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getDrmInfo()Landroid/media/MediaPlayer$DrmInfo;
    .locals 1

    monitor-enter p0

    .line 2380
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDrmInfo()Landroid/media/MediaPlayer$DrmInfo;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getDrmPropertyString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "propertyName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/MediaPlayer$NoDrmSchemeException;
        }
    .end annotation

    monitor-enter p0

    .line 2405
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->getDrmPropertyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .end local p1    # "propertyName":Ljava/lang/String;
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized getDuration()J
    .locals 2

    monitor-enter p0

    .line 2145
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    int-to-long v0, v0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getFirst()Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    .locals 2

    monitor-enter p0

    .line 2074
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getKeyRequest([B[BLjava/lang/String;ILjava/util/Map;)Landroid/media/MediaDrm$KeyRequest;
    .locals 6
    .param p1, "keySetId"    # [B
    .param p2, "initData"    # [B
    .param p3, "mimeType"    # Ljava/lang/String;
    .param p4, "keyType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B[B",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/media/MediaDrm$KeyRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/MediaPlayer$NoDrmSchemeException;
        }
    .end annotation

    .local p5, "optionalParameters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    monitor-enter p0

    .line 2421
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->getKeyRequest([B[BLjava/lang/String;ILjava/util/Map;)Landroid/media/MediaDrm$KeyRequest;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .end local p1    # "keySetId":[B
    .end local p2    # "initData":[B
    .end local p3    # "mimeType":Ljava/lang/String;
    .end local p4    # "keyType":I
    .end local p5    # "optionalParameters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized getMediaPlayer2State()I
    .locals 2

    monitor-enter p0

    .line 2471
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    iget v0, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mMp2State:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getMetrics()Landroid/os/PersistableBundle;
    .locals 1

    monitor-enter p0

    .line 2315
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getMetrics()Landroid/os/PersistableBundle;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getPlaybackParams()Landroid/media/PlaybackParams;
    .locals 1

    monitor-enter p0

    .line 2319
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getPlaybackParams()Landroid/media/PlaybackParams;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getPlayerState()I
    .locals 2

    monitor-enter p0

    .line 2479
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    iget v0, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayerState:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getSelectedTrack(I)I
    .locals 1
    .param p1, "trackType"    # I

    monitor-enter p0

    .line 2368
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->getSelectedTrack(I)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .end local p1    # "trackType":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized getSourceForPlayer(Landroid/media/MediaPlayer;)Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    .locals 3
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    monitor-enter p0

    .line 2483
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    .line 2484
    .local v1, "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    iget-object v2, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v2, p1, :cond_0

    .line 2485
    monitor-exit p0

    return-object v1

    .line 2487
    .end local v1    # "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    :cond_0
    goto :goto_0

    .line 2488
    :cond_1
    const/4 v0, 0x0

    monitor-exit p0

    return-object v0

    .line 2482
    .end local p1    # "mp":Landroid/media/MediaPlayer;
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized getSyncParams()Landroid/media/SyncParams;
    .locals 1

    monitor-enter p0

    .line 2327
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getSyncParams()Landroid/media/SyncParams;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getTimestamp()Landroid/media/MediaTimestamp;
    .locals 1

    monitor-enter p0

    .line 2344
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getTimestamp()Landroid/media/MediaTimestamp;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getTrackInfo()[Landroid/media/MediaPlayer$TrackInfo;
    .locals 1

    monitor-enter p0

    .line 2364
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getTrackInfo()[Landroid/media/MediaPlayer$TrackInfo;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getVideoHeight()I
    .locals 1

    monitor-enter p0

    .line 2311
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getVideoWidth()I
    .locals 1

    monitor-enter p0

    .line 2307
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized getVolume()F
    .locals 1

    monitor-enter p0

    .line 2293
    :try_start_0
    iget v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mVolume:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized moveToNext()V
    .locals 4

    monitor-enter p0

    .line 2199
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    .line 2200
    .local v0, "src1":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    iget-object v2, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->release()V

    .line 2201
    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 2204
    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    .line 2205
    .local v1, "src2":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    iget v2, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayerState:I

    iget v3, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayerState:I

    if-eq v2, v3, :cond_0

    .line 2206
    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->this$0:Landroidx/media/MediaPlayer2Impl;

    new-instance v3, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$2;

    invoke-direct {v3, p0, v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$2;-><init>(Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;)V

    invoke-static {v2, v3}, Landroidx/media/MediaPlayer2Impl;->access$900(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;)V

    .line 2213
    :cond_0
    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->this$0:Landroidx/media/MediaPlayer2Impl;

    new-instance v3, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$3;

    invoke-direct {v3, p0, v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$3;-><init>(Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;)V

    invoke-static {v2, v3}, Landroidx/media/MediaPlayer2Impl;->access$900(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2219
    monitor-exit p0

    return-void

    .line 2202
    .end local v1    # "src2":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "player/source queue emptied"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2198
    .end local v0    # "src1":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized onCompletion(Landroid/media/MediaPlayer;)Landroidx/media/MediaPlayer2Impl$DataSourceError;
    .locals 3
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    monitor-enter p0

    .line 2180
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    if-ne p1, v0, :cond_1

    .line 2181
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 2182
    const/16 v0, 0x3eb

    invoke-virtual {p0, p1, v0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setMp2State(Landroid/media/MediaPlayer;I)V

    .line 2184
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroidx/media/DataSourceDesc;

    move-result-object v0

    .line 2185
    .local v0, "dsd":Landroidx/media/DataSourceDesc;
    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->this$0:Landroidx/media/MediaPlayer2Impl;

    new-instance v2, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$1;

    invoke-direct {v2, p0, v0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$1;-><init>(Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;Landroidx/media/DataSourceDesc;)V

    invoke-static {v1, v2}, Landroidx/media/MediaPlayer2Impl;->access$600(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2191
    const/4 v1, 0x0

    monitor-exit p0

    return-object v1

    .line 2193
    .end local v0    # "dsd":Landroidx/media/DataSourceDesc;
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->moveToNext()V

    .line 2195
    :cond_1
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->playCurrent()Landroidx/media/MediaPlayer2Impl$DataSourceError;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    .line 2179
    .end local p1    # "mp":Landroid/media/MediaPlayer;
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized onError(Landroid/media/MediaPlayer;)V
    .locals 1
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    monitor-enter p0

    .line 2247
    const/16 v0, 0x3ed

    :try_start_0
    invoke-virtual {p0, p1, v0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setMp2State(Landroid/media/MediaPlayer;I)V

    .line 2248
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setBufferingState(Landroid/media/MediaPlayer;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2249
    monitor-exit p0

    return-void

    .line 2246
    .end local p1    # "mp":Landroid/media/MediaPlayer;
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized onPrepared(Landroid/media/MediaPlayer;)Landroidx/media/MediaPlayer2Impl$DataSourceError;
    .locals 4
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    monitor-enter p0

    .line 2158
    const/4 v0, 0x0

    move v1, v0

    .local v1, "i":I
    :goto_0
    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 2159
    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    .line 2160
    .local v2, "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    iget-object v3, v2, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    if-ne p1, v3, :cond_2

    .line 2161
    if-nez v1, :cond_1

    .line 2162
    iget-boolean v3, v2, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayPending:Z

    if-eqz v3, :cond_0

    .line 2163
    iput-boolean v0, v2, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayPending:Z

    .line 2164
    iget-object v0, v2, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 2165
    iget-object v0, v2, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    const/16 v3, 0x3ec

    invoke-virtual {p0, v0, v3}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setMp2State(Landroid/media/MediaPlayer;I)V

    goto :goto_1

    .line 2167
    :cond_0
    iget-object v0, v2, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    const/16 v3, 0x3ea

    invoke-virtual {p0, v0, v3}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setMp2State(Landroid/media/MediaPlayer;I)V

    .line 2170
    :cond_1
    :goto_1
    const/4 v0, 0x2

    iput v0, v2, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mSourceState:I

    .line 2171
    iget-object v0, v2, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    const/4 v3, 0x1

    invoke-virtual {p0, v0, v3}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setBufferingState(Landroid/media/MediaPlayer;I)V

    .line 2173
    add-int/lit8 v0, v1, 0x1

    invoke-virtual {p0, v0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->prepareAt(I)Landroidx/media/MediaPlayer2Impl$DataSourceError;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 2158
    .end local v2    # "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2176
    .end local v1    # "i":I
    :cond_3
    const/4 v0, 0x0

    monitor-exit p0

    return-object v0

    .line 2157
    .end local p1    # "mp":Landroid/media/MediaPlayer;
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized pause()V
    .locals 2

    monitor-enter p0

    .line 2135
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    .line 2136
    .local v0, "mp":Landroid/media/MediaPlayer;
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 2137
    const/16 v1, 0x3eb

    invoke-virtual {p0, v0, v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setMp2State(Landroid/media/MediaPlayer;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2138
    monitor-exit p0

    return-void

    .line 2134
    .end local v0    # "mp":Landroid/media/MediaPlayer;
    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized play()V
    .locals 3

    monitor-enter p0

    .line 2113
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    .line 2114
    .local v0, "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    iget v1, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mSourceState:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 2115
    iget-object v1, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 2116
    iget-object v1, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    const/16 v2, 0x3ec

    invoke-virtual {p0, v1, v2}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setMp2State(Landroid/media/MediaPlayer;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2118
    :cond_0
    monitor-exit p0

    return-void

    .line 2112
    .end local v0    # "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized playCurrent()Landroidx/media/MediaPlayer2Impl$DataSourceError;
    .locals 6

    monitor-enter p0

    .line 2222
    const/4 v0, 0x0

    .line 2223
    .local v0, "err":Landroidx/media/MediaPlayer2Impl$DataSourceError;
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    .line 2224
    .local v1, "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    iget-object v3, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    iget-object v4, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mSurface:Landroid/view/Surface;

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 2225
    iget-object v3, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    iget v4, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mVolume:F

    iget v5, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mVolume:F

    invoke-virtual {v3, v4, v5}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 2226
    iget v3, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mSourceState:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    .line 2228
    iget-object v2, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->start()V

    .line 2229
    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->this$0:Landroidx/media/MediaPlayer2Impl;

    new-instance v3, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$4;

    invoke-direct {v3, p0, v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$4;-><init>(Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;)V

    invoke-static {v2, v3}, Landroidx/media/MediaPlayer2Impl;->access$600(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;)V

    goto :goto_0

    .line 2238
    :cond_0
    iget v3, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mSourceState:I

    if-nez v3, :cond_1

    .line 2239
    invoke-virtual {p0, v2}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->prepareAt(I)Landroidx/media/MediaPlayer2Impl$DataSourceError;

    move-result-object v2

    move-object v0, v2

    .line 2241
    :cond_1
    const/4 v2, 0x1

    iput-boolean v2, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayPending:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2243
    :goto_0
    monitor-exit p0

    return-object v0

    .line 2221
    .end local v0    # "err":Landroidx/media/MediaPlayer2Impl$DataSourceError;
    .end local v1    # "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized prepare()V
    .locals 1

    monitor-enter p0

    .line 2121
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2122
    monitor-exit p0

    return-void

    .line 2120
    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized prepareAsync()V
    .locals 2

    monitor-enter p0

    .line 2129
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    .line 2130
    .local v0, "mp":Landroid/media/MediaPlayer;
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 2131
    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setBufferingState(Landroid/media/MediaPlayer;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2132
    monitor-exit p0

    return-void

    .line 2128
    .end local v0    # "mp":Landroid/media/MediaPlayer;
    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized prepareAt(I)Landroidx/media/MediaPlayer2Impl$DataSourceError;
    .locals 6
    .param p1, "n"    # I

    monitor-enter p0

    .line 2252
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    if-ge p1, v0, :cond_1

    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    .line 2253
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    iget v0, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mSourceState:I

    if-nez v0, :cond_1

    .line 2254
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getPlayerState()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 2259
    :cond_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2261
    .local v0, "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    const/4 v2, 0x1

    :try_start_1
    iput v2, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mSourceState:I

    .line 2262
    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$2300(Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;)V

    .line 2263
    iget-object v3, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->prepareAsync()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2264
    monitor-exit p0

    return-object v1

    .line 2265
    :catch_0
    move-exception v1

    .line 2266
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroidx/media/DataSourceDesc;

    move-result-object v3

    .line 2267
    .local v3, "dsd":Landroidx/media/DataSourceDesc;
    iget-object v4, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    const/16 v5, 0x3ed

    invoke-virtual {p0, v4, v5}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setMp2State(Landroid/media/MediaPlayer;I)V

    .line 2268
    new-instance v4, Landroidx/media/MediaPlayer2Impl$DataSourceError;

    const/16 v5, -0x3f2

    invoke-direct {v4, v3, v2, v5}, Landroidx/media/MediaPlayer2Impl$DataSourceError;-><init>(Landroidx/media/DataSourceDesc;II)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v4

    .line 2256
    .end local v0    # "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "dsd":Landroidx/media/DataSourceDesc;
    :cond_1
    :goto_0
    monitor-exit p0

    return-object v1

    .line 2251
    .end local p1    # "n":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized prepareDrm(Ljava/util/UUID;)V
    .locals 1
    .param p1, "uuid"    # Ljava/util/UUID;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/ResourceBusyException;,
            Landroid/media/MediaPlayer$ProvisioningServerErrorException;,
            Landroid/media/MediaPlayer$ProvisioningNetworkErrorException;,
            Landroid/media/UnsupportedSchemeException;
        }
    .end annotation

    monitor-enter p0

    .line 2386
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->prepareDrm(Ljava/util/UUID;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2387
    monitor-exit p0

    return-void

    .line 2385
    .end local p1    # "uuid":Ljava/util/UUID;
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized provideKeyResponse([B[B)[B
    .locals 1
    .param p1, "keySetId"    # [B
    .param p2, "response"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/DeniedByServerException;,
            Landroid/media/MediaPlayer$NoDrmSchemeException;
        }
    .end annotation

    monitor-enter p0

    .line 2396
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/media/MediaPlayer;->provideKeyResponse([B[B)[B

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .end local p1    # "keySetId":[B
    .end local p2    # "response":[B
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized release()V
    .locals 1

    monitor-enter p0

    .line 2125
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2126
    monitor-exit p0

    return-void

    .line 2124
    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized releaseDrm()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/MediaPlayer$NoDrmSchemeException;
        }
    .end annotation

    monitor-enter p0

    .line 2390
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 2391
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->releaseDrm()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2392
    monitor-exit p0

    return-void

    .line 2389
    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized reset()V
    .locals 4

    monitor-enter p0

    .line 2335
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    .line 2336
    .local v0, "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    iget-object v2, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->reset()V

    .line 2337
    iget-object v2, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mBufferedPercentage:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 2338
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mVolume:F

    .line 2339
    iget-object v2, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    const/16 v3, 0x3e9

    invoke-virtual {p0, v2, v3}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setMp2State(Landroid/media/MediaPlayer;I)V

    .line 2340
    iget-object v2, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p0, v2, v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setBufferingState(Landroid/media/MediaPlayer;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2341
    monitor-exit p0

    return-void

    .line 2334
    .end local v0    # "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method

.method declared-synchronized restoreKeys([B)V
    .locals 1
    .param p1, "keySetId"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/MediaPlayer$NoDrmSchemeException;
        }
    .end annotation

    monitor-enter p0

    .line 2400
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->restoreKeys([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2401
    monitor-exit p0

    return-void

    .line 2399
    .end local p1    # "keySetId":[B
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized seekTo(JI)V
    .locals 1
    .param p1, "msec"    # J
    .param p3, "mode"    # I

    monitor-enter p0

    .line 2331
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroid/media/MediaPlayer;->seekTo(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2332
    monitor-exit p0

    return-void

    .line 2330
    .end local p1    # "msec":J
    .end local p3    # "mode":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized selectTrack(I)V
    .locals 1
    .param p1, "index"    # I

    monitor-enter p0

    .line 2372
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->selectTrack(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2373
    monitor-exit p0

    return-void

    .line 2371
    .end local p1    # "index":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized setAudioAttributes(Landroid/media/AudioAttributes;)V
    .locals 1
    .param p1, "attributes"    # Landroid/media/AudioAttributes;

    monitor-enter p0

    .line 2154
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setAudioAttributes(Landroid/media/AudioAttributes;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2155
    monitor-exit p0

    return-void

    .line 2153
    .end local p1    # "attributes":Landroid/media/AudioAttributes;
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized setAudioSessionId(I)V
    .locals 1
    .param p1, "sessionId"    # I

    monitor-enter p0

    .line 2348
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setAudioSessionId(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2349
    monitor-exit p0

    return-void

    .line 2347
    .end local p1    # "sessionId":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized setAuxEffectSendLevel(F)V
    .locals 1
    .param p1, "level"    # F

    monitor-enter p0

    .line 2360
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setAuxEffectSendLevel(F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2361
    monitor-exit p0

    return-void

    .line 2359
    .end local p1    # "level":F
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized setBufferingState(Landroid/media/MediaPlayer;I)V
    .locals 3
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "state"    # I

    monitor-enter p0

    .line 2451
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    .line 2452
    .local v1, "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    iget-object v2, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    if-eq v2, p1, :cond_0

    .line 2453
    goto :goto_0

    .line 2455
    :cond_0
    iget v0, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mBufferingState:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, p2, :cond_1

    .line 2456
    monitor-exit p0

    return-void

    .line 2458
    :cond_1
    :try_start_1
    iput p2, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mBufferingState:I

    .line 2459
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->this$0:Landroidx/media/MediaPlayer2Impl;

    new-instance v2, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$6;

    invoke-direct {v2, p0, v1, p2}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$6;-><init>(Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;I)V

    invoke-static {v0, v2}, Landroidx/media/MediaPlayer2Impl;->access$900(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2466
    monitor-exit p0

    return-void

    .line 2468
    .end local v1    # "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    :cond_2
    monitor-exit p0

    return-void

    .line 2450
    .end local p1    # "mp":Landroid/media/MediaPlayer;
    .end local p2    # "state":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized setDrmPropertyString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/MediaPlayer$NoDrmSchemeException;
        }
    .end annotation

    monitor-enter p0

    .line 2410
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/media/MediaPlayer;->setDrmPropertyString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2411
    monitor-exit p0

    return-void

    .line 2409
    .end local p1    # "propertyName":Ljava/lang/String;
    .end local p2    # "value":Ljava/lang/String;
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized setFirst(Landroidx/media/DataSourceDesc;)V
    .locals 4
    .param p1, "dsd"    # Landroidx/media/DataSourceDesc;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 2078
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2079
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    new-instance v2, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    iget-object v3, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-direct {v2, v3, p1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;-><init>(Landroidx/media/MediaPlayer2Impl;Landroidx/media/DataSourceDesc;)V

    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 2081
    :cond_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    iput-object p1, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mDSD:Landroidx/media/DataSourceDesc;

    .line 2082
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-static {v0, v2}, Landroidx/media/MediaPlayer2Impl;->access$2200(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;)V

    .line 2084
    :goto_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$2300(Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2085
    monitor-exit p0

    return-void

    .line 2077
    .end local p1    # "dsd":Landroidx/media/DataSourceDesc;
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized setLooping(Z)V
    .locals 1
    .param p1, "loop"    # Z

    monitor-enter p0

    .line 2285
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setLooping(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2286
    monitor-exit p0

    return-void

    .line 2284
    .end local p1    # "loop":Z
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized setMp2State(Landroid/media/MediaPlayer;I)V
    .locals 4
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "mp2State"    # I

    monitor-enter p0

    .line 2426
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    .line 2427
    .local v1, "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    iget-object v2, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    if-eq v2, p1, :cond_0

    .line 2428
    goto :goto_0

    .line 2430
    :cond_0
    iget v0, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mMp2State:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, p2, :cond_1

    .line 2431
    monitor-exit p0

    return-void

    .line 2433
    :cond_1
    :try_start_1
    iput p2, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mMp2State:I

    .line 2435
    invoke-static {}, Landroidx/media/MediaPlayer2Impl;->access$2400()Landroidx/collection/ArrayMap;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroidx/collection/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 2436
    .local v0, "playerState":I
    iget v2, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayerState:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-ne v2, v0, :cond_2

    .line 2437
    monitor-exit p0

    return-void

    .line 2439
    :cond_2
    :try_start_2
    iput v0, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayerState:I

    .line 2440
    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->this$0:Landroidx/media/MediaPlayer2Impl;

    new-instance v3, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$5;

    invoke-direct {v3, p0, v0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$5;-><init>(Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;I)V

    invoke-static {v2, v3}, Landroidx/media/MediaPlayer2Impl;->access$900(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2446
    monitor-exit p0

    return-void

    .line 2448
    .end local v0    # "playerState":I
    .end local v1    # "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    :cond_3
    monitor-exit p0

    return-void

    .line 2425
    .end local p1    # "mp":Landroid/media/MediaPlayer;
    .end local p2    # "mp2State":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized setNext(Landroidx/media/DataSourceDesc;)Landroidx/media/MediaPlayer2Impl$DataSourceError;
    .locals 3
    .param p1, "dsd"    # Landroidx/media/DataSourceDesc;

    monitor-enter p0

    .line 2088
    :try_start_0
    new-instance v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-direct {v0, v1, p1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;-><init>(Landroidx/media/MediaPlayer2Impl;Landroidx/media/DataSourceDesc;)V

    .line 2089
    .local v0, "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2090
    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2091
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->prepareAt(I)Landroidx/media/MediaPlayer2Impl$DataSourceError;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    .line 2093
    :cond_0
    :try_start_1
    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    const/4 v2, 0x1

    invoke-interface {v1, v2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 2094
    invoke-virtual {p0, v2}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->prepareAt(I)Landroidx/media/MediaPlayer2Impl$DataSourceError;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v1

    .line 2087
    .end local v0    # "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    .end local p1    # "dsd":Landroidx/media/DataSourceDesc;
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized setNextMultiple(Ljava/util/List;)Landroidx/media/MediaPlayer2Impl$DataSourceError;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media/DataSourceDesc;",
            ">;)",
            "Landroidx/media/MediaPlayer2Impl$DataSourceError;"
        }
    .end annotation

    .local p1, "descs":Ljava/util/List;, "Ljava/util/List<Landroidx/media/DataSourceDesc;>;"
    monitor-enter p0

    .line 2099
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2100
    .local v0, "sources":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media/DataSourceDesc;

    .line 2101
    .local v2, "dsd":Landroidx/media/DataSourceDesc;
    new-instance v3, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    iget-object v4, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-direct {v3, v4, v2}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;-><init>(Landroidx/media/MediaPlayer2Impl;Landroidx/media/DataSourceDesc;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2102
    .end local v2    # "dsd":Landroidx/media/DataSourceDesc;
    goto :goto_0

    .line 2103
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2104
    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 2105
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->prepareAt(I)Landroidx/media/MediaPlayer2Impl$DataSourceError;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    .line 2107
    :cond_1
    :try_start_1
    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    const/4 v2, 0x1

    invoke-interface {v1, v2, v0}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 2108
    invoke-virtual {p0, v2}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->prepareAt(I)Landroidx/media/MediaPlayer2Impl$DataSourceError;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v1

    .line 2098
    .end local v0    # "sources":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;>;"
    .end local p1    # "descs":Ljava/util/List;, "Ljava/util/List<Landroidx/media/DataSourceDesc;>;"
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized setOnDrmConfigHelper(Landroid/media/MediaPlayer$OnDrmConfigHelper;)V
    .locals 1
    .param p1, "onDrmConfigHelper"    # Landroid/media/MediaPlayer$OnDrmConfigHelper;

    monitor-enter p0

    .line 2414
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setOnDrmConfigHelper(Landroid/media/MediaPlayer$OnDrmConfigHelper;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2415
    monitor-exit p0

    return-void

    .line 2413
    .end local p1    # "onDrmConfigHelper":Landroid/media/MediaPlayer$OnDrmConfigHelper;
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized setPlaybackParams(Landroid/media/PlaybackParams;)V
    .locals 1
    .param p1, "playbackParams"    # Landroid/media/PlaybackParams;

    monitor-enter p0

    .line 2289
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setPlaybackParams(Landroid/media/PlaybackParams;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2290
    monitor-exit p0

    return-void

    .line 2288
    .end local p1    # "playbackParams":Landroid/media/PlaybackParams;
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized setSurface(Landroid/view/Surface;)V
    .locals 1
    .param p1, "surface"    # Landroid/view/Surface;

    monitor-enter p0

    .line 2302
    :try_start_0
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mSurface:Landroid/view/Surface;

    .line 2303
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2304
    monitor-exit p0

    return-void

    .line 2301
    .end local p1    # "surface":Landroid/view/Surface;
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized setSyncParams(Landroid/media/SyncParams;)V
    .locals 1
    .param p1, "params"    # Landroid/media/SyncParams;

    monitor-enter p0

    .line 2323
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setSyncParams(Landroid/media/SyncParams;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2324
    monitor-exit p0

    return-void

    .line 2322
    .end local p1    # "params":Landroid/media/SyncParams;
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized setVolume(F)V
    .locals 1
    .param p1, "volume"    # F

    monitor-enter p0

    .line 2297
    :try_start_0
    iput p1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mVolume:F

    .line 2298
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getCurrentPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1, p1}, Landroid/media/MediaPlayer;->setVolume(FF)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2299
    monitor-exit p0

    return-void

    .line 2296
    .end local p1    # "volume":F
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw p1
.end method

.method declared-synchronized skipToNext()V
    .locals 3

    monitor-enter p0

    .line 2274
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    .line 2277
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->mQueue:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    .line 2278
    .local v0, "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->moveToNext()V

    .line 2279
    iget v1, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayerState:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 2280
    invoke-virtual {p0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->playCurrent()Landroidx/media/MediaPlayer2Impl$DataSourceError;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2282
    :cond_0
    monitor-exit p0

    return-void

    .line 2275
    .end local v0    # "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    :cond_1
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No next source available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2273
    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;
    throw v0
.end method
