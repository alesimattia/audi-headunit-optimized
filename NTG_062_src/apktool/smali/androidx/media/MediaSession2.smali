.class public Landroidx/media/MediaSession2;
.super Landroidx/media/MediaInterface2$SessionPlayer;
.source "MediaSession2.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/MediaSession2$BuilderBase;,
        Landroidx/media/MediaSession2$SupportLibraryImpl;,
        Landroidx/media/MediaSession2$ControllerCb;,
        Landroidx/media/MediaSession2$CommandButton;,
        Landroidx/media/MediaSession2$ControllerInfo;,
        Landroidx/media/MediaSession2$Builder;,
        Landroidx/media/MediaSession2$SessionCallback;,
        Landroidx/media/MediaSession2$OnDataSourceMissingHelper;,
        Landroidx/media/MediaSession2$ErrorCode;
    }
.end annotation


# static fields
.field public static final ERROR_CODE_ACTION_ABORTED:I = 0xa

.field public static final ERROR_CODE_APP_ERROR:I = 0x1

.field public static final ERROR_CODE_AUTHENTICATION_EXPIRED:I = 0x3

.field public static final ERROR_CODE_CONCURRENT_STREAM_LIMIT:I = 0x5

.field public static final ERROR_CODE_CONTENT_ALREADY_PLAYING:I = 0x8

.field public static final ERROR_CODE_END_OF_QUEUE:I = 0xb

.field public static final ERROR_CODE_NOT_AVAILABLE_IN_REGION:I = 0x7

.field public static final ERROR_CODE_NOT_SUPPORTED:I = 0x2

.field public static final ERROR_CODE_PARENTAL_CONTROL_RESTRICTED:I = 0x6

.field public static final ERROR_CODE_PREMIUM_ACCOUNT_REQUIRED:I = 0x4

.field public static final ERROR_CODE_SETUP_REQUIRED:I = 0xc

.field public static final ERROR_CODE_SKIP_LIMIT_REACHED:I = 0x9

.field public static final ERROR_CODE_UNKNOWN_ERROR:I = 0x0

.field static final TAG:Ljava/lang/String; = "MediaSession2"


# instance fields
.field private final mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2$SupportLibraryImpl;)V
    .locals 0
    .param p1, "impl"    # Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 195
    invoke-direct {p0}, Landroidx/media/MediaInterface2$SessionPlayer;-><init>()V

    .line 196
    iput-object p1, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 197
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

    .line 673
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->addPlaylistItem(ILandroidx/media/MediaItem2;)V

    .line 674
    return-void
.end method

.method public clearOnDataSourceMissingHelper()V
    .locals 1

    .line 553
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->clearOnDataSourceMissingHelper()V

    .line 554
    return-void
.end method

.method public close()V
    .locals 1

    .line 228
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 231
    goto :goto_0

    .line 229
    :catch_0
    move-exception v0

    .line 232
    :goto_0
    return-void
.end method

.method getAudioFocusHandler()Landroidx/media/AudioFocusHandler;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 275
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getAudioFocusHandler()Landroidx/media/AudioFocusHandler;

    move-result-object v0

    return-object v0
.end method

.method public getBufferedPosition()J
    .locals 2

    .line 480
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getBufferedPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getBufferingState()I
    .locals 1

    .line 492
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getBufferingState()I

    move-result v0

    return v0
.end method

.method getCallback()Landroidx/media/MediaSession2$SessionCallback;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 271
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v0

    return-object v0
.end method

.method getCallbackExecutor()Ljava/util/concurrent/Executor;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 267
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    return-object v0
.end method

