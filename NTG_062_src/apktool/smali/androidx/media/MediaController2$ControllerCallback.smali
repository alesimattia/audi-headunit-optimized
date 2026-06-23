.class public abstract Landroidx/media/MediaController2$ControllerCallback;
.super Ljava/lang/Object;
.source "MediaController2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaController2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ControllerCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 746
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAllowedCommandsChanged(Landroidx/media/MediaController2;Landroidx/media/SessionCommandGroup2;)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "commands"    # Landroidx/media/SessionCommandGroup2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 798
    return-void
.end method

.method public onBufferingStateChanged(Landroidx/media/MediaController2;Landroidx/media/MediaItem2;I)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "state"    # I

    .line 839
    return-void
.end method

.method public onConnected(Landroidx/media/MediaController2;Landroidx/media/SessionCommandGroup2;)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "allowedCommands"    # Landroidx/media/SessionCommandGroup2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 755
    return-void
.end method

.method public onCurrentMediaItemChanged(Landroidx/media/MediaController2;Landroidx/media/MediaItem2;)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 870
    return-void
.end method

.method public onCustomCommand(Landroidx/media/MediaController2;Landroidx/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
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

    .line 810
    return-void
.end method

.method public onCustomLayoutChanged(Landroidx/media/MediaController2;Ljava/util/List;)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
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
            "Landroidx/media/MediaController2;",
            "Ljava/util/List<",
            "Landroidx/media/MediaSession2$CommandButton;",
            ">;)V"
        }
    .end annotation

    .line 780
    .local p2, "layout":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaSession2$CommandButton;>;"
    return-void
.end method

.method public onDisconnected(Landroidx/media/MediaController2;)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 767
    return-void
.end method

.method public onError(Landroidx/media/MediaController2;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "errorCode"    # I
    .param p3, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 857
    return-void
.end method

.method public onPlaybackInfoChanged(Landroidx/media/MediaController2;Landroidx/media/MediaController2$PlaybackInfo;)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "info"    # Landroidx/media/MediaController2$PlaybackInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 789
    return-void
.end method

.method public onPlaybackSpeedChanged(Landroidx/media/MediaController2;F)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "speed"    # F

    .line 827
    return-void
.end method

.method public onPlayerStateChanged(Landroidx/media/MediaController2;I)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "state"    # I

    .line 818
    return-void
.end method

.method public onPlaylistChanged(Landroidx/media/MediaController2;Ljava/util/List;Landroidx/media/MediaMetadata2;)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "metadata"    # Landroidx/media/MediaMetadata2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media/MediaController2;",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;",
            "Landroidx/media/MediaMetadata2;",
            ")V"
        }
    .end annotation

    .line 880
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    return-void
.end method

.method public onPlaylistMetadataChanged(Landroidx/media/MediaController2;Landroidx/media/MediaMetadata2;)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Landroidx/media/MediaMetadata2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 889
    return-void
.end method

.method public onRepeatModeChanged(Landroidx/media/MediaController2;I)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "repeatMode"    # I

    .line 914
    return-void
.end method

.method public onRoutesInfoChanged(Landroidx/media/MediaController2;Ljava/util/List;)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
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
            "Landroidx/media/MediaController2;",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .line 927
    .local p2, "routes":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    return-void
.end method

.method public onSeekCompleted(Landroidx/media/MediaController2;J)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # J

    .line 847
    return-void
.end method

.method public onShuffleModeChanged(Landroidx/media/MediaController2;I)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "shuffleMode"    # I

    .line 901
    return-void
.end method
