.class Landroidx/media/MediaSession2ImplBase;
.super Landroidx/media/MediaSession2$SupportLibraryImpl;
.source "MediaSession2ImplBase.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/MediaSession2ImplBase$MainHandlerExecutor;,
        Landroidx/media/MediaSession2ImplBase$Builder;,
        Landroidx/media/MediaSession2ImplBase$BuilderBase;,
        Landroidx/media/MediaSession2ImplBase$MyPlaylistEventCallback;,
        Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;,
        Landroidx/media/MediaSession2ImplBase$NotifyRunnable;
    }
.end annotation


# static fields
.field static final DEBUG:Z

.field static final TAG:Ljava/lang/String; = "MS2ImplBase"


# instance fields
.field private final mAudioFocusHandler:Landroidx/media/AudioFocusHandler;

.field private final mAudioManager:Landroid/media/AudioManager;

.field private final mCallback:Landroidx/media/MediaSession2$SessionCallback;

.field private final mCallbackExecutor:Ljava/util/concurrent/Executor;

.field private final mContext:Landroid/content/Context;

.field private mDsmHelper:Landroidx/media/MediaSession2$OnDataSourceMissingHelper;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mHandler:Landroid/os/Handler;

.field private final mHandlerThread:Landroid/os/HandlerThread;

.field private final mInstance:Landroidx/media/MediaSession2;

.field private final mLock:Ljava/lang/Object;

.field private mPlaybackInfo:Landroidx/media/MediaController2$PlaybackInfo;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mPlayer:Landroidx/media/BaseMediaPlayer;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mPlayerEventCallback:Landroidx/media/BaseMediaPlayer$PlayerEventCallback;

.field private mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mPlaylistEventCallback:Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;

.field private final mSession2Stub:Landroidx/media/MediaSession2Stub;

.field private final mSessionCompat:Landroid/support/v4/media/session/MediaSessionCompat;

.field private final mSessionLegacyStub:Landroidx/media/MediaSessionLegacyStub;

.field private mSessionPlaylistAgent:Landroidx/media/SessionPlaylistAgentImplBase;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mSessionToken:Landroidx/media/SessionToken2;

.field private mVolumeProvider:Landroidx/media/VolumeProviderCompat;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 66
    const-string v0, "MS2ImplBase"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat;Ljava/lang/String;Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaPlaylistAgent;Landroidx/media/VolumeProviderCompat;Landroid/app/PendingIntent;Ljava/util/concurrent/Executor;Landroidx/media/MediaSession2$SessionCallback;)V
    .locals 18
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "sessionCompat"    # Landroid/support/v4/media/session/MediaSessionCompat;
    .param p3, "id"    # Ljava/lang/String;
    .param p4, "player"    # Landroidx/media/BaseMediaPlayer;
    .param p5, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
    .param p6, "volumeProvider"    # Landroidx/media/VolumeProviderCompat;
    .param p7, "sessionActivity"    # Landroid/app/PendingIntent;
    .param p8, "callbackExecutor"    # Ljava/util/concurrent/Executor;
    .param p9, "callback"    # Landroidx/media/MediaSession2$SessionCallback;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v9, p3

    .line 101
    invoke-direct/range {p0 .. p0}, Landroidx/media/MediaSession2$SupportLibraryImpl;-><init>()V

    .line 68
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    .line 102
    iput-object v1, v0, Landroidx/media/MediaSession2ImplBase;->mContext:Landroid/content/Context;

    .line 103
    invoke-virtual/range {p0 .. p0}, Landroidx/media/MediaSession2ImplBase;->createInstance()Landroidx/media/MediaSession2;

    move-result-object v2

    iput-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mInstance:Landroidx/media/MediaSession2;

    .line 104
    new-instance v2, Landroid/os/HandlerThread;

    const-string v3, "MediaController2_Thread"

    invoke-direct {v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mHandlerThread:Landroid/os/HandlerThread;

    .line 105
    iget-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->start()V

    .line 106
    new-instance v2, Landroid/os/Handler;

    iget-object v3, v0, Landroidx/media/MediaSession2ImplBase;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mHandler:Landroid/os/Handler;

    .line 108
    move-object/from16 v10, p2

    iput-object v10, v0, Landroidx/media/MediaSession2ImplBase;->mSessionCompat:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 109
    new-instance v2, Landroidx/media/MediaSession2Stub;

    invoke-direct {v2, v0}, Landroidx/media/MediaSession2Stub;-><init>(Landroidx/media/MediaSession2$SupportLibraryImpl;)V

    iput-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mSession2Stub:Landroidx/media/MediaSession2Stub;

    .line 110
    new-instance v2, Landroidx/media/MediaSessionLegacyStub;

    invoke-direct {v2, v0}, Landroidx/media/MediaSessionLegacyStub;-><init>(Landroidx/media/MediaSession2$SupportLibraryImpl;)V

    iput-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mSessionLegacyStub:Landroidx/media/MediaSessionLegacyStub;

    .line 111
    iget-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mSessionCompat:Landroid/support/v4/media/session/MediaSessionCompat;

    iget-object v3, v0, Landroidx/media/MediaSession2ImplBase;->mSession2Stub:Landroidx/media/MediaSession2Stub;

    iget-object v4, v0, Landroidx/media/MediaSession2ImplBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v3, v4}, Landroid/support/v4/media/session/MediaSessionCompat;->setCallback(Landroid/support/v4/media/session/MediaSessionCompat$Callback;Landroid/os/Handler;)V

    .line 112
    iget-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mSessionCompat:Landroid/support/v4/media/session/MediaSessionCompat;

    move-object/from16 v11, p7

    invoke-virtual {v2, v11}, Landroid/support/v4/media/session/MediaSessionCompat;->setSessionActivity(Landroid/app/PendingIntent;)V

    .line 114
    move-object/from16 v12, p9

    iput-object v12, v0, Landroidx/media/MediaSession2ImplBase;->mCallback:Landroidx/media/MediaSession2$SessionCallback;

    .line 115
    move-object/from16 v13, p8

    iput-object v13, v0, Landroidx/media/MediaSession2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 116
    const-string v2, "audio"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/AudioManager;

    iput-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mAudioManager:Landroid/media/AudioManager;

    .line 118
    new-instance v2, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;-><init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaSession2ImplBase$1;)V

    iput-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mPlayerEventCallback:Landroidx/media/BaseMediaPlayer$PlayerEventCallback;

    .line 119
    new-instance v2, Landroidx/media/MediaSession2ImplBase$MyPlaylistEventCallback;

    invoke-direct {v2, v0, v3}, Landroidx/media/MediaSession2ImplBase$MyPlaylistEventCallback;-><init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaSession2ImplBase$1;)V

    iput-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mPlaylistEventCallback:Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;

    .line 120
    new-instance v2, Landroidx/media/AudioFocusHandler;

    invoke-virtual/range {p0 .. p0}, Landroidx/media/MediaSession2ImplBase;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v3

    invoke-direct {v2, v3}, Landroidx/media/AudioFocusHandler;-><init>(Landroidx/media/MediaSession2;)V

    iput-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mAudioFocusHandler:Landroidx/media/AudioFocusHandler;

    .line 123
    const-string v2, "android.media.MediaLibraryService2"

    invoke-static {v1, v2, v9}, Landroidx/media/MediaSession2ImplBase;->getServiceName(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 124
    .local v14, "libraryService":Ljava/lang/String;
    const-string v2, "android.media.MediaSessionService2"

    invoke-static {v1, v2, v9}, Landroidx/media/MediaSession2ImplBase;->getServiceName(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 125
    .local v15, "sessionService":Ljava/lang/String;
    if-eqz v15, :cond_1

    if-nez v14, :cond_0

    goto :goto_0

    .line 126
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Ambiguous session type. Multiple session services define the same id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 128
    :cond_1
    :goto_0
    if-eqz v14, :cond_2

    .line 129
    new-instance v8, Landroidx/media/SessionToken2;

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v3

    const/4 v4, 0x2

    .line 130
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    iget-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mSessionCompat:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v2}, Landroid/support/v4/media/session/MediaSessionCompat;->getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;

    move-result-object v16

    move-object v2, v8

    move-object v6, v14

    move-object v7, v9

    move-object v10, v8

    move-object/from16 v8, v16

    invoke-direct/range {v2 .. v8}, Landroidx/media/SessionToken2;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    iput-object v10, v0, Landroidx/media/MediaSession2ImplBase;->mSessionToken:Landroidx/media/SessionToken2;

    goto :goto_1

    .line 131
    :cond_2
    if-eqz v15, :cond_3

    .line 132
    new-instance v10, Landroidx/media/SessionToken2;

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v3

    const/4 v4, 0x1

    .line 133
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    iget-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mSessionCompat:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v2}, Landroid/support/v4/media/session/MediaSessionCompat;->getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;

    move-result-object v8

    move-object v2, v10

    move-object v6, v15

    move-object v7, v9

    invoke-direct/range {v2 .. v8}, Landroidx/media/SessionToken2;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    iput-object v10, v0, Landroidx/media/MediaSession2ImplBase;->mSessionToken:Landroidx/media/SessionToken2;

    goto :goto_1

    .line 135
    :cond_3
    new-instance v10, Landroidx/media/SessionToken2;

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v3

    const/4 v4, 0x0

    .line 136
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    iget-object v2, v0, Landroidx/media/MediaSession2ImplBase;->mSessionCompat:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v2}, Landroid/support/v4/media/session/MediaSessionCompat;->getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;

    move-result-object v8

    move-object v2, v10

    move-object v7, v9

    invoke-direct/range {v2 .. v8}, Landroidx/media/SessionToken2;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    iput-object v10, v0, Landroidx/media/MediaSession2ImplBase;->mSessionToken:Landroidx/media/SessionToken2;

    .line 138
    :goto_1
    move-object/from16 v2, p4

    move-object/from16 v3, p5

    move-object/from16 v4, p6

    invoke-virtual {v0, v2, v3, v4}, Landroidx/media/MediaSession2ImplBase;->updatePlayer(Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaPlaylistAgent;Landroidx/media/VolumeProviderCompat;)V

    .line 139
    return-void
