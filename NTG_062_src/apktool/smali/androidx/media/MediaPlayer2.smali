.class public abstract Landroidx/media/MediaPlayer2;
.super Ljava/lang/Object;
.source "MediaPlayer2.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1c
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/MediaPlayer2$MetricsConstants;,
        Landroidx/media/MediaPlayer2$ProvisioningServerErrorException;,
        Landroidx/media/MediaPlayer2$ProvisioningNetworkErrorException;,
        Landroidx/media/MediaPlayer2$NoDrmSchemeException;,
        Landroidx/media/MediaPlayer2$DrmInfo;,
        Landroidx/media/MediaPlayer2$PrepareDrmStatusCode;,
        Landroidx/media/MediaPlayer2$DrmEventCallback;,
        Landroidx/media/MediaPlayer2$OnDrmConfigHelper;,
        Landroidx/media/MediaPlayer2$CallStatus;,
        Landroidx/media/MediaPlayer2$CallCompleted;,
        Landroidx/media/MediaPlayer2$MediaInfo;,
        Landroidx/media/MediaPlayer2$MediaError;,
        Landroidx/media/MediaPlayer2$MediaPlayer2State;,
        Landroidx/media/MediaPlayer2$EventCallback;,
        Landroidx/media/MediaPlayer2$TrackInfo;,
        Landroidx/media/MediaPlayer2$SeekMode;
    }
.end annotation


# static fields
.field public static final CALL_COMPLETED_ATTACH_AUX_EFFECT:I = 0x1

.field public static final CALL_COMPLETED_DESELECT_TRACK:I = 0x2

.field public static final CALL_COMPLETED_LOOP_CURRENT:I = 0x3

.field public static final CALL_COMPLETED_NOTIFY_WHEN_COMMAND_LABEL_REACHED:I = 0x3eb
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field public static final CALL_COMPLETED_PAUSE:I = 0x4

.field public static final CALL_COMPLETED_PLAY:I = 0x5

.field public static final CALL_COMPLETED_PREPARE:I = 0x6

.field public static final CALL_COMPLETED_SEEK_TO:I = 0xe

.field public static final CALL_COMPLETED_SELECT_TRACK:I = 0xf

.field public static final CALL_COMPLETED_SET_AUDIO_ATTRIBUTES:I = 0x10

.field public static final CALL_COMPLETED_SET_AUDIO_SESSION_ID:I = 0x11

.field public static final CALL_COMPLETED_SET_AUX_EFFECT_SEND_LEVEL:I = 0x12

.field public static final CALL_COMPLETED_SET_DATA_SOURCE:I = 0x13

.field public static final CALL_COMPLETED_SET_NEXT_DATA_SOURCE:I = 0x16

.field public static final CALL_COMPLETED_SET_NEXT_DATA_SOURCES:I = 0x17

.field public static final CALL_COMPLETED_SET_PLAYBACK_PARAMS:I = 0x18

.field public static final CALL_COMPLETED_SET_PLAYBACK_SPEED:I = 0x19

.field public static final CALL_COMPLETED_SET_PLAYER_VOLUME:I = 0x1a

.field public static final CALL_COMPLETED_SET_SURFACE:I = 0x1b

.field public static final CALL_COMPLETED_SET_SYNC_PARAMS:I = 0x1c

.field public static final CALL_COMPLETED_SKIP_TO_NEXT:I = 0x1d

.field public static final CALL_STATUS_BAD_VALUE:I = 0x2

.field public static final CALL_STATUS_ERROR_IO:I = 0x4

.field public static final CALL_STATUS_ERROR_UNKNOWN:I = -0x80000000

.field public static final CALL_STATUS_INVALID_OPERATION:I = 0x1

.field public static final CALL_STATUS_NO_ERROR:I = 0x0

.field public static final CALL_STATUS_PERMISSION_DENIED:I = 0x3

.field public static final MEDIAPLAYER2_STATE_ERROR:I = 0x3ed

.field public static final MEDIAPLAYER2_STATE_IDLE:I = 0x3e9

.field public static final MEDIAPLAYER2_STATE_PAUSED:I = 0x3eb

.field public static final MEDIAPLAYER2_STATE_PLAYING:I = 0x3ec

.field public static final MEDIAPLAYER2_STATE_PREPARED:I = 0x3ea

.field public static final MEDIA_ERROR_IO:I = -0x3ec

.field public static final MEDIA_ERROR_MALFORMED:I = -0x3ef

