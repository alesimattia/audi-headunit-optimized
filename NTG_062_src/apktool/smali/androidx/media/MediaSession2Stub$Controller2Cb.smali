.class final Landroidx/media/MediaSession2Stub$Controller2Cb;
.super Landroidx/media/MediaSession2$ControllerCb;
.source "MediaSession2Stub.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaSession2Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "Controller2Cb"
.end annotation


# instance fields
.field private final mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

.field final synthetic this$0:Landroidx/media/MediaSession2Stub;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2Stub;Landroid/support/v4/media/session/IMediaControllerCallback;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2Stub;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "callback"    # Landroid/support/v4/media/session/IMediaControllerCallback;

    .line 632
    iput-object p1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->this$0:Landroidx/media/MediaSession2Stub;

    invoke-direct {p0}, Landroidx/media/MediaSession2$ControllerCb;-><init>()V

    .line 633
    iput-object p2, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    .line 634
    return-void
.end method


# virtual methods
.method getId()Landroid/os/IBinder;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 638
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

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

    .line 659
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 660
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.ALLOWED_COMMANDS"

    invoke-virtual {p1}, Landroidx/media/SessionCommandGroup2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 661
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_ALLOWED_COMMANDS_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 662
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

    .line 699
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 700
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.MEDIA_ITEM"

    invoke-virtual {p1}, Landroidx/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 701
    const-string v1, "androidx.media.argument.BUFFERING_STATE"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 702
    const-string v1, "androidx.media.argument.PLAYBACK_STATE_COMPAT"

    iget-object v2, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 703
    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getPlaybackStateCompat()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v2

    .line 702
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 704
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_BUFFERING_STATE_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 706
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

    .line 780
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 781
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.MEDIA_ID"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 782
    const-string v1, "androidx.media.argument.ITEM_COUNT"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 783
    const-string v1, "androidx.media.argument.EXTRAS"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 784
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_CHILDREN_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 785
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

    .line 729
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 730
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

    .line 731
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_CURRENT_MEDIA_ITEM_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 732
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

    .line 667
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 668
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.CUSTOM_COMMAND"

    invoke-virtual {p1}, Landroidx/media/SessionCommand2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 669
    const-string v1, "androidx.media.argument.ARGUMENTS"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 670
    const-string v1, "androidx.media.argument.RESULT_RECEIVER"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 671
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.SEND_CUSTOM_COMMAND"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 672
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

    .line 643
    .local p1, "layout":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaSession2$CommandButton;>;"
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 644
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.COMMAND_BUTTONS"

    .line 645
    invoke-static {p1}, Landroidx/media/MediaUtils2;->toCommandButtonParcelableArray(Ljava/util/List;)[Landroid/os/Parcelable;

    move-result-object v2

    .line 644
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 646
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.SET_CUSTOM_LAYOUT"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 647
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

    .line 721
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 722
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.ERROR_CODE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 723
    const-string v1, "androidx.media.argument.EXTRAS"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 724
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_ERROR"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 725
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

    .line 651
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 652
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.PLAYBACK_INFO"

    invoke-virtual {p1}, Landroidx/media/MediaController2$PlaybackInfo;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 653
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_PLAYBACK_INFO_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 655
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

    .line 689
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 690
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.PLAYBACK_STATE_COMPAT"

    iget-object v2, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 691
    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getPlaybackStateCompat()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v2

    .line 690
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 692
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_PLAYBACK_SPEED_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 693
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

    .line 679
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 680
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.PLAYER_STATE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 681
    const-string v1, "androidx.media.argument.PLAYBACK_STATE_COMPAT"

    iget-object v2, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getPlaybackStateCompat()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 682
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_PLAYER_STATE_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 683
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

    .line 737
    .local p1, "playlist":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 738
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.PLAYLIST"

    .line 739
    invoke-static {p1}, Landroidx/media/MediaUtils2;->toMediaItem2ParcelableArray(Ljava/util/List;)[Landroid/os/Parcelable;

    move-result-object v2

    .line 738
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 740
    const-string v1, "androidx.media.argument.PLAYLIST_METADATA"

    if-nez p2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    .line 741
    :cond_0
    invoke-virtual {p2}, Landroidx/media/MediaMetadata2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    .line 740
    :goto_0
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 742
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_PLAYLIST_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 743
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

    .line 747
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 748
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.PLAYLIST_METADATA"

    if-nez p1, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    .line 749
    :cond_0
    invoke-virtual {p1}, Landroidx/media/MediaMetadata2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    .line 748
    :goto_0
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 750
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_PLAYLIST_METADATA_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 751
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

    .line 762
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 763
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.REPEAT_MODE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 764
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_REPEAT_MODE_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 765
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

    .line 769
    .local p1, "routes":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    const/4 v0, 0x0

    .line 770
    .local v0, "bundle":Landroid/os/Bundle;
    if-eqz p1, :cond_0

    .line 771
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    move-object v0, v1

    .line 772
    const-string v1, "androidx.media.argument.ROUTE_BUNDLE"

    const/4 v2, 0x0

    new-array v2, v2, [Landroid/os/Bundle;

    invoke-interface {p1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Landroid/os/Parcelable;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 774
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_ROUTES_INFO_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 775
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

    .line 790
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 791
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.QUERY"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 792
    const-string v1, "androidx.media.argument.ITEM_COUNT"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 793
    const-string v1, "androidx.media.argument.EXTRAS"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 794
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_SEARCH_RESULT_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 795
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

    .line 712
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 713
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.SEEK_POSITION"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 714
    const-string v1, "androidx.media.argument.PLAYBACK_STATE_COMPAT"

    iget-object v2, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 715
    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getPlaybackStateCompat()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v2

    .line 714
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 716
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_SEEK_COMPLETED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 717
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

    .line 755
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 756
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.SHUFFLE_MODE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 757
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v2, "androidx.media.session.event.ON_SHUFFLE_MODE_CHANGED"

    invoke-interface {v1, v2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 758
    return-void
.end method