.method public getConnectedControllers()Ljava/util/List;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/media/MediaSession2$ControllerInfo;",
            ">;"
        }
    .end annotation

    .line 284
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getConnectedControllers()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method getContext()Landroid/content/Context;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 263
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentMediaItem()Landroidx/media/MediaItem2;
    .locals 1

    .line 708
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCurrentMediaItem()Landroidx/media/MediaItem2;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentPosition()J
    .locals 2

    .line 460
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCurrentPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getDuration()J
    .locals 2

    .line 470
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method getImpl()Landroidx/media/MediaSession2$SupportLibraryImpl;
    .locals 1

    .line 200
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    return-object v0
.end method

.method public getPlaybackSpeed()F
    .locals 1

    .line 502
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getPlaybackSpeed()F

    move-result v0

    return v0
.end method

.method public getPlayer()Landroidx/media/BaseMediaPlayer;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 238
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getPlayer()Landroidx/media/BaseMediaPlayer;

    move-result-object v0

    return-object v0
.end method

.method public getPlayerState()I
    .locals 1

    .line 449
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getPlayerState()I

    move-result v0

    return v0
.end method

.method public getPlaylist()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;"
        }
    .end annotation

    .line 571
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getPlaylist()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPlaylistAgent()Landroidx/media/MediaPlaylistAgent;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 245
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getPlaylistAgent()Landroidx/media/MediaPlaylistAgent;

    move-result-object v0

    return-object v0
.end method

.method public getPlaylistMetadata()Landroidx/media/MediaMetadata2;
    .locals 1

    .line 656
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getPlaylistMetadata()Landroidx/media/MediaMetadata2;

    move-result-object v0

    return-object v0
.end method

.method public getRepeatMode()I
    .locals 1

    .line 732
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getRepeatMode()I

    move-result v0

    return v0
.end method

.method public getShuffleMode()I
    .locals 1

    .line 759
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getShuffleMode()I

    move-result v0

    return v0
.end method

.method public getToken()Landroidx/media/SessionToken2;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 259
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getToken()Landroidx/media/SessionToken2;

    move-result-object v0

    return-object v0
.end method

.method public getVolumeProvider()Landroidx/media/VolumeProviderCompat;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 252
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getVolumeProvider()Landroidx/media/VolumeProviderCompat;

    move-result-object v0

    return-object v0
.end method

.method public notifyError(ILandroid/os/Bundle;)V
    .locals 1
    .param p1, "errorCode"    # I
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 426
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->notifyError(ILandroid/os/Bundle;)V

    .line 427
    return-void
.end method

.method public notifyRoutesInfoChanged(Landroidx/media/MediaSession2$ControllerInfo;Ljava/util/List;)V
    .locals 1
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media/MediaSession2$ControllerInfo;",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .line 439
    .local p2, "routes":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->notifyRoutesInfoChanged(Landroidx/media/MediaSession2$ControllerInfo;Ljava/util/List;)V

    .line 440
    return-void
.end method

.method public pause()V
    .locals 1

    .line 363
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->pause()V

    .line 364
    return-void
.end method

.method public play()V
    .locals 1

    .line 353
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->play()V

    .line 354
    return-void
.end method

.method public prepare()V
    .locals 1

    .line 387
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->prepare()V

    .line 388
    return-void
.end method

.method public removePlaylistItem(Landroidx/media/MediaItem2;)V
    .locals 1
    .param p1, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 686
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->removePlaylistItem(Landroidx/media/MediaItem2;)V

    .line 687
    return-void
.end method

