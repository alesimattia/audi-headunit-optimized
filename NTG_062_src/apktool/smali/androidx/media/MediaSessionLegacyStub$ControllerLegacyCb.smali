.class final Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;
.super Landroidx/media/MediaSession2$ControllerCb;
.source "MediaSessionLegacyStub.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaSessionLegacyStub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ControllerLegacyCb"
.end annotation


# instance fields
.field private final mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

.field final synthetic this$0:Landroidx/media/MediaSessionLegacyStub;


# direct methods
.method constructor <init>(Landroidx/media/MediaSessionLegacyStub;Landroid/support/v4/media/session/IMediaControllerCallback;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSessionLegacyStub;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "callback"    # Landroid/support/v4/media/session/IMediaControllerCallback;

    .line 418
    iput-object p1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->this$0:Landroidx/media/MediaSessionLegacyStub;

    invoke-direct {p0}, Landroidx/media/MediaSession2$ControllerCb;-><init>()V

    .line 419
    iput-object p2, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    .line 420
    return-void
.end method


# virtual methods
.method getId()Landroid/os/IBinder;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 424
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    invoke-interface {v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    return-object v0
.end method

.method onAllowedCommandsChanged(Landroidx/media/SessionCommandGroup2;)V
    .locals 3
    .param p1, "commands"    # Landroidx/media/SessionCommandGroup2;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 445
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 446
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.ALLOWED_COMMANDS"

    invoke-virtual {p1}, Landroidx/media/SessionCommandGroup2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 447
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_ALLOWED_COMMANDS_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 448
    return-void
.end method

.method onBufferingStateChanged(Landroidx/media/MediaItem2;I)V
    .locals 3
    .param p1, "item"    # Landroidx/media/MediaItem2;
    .param p2, "state"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 485
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 486
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.MEDIA_ITEM"

    invoke-virtual {p1}, Landroidx/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 487
    const-string v1, "androidx.media.argument.BUFFERING_STATE"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 488
    const-string v1, "androidx.media.argument.PLAYBACK_STATE_COMPAT"

    iget-object v2, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v2, v2, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 489
    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getPlaybackStateCompat()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v2

    .line 488
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 490
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_BUFFERING_STATE_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 492
    return-void
.end method

.method onChildrenChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 3
    .param p1, "parentId"    # Ljava/lang/String;
    .param p2, "itemCount"    # I
    .param p3, "extras"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 566
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 567
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.MEDIA_ID"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 568
    const-string v1, "androidx.media.argument.ITEM_COUNT"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 569
    const-string v1, "androidx.media.argument.EXTRAS"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 570
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_CHILDREN_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 571
    return-void
.end method

.method onCurrentMediaItemChanged(Landroidx/media/MediaItem2;)V
    .locals 3
    .param p1, "item"    # Landroidx/media/MediaItem2;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 515
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 516
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.MEDIA_ITEM"

    if-nez p1, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroidx/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    :goto_0
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 517
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_CURRENT_MEDIA_ITEM_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 518
    return-void
.end method

.method onCustomCommand(Landroidx/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 3
    .param p1, "command"    # Landroidx/media/SessionCommand2;
    .param p2, "args"    # Landroid/os/Bundle;
    .param p3, "receiver"    # Landroid/os/ResultReceiver;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 453
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 454
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.CUSTOM_COMMAND"

    invoke-virtual {p1}, Landroidx/media/SessionCommand2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 455
    const-string v1, "androidx.media.argument.ARGUMENTS"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 456
    const-string v1, "androidx.media.argument.RESULT_RECEIVER"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 457
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.SEND_CUSTOM_COMMAND"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 458
    return-void
.end method

.method onCustomLayoutChanged(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media/MediaSession2$CommandButton;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 429
    .local p1, "layout":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaSession2$CommandButton;>;"
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 430
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.COMMAND_BUTTONS"

    .line 431
    invoke-static {p1}, Landroidx/media/MediaUtils2;->toCommandButtonParcelableArray(Ljava/util/List;)[Landroid/os/Parcelable;

    move-result-object v2

    .line 430
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 432
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.SET_CUSTOM_LAYOUT"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 433
    return-void
.end method

.method onError(ILandroid/os/Bundle;)V
    .locals 3
    .param p1, "errorCode"    # I
    .param p2, "extras"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 507
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 508
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.ERROR_CODE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 509
    const-string v1, "androidx.media.argument.EXTRAS"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 510
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_ERROR"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 511
    return-void
.end method

.method onPlaybackInfoChanged(Landroidx/media/MediaController2$PlaybackInfo;)V
    .locals 3
    .param p1, "info"    # Landroidx/media/MediaController2$PlaybackInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 437
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 438
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.PLAYBACK_INFO"

    invoke-virtual {p1}, Landroidx/media/MediaController2$PlaybackInfo;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 439
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_PLAYBACK_INFO_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 441
    return-void
.end method

.method onPlaybackSpeedChanged(F)V
    .locals 3
    .param p1, "speed"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 475
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 476
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.PLAYBACK_STATE_COMPAT"

    iget-object v2, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v2, v2, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 477
    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getPlaybackStateCompat()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v2

    .line 476
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 478
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_PLAYBACK_SPEED_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 479
    return-void
.end method

.method onPlayerStateChanged(I)V
    .locals 3
    .param p1, "playerState"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 465
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 466
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.PLAYER_STATE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 467
    const-string v1, "androidx.media.argument.PLAYBACK_STATE_COMPAT"

    iget-object v2, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v2, v2, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getPlaybackStateCompat()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 468
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_PLAYER_STATE_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 469
    return-void
.end method

.method onPlaylistChanged(Ljava/util/List;Landroidx/media/MediaMetadata2;)V
    .locals 3
    .param p2, "metadata"    # Landroidx/media/MediaMetadata2;
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 523
    .local p1, "playlist":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 524
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.PLAYLIST"

    .line 525
    invoke-static {p1}, Landroidx/media/MediaUtils2;->toMediaItem2ParcelableArray(Ljava/util/List;)[Landroid/os/Parcelable;

    move-result-object v2

    .line 524
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 526
    const-string v1, "androidx.media.argument.PLAYLIST_METADATA"

    if-nez p2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    .line 527
    :cond_0
    invoke-virtual {p2}, Landroidx/media/MediaMetadata2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    .line 526
    :goto_0
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 528
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_PLAYLIST_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 529
    return-void
.end method

.method onPlaylistMetadataChanged(Landroidx/media/MediaMetadata2;)V
    .locals 3
    .param p1, "metadata"    # Landroidx/media/MediaMetadata2;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 533
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 534
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.PLAYLIST_METADATA"

    if-nez p1, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    .line 535
    :cond_0
    invoke-virtual {p1}, Landroidx/media/MediaMetadata2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    .line 534
    :goto_0
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 536
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_PLAYLIST_METADATA_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 537
    return-void
.end method

.method onRepeatModeChanged(I)V
    .locals 3
    .param p1, "repeatMode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 548
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 549
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.REPEAT_MODE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 550
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_REPEAT_MODE_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 551
    return-void
.end method

.method onRoutesInfoChanged(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 555
    .local p1, "routes":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    const/4 v0, 0x0

    .line 556
    .local v0, "bundle":Landroid/os/Bundle;
    if-eqz p1, :cond_0

    .line 557
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    move-object v0, v1

    .line 558
    const-string v1, "androidx.media.argument.ROUTE_BUNDLE"

    const/4 v2, 0x0

    new-array v2, v2, [Landroid/os/Bundle;

    invoke-interface {p1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Landroid/os/Parcelable;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 560
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_ROUTES_INFO_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 561
    return-void
.end method

.method onSearchResultChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 3
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "itemCount"    # I
    .param p3, "extras"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 576
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 577
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.QUERY"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 578
    const-string v1, "androidx.media.argument.ITEM_COUNT"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 579
    const-string v1, "androidx.media.argument.EXTRAS"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 580
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_SEARCH_RESULT_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 581
    return-void
.end method

.method onSeekCompleted(J)V
    .locals 3
    .param p1, "position"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 498
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 499
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.SEEK_POSITION"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 500
    const-string v1, "androidx.media.argument.PLAYBACK_STATE_COMPAT"

    iget-object v2, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v2, v2, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 501
    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getPlaybackStateCompat()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v2

    .line 500
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 502
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_SEEK_COMPLETED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 503
    return-void
.end method

.method onShuffleModeChanged(I)V
    .locals 3
    .param p1, "shuffleMode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 541
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 542
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.SHUFFLE_MODE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 543
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_SHUFFLE_MODE_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 544
    return-void
.end method