.field public static final MEDIA_ERROR_NOT_VALID_FOR_PROGRESSIVE_PLAYBACK:I = 0xc8

.field public static final MEDIA_ERROR_SYSTEM:I = -0x80000000
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field public static final MEDIA_ERROR_TIMED_OUT:I = -0x6e

.field public static final MEDIA_ERROR_UNKNOWN:I = 0x1

.field public static final MEDIA_ERROR_UNSUPPORTED:I = -0x3f2

.field public static final MEDIA_INFO_AUDIO_NOT_PLAYING:I = 0x324

.field public static final MEDIA_INFO_AUDIO_RENDERING_START:I = 0x4

.field public static final MEDIA_INFO_BAD_INTERLEAVING:I = 0x320

.field public static final MEDIA_INFO_BUFFERING_END:I = 0x2be

.field public static final MEDIA_INFO_BUFFERING_START:I = 0x2bd

.field public static final MEDIA_INFO_BUFFERING_UPDATE:I = 0x2c0

.field public static final MEDIA_INFO_EXTERNAL_METADATA_UPDATE:I = 0x323
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field public static final MEDIA_INFO_METADATA_UPDATE:I = 0x322

.field public static final MEDIA_INFO_NETWORK_BANDWIDTH:I = 0x2bf
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field public static final MEDIA_INFO_NOT_SEEKABLE:I = 0x321

.field public static final MEDIA_INFO_PLAYBACK_COMPLETE:I = 0x5

.field public static final MEDIA_INFO_PLAYLIST_END:I = 0x6

.field public static final MEDIA_INFO_PREPARED:I = 0x64

.field public static final MEDIA_INFO_STARTED_AS_NEXT:I = 0x2
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field public static final MEDIA_INFO_SUBTITLE_TIMED_OUT:I = 0x386

.field public static final MEDIA_INFO_TIMED_TEXT_ERROR:I = 0x384
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field public static final MEDIA_INFO_UNKNOWN:I = 0x1

.field public static final MEDIA_INFO_UNSUPPORTED_SUBTITLE:I = 0x385

.field public static final MEDIA_INFO_VIDEO_NOT_PLAYING:I = 0x325

.field public static final MEDIA_INFO_VIDEO_RENDERING_START:I = 0x3

.field public static final MEDIA_INFO_VIDEO_TRACK_LAGGING:I = 0x2bc

.field public static final PREPARE_DRM_STATUS_PREPARATION_ERROR:I = 0x3

.field public static final PREPARE_DRM_STATUS_PROVISIONING_NETWORK_ERROR:I = 0x1

.field public static final PREPARE_DRM_STATUS_PROVISIONING_SERVER_ERROR:I = 0x2

.field public static final PREPARE_DRM_STATUS_SUCCESS:I = 0x0

.field public static final SEEK_CLOSEST:I = 0x3

.field public static final SEEK_CLOSEST_SYNC:I = 0x2

.field public static final SEEK_NEXT_SYNC:I = 0x1

.field public static final SEEK_PREVIOUS_SYNC:I = 0x0

.field public static final VIDEO_SCALING_MODE_SCALE_TO_FIT:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 236
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final create()Landroidx/media/MediaPlayer2;
    .locals 1

    .line 229
    new-instance v0, Landroidx/media/MediaPlayer2Impl;

    invoke-direct {v0}, Landroidx/media/MediaPlayer2Impl;-><init>()V

    return-object v0
.end method


# virtual methods
.method public abstract attachAuxEffect(I)V
.end method

.method public abstract clearDrmEventCallback()V
.end method

.method public abstract clearEventCallback()V
.end method

.method public abstract clearPendingCommands()V
.end method

.method public abstract close()V
.end method

.method public abstract deselectTrack(I)V
.end method

.method public abstract getAudioAttributes()Landroidx/media/AudioAttributesCompat;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract getAudioSessionId()I
.end method

.method public abstract getBufferedPosition()J
.end method

.method public abstract getCurrentDataSource()Landroidx/media/DataSourceDesc;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method public abstract getCurrentPosition()J
.end method

.method public abstract getDrmInfo()Landroidx/media/MediaPlayer2$DrmInfo;
.end method

.method public abstract getDrmKeyRequest([B[BLjava/lang/String;ILjava/util/Map;)Landroid/media/MediaDrm$KeyRequest;
    .param p1    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

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
            Landroidx/media/MediaPlayer2$NoDrmSchemeException;
        }
    .end annotation
.end method

.method public abstract getDrmPropertyString(Ljava/lang/String;)Ljava/lang/String;
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media/MediaPlayer2$NoDrmSchemeException;
        }
    .end annotation