.method public replacePlaylistItem(ILandroidx/media/MediaItem2;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 698
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->replacePlaylistItem(ILandroidx/media/MediaItem2;)V

    .line 699
    return-void
.end method

.method public reset()V
    .locals 1

    .line 373
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->reset()V

    .line 374
    return-void
.end method

.method public seekTo(J)V
    .locals 1
    .param p1, "pos"    # J

    .line 397
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->seekTo(J)V

    .line 398
    return-void
.end method

.method public sendCustomCommand(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 1
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "command"    # Landroidx/media/SessionCommand2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "args"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "receiver"    # Landroid/os/ResultReceiver;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 343
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroidx/media/MediaSession2$SupportLibraryImpl;->sendCustomCommand(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    .line 344
    return-void
.end method

.method public sendCustomCommand(Landroidx/media/SessionCommand2;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "command"    # Landroidx/media/SessionCommand2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "args"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 330
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->sendCustomCommand(Landroidx/media/SessionCommand2;Landroid/os/Bundle;)V

    .line 331
    return-void
.end method

.method public setAllowedCommands(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommandGroup2;)V
    .locals 1
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "commands"    # Landroidx/media/SessionCommandGroup2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 320
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->setAllowedCommands(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommandGroup2;)V

    .line 321
    return-void
.end method

.method public setCustomLayout(Landroidx/media/MediaSession2$ControllerInfo;Ljava/util/List;)V
    .locals 1
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media/MediaSession2$ControllerInfo;",
            "Ljava/util/List<",
            "Landroidx/media/MediaSession2$CommandButton;",
            ">;)V"
        }
    .end annotation

    .line 309
    .local p2, "layout":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaSession2$CommandButton;>;"
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->setCustomLayout(Landroidx/media/MediaSession2$ControllerInfo;Ljava/util/List;)V

    .line 310
    return-void
.end method

.method public setOnDataSourceMissingHelper(Landroidx/media/MediaSession2$OnDataSourceMissingHelper;)V
    .locals 1
    .param p1, "helper"    # Landroidx/media/MediaSession2$OnDataSourceMissingHelper;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 543
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->setOnDataSourceMissingHelper(Landroidx/media/MediaSession2$OnDataSourceMissingHelper;)V

    .line 544
    return-void
.end method

.method public setPlaybackSpeed(F)V
    .locals 1
    .param p1, "speed"    # F

    .line 510
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->setPlaybackSpeed(F)V

    .line 511
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

    .line 603
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->setPlaylist(Ljava/util/List;Landroidx/media/MediaMetadata2;)V

    .line 604
    return-void
.end method

.method public setRepeatMode(I)V
    .locals 1
    .param p1, "repeatMode"    # I

    .line 746
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->setRepeatMode(I)V

    .line 747
    return-void
.end method

.method public setShuffleMode(I)V
    .locals 1
    .param p1, "shuffleMode"    # I

    .line 772
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->setShuffleMode(I)V

    .line 773
    return-void
.end method

.method public skipBackward()V
    .locals 1
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 415
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->skipBackward()V

    .line 416
    return-void
.end method

.method public skipForward()V
    .locals 1
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 406
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->skipForward()V

    .line 407
    return-void
.end method

.method public skipToNextItem()V
    .locals 1

    .line 646
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->skipToNextItem()V

    .line 647
    return-void
.end method

.method public skipToPlaylistItem(Landroidx/media/MediaItem2;)V
    .locals 1
    .param p1, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 618
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->skipToPlaylistItem(Landroidx/media/MediaItem2;)V

    .line 619
    return-void
.end method

.method public skipToPreviousItem()V
    .locals 1

    .line 632
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->skipToPreviousItem()V

    .line 633
    return-void
.end method

.method public updatePlayer(Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaPlaylistAgent;Landroidx/media/VolumeProviderCompat;)V
    .locals 1
    .param p1, "player"    # Landroidx/media/BaseMediaPlayer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "volumeProvider"    # Landroidx/media/VolumeProviderCompat;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 222
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/media/MediaSession2$SupportLibraryImpl;->updatePlayer(Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaPlaylistAgent;Landroidx/media/VolumeProviderCompat;)V

    .line 223
    return-void
.end method

.method public updatePlaylistMetadata(Landroidx/media/MediaMetadata2;)V
    .locals 1
    .param p1, "metadata"    # Landroidx/media/MediaMetadata2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 718
    iget-object v0, p0, Landroidx/media/MediaSession2;->mImpl:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0, p1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->updatePlaylistMetadata(Landroidx/media/MediaMetadata2;)V

    .line 719
    return-void
.end method
