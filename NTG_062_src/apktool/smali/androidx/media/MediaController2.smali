.class public Landroidx/media/MediaController2;
.super Ljava/lang/Object;
.source "MediaController2.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/MediaController2$PlaybackInfo;,
        Landroidx/media/MediaController2$ControllerCallback;,
        Landroidx/media/MediaController2$SupportLibraryImpl;,
        Landroidx/media/MediaController2$VolumeFlags;,
        Landroidx/media/MediaController2$VolumeDirection;
    }
.end annotation


# instance fields
.field private final mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

.field mTimeDiff:Ljava/lang/Long;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/media/SessionToken2;Ljava/util/concurrent/Executor;Landroidx/media/MediaController2$ControllerCallback;)V
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
    .param p4, "callback"    # Landroidx/media/MediaController2$ControllerCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    new-instance v0, Landroidx/media/MediaController2ImplBase;

    invoke-direct {v0, p1, p2, p3, p4}, Landroidx/media/MediaController2ImplBase;-><init>(Landroid/content/Context;Landroidx/media/SessionToken2;Ljava/util/concurrent/Executor;Landroidx/media/MediaController2$ControllerCallback;)V

    iput-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    .line 105
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p0}, Landroidx/media/MediaController2$SupportLibraryImpl;->setInstance(Landroidx/media/MediaController2;)V

    .line 106
    return-void
.end method


# virtual methods
.method public addPlaylistItem(ILandroidx/media/MediaItem2;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 514
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1, p2}, Landroidx/media/MediaController2$SupportLibraryImpl;->addPlaylistItem(ILandroidx/media/MediaItem2;)V

    .line 515
    return-void
.end method

.method public adjustVolume(II)V
    .locals 1
    .param p1, "direction"    # I
    .param p2, "flags"    # I

    .line 330
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1, p2}, Landroidx/media/MediaController2$SupportLibraryImpl;->adjustVolume(II)V

    .line 331
    return-void
.end method

.method public close()V
    .locals 1

    .line 115
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    goto :goto_0

    .line 116
    :catch_0
    move-exception v0

    .line 119
    :goto_0
    return-void
.end method

.method public fastForward()V
    .locals 1

    .line 172
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->fastForward()V

    .line 173
    return-void
.end method

.method getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 669
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    return-object v0
.end method

.method public getBufferedPosition()J
    .locals 2

    .line 409
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getBufferedPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getBufferingState()I
    .locals 1

    .line 397
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getBufferingState()I

    move-result v0

    return v0
.end method

.method getCallback()Landroidx/media/MediaController2$ControllerCallback;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 661
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaController2$ControllerCallback;

    move-result-object v0

    return-object v0
.end method

.method getCallbackExecutor()Ljava/util/concurrent/Executor;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 665
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    return-object v0
.end method

.method getContext()Landroid/content/Context;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 657
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentMediaItem()Landroidx/media/MediaItem2;
    .locals 1

    .line 547
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getCurrentMediaItem()Landroidx/media/MediaItem2;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentPosition()J
    .locals 2

    .line 370
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getCurrentPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getDuration()J
    .locals 2

    .line 358
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getPlaybackInfo()Landroidx/media/MediaController2$PlaybackInfo;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 418
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getPlaybackInfo()Landroidx/media/MediaController2$PlaybackInfo;

    move-result-object v0

    return-object v0
.end method

.method public getPlaybackSpeed()F
    .locals 1

    .line 380
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getPlaybackSpeed()F

    move-result v0

    return v0
.end method

.method public getPlayerState()I
    .locals 1

    .line 349
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getPlayerState()I

    move-result v0

    return v0
.end method

.method public getPlaylist()Ljava/util/List;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;"
        }
    .end annotation

    .line 462
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getPlaylist()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPlaylistMetadata()Landroidx/media/MediaMetadata2;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 498
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getPlaylistMetadata()Landroidx/media/MediaMetadata2;

    move-result-object v0

    return-object v0
.end method

.method public getRepeatMode()I
    .locals 1

    .line 589
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getRepeatMode()I

    move-result v0

    return v0
.end method

.method public getSessionActivity()Landroid/app/PendingIntent;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 339
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getSessionActivity()Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method public getSessionToken()Landroidx/media/SessionToken2;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 125
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getSessionToken()Landroidx/media/SessionToken2;

    move-result-object v0

    return-object v0
.end method

.method public getShuffleMode()I
    .locals 1

    .line 614
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->getShuffleMode()I

    move-result v0

    return v0
.end method

.method public isConnected()Z
    .locals 1

    .line 132
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->isConnected()Z

    move-result v0

    return v0
.end method

.method public pause()V
    .locals 1

    .line 146
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->pause()V

    .line 147
    return-void
.end method

.method public play()V
    .locals 1

    .line 139
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->play()V

    .line 140
    return-void
.end method

.method public playFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "mediaId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 218
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1, p2}, Landroidx/media/MediaController2$SupportLibraryImpl;->playFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 219
    return-void
.end method

.method public playFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 228
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1, p2}, Landroidx/media/MediaController2$SupportLibraryImpl;->playFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 229
    return-void
.end method

.method public playFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 239
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1, p2}, Landroidx/media/MediaController2$SupportLibraryImpl;->playFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V

    .line 240
    return-void
.end method

.method public prepare()V
    .locals 1

    .line 164
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->prepare()V

    .line 165
    return-void
.end method

.method public prepareFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "mediaId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 255
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1, p2}, Landroidx/media/MediaController2$SupportLibraryImpl;->prepareFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 256
    return-void
.end method

.method public prepareFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 271
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1, p2}, Landroidx/media/MediaController2$SupportLibraryImpl;->prepareFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 272
    return-void
.end method