.end method

.method public abstract getDuration()J
.end method

.method public getMaxPlayerVolume()F
    .locals 1

    .line 452
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public abstract getMediaPlayerInterface()Landroidx/media/BaseMediaPlayer;
.end method

.method public abstract getMetrics()Landroid/os/PersistableBundle;
.end method

.method public abstract getPlaybackParams()Landroid/media/PlaybackParams;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method public getPlaybackSpeed()F
    .locals 1

    .line 416
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public abstract getPlayerVolume()F
.end method

.method public abstract getSelectedTrack(I)I
.end method

.method public abstract getState()I
.end method

.method public abstract getSyncParams()Landroid/media/SyncParams;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method public abstract getTimestamp()Landroid/media/MediaTimestamp;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract getTrackInfo()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/media/MediaPlayer2$TrackInfo;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getVideoHeight()I
.end method

.method public abstract getVideoWidth()I
.end method

.method public isReversePlaybackSupported()Z
    .locals 1

    .line 426
    const/4 v0, 0x0

    return v0
.end method

.method public abstract loopCurrent(Z)V
.end method

.method public notifyWhenCommandLabelReached(Ljava/lang/Object;)V
    .locals 0
    .param p1, "label"    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 467
    return-void
.end method

.method public abstract pause()V
.end method

.method public abstract play()V
.end method

.method public abstract prepare()V
.end method

.method public abstract prepareDrm(Ljava/util/UUID;)V
    .param p1    # Ljava/util/UUID;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/UnsupportedSchemeException;,
            Landroid/media/ResourceBusyException;,
            Landroidx/media/MediaPlayer2$ProvisioningNetworkErrorException;,
            Landroidx/media/MediaPlayer2$ProvisioningServerErrorException;
        }
    .end annotation
.end method

.method public abstract provideDrmKeyResponse([B[B)[B
    .param p1    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # [B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media/MediaPlayer2$NoDrmSchemeException;,
            Landroid/media/DeniedByServerException;
        }
    .end annotation
.end method

.method public abstract releaseDrm()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media/MediaPlayer2$NoDrmSchemeException;
        }
    .end annotation
.end method

.method public abstract reset()V
.end method

.method public abstract restoreDrmKeys([B)V
    .param p1    # [B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media/MediaPlayer2$NoDrmSchemeException;
        }
    .end annotation
.end method

.method public seekTo(J)V
    .locals 1
    .param p1, "msec"    # J

    .line 307
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroidx/media/MediaPlayer2;->seekTo(JI)V

    .line 308
    return-void
.end method

.method public abstract seekTo(JI)V
.end method

.method public abstract selectTrack(I)V
.end method

.method public abstract setAudioAttributes(Landroidx/media/AudioAttributesCompat;)V
    .param p1    # Landroidx/media/AudioAttributesCompat;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract setAudioSessionId(I)V
.end method

.method public abstract setAuxEffectSendLevel(F)V
.end method

.method public abstract setDataSource(Landroidx/media/DataSourceDesc;)V
    .param p1    # Landroidx/media/DataSourceDesc;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract setDrmEventCallback(Ljava/util/concurrent/Executor;Landroidx/media/MediaPlayer2$DrmEventCallback;)V
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/media/MediaPlayer2$DrmEventCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract setDrmPropertyString(Ljava/lang/String;Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media/MediaPlayer2$NoDrmSchemeException;
        }
    .end annotation
.end method

.method public abstract setEventCallback(Ljava/util/concurrent/Executor;Landroidx/media/MediaPlayer2$EventCallback;)V
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/media/MediaPlayer2$EventCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract setNextDataSource(Landroidx/media/DataSourceDesc;)V
    .param p1    # Landroidx/media/DataSourceDesc;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract setNextDataSources(Ljava/util/List;)V
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media/DataSourceDesc;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setOnDrmConfigHelper(Landroidx/media/MediaPlayer2$OnDrmConfigHelper;)V
.end method

.method public abstract setPlaybackParams(Landroid/media/PlaybackParams;)V
    .param p1    # Landroid/media/PlaybackParams;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract setPlaybackSpeed(F)V
.end method

.method public abstract setPlayerVolume(F)V
.end method

.method public abstract setSurface(Landroid/view/Surface;)V
.end method

.method public abstract setSyncParams(Landroid/media/SyncParams;)V
    .param p1    # Landroid/media/SyncParams;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract skipToNext()V
.end method
