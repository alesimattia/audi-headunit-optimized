.class Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;
.super Landroidx/media/BaseMediaPlayer;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaPlayer2Impl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BaseMediaPlayerImpl"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;


# direct methods
.method private constructor <init>(Landroidx/media/MediaPlayer2Impl;)V
    .locals 0

    .line 2492
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-direct {p0}, Landroidx/media/BaseMediaPlayer;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/media/MediaPlayer2Impl;
    .param p2, "x1"    # Landroidx/media/MediaPlayer2Impl$1;

    .line 2492
    invoke-direct {p0, p1}, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;-><init>(Landroidx/media/MediaPlayer2Impl;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 2615
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl;->close()V

    .line 2616
    return-void
.end method

.method public getAudioAttributes()Landroidx/media/AudioAttributesCompat;
    .locals 1

    .line 2555
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl;->getAudioAttributes()Landroidx/media/AudioAttributesCompat;

    move-result-object v0

    return-object v0
.end method

.method public getBufferedPosition()J
    .locals 2

    .line 2535
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl;->getBufferedPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getBufferingState()I
    .locals 1

    .line 2545
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$2600(Landroidx/media/MediaPlayer2Impl;)I

    move-result v0

    return v0
.end method

.method public getCurrentDataSource()Landroidx/media/DataSourceDesc;
    .locals 1

    .line 2575
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl;->getCurrentDataSource()Landroidx/media/DataSourceDesc;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentPosition()J
    .locals 2

    .line 2525
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl;->getCurrentPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getDuration()J
    .locals 2

    .line 2530
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl;->getDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getPlaybackSpeed()F
    .locals 1

    .line 2590
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl;->getPlaybackSpeed()F

    move-result v0

    return v0
.end method

.method public getPlayerState()I
    .locals 1

    .line 2540
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$2500(Landroidx/media/MediaPlayer2Impl;)I

    move-result v0

    return v0
.end method

.method public getPlayerVolume()F
    .locals 1

    .line 2600
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl;->getPlayerVolume()F

    move-result v0

    return v0
.end method

.method public loopCurrent(Z)V
    .locals 1
    .param p1, "loop"    # Z

    .line 2580
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0, p1}, Landroidx/media/MediaPlayer2Impl;->loopCurrent(Z)V

    .line 2581
    return-void
.end method

.method public pause()V
    .locals 1

    .line 2505
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl;->pause()V

    .line 2506
    return-void
.end method

.method public play()V
    .locals 1

    .line 2495
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl;->play()V

    .line 2496
    return-void
.end method

.method public prepare()V
    .locals 1

    .line 2500
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl;->prepare()V

    .line 2501
    return-void
.end method

.method public registerPlayerEventCallback(Ljava/util/concurrent/Executor;Landroidx/media/BaseMediaPlayer$PlayerEventCallback;)V
    .locals 1
    .param p1, "e"    # Ljava/util/concurrent/Executor;
    .param p2, "cb"    # Landroidx/media/BaseMediaPlayer$PlayerEventCallback;

    .line 2605
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0, p1, p2}, Landroidx/media/MediaPlayer2Impl;->access$2700(Landroidx/media/MediaPlayer2Impl;Ljava/util/concurrent/Executor;Landroidx/media/BaseMediaPlayer$PlayerEventCallback;)V

    .line 2606
    return-void
.end method

.method public reset()V
    .locals 1

    .line 2510
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl;->reset()V

    .line 2511
    return-void
.end method

.method public seekTo(J)V
    .locals 1
    .param p1, "pos"    # J

    .line 2520
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0, p1, p2}, Landroidx/media/MediaPlayer2Impl;->seekTo(J)V

    .line 2521
    return-void
.end method

.method public setAudioAttributes(Landroidx/media/AudioAttributesCompat;)V
    .locals 1
    .param p1, "attributes"    # Landroidx/media/AudioAttributesCompat;

    .line 2550
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0, p1}, Landroidx/media/MediaPlayer2Impl;->setAudioAttributes(Landroidx/media/AudioAttributesCompat;)V

    .line 2551
    return-void
.end method

.method public setDataSource(Landroidx/media/DataSourceDesc;)V
    .locals 1
    .param p1, "dsd"    # Landroidx/media/DataSourceDesc;

    .line 2560
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0, p1}, Landroidx/media/MediaPlayer2Impl;->setDataSource(Landroidx/media/DataSourceDesc;)V

    .line 2561
    return-void
.end method

.method public setNextDataSource(Landroidx/media/DataSourceDesc;)V
    .locals 1
    .param p1, "dsd"    # Landroidx/media/DataSourceDesc;

    .line 2565
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0, p1}, Landroidx/media/MediaPlayer2Impl;->setNextDataSource(Landroidx/media/DataSourceDesc;)V

    .line 2566
    return-void
.end method

.method public setNextDataSources(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media/DataSourceDesc;",
            ">;)V"
        }
    .end annotation

    .line 2570
    .local p1, "dsds":Ljava/util/List;, "Ljava/util/List<Landroidx/media/DataSourceDesc;>;"
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0, p1}, Landroidx/media/MediaPlayer2Impl;->setNextDataSources(Ljava/util/List;)V

    .line 2571
    return-void
.end method

.method public setPlaybackSpeed(F)V
    .locals 1
    .param p1, "speed"    # F

    .line 2585
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0, p1}, Landroidx/media/MediaPlayer2Impl;->setPlaybackSpeed(F)V

    .line 2586
    return-void
.end method

.method public setPlayerVolume(F)V
    .locals 1
    .param p1, "volume"    # F

    .line 2595
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0, p1}, Landroidx/media/MediaPlayer2Impl;->setPlayerVolume(F)V

    .line 2596
    return-void
.end method

.method public skipToNext()V
    .locals 1

    .line 2515
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl;->skipToNext()V

    .line 2516
    return-void
.end method

.method public unregisterPlayerEventCallback(Landroidx/media/BaseMediaPlayer$PlayerEventCallback;)V
    .locals 1
    .param p1, "cb"    # Landroidx/media/BaseMediaPlayer$PlayerEventCallback;

    .line 2610
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0, p1}, Landroidx/media/MediaPlayer2Impl;->access$2800(Landroidx/media/MediaPlayer2Impl;Landroidx/media/BaseMediaPlayer$PlayerEventCallback;)V

    .line 2611
    return-void
.end method
