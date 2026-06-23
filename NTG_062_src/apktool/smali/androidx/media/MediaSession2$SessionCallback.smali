.class public abstract Landroidx/media/MediaSession2$SessionCallback;
.super Ljava/lang/Object;
.source "MediaSession2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaSession2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SessionCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 805
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBufferingStateChanged(Landroidx/media/MediaSession2;Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaItem2;I)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "player"    # Landroidx/media/BaseMediaPlayer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "state"    # I

    .line 1119
    return-void
.end method

.method public onCommandRequest(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;)Z
    .locals 1
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "command"    # Landroidx/media/SessionCommand2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 870
    const/4 v0, 0x1

    return v0
.end method

.method public onConnect(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;)Landroidx/media/SessionCommandGroup2;
    .locals 1
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 820
    new-instance v0, Landroidx/media/SessionCommandGroup2;

    invoke-direct {v0}, Landroidx/media/SessionCommandGroup2;-><init>()V

    .line 821
    .local v0, "commands":Landroidx/media/SessionCommandGroup2;
    invoke-virtual {v0}, Landroidx/media/SessionCommandGroup2;->addAllPredefinedCommands()V

    .line 822
    return-object v0
.end method

.method public onCurrentMediaItemChanged(Landroidx/media/MediaSession2;Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaItem2;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "player"    # Landroidx/media/BaseMediaPlayer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1087
    return-void
.end method

.method public onCustomCommand(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "customCommand"    # Landroidx/media/SessionCommand2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "args"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "cb"    # Landroid/os/ResultReceiver;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 904
    return-void
.end method

.method public onDisconnected(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 832
    return-void
.end method

.method public onFastForward(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;

    .line 1030
    return-void
.end method

.method public onMediaPrepared(Landroidx/media/MediaSession2;Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaItem2;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "player"    # Landroidx/media/BaseMediaPlayer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1097
    return-void
.end method

.method public onPlayFromMediaId(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "mediaId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 918
    return-void
.end method

.method public onPlayFromSearch(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "query"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 935
    return-void
.end method

.method public onPlayFromUri(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "uri"    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 949
    return-void
.end method

.method public onPlaybackSpeedChanged(Landroidx/media/MediaSession2;Landroidx/media/BaseMediaPlayer;F)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "player"    # Landroidx/media/BaseMediaPlayer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "speed"    # F

    .line 1128
    return-void
.end method

.method public onPlayerStateChanged(Landroidx/media/MediaSession2;Landroidx/media/BaseMediaPlayer;I)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "player"    # Landroidx/media/BaseMediaPlayer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "state"    # I

    .line 1107
    return-void
.end method

.method public onPlaylistChanged(Landroidx/media/MediaSession2;Landroidx/media/MediaPlaylistAgent;Ljava/util/List;Landroidx/media/MediaMetadata2;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "metadata"    # Landroidx/media/MediaMetadata2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media/MediaSession2;",
            "Landroidx/media/MediaPlaylistAgent;",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;",
            "Landroidx/media/MediaMetadata2;",
            ")V"
        }
    .end annotation

    .line 1155
    .local p3, "list":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    return-void
.end method

.method public onPlaylistMetadataChanged(Landroidx/media/MediaSession2;Landroidx/media/MediaPlaylistAgent;Landroidx/media/MediaMetadata2;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "metadata"    # Landroidx/media/MediaMetadata2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1165
    return-void
.end method

.method public onPrepareFromMediaId(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "mediaId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 973
    return-void
.end method

.method public onPrepareFromSearch(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "query"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 998
    return-void
.end method

.method public onPrepareFromUri(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "uri"    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1021
    return-void
.end method

.method public onRepeatModeChanged(Landroidx/media/MediaSession2;Landroidx/media/MediaPlaylistAgent;I)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "repeatMode"    # I

    .line 1194
    return-void
.end method

.method public onRewind(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;

    .line 1039
    return-void
.end method

.method public onSeekCompleted(Landroidx/media/MediaSession2;Landroidx/media/BaseMediaPlayer;J)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "player"    # Landroidx/media/BaseMediaPlayer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "position"    # J

    .line 1139
    return-void
.end method

.method public onSelectRoute(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "route"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1075
    return-void
.end method

.method public onSetRating(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroidx/media/Rating2;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "mediaId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "rating"    # Landroidx/media/Rating2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 889
    return-void
.end method

.method public onShuffleModeChanged(Landroidx/media/MediaSession2;Landroidx/media/MediaPlaylistAgent;I)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "shuffleMode"    # I

    .line 1179
    return-void
.end method

.method public onSubscribeRoutesInfo(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1051
    return-void
.end method

.method public onUnsubscribeRoutesInfo(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1061
    return-void
.end method