.method public prepareFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 287
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1, p2}, Landroidx/media/MediaController2$SupportLibraryImpl;->prepareFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V

    .line 288
    return-void
.end method

.method public removePlaylistItem(Landroidx/media/MediaItem2;)V
    .locals 1
    .param p1, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 526
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1}, Landroidx/media/MediaController2$SupportLibraryImpl;->removePlaylistItem(Landroidx/media/MediaItem2;)V

    .line 527
    return-void
.end method

.method public replacePlaylistItem(ILandroidx/media/MediaItem2;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 537
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1, p2}, Landroidx/media/MediaController2$SupportLibraryImpl;->replacePlaylistItem(ILandroidx/media/MediaItem2;)V

    .line 538
    return-void
.end method

.method public reset()V
    .locals 1

    .line 153
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->reset()V

    .line 154
    return-void
.end method

.method public rewind()V
    .locals 1

    .line 180
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->rewind()V

    .line 181
    return-void
.end method

.method public seekTo(J)V
    .locals 1
    .param p1, "pos"    # J

    .line 189
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1, p2}, Landroidx/media/MediaController2$SupportLibraryImpl;->seekTo(J)V

    .line 190
    return-void
.end method

.method public selectRoute(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "route"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 653
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1}, Landroidx/media/MediaController2$SupportLibraryImpl;->selectRoute(Landroid/os/Bundle;)V

    .line 654
    return-void
.end method

.method public sendCustomCommand(Landroidx/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 1
    .param p1, "command"    # Landroidx/media/SessionCommand2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "args"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "cb"    # Landroid/os/ResultReceiver;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 446
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1, p2, p3}, Landroidx/media/MediaController2$SupportLibraryImpl;->sendCustomCommand(Landroidx/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    .line 447
    return-void
.end method

.method public setPlaybackSpeed(F)V
    .locals 1
    .param p1, "speed"    # F

    .line 387
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1}, Landroidx/media/MediaController2$SupportLibraryImpl;->setPlaybackSpeed(F)V

    .line 388
    return-void
.end method

.method public setPlaylist(Ljava/util/List;Landroidx/media/MediaMetadata2;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Landroidx/media/MediaMetadata2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;",
            "Landroidx/media/MediaMetadata2;",
            ")V"
        }
    .end annotation

    .line 478
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1, p2}, Landroidx/media/MediaController2$SupportLibraryImpl;->setPlaylist(Ljava/util/List;Landroidx/media/MediaMetadata2;)V

    .line 479
    return-void
.end method

.method public setRating(Ljava/lang/String;Landroidx/media/Rating2;)V
    .locals 1
    .param p1, "mediaId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "rating"    # Landroidx/media/Rating2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 434
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1, p2}, Landroidx/media/MediaController2$SupportLibraryImpl;->setRating(Ljava/lang/String;Landroidx/media/Rating2;)V

    .line 435
    return-void
.end method

.method public setRepeatMode(I)V
    .locals 1
    .param p1, "repeatMode"    # I

    .line 602
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1}, Landroidx/media/MediaController2$SupportLibraryImpl;->setRepeatMode(I)V

    .line 603
    return-void
.end method

.method public setShuffleMode(I)V
    .locals 1
    .param p1, "shuffleMode"    # I

    .line 626
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1}, Landroidx/media/MediaController2$SupportLibraryImpl;->setShuffleMode(I)V

    .line 627
    return-void
.end method

.method public setTimeDiff(Ljava/lang/Long;)V
    .locals 0
    .param p1, "timeDiff"    # Ljava/lang/Long;
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 680
    iput-object p1, p0, Landroidx/media/MediaController2;->mTimeDiff:Ljava/lang/Long;

    .line 681
    return-void
.end method

.method public setVolumeTo(II)V
    .locals 1
    .param p1, "value"    # I
    .param p2, "flags"    # I

    .line 306
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1, p2}, Landroidx/media/MediaController2$SupportLibraryImpl;->setVolumeTo(II)V

    .line 307
    return-void
.end method

.method public skipBackward()V
    .locals 1
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 207
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->skipBackward()V

    .line 208
    return-void
.end method

.method public skipForward()V
    .locals 1
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 198
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->skipForward()V

    .line 199
    return-void
.end method

.method public skipToNextItem()V
    .locals 1

    .line 565
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->skipToNextItem()V

    .line 566
    return-void
.end method

.method public skipToPlaylistItem(Landroidx/media/MediaItem2;)V
    .locals 1
    .param p1, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 576
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1}, Landroidx/media/MediaController2$SupportLibraryImpl;->skipToPlaylistItem(Landroidx/media/MediaItem2;)V

    .line 577
    return-void
.end method

.method public skipToPreviousItem()V
    .locals 1

    .line 556
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->skipToPreviousItem()V

    .line 557
    return-void
.end method

.method public subscribeRoutesInfo()V
    .locals 1

    .line 633
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->subscribeRoutesInfo()V

    .line 634
    return-void
.end method

.method public unsubscribeRoutesInfo()V
    .locals 1

    .line 644
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0}, Landroidx/media/MediaController2$SupportLibraryImpl;->unsubscribeRoutesInfo()V

    .line 645
    return-void
.end method

.method public updatePlaylistMetadata(Landroidx/media/MediaMetadata2;)V
    .locals 1
    .param p1, "metadata"    # Landroidx/media/MediaMetadata2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 487
    iget-object v0, p0, Landroidx/media/MediaController2;->mImpl:Landroidx/media/MediaController2$SupportLibraryImpl;

    invoke-interface {v0, p1}, Landroidx/media/MediaController2$SupportLibraryImpl;->updatePlaylistMetadata(Landroidx/media/MediaMetadata2;)V

    .line 488
    return-void
.end method