.end method

.method static synthetic access$200(Landroidx/media/MediaSession2ImplBase;)Landroidx/media/MediaSession2$SessionCallback;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaSession2ImplBase;

    .line 64
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mCallback:Landroidx/media/MediaSession2$SessionCallback;

    return-object v0
.end method

.method static synthetic access$400(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaSession2ImplBase;
    .param p1, "x1"    # Landroidx/media/MediaSession2ImplBase$NotifyRunnable;

    .line 64
    invoke-direct {p0, p1}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    return-void
.end method

.method static synthetic access$500(Landroidx/media/MediaSession2ImplBase;)Landroidx/media/AudioFocusHandler;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaSession2ImplBase;

    .line 64
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mAudioFocusHandler:Landroidx/media/AudioFocusHandler;

    return-object v0
.end method

.method static synthetic access$600(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaPlaylistAgent;Ljava/util/List;Landroidx/media/MediaMetadata2;)V
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaSession2ImplBase;
    .param p1, "x1"    # Landroidx/media/MediaPlaylistAgent;
    .param p2, "x2"    # Ljava/util/List;
    .param p3, "x3"    # Landroidx/media/MediaMetadata2;

    .line 64
    invoke-direct {p0, p1, p2, p3}, Landroidx/media/MediaSession2ImplBase;->notifyPlaylistChangedOnExecutor(Landroidx/media/MediaPlaylistAgent;Ljava/util/List;Landroidx/media/MediaMetadata2;)V

    return-void
.end method

.method static synthetic access$700(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaPlaylistAgent;Landroidx/media/MediaMetadata2;)V
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaSession2ImplBase;
    .param p1, "x1"    # Landroidx/media/MediaPlaylistAgent;
    .param p2, "x2"    # Landroidx/media/MediaMetadata2;

    .line 64
    invoke-direct {p0, p1, p2}, Landroidx/media/MediaSession2ImplBase;->notifyPlaylistMetadataChangedOnExecutor(Landroidx/media/MediaPlaylistAgent;Landroidx/media/MediaMetadata2;)V

    return-void
.end method

.method static synthetic access$800(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaPlaylistAgent;I)V
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaSession2ImplBase;
    .param p1, "x1"    # Landroidx/media/MediaPlaylistAgent;
    .param p2, "x2"    # I

    .line 64
    invoke-direct {p0, p1, p2}, Landroidx/media/MediaSession2ImplBase;->notifyRepeatModeChangedOnExecutor(Landroidx/media/MediaPlaylistAgent;I)V

    return-void
.end method

.method static synthetic access$900(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaPlaylistAgent;I)V
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaSession2ImplBase;
    .param p1, "x1"    # Landroidx/media/MediaPlaylistAgent;
    .param p2, "x2"    # I

    .line 64
    invoke-direct {p0, p1, p2}, Landroidx/media/MediaSession2ImplBase;->notifyShuffleModeChangedOnExecutor(Landroidx/media/MediaPlaylistAgent;I)V

    return-void
.end method

.method private createPlaybackInfo(Landroidx/media/VolumeProviderCompat;Landroidx/media/AudioAttributesCompat;)Landroidx/media/MediaController2$PlaybackInfo;
    .locals 5
    .param p1, "volumeProvider"    # Landroidx/media/VolumeProviderCompat;
    .param p2, "attrs"    # Landroidx/media/AudioAttributesCompat;

    .line 218
    if-nez p1, :cond_1

    .line 219
    invoke-direct {p0, p2}, Landroidx/media/MediaSession2ImplBase;->getLegacyStreamType(Landroidx/media/AudioAttributesCompat;)I

    move-result v0

    .line 220
    .local v0, "stream":I
    const/4 v1, 0x2

    .line 221
    .local v1, "controlType":I
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_0

    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v2}, Landroid/media/AudioManager;->isVolumeFixed()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 222
    const/4 v1, 0x0

    .line 224
    :cond_0
    const/4 v2, 0x1

    iget-object v3, p0, Landroidx/media/MediaSession2ImplBase;->mAudioManager:Landroid/media/AudioManager;

    .line 228
    invoke-virtual {v3, v0}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v3

    iget-object v4, p0, Landroidx/media/MediaSession2ImplBase;->mAudioManager:Landroid/media/AudioManager;

    .line 229
    invoke-virtual {v4, v0}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v4

    .line 224
    invoke-static {v2, p2, v1, v3, v4}, Landroidx/media/MediaController2$PlaybackInfo;->createPlaybackInfo(ILandroidx/media/AudioAttributesCompat;III)Landroidx/media/MediaController2$PlaybackInfo;

    move-result-object v0

    .line 230
    .end local v1    # "controlType":I
    .local v0, "info":Landroidx/media/MediaController2$PlaybackInfo;
    goto :goto_0

    .line 231
    .end local v0    # "info":Landroidx/media/MediaController2$PlaybackInfo;
    :cond_1
    const/4 v0, 0x2

    .line 234
    invoke-virtual {p1}, Landroidx/media/VolumeProviderCompat;->getVolumeControl()I

    move-result v1

    .line 235
    invoke-virtual {p1}, Landroidx/media/VolumeProviderCompat;->getMaxVolume()I

    move-result v2

    .line 236
    invoke-virtual {p1}, Landroidx/media/VolumeProviderCompat;->getCurrentVolume()I

    move-result v3

    .line 231
    invoke-static {v0, p2, v1, v2, v3}, Landroidx/media/MediaController2$PlaybackInfo;->createPlaybackInfo(ILandroidx/media/AudioAttributesCompat;III)Landroidx/media/MediaController2$PlaybackInfo;

    move-result-object v0

    .line 238
    .restart local v0    # "info":Landroidx/media/MediaController2$PlaybackInfo;
    :goto_0
    return-object v0
.end method

.method private getLegacyStreamType(Landroidx/media/AudioAttributesCompat;)I
    .locals 2
    .param p1, "attrs"    # Landroidx/media/AudioAttributesCompat;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 243
    if-nez p1, :cond_0

    .line 244
    const/4 v0, 0x3

    .local v0, "stream":I
    goto :goto_0

    .line 246
    .end local v0    # "stream":I
    :cond_0
    invoke-virtual {p1}, Landroidx/media/AudioAttributesCompat;->getLegacyStreamType()I

    move-result v0

    .line 247
    .restart local v0    # "stream":I
    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_1

    .line 252
    const/4 v0, 0x3

    .line 255
    :cond_1
    :goto_0
    return v0
.end method

