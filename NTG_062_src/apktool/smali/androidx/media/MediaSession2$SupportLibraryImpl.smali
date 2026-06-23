.class abstract Landroidx/media/MediaSession2$SupportLibraryImpl;
.super Landroidx/media/MediaInterface2$SessionPlayer;
.source "MediaSession2.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaSession2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "SupportLibraryImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1568
    invoke-direct {p0}, Landroidx/media/MediaInterface2$SessionPlayer;-><init>()V

    return-void
.end method


# virtual methods
.method abstract createInstance()Landroidx/media/MediaSession2;
.end method

.method abstract getAudioFocusHandler()Landroidx/media/AudioFocusHandler;
.end method

.method abstract getCallback()Landroidx/media/MediaSession2$SessionCallback;
.end method

.method abstract getCallbackExecutor()Ljava/util/concurrent/Executor;
.end method

.method abstract getConnectedControllers()Ljava/util/List;
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
.end method

.method abstract getContext()Landroid/content/Context;
.end method

.method abstract getInstance()Landroidx/media/MediaSession2;
.end method

.method abstract getPlaybackInfo()Landroidx/media/MediaController2$PlaybackInfo;
.end method

.method abstract getPlaybackStateCompat()Landroid/support/v4/media/session/PlaybackStateCompat;
.end method

.method abstract getPlayer()Landroidx/media/BaseMediaPlayer;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method abstract getPlaylistAgent()Landroidx/media/MediaPlaylistAgent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method abstract getSessionCompat()Landroid/support/v4/media/session/MediaSessionCompat;
.end method

.method abstract getToken()Landroidx/media/SessionToken2;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method abstract getVolumeProvider()Landroidx/media/VolumeProviderCompat;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method abstract isClosed()Z
.end method

.method abstract notifyChildrenChanged(Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;ILandroid/os/Bundle;Ljava/util/List;)V
    .param p1    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media/MediaSession2$ControllerInfo;",
            "Ljava/lang/String;",
            "I",
            "Landroid/os/Bundle;",
            "Ljava/util/List<",
            "Landroidx/media/MediaSessionManager$RemoteUserInfo;",
            ">;)V"
        }
    .end annotation
.end method

.method abstract notifyRoutesInfoChanged(Landroidx/media/MediaSession2$ControllerInfo;Ljava/util/List;)V
    .param p1    # Landroidx/media/MediaSession2$ControllerInfo;
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
.end method

.method abstract notifySearchResultChanged(Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;ILandroid/os/Bundle;)V
    .param p1    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method abstract sendCustomCommand(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .param p1    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/media/SessionCommand2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/os/ResultReceiver;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method abstract sendCustomCommand(Landroidx/media/SessionCommand2;Landroid/os/Bundle;)V
    .param p1    # Landroidx/media/SessionCommand2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method abstract setAllowedCommands(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommandGroup2;)V
    .param p1    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/media/SessionCommandGroup2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method abstract setCustomLayout(Landroidx/media/MediaSession2$ControllerInfo;Ljava/util/List;)V
    .param p1    # Landroidx/media/MediaSession2$ControllerInfo;
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
.end method

.method abstract updatePlayer(Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaPlaylistAgent;Landroidx/media/VolumeProviderCompat;)V
    .param p1    # Landroidx/media/BaseMediaPlayer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/media/MediaPlaylistAgent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroidx/media/VolumeProviderCompat;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method