.method private static getServiceName(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "serviceAction"    # Ljava/lang/String;
    .param p2, "id"    # Ljava/lang/String;

    .line 952
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 953
    .local v0, "manager":Landroid/content/pm/PackageManager;
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 954
    .local v1, "serviceIntent":Landroid/content/Intent;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 955
    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    .line 957
    .local v2, "services":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    const/4 v3, 0x0

    .line 958
    .local v3, "serviceName":Ljava/lang/String;
    if-eqz v2, :cond_3

    .line 959
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_3

    .line 960
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/ResolveInfo;

    invoke-static {v5}, Landroidx/media/SessionToken2;->getSessionId(Landroid/content/pm/ResolveInfo;)Ljava/lang/String;

    move-result-object v5

    .line 961
    .local v5, "serviceId":Ljava/lang/String;
    if-eqz v5, :cond_2

    invoke-static {p2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 962
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/pm/ResolveInfo;

    iget-object v6, v6, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    if-nez v6, :cond_0

    .line 963
    goto :goto_1

    .line 965
    :cond_0
    if-nez v3, :cond_1

    .line 969
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/pm/ResolveInfo;

    iget-object v6, v6, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v3, v6, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    .end local v5    # "serviceId":Ljava/lang/String;
    goto :goto_1

    .line 966
    .restart local v5    # "serviceId":Ljava/lang/String;
    :cond_1
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Ambiguous session type. Multiple session services define the same id="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 959
    .end local v5    # "serviceId":Ljava/lang/String;
    :cond_2
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 973
    .end local v4    # "i":I
    :cond_3
    return-object v3
.end method

.method private notifyAgentUpdatedNotLocked(Landroidx/media/MediaPlaylistAgent;)V
    .locals 7
    .param p1, "oldAgent"    # Landroidx/media/MediaPlaylistAgent;

    .line 979
    invoke-virtual {p1}, Landroidx/media/MediaPlaylistAgent;->getPlaylist()Ljava/util/List;

    move-result-object v0

    .line 980
    .local v0, "oldPlaylist":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    invoke-virtual {p0}, Landroidx/media/MediaSession2ImplBase;->getPlaylist()Ljava/util/List;

    move-result-object v1

    .line 981
    .local v1, "newPlaylist":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    invoke-static {v0, v1}, Landroidx/core/util/ObjectsCompat;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 982
    new-instance v2, Landroidx/media/MediaSession2ImplBase$10;

    invoke-direct {v2, p0, v1}, Landroidx/media/MediaSession2ImplBase$10;-><init>(Landroidx/media/MediaSession2ImplBase;Ljava/util/List;)V

    invoke-direct {p0, v2}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    goto :goto_0

    .line 990
    :cond_0
    invoke-virtual {p1}, Landroidx/media/MediaPlaylistAgent;->getPlaylistMetadata()Landroidx/media/MediaMetadata2;

    move-result-object v2

    .line 991
    .local v2, "oldMetadata":Landroidx/media/MediaMetadata2;
    invoke-virtual {p0}, Landroidx/media/MediaSession2ImplBase;->getPlaylistMetadata()Landroidx/media/MediaMetadata2;

    move-result-object v3

    .line 992
    .local v3, "newMetadata":Landroidx/media/MediaMetadata2;
    invoke-static {v2, v3}, Landroidx/core/util/ObjectsCompat;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 993
    new-instance v4, Landroidx/media/MediaSession2ImplBase$11;

    invoke-direct {v4, p0, v3}, Landroidx/media/MediaSession2ImplBase$11;-><init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaMetadata2;)V

    invoke-direct {p0, v4}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1001
    .end local v2    # "oldMetadata":Landroidx/media/MediaMetadata2;
    .end local v3    # "newMetadata":Landroidx/media/MediaMetadata2;
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroidx/media/MediaPlaylistAgent;->getCurrentMediaItem()Landroidx/media/MediaItem2;

    move-result-object v2

    .line 1002
    .local v2, "oldCurrentItem":Landroidx/media/MediaItem2;
    invoke-virtual {p0}, Landroidx/media/MediaSession2ImplBase;->getCurrentMediaItem()Landroidx/media/MediaItem2;

    move-result-object v3

    .line 1003
    .local v3, "newCurrentItem":Landroidx/media/MediaItem2;
    invoke-static {v2, v3}, Landroidx/core/util/ObjectsCompat;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 1004
    new-instance v4, Landroidx/media/MediaSession2ImplBase$12;

    invoke-direct {v4, p0, v3}, Landroidx/media/MediaSession2ImplBase$12;-><init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaItem2;)V

    invoke-direct {p0, v4}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1011
    :cond_2
    invoke-virtual {p0}, Landroidx/media/MediaSession2ImplBase;->getRepeatMode()I

    move-result v4

    .line 1012
    .local v4, "repeatMode":I
    invoke-virtual {p1}, Landroidx/media/MediaPlaylistAgent;->getRepeatMode()I

    move-result v5

    if-eq v5, v4, :cond_3

    .line 1013
    new-instance v5, Landroidx/media/MediaSession2ImplBase$13;

    invoke-direct {v5, p0, v4}, Landroidx/media/MediaSession2ImplBase$13;-><init>(Landroidx/media/MediaSession2ImplBase;I)V

    invoke-direct {p0, v5}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1020
    :cond_3
    invoke-virtual {p0}, Landroidx/media/MediaSession2ImplBase;->getShuffleMode()I

    move-result v5

    .line 1021
    .local v5, "shuffleMode":I
    invoke-virtual {p1}, Landroidx/media/MediaPlaylistAgent;->getShuffleMode()I

    move-result v6

    if-eq v6, v5, :cond_4

    .line 1022
    new-instance v6, Landroidx/media/MediaSession2ImplBase$14;

    invoke-direct {v6, p0, v5}, Landroidx/media/MediaSession2ImplBase$14;-><init>(Landroidx/media/MediaSession2ImplBase;I)V

    invoke-direct {p0, v6}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1029
    :cond_4
    return-void
.end method

.method private notifyPlayerUpdatedNotLocked(Landroidx/media/BaseMediaPlayer;)V
    .locals 4
    .param p1, "oldPlayer"    # Landroidx/media/BaseMediaPlayer;

    .line 1034
    invoke-virtual {p0}, Landroidx/media/MediaSession2ImplBase;->getPlayerState()I

    move-result v0

    .line 1035
    .local v0, "playerState":I
    new-instance v1, Landroidx/media/MediaSession2ImplBase$15;

    invoke-direct {v1, p0, v0}, Landroidx/media/MediaSession2ImplBase$15;-><init>(Landroidx/media/MediaSession2ImplBase;I)V

    invoke-direct {p0, v1}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1041
    invoke-virtual {p0}, Landroidx/media/MediaSession2ImplBase;->getCurrentMediaItem()Landroidx/media/MediaItem2;

    move-result-object v1

    .line 1042
    .local v1, "item":Landroidx/media/MediaItem2;
    if-eqz v1, :cond_0

    .line 1043
    invoke-virtual {p0}, Landroidx/media/MediaSession2ImplBase;->getBufferingState()I

    move-result v2

    .line 1044
    .local v2, "bufferingState":I
    new-instance v3, Landroidx/media/MediaSession2ImplBase$16;

    invoke-direct {v3, p0, v1, v2}, Landroidx/media/MediaSession2ImplBase$16;-><init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaItem2;I)V

    invoke-direct {p0, v3}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1051
    .end local v2    # "bufferingState":I
    :cond_0
    invoke-virtual {p0}, Landroidx/media/MediaSession2ImplBase;->getPlaybackSpeed()F

    move-result v2

    .line 1052
    .local v2, "speed":F
    invoke-virtual {p1}, Landroidx/media/BaseMediaPlayer;->getPlaybackSpeed()F

    move-result v3

    cmpl-float v3, v2, v3

    if-eqz v3, :cond_1

    .line 1053
    new-instance v3, Landroidx/media/MediaSession2ImplBase$17;

    invoke-direct {v3, p0, v2}, Landroidx/media/MediaSession2ImplBase$17;-><init>(Landroidx/media/MediaSession2ImplBase;F)V

    invoke-direct {p0, v3}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1061
    :cond_1
    return-void
.end method

.method private notifyPlaylistChangedOnExecutor(Landroidx/media/MediaPlaylistAgent;Ljava/util/List;Landroidx/media/MediaMetadata2;)V
    .locals 2
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
    .param p3, "metadata"    # Landroidx/media/MediaMetadata2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media/MediaPlaylistAgent;",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;",
            "Landroidx/media/MediaMetadata2;",
            ")V"
        }
    .end annotation

    .line 1065
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1066
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;

    if-eq p1, v1, :cond_0

    .line 1068
    monitor-exit v0

    return-void

    .line 1070
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1071
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mCallback:Landroidx/media/MediaSession2$SessionCallback;

    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mInstance:Landroidx/media/MediaSession2;

    invoke-virtual {v0, v1, p1, p2, p3}, Landroidx/media/MediaSession2$SessionCallback;->onPlaylistChanged(Landroidx/media/MediaSession2;Landroidx/media/MediaPlaylistAgent;Ljava/util/List;Landroidx/media/MediaMetadata2;)V

    .line 1072
    new-instance v0, Landroidx/media/MediaSession2ImplBase$18;

    invoke-direct {v0, p0, p2, p3}, Landroidx/media/MediaSession2ImplBase$18;-><init>(Landroidx/media/MediaSession2ImplBase;Ljava/util/List;Landroidx/media/MediaMetadata2;)V

    invoke-direct {p0, v0}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1078
    return-void

    .line 1070
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private notifyPlaylistMetadataChangedOnExecutor(Landroidx/media/MediaPlaylistAgent;Landroidx/media/MediaMetadata2;)V
    .locals 2
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
    .param p2, "metadata"    # Landroidx/media/MediaMetadata2;

    .line 1082
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1083
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;

    if-eq p1, v1, :cond_0

    .line 1085
    monitor-exit v0

    return-void

    .line 1087
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1088
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mCallback:Landroidx/media/MediaSession2$SessionCallback;

    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mInstance:Landroidx/media/MediaSession2;

    invoke-virtual {v0, v1, p1, p2}, Landroidx/media/MediaSession2$SessionCallback;->onPlaylistMetadataChanged(Landroidx/media/MediaSession2;Landroidx/media/MediaPlaylistAgent;Landroidx/media/MediaMetadata2;)V

    .line 1089
    new-instance v0, Landroidx/media/MediaSession2ImplBase$19;

    invoke-direct {v0, p0, p2}, Landroidx/media/MediaSession2ImplBase$19;-><init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaMetadata2;)V

    invoke-direct {p0, v0}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1095
    return-void

    .line 1087
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private notifyRepeatModeChangedOnExecutor(Landroidx/media/MediaPlaylistAgent;I)V
    .locals 2
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
    .param p2, "repeatMode"    # I

    .line 1099
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1100
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;

    if-eq p1, v1, :cond_0

    .line 1102
    monitor-exit v0

    return-void

    .line 1104
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1105
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mCallback:Landroidx/media/MediaSession2$SessionCallback;

    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mInstance:Landroidx/media/MediaSession2;

    invoke-virtual {v0, v1, p1, p2}, Landroidx/media/MediaSession2$SessionCallback;->onRepeatModeChanged(Landroidx/media/MediaSession2;Landroidx/media/MediaPlaylistAgent;I)V

    .line 1106
    new-instance v0, Landroidx/media/MediaSession2ImplBase$20;

    invoke-direct {v0, p0, p2}, Landroidx/media/MediaSession2ImplBase$20;-><init>(Landroidx/media/MediaSession2ImplBase;I)V

    invoke-direct {p0, v0}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1112
    return-void

    .line 1104
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private notifyShuffleModeChangedOnExecutor(Landroidx/media/MediaPlaylistAgent;I)V
    .locals 2
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
    .param p2, "shuffleMode"    # I

    .line 1116
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1117
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;

    if-eq p1, v1, :cond_0

    .line 1119
    monitor-exit v0

    return-void

    .line 1121
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1122
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mCallback:Landroidx/media/MediaSession2$SessionCallback;

    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mInstance:Landroidx/media/MediaSession2;

    invoke-virtual {v0, v1, p1, p2}, Landroidx/media/MediaSession2$SessionCallback;->onShuffleModeChanged(Landroidx/media/MediaSession2;Landroidx/media/MediaPlaylistAgent;I)V

    .line 1123
    new-instance v0, Landroidx/media/MediaSession2ImplBase$21;

    invoke-direct {v0, p0, p2}, Landroidx/media/MediaSession2ImplBase$21;-><init>(Landroidx/media/MediaSession2ImplBase;I)V

    invoke-direct {p0, v0}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1129
    return-void

    .line 1121
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V
    .locals 3
    .param p1, "runnable"    # Landroidx/media/MediaSession2ImplBase$NotifyRunnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1160
    invoke-virtual {p0}, Landroidx/media/MediaSession2ImplBase;->getConnectedControllers()Ljava/util/List;

    move-result-object v0

    .line 1161
    .local v0, "controllers":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaSession2$ControllerInfo;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 1162
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media/MediaSession2$ControllerInfo;

    invoke-direct {p0, v2, p1}, Landroidx/media/MediaSession2ImplBase;->notifyToController(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1161
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1164
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method private notifyToController(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V
    .locals 4
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "runnable"    # Landroidx/media/MediaSession2ImplBase$NotifyRunnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1133
    if-nez p1, :cond_0

    .line 1134
    return-void

    .line 1137
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Landroidx/media/MediaSession2$ControllerInfo;->getControllerCb()Landroidx/media/MediaSession2$ControllerCb;

    move-result-object v0

    invoke-interface {p2, v0}, Landroidx/media/MediaSession2ImplBase$NotifyRunnable;->run(Landroidx/media/MediaSession2$ControllerCb;)V
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1156
    :goto_0
    goto :goto_1

    .line 1149
    :catch_0
    move-exception v0

    .line 1155
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MS2ImplBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroidx/media/MediaSession2$ControllerInfo;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v0    # "e":Landroid/os/RemoteException;
    goto :goto_1

    .line 1138
    :catch_1
    move-exception v0

    .line 1139
    .local v0, "e":Landroid/os/DeadObjectException;
    sget-boolean v1, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v1, :cond_1

    .line 1140
    const-string v1, "MS2ImplBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroidx/media/MediaSession2$ControllerInfo;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " is gone"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1142
    :cond_1
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mSession2Stub:Landroidx/media/MediaSession2Stub;

    invoke-virtual {v1, p1}, Landroidx/media/MediaSession2Stub;->removeControllerInfo(Landroidx/media/MediaSession2$ControllerInfo;)V

    .line 1143
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Landroidx/media/MediaSession2ImplBase$22;

    invoke-direct {v2, p0, p1}, Landroidx/media/MediaSession2ImplBase$22;-><init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaSession2$ControllerInfo;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .end local v0    # "e":Landroid/os/DeadObjectException;
    goto :goto_0

    .line 1157
    :goto_1
    return-void
.end method


# virtual methods
.method public addPlaylistItem(ILandroidx/media/MediaItem2;)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 692
    if-ltz p1, :cond_3

    .line 695
    if-eqz p2, :cond_2

    .line 699
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 700
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 701
    .local v1, "agent":Landroidx/media/MediaPlaylistAgent;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 702
    if-eqz v1, :cond_0

    .line 703
    invoke-virtual {v1, p1, p2}, Landroidx/media/MediaPlaylistAgent;->addPlaylistItem(ILandroidx/media/MediaItem2;)V

    goto :goto_0

    .line 704
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 705
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 707
    :cond_1
    :goto_0
    return-void

    .line 701
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 696
    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "item shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 693
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "index shouldn\'t be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public clearOnDataSourceMissingHelper()V
    .locals 2

    .line 596
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 597
    const/4 v1, 0x0

    :try_start_0
    iput-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mDsmHelper:Landroidx/media/MediaSession2$OnDataSourceMissingHelper;

    .line 598
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mSessionPlaylistAgent:Landroidx/media/SessionPlaylistAgentImplBase;

    if-eqz v1, :cond_0

    .line 599
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mSessionPlaylistAgent:Landroidx/media/SessionPlaylistAgentImplBase;

    invoke-virtual {v1}, Landroidx/media/SessionPlaylistAgentImplBase;->clearOnDataSourceMissingHelper()V

    .line 601
    :cond_0
    monitor-exit v0

    .line 602
    return-void

    .line 601
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public close()V
    .locals 3

    .line 260
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 261
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;

    if-nez v1, :cond_0

    .line 262
    monitor-exit v0

    return-void

    .line 264
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mAudioFocusHandler:Landroidx/media/AudioFocusHandler;

    invoke-virtual {v1}, Landroidx/media/AudioFocusHandler;->close()V

    .line 265
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;

    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase;->mPlayerEventCallback:Landroidx/media/BaseMediaPlayer$PlayerEventCallback;

    invoke-virtual {v1, v2}, Landroidx/media/BaseMediaPlayer;->unregisterPlayerEventCallback(Landroidx/media/BaseMediaPlayer$PlayerEventCallback;)V

    .line 266
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;

    .line 267
    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase;->mSessionCompat:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v2}, Landroid/support/v4/media/session/MediaSessionCompat;->release()V

    .line 268
    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 269
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 270
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    if-lt v1, v2, :cond_1

    .line 271
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->quitSafely()Z

    goto :goto_0

    .line 273
    :cond_1
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->quit()Z

    .line 276
    :cond_2
    :goto_0
    monitor-exit v0

    .line 277
    return-void

    .line 276
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method createInstance()Landroidx/media/MediaSession2;
    .locals 1

    .line 877
    new-instance v0, Landroidx/media/MediaSession2;

    invoke-direct {v0, p0}, Landroidx/media/MediaSession2;-><init>(Landroidx/media/MediaSession2$SupportLibraryImpl;)V

    return-object v0
.end method

.method getAudioFocusHandler()Landroidx/media/AudioFocusHandler;
    .locals 1

    .line 907
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mAudioFocusHandler:Landroidx/media/AudioFocusHandler;

    return-object v0
.end method

.method public getBufferedPosition()J
    .locals 4

    .line 528
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 529
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 530
    .local v1, "player":Landroidx/media/BaseMediaPlayer;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 531
    if-eqz v1, :cond_0

    .line 532
    invoke-virtual {v1}, Landroidx/media/BaseMediaPlayer;->getBufferedPosition()J

    move-result-wide v2

    return-wide v2

    .line 533
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 534
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 536
    :cond_1
    const-wide/16 v2, -0x1

    return-wide v2

    .line 530
    :catchall_0
    move-exception v2

    goto :goto_0

    .end local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public getBufferingState()I
    .locals 4

    .line 542
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 543
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 544
    .local v1, "player":Landroidx/media/BaseMediaPlayer;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 545
    if-eqz v1, :cond_0

    .line 546
    invoke-virtual {v1}, Landroidx/media/BaseMediaPlayer;->getBufferingState()I

    move-result v0

    return v0

    .line 547
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 548
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 550
    :cond_1
    const/4 v0, 0x0

    return v0

    .line 544
    :catchall_0
    move-exception v2

    goto :goto_0

    .end local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method getCallback()Landroidx/media/MediaSession2$SessionCallback;
    .locals 1

    .line 897
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mCallback:Landroidx/media/MediaSession2$SessionCallback;

    return-object v0
.end method

.method getCallbackExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 892
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

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

    .line 307
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mSession2Stub:Landroidx/media/MediaSession2Stub;

    invoke-virtual {v0}, Landroidx/media/MediaSession2Stub;->getConnectedControllers()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method getContext()Landroid/content/Context;
    .locals 1

    .line 887
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getCurrentMediaItem()Landroidx/media/MediaItem2;
    .locals 6

    .line 747
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 748
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 749
    .local v2, "agent":Landroidx/media/MediaPlaylistAgent;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 750
    if-eqz v2, :cond_0

    .line 751
    invoke-virtual {v2}, Landroidx/media/MediaPlaylistAgent;->getCurrentMediaItem()Landroidx/media/MediaItem2;

    move-result-object v0

    return-object v0

    .line 752
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 753
    const-string v0, "MS2ImplBase"

    const-string v3, "API calls after the close()"

    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 755
    :cond_1
    return-object v1

    .line 749
    :catchall_0
    move-exception v1

    goto :goto_0

    .end local v2    # "agent":Landroidx/media/MediaPlaylistAgent;
    :catchall_1
    move-exception v2

    move-object v5, v2

    move-object v2, v1

    move-object v1, v5

    .restart local v2    # "agent":Landroidx/media/MediaPlaylistAgent;
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public getCurrentPosition()J
    .locals 4

    .line 498
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 499
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 500
    .local v1, "player":Landroidx/media/BaseMediaPlayer;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 501
    if-eqz v1, :cond_0

    .line 502
    invoke-virtual {v1}, Landroidx/media/BaseMediaPlayer;->getCurrentPosition()J

    move-result-wide v2

    return-wide v2

    .line 503
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 504
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 506
    :cond_1
    const-wide/16 v2, -0x1

    return-wide v2

    .line 500
    :catchall_0
    move-exception v2

    goto :goto_0

    .end local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public getDuration()J
    .locals 4

    .line 512
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 513
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 514
    .local v1, "player":Landroidx/media/BaseMediaPlayer;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 515
    if-eqz v1, :cond_0

    .line 518
    invoke-virtual {v1}, Landroidx/media/BaseMediaPlayer;->getDuration()J

    move-result-wide v2

    return-wide v2

    .line 519
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 520
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 522
    :cond_1
    const-wide/16 v2, -0x1

    return-wide v2

    .line 514
    :catchall_0
    move-exception v2

    goto :goto_0

    .end local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method getInstance()Landroidx/media/MediaSession2;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 882
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mInstance:Landroidx/media/MediaSession2;

    return-object v0
.end method

.method getPlaybackInfo()Landroidx/media/MediaController2$PlaybackInfo;
    .locals 2

    .line 947
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 948
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaybackInfo:Landroidx/media/MediaController2$PlaybackInfo;

    monitor-exit v0

    return-object v1

    .line 949
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPlaybackSpeed()F
    .locals 4

    .line 556
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 557
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 558
    .local v1, "player":Landroidx/media/BaseMediaPlayer;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 559
    if-eqz v1, :cond_0

    .line 560
    invoke-virtual {v1}, Landroidx/media/BaseMediaPlayer;->getPlaybackSpeed()F

    move-result v0

    return v0

    .line 561
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 562
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 564
    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    return v0

    .line 558
    :catchall_0
    move-exception v2

    goto :goto_0

    .end local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method getPlaybackStateCompat()Landroid/support/v4/media/session/PlaybackStateCompat;
    .locals 8

    .line 917
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 918
    :try_start_0
    invoke-virtual {p0}, Landroidx/media/MediaSession2ImplBase;->getPlayerState()I

    move-result v1

    .line 919
    invoke-virtual {p0}, Landroidx/media/MediaSession2ImplBase;->getBufferingState()I

    move-result v2

    .line 918
    invoke-static {v1, v2}, Landroidx/media/MediaUtils2;->createPlaybackStateCompatState(II)I

    move-result v1

    .line 920
    .local v1, "state":I
    const-wide/32 v2, 0x37ffff

    .line 937
    .local v2, "allActions":J
    new-instance v4, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    invoke-direct {v4}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;-><init>()V

    .line 938
    invoke-virtual {p0}, Landroidx/media/MediaSession2ImplBase;->getCurrentPosition()J

    move-result-wide v5

    invoke-virtual {p0}, Landroidx/media/MediaSession2ImplBase;->getPlaybackSpeed()F

    move-result v7

    invoke-virtual {v4, v1, v5, v6, v7}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setState(IJF)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    move-result-object v4

    .line 939
    invoke-virtual {v4, v2, v3}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setActions(J)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    move-result-object v4

    .line 940
    invoke-virtual {p0}, Landroidx/media/MediaSession2ImplBase;->getBufferedPosition()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setBufferedPosition(J)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    move-result-object v4

    .line 941
    invoke-virtual {v4}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->build()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v4

    monitor-exit v0

    return-object v4

    .line 942
    .end local v1    # "state":I
    .end local v2    # "allActions":J
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPlayer()Landroidx/media/BaseMediaPlayer;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 281
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 282
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;

    monitor-exit v0

    return-object v1

    .line 283
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPlayerState()I
    .locals 4

    .line 484
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 485
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 486
    .local v1, "player":Landroidx/media/BaseMediaPlayer;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 487
    if-eqz v1, :cond_0

    .line 488
    invoke-virtual {v1}, Landroidx/media/BaseMediaPlayer;->getPlayerState()I

    move-result v0

    return v0

    .line 489
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 490
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 492
    :cond_1
    const/4 v0, 0x3

    return v0

    .line 486
    :catchall_0
    move-exception v2

    goto :goto_0

    .end local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public getPlaylist()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;"
        }
    .end annotation

    .line 607
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 608
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 609
    .local v2, "agent":Landroidx/media/MediaPlaylistAgent;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 610
    if-eqz v2, :cond_0

    .line 611
    invoke-virtual {v2}, Landroidx/media/MediaPlaylistAgent;->getPlaylist()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 612
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 613
    const-string v0, "MS2ImplBase"

    const-string v3, "API calls after the close()"

    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 615
    :cond_1
    return-object v1

    .line 609
    :catchall_0
    move-exception v1

    goto :goto_0

    .end local v2    # "agent":Landroidx/media/MediaPlaylistAgent;
    :catchall_1
    move-exception v2

    move-object v5, v2

    move-object v2, v1

    move-object v1, v5

    .restart local v2    # "agent":Landroidx/media/MediaPlaylistAgent;
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public getPlaylistAgent()Landroidx/media/MediaPlaylistAgent;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 288
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 289
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;

    monitor-exit v0

    return-object v1

    .line 290
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPlaylistMetadata()Landroidx/media/MediaMetadata2;
    .locals 6

    .line 679
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 680
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 681
    .local v2, "agent":Landroidx/media/MediaPlaylistAgent;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 682
    if-eqz v2, :cond_0

    .line 683
    invoke-virtual {v2}, Landroidx/media/MediaPlaylistAgent;->getPlaylistMetadata()Landroidx/media/MediaMetadata2;

    move-result-object v0

    return-object v0

    .line 684
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 685
    const-string v0, "MS2ImplBase"

    const-string v3, "API calls after the close()"

    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 687
    :cond_1
    return-object v1

    .line 681
    :catchall_0
    move-exception v1

    goto :goto_0

    .end local v2    # "agent":Landroidx/media/MediaPlaylistAgent;
    :catchall_1
    move-exception v2

    move-object v5, v2

    move-object v2, v1

    move-object v1, v5

    .restart local v2    # "agent":Landroidx/media/MediaPlaylistAgent;
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public getRepeatMode()I
    .locals 4

    .line 774
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 775
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 776
    .local v1, "agent":Landroidx/media/MediaPlaylistAgent;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 777
    if-eqz v1, :cond_0

    .line 778
    invoke-virtual {v1}, Landroidx/media/MediaPlaylistAgent;->getRepeatMode()I

    move-result v0

    return v0

    .line 779
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 780
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 782
    :cond_1
    const/4 v0, 0x0

    return v0

    .line 776
    :catchall_0
    move-exception v2

    goto :goto_0

    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method getSessionCompat()Landroid/support/v4/media/session/MediaSessionCompat;
    .locals 1

    .line 902
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mSessionCompat:Landroid/support/v4/media/session/MediaSessionCompat;

    return-object v0
.end method

.method public getShuffleMode()I
    .locals 4

    .line 801
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 802
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 803
    .local v1, "agent":Landroidx/media/MediaPlaylistAgent;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 804
    if-eqz v1, :cond_0

    .line 805
    invoke-virtual {v1}, Landroidx/media/MediaPlaylistAgent;->getShuffleMode()I

    move-result v0

    return v0

    .line 806
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 807
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 809
    :cond_1
    const/4 v0, 0x0

    return v0

    .line 803
    :catchall_0
    move-exception v2

    goto :goto_0

    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public getToken()Landroidx/media/SessionToken2;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 302
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mSessionToken:Landroidx/media/SessionToken2;

    return-object v0
.end method

.method public getVolumeProvider()Landroidx/media/VolumeProviderCompat;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 295
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 296
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mVolumeProvider:Landroidx/media/VolumeProviderCompat;

    monitor-exit v0

    return-object v1

    .line 297
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method isClosed()Z
    .locals 1

    .line 912
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method notifyChildrenChanged(Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;ILandroid/os/Bundle;Ljava/util/List;)V
    .locals 4
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
    .param p2, "parentId"    # Ljava/lang/String;
    .param p3, "itemCount"    # I
    .param p4, "extras"    # Landroid/os/Bundle;
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

    .line 833
    .local p5, "subscribingBrowsers":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaSessionManager$RemoteUserInfo;>;"
    if-eqz p1, :cond_3

    .line 836
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 841
    invoke-interface {p5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media/MediaSessionManager$RemoteUserInfo;

    .line 842
    .local v1, "info":Landroidx/media/MediaSessionManager$RemoteUserInfo;
    invoke-virtual {v1}, Landroidx/media/MediaSessionManager$RemoteUserInfo;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Landroidx/media/MediaSession2$ControllerInfo;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 843
    invoke-virtual {v1}, Landroidx/media/MediaSessionManager$RemoteUserInfo;->getUid()I

    move-result v2

    invoke-virtual {p1}, Landroidx/media/MediaSession2$ControllerInfo;->getUid()I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 844
    new-instance v0, Landroidx/media/MediaSession2ImplBase$8;

    invoke-direct {v0, p0, p2, p3, p4}, Landroidx/media/MediaSession2ImplBase$8;-><init>(Landroidx/media/MediaSession2ImplBase;Ljava/lang/String;ILandroid/os/Bundle;)V

    invoke-direct {p0, p1, v0}, Landroidx/media/MediaSession2ImplBase;->notifyToController(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 850
    return-void

    .line 852
    .end local v1    # "info":Landroidx/media/MediaSessionManager$RemoteUserInfo;
    :cond_0
    goto :goto_0

    .line 853
    :cond_1
    return-void

    .line 837
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "query shouldn\'t be empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 834
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "controller shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public notifyError(ILandroid/os/Bundle;)V
    .locals 1
    .param p1, "errorCode"    # I
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 462
    new-instance v0, Landroidx/media/MediaSession2ImplBase$6;

    invoke-direct {v0, p0, p1, p2}, Landroidx/media/MediaSession2ImplBase$6;-><init>(Landroidx/media/MediaSession2ImplBase;ILandroid/os/Bundle;)V

    invoke-direct {p0, v0}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 468
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

    .line 473
    .local p2, "routes":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    new-instance v0, Landroidx/media/MediaSession2ImplBase$7;

    invoke-direct {v0, p0, p2}, Landroidx/media/MediaSession2ImplBase$7;-><init>(Landroidx/media/MediaSession2ImplBase;Ljava/util/List;)V

    invoke-direct {p0, p1, v0}, Landroidx/media/MediaSession2ImplBase;->notifyToController(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 479
    return-void
.end method

.method notifySearchResultChanged(Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 2
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
    .param p2, "query"    # Ljava/lang/String;
    .param p3, "itemCount"    # I
    .param p4, "extras"    # Landroid/os/Bundle;

    .line 858
    if-eqz p1, :cond_1

    .line 861
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 864
    new-instance v0, Landroidx/media/MediaSession2ImplBase$9;

    invoke-direct {v0, p0, p2, p3, p4}, Landroidx/media/MediaSession2ImplBase$9;-><init>(Landroidx/media/MediaSession2ImplBase;Ljava/lang/String;ILandroid/os/Bundle;)V

    invoke-direct {p0, p1, v0}, Landroidx/media/MediaSession2ImplBase;->notifyToController(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 870
    return-void

    .line 862
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "query shouldn\'t be empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 859
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "controller shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public pause()V
    .locals 4

    .line 397
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 398
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 399
    .local v1, "player":Landroidx/media/BaseMediaPlayer;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 400
    if-eqz v1, :cond_1

    .line 401
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mAudioFocusHandler:Landroidx/media/AudioFocusHandler;

    invoke-virtual {v0}, Landroidx/media/AudioFocusHandler;->onPauseRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 402
    invoke-virtual {v1}, Landroidx/media/BaseMediaPlayer;->pause()V

    goto :goto_0

    .line 404
    :cond_0
    const-string v0, "MS2ImplBase"

    const-string v2, "pause() wouldn\'t be called of the failure in audio focus"

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 406
    :cond_1
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_2

    .line 407
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 409
    :cond_2
    :goto_0
    return-void

    .line 399
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public play()V
    .locals 4

    .line 380
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 381
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 382
    .local v1, "player":Landroidx/media/BaseMediaPlayer;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 383
    if-eqz v1, :cond_1

    .line 384
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mAudioFocusHandler:Landroidx/media/AudioFocusHandler;

    invoke-virtual {v0}, Landroidx/media/AudioFocusHandler;->onPlayRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 385
    invoke-virtual {v1}, Landroidx/media/BaseMediaPlayer;->play()V

    goto :goto_0

    .line 387
    :cond_0
    const-string v0, "MS2ImplBase"

    const-string v2, "play() wouldn\'t be called because of the failure in audio focus"

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 389
    :cond_1
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_2

    .line 390
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 392
    :cond_2
    :goto_0
    return-void

    .line 382
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public prepare()V
    .locals 4

    .line 427
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 428
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 429
    .local v1, "player":Landroidx/media/BaseMediaPlayer;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 430
    if-eqz v1, :cond_0

    .line 431
    invoke-virtual {v1}, Landroidx/media/BaseMediaPlayer;->prepare()V

    goto :goto_0

    .line 432
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 433
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 435
    :cond_1
    :goto_0
    return-void

    .line 429
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public removePlaylistItem(Landroidx/media/MediaItem2;)V
    .locals 4
    .param p1, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 711
    if-eqz p1, :cond_2

    .line 715
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 716
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 717
    .local v1, "agent":Landroidx/media/MediaPlaylistAgent;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 718
    if-eqz v1, :cond_0

    .line 719
    invoke-virtual {v1, p1}, Landroidx/media/MediaPlaylistAgent;->removePlaylistItem(Landroidx/media/MediaItem2;)V

    goto :goto_0

    .line 720
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 721
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 723
    :cond_1
    :goto_0
    return-void

    .line 717
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 712
    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "item shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public replacePlaylistItem(ILandroidx/media/MediaItem2;)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 727
    if-ltz p1, :cond_3

    .line 730
    if-eqz p2, :cond_2

    .line 734
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 735
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 736
    .local v1, "agent":Landroidx/media/MediaPlaylistAgent;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 737
    if-eqz v1, :cond_0

    .line 738
    invoke-virtual {v1, p1, p2}, Landroidx/media/MediaPlaylistAgent;->replacePlaylistItem(ILandroidx/media/MediaItem2;)V

    goto :goto_0

    .line 739
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 740
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 742
    :cond_1
    :goto_0
    return-void

    .line 736
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 731
    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "item shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 728
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "index shouldn\'t be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public reset()V
    .locals 4

    .line 414
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 415
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 416
    .local v1, "player":Landroidx/media/BaseMediaPlayer;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 417
    if-eqz v1, :cond_0

    .line 418
    invoke-virtual {v1}, Landroidx/media/BaseMediaPlayer;->reset()V

    goto :goto_0

    .line 419
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 420
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 422
    :cond_1
    :goto_0
    return-void

    .line 416
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public seekTo(J)V
    .locals 4
    .param p1, "pos"    # J

    .line 440
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 441
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 442
    .local v1, "player":Landroidx/media/BaseMediaPlayer;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 443
    if-eqz v1, :cond_0

    .line 444
    invoke-virtual {v1, p1, p2}, Landroidx/media/BaseMediaPlayer;->seekTo(J)V

    goto :goto_0

    .line 445
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 446
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 448
    :cond_1
    :goto_0
    return-void

    .line 442
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public sendCustomCommand(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 2
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

    .line 363
    if-eqz p1, :cond_1

    .line 366
    if-eqz p2, :cond_0

    .line 369
    new-instance v0, Landroidx/media/MediaSession2ImplBase$5;

    invoke-direct {v0, p0, p2, p3, p4}, Landroidx/media/MediaSession2ImplBase$5;-><init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    invoke-direct {p0, p1, v0}, Landroidx/media/MediaSession2ImplBase;->notifyToController(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 375
    return-void

    .line 367
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "command shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 364
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "controller shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public sendCustomCommand(Landroidx/media/SessionCommand2;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "command"    # Landroidx/media/SessionCommand2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "args"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 348
    if-eqz p1, :cond_0

    .line 351
    new-instance v0, Landroidx/media/MediaSession2ImplBase$4;

    invoke-direct {v0, p0, p1, p2}, Landroidx/media/MediaSession2ImplBase$4;-><init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/SessionCommand2;Landroid/os/Bundle;)V

    invoke-direct {p0, v0}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 357
    return-void

    .line 349
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "command shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAllowedCommands(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommandGroup2;)V
    .locals 2
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "commands"    # Landroidx/media/SessionCommandGroup2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 330
    if-eqz p1, :cond_1

    .line 333
    if-eqz p2, :cond_0

    .line 336
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mSession2Stub:Landroidx/media/MediaSession2Stub;

    invoke-virtual {v0, p1, p2}, Landroidx/media/MediaSession2Stub;->setAllowedCommands(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommandGroup2;)V

    .line 337
    new-instance v0, Landroidx/media/MediaSession2ImplBase$3;

    invoke-direct {v0, p0, p2}, Landroidx/media/MediaSession2ImplBase$3;-><init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/SessionCommandGroup2;)V

    invoke-direct {p0, p1, v0}, Landroidx/media/MediaSession2ImplBase;->notifyToController(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 343
    return-void

    .line 334
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "commands shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 331
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "controller shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setCustomLayout(Landroidx/media/MediaSession2$ControllerInfo;Ljava/util/List;)V
    .locals 2
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

    .line 313
    .local p2, "layout":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaSession2$CommandButton;>;"
    if-eqz p1, :cond_1

    .line 316
    if-eqz p2, :cond_0

    .line 319
    new-instance v0, Landroidx/media/MediaSession2ImplBase$2;

    invoke-direct {v0, p0, p2}, Landroidx/media/MediaSession2ImplBase$2;-><init>(Landroidx/media/MediaSession2ImplBase;Ljava/util/List;)V

    invoke-direct {p0, p1, v0}, Landroidx/media/MediaSession2ImplBase;->notifyToController(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 325
    return-void

    .line 317
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "layout shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 314
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "controller shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setOnDataSourceMissingHelper(Landroidx/media/MediaSession2$OnDataSourceMissingHelper;)V
    .locals 2
    .param p1, "helper"    # Landroidx/media/MediaSession2$OnDataSourceMissingHelper;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 583
    if-eqz p1, :cond_1

    .line 586
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 587
    :try_start_0
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase;->mDsmHelper:Landroidx/media/MediaSession2$OnDataSourceMissingHelper;

    .line 588
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mSessionPlaylistAgent:Landroidx/media/SessionPlaylistAgentImplBase;

    if-eqz v1, :cond_0

    .line 589
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mSessionPlaylistAgent:Landroidx/media/SessionPlaylistAgentImplBase;

    invoke-virtual {v1, p1}, Landroidx/media/SessionPlaylistAgentImplBase;->setOnDataSourceMissingHelper(Landroidx/media/MediaSession2$OnDataSourceMissingHelper;)V

    .line 591
    :cond_0
    monitor-exit v0

    .line 592
    return-void

    .line 591
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 584
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "helper shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPlaybackSpeed(F)V
    .locals 4
    .param p1, "speed"    # F

    .line 570
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 571
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 572
    .local v1, "player":Landroidx/media/BaseMediaPlayer;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 573
    if-eqz v1, :cond_0

    .line 574
    invoke-virtual {v1, p1}, Landroidx/media/BaseMediaPlayer;->setPlaybackSpeed(F)V

    goto :goto_0

    .line 575
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 576
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 578
    :cond_1
    :goto_0
    return-void

    .line 572
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "player":Landroidx/media/BaseMediaPlayer;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public setPlaylist(Ljava/util/List;Landroidx/media/MediaMetadata2;)V
    .locals 4
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

    .line 620
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    if-eqz p1, :cond_2

    .line 624
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 625
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 626
    .local v1, "agent":Landroidx/media/MediaPlaylistAgent;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 627
    if-eqz v1, :cond_0

    .line 628
    invoke-virtual {v1, p1, p2}, Landroidx/media/MediaPlaylistAgent;->setPlaylist(Ljava/util/List;Landroidx/media/MediaMetadata2;)V

    goto :goto_0

    .line 629
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 630
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 632
    :cond_1
    :goto_0
    return-void

    .line 626
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 621
    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "list shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRepeatMode(I)V
    .locals 4
    .param p1, "repeatMode"    # I

    .line 788
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 789
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 790
    .local v1, "agent":Landroidx/media/MediaPlaylistAgent;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 791
    if-eqz v1, :cond_0

    .line 792
    invoke-virtual {v1, p1}, Landroidx/media/MediaPlaylistAgent;->setRepeatMode(I)V

    goto :goto_0

    .line 793
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 794
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 796
    :cond_1
    :goto_0
    return-void

    .line 790
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public setShuffleMode(I)V
    .locals 4
    .param p1, "shuffleMode"    # I

    .line 815
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 816
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 817
    .local v1, "agent":Landroidx/media/MediaPlaylistAgent;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 818
    if-eqz v1, :cond_0

    .line 819
    invoke-virtual {v1, p1}, Landroidx/media/MediaPlaylistAgent;->setShuffleMode(I)V

    goto :goto_0

    .line 820
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 821
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 823
    :cond_1
    :goto_0
    return-void

    .line 817
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public skipBackward()V
    .locals 0

    .line 458
    return-void
.end method

.method public skipForward()V
    .locals 0

    .line 453
    return-void
.end method

.method public skipToNextItem()V
    .locals 4

    .line 666
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 667
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 668
    .local v1, "agent":Landroidx/media/MediaPlaylistAgent;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 669
    if-eqz v1, :cond_0

    .line 670
    invoke-virtual {v1}, Landroidx/media/MediaPlaylistAgent;->skipToNextItem()V

    goto :goto_0

    .line 671
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 672
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 674
    :cond_1
    :goto_0
    return-void

    .line 668
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public skipToPlaylistItem(Landroidx/media/MediaItem2;)V
    .locals 4
    .param p1, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 636
    if-eqz p1, :cond_2

    .line 640
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 641
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 642
    .local v1, "agent":Landroidx/media/MediaPlaylistAgent;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 643
    if-eqz v1, :cond_0

    .line 644
    invoke-virtual {v1, p1}, Landroidx/media/MediaPlaylistAgent;->skipToPlaylistItem(Landroidx/media/MediaItem2;)V

    goto :goto_0

    .line 645
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 646
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 648
    :cond_1
    :goto_0
    return-void

    .line 642
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 637
    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "item shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public skipToPreviousItem()V
    .locals 4

    .line 653
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 654
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 655
    .local v1, "agent":Landroidx/media/MediaPlaylistAgent;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 656
    if-eqz v1, :cond_0

    .line 657
    invoke-virtual {v1}, Landroidx/media/MediaPlaylistAgent;->skipToPreviousItem()V

    goto :goto_0

    .line 658
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 659
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 661
    :cond_1
    :goto_0
    return-void

    .line 655
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public updatePlayer(Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaPlaylistAgent;Landroidx/media/VolumeProviderCompat;)V
    .locals 10
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

    .line 145
    if-eqz p1, :cond_b

    .line 153
    invoke-virtual {p1}, Landroidx/media/BaseMediaPlayer;->getAudioAttributes()Landroidx/media/AudioAttributesCompat;

    move-result-object v0

    invoke-direct {p0, p3, v0}, Landroidx/media/MediaSession2ImplBase;->createPlaybackInfo(Landroidx/media/VolumeProviderCompat;Landroidx/media/AudioAttributesCompat;)Landroidx/media/MediaController2$PlaybackInfo;

    move-result-object v0

    .line 154
    .local v0, "info":Landroidx/media/MediaController2$PlaybackInfo;
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 155
    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_0
    iget-object v4, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    const/4 v5, 0x1

    if-eq v4, p1, :cond_0

    move v4, v5

    goto :goto_0

    :cond_0
    move v4, v3

    .line 156
    .local v4, "hasPlayerChanged":Z
    :goto_0
    :try_start_1
    iget-object v6, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-eq v6, p2, :cond_1

    move v6, v5

    goto :goto_1

    :cond_1
    move v6, v3

    .line 157
    .local v6, "hasAgentChanged":Z
    :goto_1
    :try_start_2
    iget-object v7, p0, Landroidx/media/MediaSession2ImplBase;->mPlaybackInfo:Landroidx/media/MediaController2$PlaybackInfo;

    if-eq v7, v0, :cond_2

    move v3, v5

    nop

    .line 158
    .local v3, "hasPlaybackInfoChanged":Z
    :cond_2
    iget-object v5, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 159
    .local v5, "oldPlayer":Landroidx/media/BaseMediaPlayer;
    :try_start_3
    iget-object v7, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;

    move-object v2, v7

    .line 160
    .local v2, "oldAgent":Landroidx/media/MediaPlaylistAgent;
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;

    .line 161
    if-nez p2, :cond_4

    .line 162
    new-instance v7, Landroidx/media/SessionPlaylistAgentImplBase;

    iget-object v8, p0, Landroidx/media/MediaSession2ImplBase;->mPlayer:Landroidx/media/BaseMediaPlayer;

    invoke-direct {v7, p0, v8}, Landroidx/media/SessionPlaylistAgentImplBase;-><init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/BaseMediaPlayer;)V

    iput-object v7, p0, Landroidx/media/MediaSession2ImplBase;->mSessionPlaylistAgent:Landroidx/media/SessionPlaylistAgentImplBase;

    .line 163
    iget-object v7, p0, Landroidx/media/MediaSession2ImplBase;->mDsmHelper:Landroidx/media/MediaSession2$OnDataSourceMissingHelper;

    if-eqz v7, :cond_3

    .line 164
    iget-object v7, p0, Landroidx/media/MediaSession2ImplBase;->mSessionPlaylistAgent:Landroidx/media/SessionPlaylistAgentImplBase;

    iget-object v8, p0, Landroidx/media/MediaSession2ImplBase;->mDsmHelper:Landroidx/media/MediaSession2$OnDataSourceMissingHelper;

    invoke-virtual {v7, v8}, Landroidx/media/SessionPlaylistAgentImplBase;->setOnDataSourceMissingHelper(Landroidx/media/MediaSession2$OnDataSourceMissingHelper;)V

    .line 166
    :cond_3
    iget-object v7, p0, Landroidx/media/MediaSession2ImplBase;->mSessionPlaylistAgent:Landroidx/media/SessionPlaylistAgentImplBase;

    move-object p2, v7

    .line 168
    :cond_4
    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;

    .line 169
    iput-object p3, p0, Landroidx/media/MediaSession2ImplBase;->mVolumeProvider:Landroidx/media/VolumeProviderCompat;

    .line 170
    iput-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mPlaybackInfo:Landroidx/media/MediaController2$PlaybackInfo;

    .line 171
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 172
    if-nez p3, :cond_5

    .line 173
    invoke-virtual {p1}, Landroidx/media/BaseMediaPlayer;->getAudioAttributes()Landroidx/media/AudioAttributesCompat;

    move-result-object v1

    invoke-direct {p0, v1}, Landroidx/media/MediaSession2ImplBase;->getLegacyStreamType(Landroidx/media/AudioAttributesCompat;)I

    move-result v1

    .line 174
    .local v1, "stream":I
    iget-object v7, p0, Landroidx/media/MediaSession2ImplBase;->mSessionCompat:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v7, v1}, Landroid/support/v4/media/session/MediaSessionCompat;->setPlaybackToLocal(I)V

    .line 176
    .end local v1    # "stream":I
    :cond_5
    if-eq p1, v5, :cond_6

    .line 177
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    iget-object v7, p0, Landroidx/media/MediaSession2ImplBase;->mPlayerEventCallback:Landroidx/media/BaseMediaPlayer$PlayerEventCallback;

    invoke-virtual {p1, v1, v7}, Landroidx/media/BaseMediaPlayer;->registerPlayerEventCallback(Ljava/util/concurrent/Executor;Landroidx/media/BaseMediaPlayer$PlayerEventCallback;)V

    .line 178
    if-eqz v5, :cond_6

    .line 180
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlayerEventCallback:Landroidx/media/BaseMediaPlayer$PlayerEventCallback;

    invoke-virtual {v5, v1}, Landroidx/media/BaseMediaPlayer;->unregisterPlayerEventCallback(Landroidx/media/BaseMediaPlayer$PlayerEventCallback;)V

    .line 183
    :cond_6
    if-eq p2, v2, :cond_7

    .line 184
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    iget-object v7, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistEventCallback:Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;

    invoke-virtual {p2, v1, v7}, Landroidx/media/MediaPlaylistAgent;->registerPlaylistEventCallback(Ljava/util/concurrent/Executor;Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;)V

    .line 185
    if-eqz v2, :cond_7

    .line 187
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistEventCallback:Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;

    invoke-virtual {v2, v1}, Landroidx/media/MediaPlaylistAgent;->unregisterPlaylistEventCallback(Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;)V

    .line 191
    :cond_7
    if-eqz v5, :cond_a

    .line 194
    if-eqz v6, :cond_8

    .line 197
    invoke-direct {p0, v2}, Landroidx/media/MediaSession2ImplBase;->notifyAgentUpdatedNotLocked(Landroidx/media/MediaPlaylistAgent;)V

    .line 199
    :cond_8
    if-eqz v4, :cond_9

    .line 200
    invoke-direct {p0, v5}, Landroidx/media/MediaSession2ImplBase;->notifyPlayerUpdatedNotLocked(Landroidx/media/BaseMediaPlayer;)V

    .line 202
    :cond_9
    if-eqz v3, :cond_a

    .line 205
    new-instance v1, Landroidx/media/MediaSession2ImplBase$1;

    invoke-direct {v1, p0, v0}, Landroidx/media/MediaSession2ImplBase$1;-><init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaController2$PlaybackInfo;)V

    invoke-direct {p0, v1}, Landroidx/media/MediaSession2ImplBase;->notifyToAllControllers(Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 213
    :cond_a
    return-void

    .line 171
    .end local v2    # "oldAgent":Landroidx/media/MediaPlaylistAgent;
    :catchall_0
    move-exception v7

    move v9, v3

    move-object v3, v2

    move-object v2, v5

    move v5, v9

    goto :goto_4

    .end local v3    # "hasPlaybackInfoChanged":Z
    .end local v5    # "oldPlayer":Landroidx/media/BaseMediaPlayer;
    :catchall_1
    move-exception v7

    move v5, v3

    goto :goto_3

    .end local v6    # "hasAgentChanged":Z
    :catchall_2
    move-exception v7

    move v5, v3

    goto :goto_2

    .end local v4    # "hasPlayerChanged":Z
    :catchall_3
    move-exception v7

    move v4, v3

    move v5, v4

    .local v2, "oldPlayer":Landroidx/media/BaseMediaPlayer;
    .local v3, "oldAgent":Landroidx/media/MediaPlaylistAgent;
    .restart local v4    # "hasPlayerChanged":Z
    .local v5, "hasPlaybackInfoChanged":Z
    .restart local v6    # "hasAgentChanged":Z
    :goto_2
    move v6, v5

    :goto_3
    move-object v3, v2

    :goto_4
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    throw v7

    :catchall_4
    move-exception v7

    goto :goto_4

    .line 146
    .end local v0    # "info":Landroidx/media/MediaController2$PlaybackInfo;
    .end local v2    # "oldPlayer":Landroidx/media/BaseMediaPlayer;
    .end local v3    # "oldAgent":Landroidx/media/MediaPlaylistAgent;
    .end local v4    # "hasPlayerChanged":Z
    .end local v5    # "hasPlaybackInfoChanged":Z
    .end local v6    # "hasAgentChanged":Z
    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "player shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public updatePlaylistMetadata(Landroidx/media/MediaMetadata2;)V
    .locals 4
    .param p1, "metadata"    # Landroidx/media/MediaMetadata2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 761
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 762
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 763
    .local v1, "agent":Landroidx/media/MediaPlaylistAgent;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 764
    if-eqz v1, :cond_0

    .line 765
    invoke-virtual {v1, p1}, Landroidx/media/MediaPlaylistAgent;->updatePlaylistMetadata(Landroidx/media/MediaMetadata2;)V

    goto :goto_0

    .line 766
    :cond_0
    sget-boolean v0, Landroidx/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 767
    const-string v0, "MS2ImplBase"

    const-string v2, "API calls after the close()"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 769
    :cond_1
    :goto_0
    return-void

    .line 763
    :catchall_0
    move-exception v2

    goto :goto_1

    .end local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :catchall_1
    move-exception v2

    const/4 v1, 0x0

    .restart local v1    # "agent":Landroidx/media/MediaPlaylistAgent;
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method
