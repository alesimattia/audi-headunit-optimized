.class Landroidx/media/MediaController2ImplBase;
.super Ljava/lang/Object;
.source "MediaController2ImplBase.java"

# interfaces
.implements Landroidx/media/MediaController2$SupportLibraryImpl;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;,
        Landroidx/media/MediaController2ImplBase$ConnectionCallback;
    }
.end annotation


# static fields
.field private static final DEBUG:Z

.field private static final TAG:Ljava/lang/String; = "MC2ImplBase"

.field static final sDefaultRootExtras:Landroid/os/Bundle;


# instance fields
.field private mAllowedCommands:Landroidx/media/SessionCommandGroup2;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mBrowserCompat:Landroid/support/v4/media/MediaBrowserCompat;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mBufferingState:I
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mCallback:Landroidx/media/MediaController2$ControllerCallback;

.field private final mCallbackExecutor:Ljava/util/concurrent/Executor;

.field private volatile mConnected:Z
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field private mControllerCompat:Landroid/support/v4/media/session/MediaControllerCompat;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mControllerCompatCallback:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mCurrentMediaItem:Landroidx/media/MediaItem2;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mDeathRecipient:Landroid/os/IBinder$DeathRecipient;

.field private final mHandler:Landroid/os/Handler;

.field private final mHandlerThread:Landroid/os/HandlerThread;

.field private mInstance:Landroidx/media/MediaController2;

.field private mIsReleased:Z
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field private mMediaMetadataCompat:Landroid/support/v4/media/MediaMetadataCompat;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mPlaybackInfo:Landroidx/media/MediaController2$PlaybackInfo;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mPlaybackStateCompat:Landroid/support/v4/media/session/PlaybackStateCompat;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mPlayerState:I
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mPlaylist:Ljava/util/List;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;"
        }
    .end annotation
.end field

.field private mPlaylistMetadata:Landroidx/media/MediaMetadata2;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mRepeatMode:I
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mShuffleMode:I
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mToken:Landroidx/media/SessionToken2;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 149
    const-string v0, "MC2ImplBase"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Landroidx/media/MediaController2ImplBase;->DEBUG:Z

    .line 153
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    sput-object v0, Landroidx/media/MediaController2ImplBase;->sDefaultRootExtras:Landroid/os/Bundle;

    .line 155
    sget-object v0, Landroidx/media/MediaController2ImplBase;->sDefaultRootExtras:Landroid/os/Bundle;

    const-string v1, "androidx.media.root_default_root"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 156
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroidx/media/SessionToken2;Ljava/util/concurrent/Executor;Landroidx/media/MediaController2$ControllerCallback;)V
    .locals 2
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

    .line 211
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    .line 212
    if-eqz p1, :cond_3

    .line 215
    if-eqz p2, :cond_2

    .line 218
    if-eqz p4, :cond_1

    .line 221
    if-eqz p3, :cond_0

    .line 224
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase;->mContext:Landroid/content/Context;

    .line 225
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "MediaController2_Thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Landroidx/media/MediaController2ImplBase;->mHandlerThread:Landroid/os/HandlerThread;

    .line 226
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 227
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Landroidx/media/MediaController2ImplBase;->mHandler:Landroid/os/Handler;

    .line 228
    iput-object p2, p0, Landroidx/media/MediaController2ImplBase;->mToken:Landroidx/media/SessionToken2;

    .line 229
    iput-object p4, p0, Landroidx/media/MediaController2ImplBase;->mCallback:Landroidx/media/MediaController2$ControllerCallback;

    .line 230
    iput-object p3, p0, Landroidx/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 231
    new-instance v0, Landroidx/media/MediaController2ImplBase$1;

    invoke-direct {v0, p0}, Landroidx/media/MediaController2ImplBase$1;-><init>(Landroidx/media/MediaController2ImplBase;)V

    iput-object v0, p0, Landroidx/media/MediaController2ImplBase;->mDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    .line 238
    invoke-direct {p0}, Landroidx/media/MediaController2ImplBase;->initialize()V

    .line 239
    return-void

    .line 222
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "executor shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 219
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "callback shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 216
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "token shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 213
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "context shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic access$000(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;

    .line 146
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mInstance:Landroidx/media/MediaController2;

    return-object v0
.end method

.method static synthetic access$100(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2$ControllerCallback;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;

    .line 146
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mCallback:Landroidx/media/MediaController2$ControllerCallback;

    return-object v0
.end method

.method static synthetic access$1000(Landroidx/media/MediaController2ImplBase;Landroid/support/v4/media/session/MediaSessionCompat$Token;)V
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p1, "x1"    # Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 146
    invoke-direct {p0, p1}, Landroidx/media/MediaController2ImplBase;->connectToSession(Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    return-void
.end method

.method static synthetic access$1100()Z
    .locals 1

    .line 146
    sget-boolean v0, Landroidx/media/MediaController2ImplBase;->DEBUG:Z

    return v0
.end method

.method static synthetic access$1200(Landroidx/media/MediaController2ImplBase;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;

    .line 146
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1300(Landroidx/media/MediaController2ImplBase;)Z
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;

    .line 146
    iget-boolean v0, p0, Landroidx/media/MediaController2ImplBase;->mIsReleased:Z

    return v0
.end method

.method static synthetic access$1400(Landroidx/media/MediaController2ImplBase;Z)V
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p1, "x1"    # Z

    .line 146
    invoke-direct {p0, p1}, Landroidx/media/MediaController2ImplBase;->cleanUpControllerCompatLocked(Z)V

    return-void
.end method

.method static synthetic access$1500(Landroidx/media/MediaController2ImplBase;Ljava/lang/String;Landroid/os/ResultReceiver;)V
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Landroid/os/ResultReceiver;

    .line 146
    invoke-direct {p0, p1, p2}, Landroidx/media/MediaController2ImplBase;->sendCommand(Ljava/lang/String;Landroid/os/ResultReceiver;)V

    return-void
.end method

.method static synthetic access$1602(Landroidx/media/MediaController2ImplBase;Landroid/support/v4/media/session/PlaybackStateCompat;)Landroid/support/v4/media/session/PlaybackStateCompat;
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p1, "x1"    # Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 146
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase;->mPlaybackStateCompat:Landroid/support/v4/media/session/PlaybackStateCompat;

    return-object p1
.end method

.method static synthetic access$1702(Landroidx/media/MediaController2ImplBase;Landroid/support/v4/media/MediaMetadataCompat;)Landroid/support/v4/media/MediaMetadataCompat;
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p1, "x1"    # Landroid/support/v4/media/MediaMetadataCompat;

    .line 146
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase;->mMediaMetadataCompat:Landroid/support/v4/media/MediaMetadataCompat;

    return-object p1
.end method

.method static synthetic access$1802(Landroidx/media/MediaController2ImplBase;Landroidx/media/SessionCommandGroup2;)Landroidx/media/SessionCommandGroup2;
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p1, "x1"    # Landroidx/media/SessionCommandGroup2;

    .line 146
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase;->mAllowedCommands:Landroidx/media/SessionCommandGroup2;

    return-object p1
.end method

.method static synthetic access$1902(Landroidx/media/MediaController2ImplBase;I)I
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p1, "x1"    # I

    .line 146
    iput p1, p0, Landroidx/media/MediaController2ImplBase;->mPlayerState:I

    return p1
.end method

.method static synthetic access$2002(Landroidx/media/MediaController2ImplBase;Landroidx/media/MediaItem2;)Landroidx/media/MediaItem2;
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p1, "x1"    # Landroidx/media/MediaItem2;

    .line 146
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase;->mCurrentMediaItem:Landroidx/media/MediaItem2;

    return-object p1
.end method

.method static synthetic access$2102(Landroidx/media/MediaController2ImplBase;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p1, "x1"    # Ljava/util/List;

    .line 146
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase;->mPlaylist:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$2202(Landroidx/media/MediaController2ImplBase;Landroidx/media/MediaMetadata2;)Landroidx/media/MediaMetadata2;
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p1, "x1"    # Landroidx/media/MediaMetadata2;

    .line 146
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase;->mPlaylistMetadata:Landroidx/media/MediaMetadata2;

    return-object p1
.end method

.method static synthetic access$2302(Landroidx/media/MediaController2ImplBase;I)I
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p1, "x1"    # I

    .line 146
    iput p1, p0, Landroidx/media/MediaController2ImplBase;->mRepeatMode:I

    return p1
.end method

.method static synthetic access$2402(Landroidx/media/MediaController2ImplBase;I)I
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p1, "x1"    # I

    .line 146
    iput p1, p0, Landroidx/media/MediaController2ImplBase;->mShuffleMode:I

    return p1
.end method

.method static synthetic access$2502(Landroidx/media/MediaController2ImplBase;Landroidx/media/MediaController2$PlaybackInfo;)Landroidx/media/MediaController2$PlaybackInfo;
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p1, "x1"    # Landroidx/media/MediaController2$PlaybackInfo;

    .line 146
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase;->mPlaybackInfo:Landroidx/media/MediaController2$PlaybackInfo;

    return-object p1
.end method

.method static synthetic access$2602(Landroidx/media/MediaController2ImplBase;I)I
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p1, "x1"    # I

    .line 146
    iput p1, p0, Landroidx/media/MediaController2ImplBase;->mBufferingState:I

    return p1
.end method

.method static synthetic access$300(Landroidx/media/MediaController2ImplBase;)Landroid/os/HandlerThread;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;

    .line 146
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mHandlerThread:Landroid/os/HandlerThread;

    return-object v0
.end method

.method static synthetic access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;

    .line 146
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method static synthetic access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;

    .line 146
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$600(Landroidx/media/MediaController2ImplBase;)Landroid/support/v4/media/MediaBrowserCompat;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;

    .line 146
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mBrowserCompat:Landroid/support/v4/media/MediaBrowserCompat;

    return-object v0
.end method

.method static synthetic access$602(Landroidx/media/MediaController2ImplBase;Landroid/support/v4/media/MediaBrowserCompat;)Landroid/support/v4/media/MediaBrowserCompat;
    .locals 0
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p1, "x1"    # Landroid/support/v4/media/MediaBrowserCompat;

    .line 146
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase;->mBrowserCompat:Landroid/support/v4/media/MediaBrowserCompat;

    return-object p1
.end method

.method static synthetic access$700(Landroidx/media/MediaController2ImplBase;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;

    .line 146
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$800(Landroidx/media/MediaController2ImplBase;)Landroidx/media/SessionToken2;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaController2ImplBase;

    .line 146
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mToken:Landroidx/media/SessionToken2;

    return-object v0
.end method

.method private cleanUpControllerCompatLocked(Z)V
    .locals 4
    .param p1, "sendDisconnectCommand"    # Z

    .line 281
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 282
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    if-lt v0, v2, :cond_0

    .line 283
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    goto :goto_0

    .line 285
    :cond_0
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 290
    :goto_0
    if-eqz p1, :cond_1

    .line 291
    const-string v0, "androidx.media.controller.command.DISCONNECT"

    invoke-direct {p0, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(Ljava/lang/String;)V

    .line 294
    :cond_1
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 295
    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase;->mControllerCompat:Landroid/support/v4/media/session/MediaControllerCompat;

    if-eqz v2, :cond_2

    .line 296
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase;->mControllerCompat:Landroid/support/v4/media/session/MediaControllerCompat;

    iget-object v3, p0, Landroidx/media/MediaController2ImplBase;->mControllerCompatCallback:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    invoke-virtual {v2, v3}, Landroid/support/v4/media/session/MediaControllerCompat;->unregisterCallback(Landroid/support/v4/media/session/MediaControllerCompat$Callback;)V

    .line 297
    iput-object v1, p0, Landroidx/media/MediaController2ImplBase;->mControllerCompat:Landroid/support/v4/media/session/MediaControllerCompat;

    .line 299
    :cond_2
    monitor-exit v0

    .line 300
    return-void

    .line 299
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private connectToService()V
    .locals 2

    .line 912
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/media/MediaController2ImplBase$5;

    invoke-direct {v1, p0}, Landroidx/media/MediaController2ImplBase$5;-><init>(Landroidx/media/MediaController2ImplBase;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 922
    return-void
.end method

.method private connectToSession(Landroid/support/v4/media/session/MediaSessionCompat$Token;)V
    .locals 5
    .param p1, "sessionCompatToken"    # Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 873
    const/4 v0, 0x0

    move-object v1, v0

    .line 875
    .local v1, "controllerCompat":Landroid/support/v4/media/session/MediaControllerCompat;
    :try_start_0
    new-instance v2, Landroid/support/v4/media/session/MediaControllerCompat;

    iget-object v3, p0, Landroidx/media/MediaController2ImplBase;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3, p1}, Landroid/support/v4/media/session/MediaControllerCompat;-><init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat$Token;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v2

    .line 878
    goto :goto_0

    .line 876
    :catch_0
    move-exception v2

    .line 877
    .local v2, "e":Landroid/os/RemoteException;
    invoke-virtual {v2}, Landroid/os/RemoteException;->printStackTrace()V

    .line 879
    .end local v2    # "e":Landroid/os/RemoteException;
    :goto_0
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 880
    :try_start_1
    iput-object v1, p0, Landroidx/media/MediaController2ImplBase;->mControllerCompat:Landroid/support/v4/media/session/MediaControllerCompat;

    .line 881
    new-instance v3, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    invoke-direct {v3, p0, v0}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;-><init>(Landroidx/media/MediaController2ImplBase;Landroidx/media/MediaController2ImplBase$1;)V

    iput-object v3, p0, Landroidx/media/MediaController2ImplBase;->mControllerCompatCallback:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    .line 882
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mControllerCompat:Landroid/support/v4/media/session/MediaControllerCompat;

    iget-object v3, p0, Landroidx/media/MediaController2ImplBase;->mControllerCompatCallback:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v4, p0, Landroidx/media/MediaController2ImplBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3, v4}, Landroid/support/v4/media/session/MediaControllerCompat;->registerCallback(Landroid/support/v4/media/session/MediaControllerCompat$Callback;Landroid/os/Handler;)V

    .line 883
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 885
    invoke-virtual {v1}, Landroid/support/v4/media/session/MediaControllerCompat;->isSessionReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 886
    const-string v0, "androidx.media.controller.command.CONNECT"

    new-instance v2, Landroidx/media/MediaController2ImplBase$4;

    iget-object v3, p0, Landroidx/media/MediaController2ImplBase;->mHandler:Landroid/os/Handler;

    invoke-direct {v2, p0, v3}, Landroidx/media/MediaController2ImplBase$4;-><init>(Landroidx/media/MediaController2ImplBase;Landroid/os/Handler;)V

    invoke-direct {p0, v0, v2}, Landroidx/media/MediaController2ImplBase;->sendCommand(Ljava/lang/String;Landroid/os/ResultReceiver;)V

    .line 909
    :cond_0
    return-void

    .line 883
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method private initialize()V
    .locals 2

    .line 862
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mToken:Landroidx/media/SessionToken2;

    invoke-virtual {v0}, Landroidx/media/SessionToken2;->getType()I

    move-result v0

    if-nez v0, :cond_0

    .line 863
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 864
    const/4 v1, 0x0

    :try_start_0
    iput-object v1, p0, Landroidx/media/MediaController2ImplBase;->mBrowserCompat:Landroid/support/v4/media/MediaBrowserCompat;

    .line 865
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 866
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mToken:Landroidx/media/SessionToken2;

    invoke-virtual {v0}, Landroidx/media/SessionToken2;->getSessionCompatToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/media/MediaController2ImplBase;->connectToSession(Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    goto :goto_0

    .line 865
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 868
    :cond_0
    invoke-direct {p0}, Landroidx/media/MediaController2ImplBase;->connectToService()V

    .line 870
    :goto_0
    return-void
.end method

.method private sendCommand(I)V
    .locals 1
    .param p1, "commandCode"    # I

    .line 925
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 926
    return-void
.end method

.method private sendCommand(ILandroid/os/Bundle;)V
    .locals 2
    .param p1, "commandCode"    # I
    .param p2, "args"    # Landroid/os/Bundle;

    .line 929
    if-nez p2, :cond_0

    .line 930
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    move-object p2, v0

    .line 932
    :cond_0
    const-string v0, "androidx.media.argument.COMMAND_CODE"

    invoke-virtual {p2, v0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 933
    const-string v0, "androidx.media.controller.command.BY_COMMAND_CODE"

    const/4 v1, 0x0

    invoke-direct {p0, v0, p2, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    .line 934
    return-void
.end method

.method private sendCommand(Ljava/lang/String;)V
    .locals 1
    .param p1, "command"    # Ljava/lang/String;

    .line 937
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    .line 938
    return-void
.end method

.method private sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 5
    .param p1, "command"    # Ljava/lang/String;
    .param p2, "args"    # Landroid/os/Bundle;
    .param p3, "receiver"    # Landroid/os/ResultReceiver;

    .line 945
    if-nez p2, :cond_0

    .line 946
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    move-object p2, v0

    .line 950
    :cond_0
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 951
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase;->mControllerCompat:Landroid/support/v4/media/session/MediaControllerCompat;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 952
    .local v2, "controller":Landroid/support/v4/media/session/MediaControllerCompat;
    :try_start_1
    iget-object v3, p0, Landroidx/media/MediaController2ImplBase;->mControllerCompatCallback:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    move-object v1, v3

    .line 953
    .local v1, "callback":Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 954
    const-string v0, "androidx.media.argument.ICONTROLLER_CALLBACK"

    .line 955
    invoke-virtual {v1}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->getIControllerCallback()Landroid/support/v4/media/session/IMediaControllerCallback;

    move-result-object v3

    invoke-interface {v3}, Landroid/support/v4/media/session/IMediaControllerCallback;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    .line 954
    invoke-static {p2, v0, v3}, Landroidx/core/app/BundleCompat;->putBinder(Landroid/os/Bundle;Ljava/lang/String;Landroid/os/IBinder;)V

    .line 956
    const-string v0, "androidx.media.argument.PACKAGE_NAME"

    iget-object v3, p0, Landroidx/media/MediaController2ImplBase;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 957
    const-string v0, "androidx.media.argument.UID"

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v3

    invoke-virtual {p2, v0, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 958
    const-string v0, "androidx.media.argument.PID"

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    invoke-virtual {p2, v0, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 959
    invoke-virtual {v2, p1, p2, p3}, Landroid/support/v4/media/session/MediaControllerCompat;->sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    .line 960
    return-void

    .line 953
    .end local v1    # "callback":Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;
    :catchall_0
    move-exception v3

    move-object v4, v2

    move-object v2, v1

    move-object v1, v4

    goto :goto_0

    .end local v2    # "controller":Landroid/support/v4/media/session/MediaControllerCompat;
    :catchall_1
    move-exception v3

    move-object v2, v1

    .local v1, "controller":Landroid/support/v4/media/session/MediaControllerCompat;
    .local v2, "callback":Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    throw v3

    :catchall_2
    move-exception v3

    goto :goto_0
.end method

.method private sendCommand(Ljava/lang/String;Landroid/os/ResultReceiver;)V
    .locals 1
    .param p1, "command"    # Ljava/lang/String;
    .param p2, "receiver"    # Landroid/os/ResultReceiver;

    .line 941
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Landroidx/media/MediaController2ImplBase;->sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    .line 942
    return-void
.end method


# virtual methods
.method public addPlaylistItem(ILandroidx/media/MediaItem2;)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 680
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 681
    .local v0, "args":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.PLAYLIST_INDEX"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 682
    const-string v1, "androidx.media.argument.MEDIA_ITEM"

    invoke-virtual {p2}, Landroidx/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 683
    const/16 v1, 0xf

    invoke-direct {p0, v1, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 684
    return-void
.end method

.method public adjustVolume(II)V
    .locals 4
    .param p1, "direction"    # I
    .param p2, "flags"    # I

    .line 503
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 504
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 505
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 506
    monitor-exit v0

    return-void

    .line 508
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 509
    .local v1, "args":Landroid/os/Bundle;
    const-string v2, "androidx.media.argument.VOLUME_DIRECTION"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 510
    const-string v2, "androidx.media.argument.VOLUME_FLAGS"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 511
    const/16 v2, 0xb

    invoke-direct {p0, v2, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 512
    .end local v1    # "args":Landroid/os/Bundle;
    monitor-exit v0

    .line 513
    return-void

    .line 512
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public close()V
    .locals 3

    .line 248
    sget-boolean v0, Landroidx/media/MediaController2ImplBase;->DEBUG:Z

    .line 251
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 252
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mIsReleased:Z

    if-eqz v1, :cond_0

    .line 254
    monitor-exit v0

    return-void

    .line 256
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mIsReleased:Z

    .line 262
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase;->mControllerCompatCallback:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    if-eqz v2, :cond_1

    iget-object v2, p0, Landroidx/media/MediaController2ImplBase;->mControllerCompatCallback:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    .line 263
    invoke-virtual {v2}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->getIControllerCallback()Landroid/support/v4/media/session/IMediaControllerCallback;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 264
    invoke-direct {p0, v1}, Landroidx/media/MediaController2ImplBase;->cleanUpControllerCompatLocked(Z)V

    .line 266
    :cond_1
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mBrowserCompat:Landroid/support/v4/media/MediaBrowserCompat;

    if-eqz v1, :cond_2

    .line 267
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mBrowserCompat:Landroid/support/v4/media/MediaBrowserCompat;

    invoke-virtual {v1}, Landroid/support/v4/media/MediaBrowserCompat;->disconnect()V

    .line 268
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/media/MediaController2ImplBase;->mBrowserCompat:Landroid/support/v4/media/MediaBrowserCompat;

    .line 270
    :cond_2
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    .line 271
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 272
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/media/MediaController2ImplBase$2;

    invoke-direct {v1, p0}, Landroidx/media/MediaController2ImplBase$2;-><init>(Landroidx/media/MediaController2ImplBase;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 278
    return-void

    .line 271
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public fastForward()V
    .locals 4

    .line 360
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 361
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 362
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 363
    monitor-exit v0

    return-void

    .line 365
    :cond_0
    const/4 v1, 0x7

    invoke-direct {p0, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(I)V

    .line 366
    monitor-exit v0

    .line 367
    return-void

    .line 366
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 790
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 791
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mBrowserCompat:Landroid/support/v4/media/MediaBrowserCompat;

    monitor-exit v0

    return-object v1

    .line 792
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getBufferedPosition()J
    .locals 6

    .line 600
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 601
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    const-wide/16 v2, -0x1

    if-nez v1, :cond_0

    .line 602
    const-string v1, "MC2ImplBase"

    const-string v4, "Session isn\'t active"

    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 603
    monitor-exit v0

    return-wide v2

    .line 605
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mPlaybackStateCompat:Landroid/support/v4/media/session/PlaybackStateCompat;

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mPlaybackStateCompat:Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 606
    invoke-virtual {v1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getBufferedPosition()J

    move-result-wide v2

    :goto_0
    monitor-exit v0

    return-wide v2

    .line 607
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getBufferingState()I
    .locals 4

    .line 589
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 590
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 591
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 592
    const/4 v1, 0x0

    monitor-exit v0

    return v1

    .line 594
    :cond_0
    iget v1, p0, Landroidx/media/MediaController2ImplBase;->mBufferingState:I

    monitor-exit v0

    return v1

    .line 595
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getCallback()Landroidx/media/MediaController2$ControllerCallback;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 780
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mCallback:Landroidx/media/MediaController2$ControllerCallback;

    return-object v0
.end method

.method public getCallbackExecutor()Ljava/util/concurrent/Executor;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 785
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 775
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getCurrentMediaItem()Landroidx/media/MediaItem2;
    .locals 2

    .line 703
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 704
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mCurrentMediaItem:Landroidx/media/MediaItem2;

    monitor-exit v0

    return-object v1

    .line 705
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getCurrentPosition()J
    .locals 7

    .line 546
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 547
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    const-wide/16 v2, -0x1

    if-nez v1, :cond_0

    .line 548
    const-string v1, "MC2ImplBase"

    const-string v4, "Session isn\'t active"

    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 549
    monitor-exit v0

    return-wide v2

    .line 551
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mPlaybackStateCompat:Landroid/support/v4/media/session/PlaybackStateCompat;

    if-eqz v1, :cond_2

    .line 552
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mInstance:Landroidx/media/MediaController2;

    iget-object v1, v1, Landroidx/media/MediaController2;->mTimeDiff:Ljava/lang/Long;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mInstance:Landroidx/media/MediaController2;

    iget-object v1, v1, Landroidx/media/MediaController2;->mTimeDiff:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    goto :goto_0

    .line 553
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-object v3, p0, Landroidx/media/MediaController2ImplBase;->mPlaybackStateCompat:Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 554
    invoke-virtual {v3}, Landroid/support/v4/media/session/PlaybackStateCompat;->getLastPositionUpdateTime()J

    move-result-wide v3

    sub-long/2addr v1, v3

    .line 555
    .local v1, "timeDiff":J
    :goto_0
    iget-object v3, p0, Landroidx/media/MediaController2ImplBase;->mPlaybackStateCompat:Landroid/support/v4/media/session/PlaybackStateCompat;

    invoke-virtual {v3}, Landroid/support/v4/media/session/PlaybackStateCompat;->getPosition()J

    move-result-wide v3

    iget-object v5, p0, Landroidx/media/MediaController2ImplBase;->mPlaybackStateCompat:Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 556
    invoke-virtual {v5}, Landroid/support/v4/media/session/PlaybackStateCompat;->getPlaybackSpeed()F

    move-result v5

    long-to-float v6, v1

    mul-float/2addr v5, v6

    float-to-long v5, v5

    add-long/2addr v3, v5

    .line 557
    .local v3, "expectedPosition":J
    const-wide/16 v5, 0x0

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    monitor-exit v0

    return-wide v5

    .line 559
    .end local v1    # "timeDiff":J
    .end local v3    # "expectedPosition":J
    :cond_2
    monitor-exit v0

    return-wide v2

    .line 560
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getDuration()J
    .locals 3

    .line 535
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 536
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mMediaMetadataCompat:Landroid/support/v4/media/MediaMetadataCompat;

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mMediaMetadataCompat:Landroid/support/v4/media/MediaMetadataCompat;

    const-string v2, "android.media.metadata.DURATION"

    .line 537
    invoke-virtual {v1, v2}, Landroid/support/v4/media/MediaMetadataCompat;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 538
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mMediaMetadataCompat:Landroid/support/v4/media/MediaMetadataCompat;

    const-string v2, "android.media.metadata.DURATION"

    invoke-virtual {v1, v2}, Landroid/support/v4/media/MediaMetadataCompat;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    monitor-exit v0

    return-wide v1

    .line 540
    :cond_0
    monitor-exit v0

    .line 541
    const-wide/16 v0, -0x1

    return-wide v0

    .line 540
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPlaybackInfo()Landroidx/media/MediaController2$PlaybackInfo;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 612
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 613
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mPlaybackInfo:Landroidx/media/MediaController2$PlaybackInfo;

    monitor-exit v0

    return-object v1

    .line 614
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPlaybackSpeed()F
    .locals 5

    .line 565
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 566
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 567
    const-string v1, "MC2ImplBase"

    const-string v3, "Session isn\'t active"

    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 568
    monitor-exit v0

    return v2

    .line 570
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mPlaybackStateCompat:Landroid/support/v4/media/session/PlaybackStateCompat;

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mPlaybackStateCompat:Landroid/support/v4/media/session/PlaybackStateCompat;

    invoke-virtual {v1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getPlaybackSpeed()F

    move-result v2

    :goto_0
    monitor-exit v0

    return v2

    .line 571
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPlayerState()I
    .locals 2

    .line 528
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 529
    :try_start_0
    iget v1, p0, Landroidx/media/MediaController2ImplBase;->mPlayerState:I

    monitor-exit v0

    return v1

    .line 530
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPlaylist()Ljava/util/List;
    .locals 2
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

    .line 648
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 649
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mPlaylist:Ljava/util/List;

    monitor-exit v0

    return-object v1

    .line 650
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPlaylistMetadata()Landroidx/media/MediaMetadata2;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 673
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 674
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mPlaylistMetadata:Landroidx/media/MediaMetadata2;

    monitor-exit v0

    return-object v1

    .line 675
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getRepeatMode()I
    .locals 2

    .line 727
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 728
    :try_start_0
    iget v1, p0, Landroidx/media/MediaController2ImplBase;->mRepeatMode:I

    monitor-exit v0

    return v1

    .line 729
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getSessionActivity()Landroid/app/PendingIntent;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 517
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 518
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 519
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 520
    const/4 v1, 0x0

    monitor-exit v0

    return-object v1

    .line 522
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase;->mControllerCompat:Landroid/support/v4/media/session/MediaControllerCompat;

    invoke-virtual {v1}, Landroid/support/v4/media/session/MediaControllerCompat;->getSessionActivity()Landroid/app/PendingIntent;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 523
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getSessionToken()Landroidx/media/SessionToken2;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 304
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mToken:Landroidx/media/SessionToken2;

    return-object v0
.end method

.method public getShuffleMode()I
    .locals 2

    .line 741
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 742
    :try_start_0
    iget v1, p0, Landroidx/media/MediaController2ImplBase;->mShuffleMode:I

    monitor-exit v0

    return v1

    .line 743
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isConnected()Z
    .locals 2

    .line 309
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 310
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    monitor-exit v0

    return v1

    .line 311
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method onConnectedNotLocked(Landroid/os/Bundle;)V
    .locals 14
    .param p1, "data"    # Landroid/os/Bundle;

    .line 797
    const-class v0, Landroidx/media/MediaSession2;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 799
    const-string v0, "androidx.media.argument.ALLOWED_COMMANDS"

    .line 800
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 799
    invoke-static {v0}, Landroidx/media/SessionCommandGroup2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/SessionCommandGroup2;

    move-result-object v0

    .line 801
    .local v0, "allowedCommands":Landroidx/media/SessionCommandGroup2;
    const-string v1, "androidx.media.argument.PLAYER_STATE"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 802
    .local v1, "playerState":I
    const-string v2, "androidx.media.argument.BUFFERING_STATE"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 803
    .local v2, "bufferingState":I
    const-string v3, "androidx.media.argument.PLAYBACK_STATE_COMPAT"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 805
    .local v3, "playbackStateCompat":Landroid/support/v4/media/session/PlaybackStateCompat;
    const-string v4, "androidx.media.argument.REPEAT_MODE"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 806
    .local v4, "repeatMode":I
    const-string v5, "androidx.media.argument.SHUFFLE_MODE"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 807
    .local v5, "shuffleMode":I
    const-string v6, "androidx.media.argument.PLAYLIST"

    .line 808
    invoke-virtual {p1, v6}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v6

    .line 807
    invoke-static {v6}, Landroidx/media/MediaUtils2;->fromMediaItem2ParcelableArray([Landroid/os/Parcelable;)Ljava/util/List;

    move-result-object v6

    .line 809
    .local v6, "playlist":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    const-string v7, "androidx.media.argument.MEDIA_ITEM"

    .line 810
    invoke-virtual {p1, v7}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v7

    .line 809
    invoke-static {v7}, Landroidx/media/MediaItem2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaItem2;

    move-result-object v7

    .line 811
    .local v7, "currentMediaItem":Landroidx/media/MediaItem2;
    const-string v8, "androidx.media.argument.PLAYBACK_INFO"

    .line 812
    invoke-virtual {p1, v8}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v8

    invoke-static {v8}, Landroidx/media/MediaController2$PlaybackInfo;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaController2$PlaybackInfo;

    move-result-object v8

    .line 813
    .local v8, "playbackInfo":Landroidx/media/MediaController2$PlaybackInfo;
    const-string v9, "androidx.media.argument.PLAYLIST_METADATA"

    .line 814
    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v9

    .line 813
    invoke-static {v9}, Landroidx/media/MediaMetadata2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaMetadata2;

    move-result-object v9

    .line 815
    .local v9, "metadata":Landroidx/media/MediaMetadata2;
    sget-boolean v10, Landroidx/media/MediaController2ImplBase;->DEBUG:Z

    if-eqz v10, :cond_0

    .line 816
    const-string v10, "MC2ImplBase"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "onConnectedNotLocked sessionCompatToken="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v12, p0, Landroidx/media/MediaController2ImplBase;->mToken:Landroidx/media/SessionToken2;

    invoke-virtual {v12}, Landroidx/media/SessionToken2;->getSessionCompatToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v12, ", allowedCommands="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 819
    :cond_0
    const/4 v10, 0x0

    .line 821
    .local v10, "close":Z
    :try_start_0
    iget-object v11, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 822
    :try_start_1
    iget-boolean v12, p0, Landroidx/media/MediaController2ImplBase;->mIsReleased:Z

    if-eqz v12, :cond_2

    .line 823
    monitor-exit v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 853
    if-eqz v10, :cond_1

    .line 856
    invoke-virtual {p0}, Landroidx/media/MediaController2ImplBase;->close()V

    .line 823
    :cond_1
    return-void

    .line 825
    :cond_2
    :try_start_2
    iget-boolean v12, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-eqz v12, :cond_4

    .line 826
    const-string v12, "MC2ImplBase"

    const-string v13, "Cannot be notified about the connection result many times. Probably a bug or malicious app."

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 828
    const/4 v10, 0x1

    .line 829
    monitor-exit v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 853
    if-eqz v10, :cond_3

    .line 856
    invoke-virtual {p0}, Landroidx/media/MediaController2ImplBase;->close()V

    .line 829
    :cond_3
    return-void

    .line 831
    :cond_4
    :try_start_3
    iput-object v0, p0, Landroidx/media/MediaController2ImplBase;->mAllowedCommands:Landroidx/media/SessionCommandGroup2;

    .line 832
    iput v1, p0, Landroidx/media/MediaController2ImplBase;->mPlayerState:I

    .line 833
    iput v2, p0, Landroidx/media/MediaController2ImplBase;->mBufferingState:I

    .line 834
    iput-object v3, p0, Landroidx/media/MediaController2ImplBase;->mPlaybackStateCompat:Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 835
    iput v4, p0, Landroidx/media/MediaController2ImplBase;->mRepeatMode:I

    .line 836
    iput v5, p0, Landroidx/media/MediaController2ImplBase;->mShuffleMode:I

    .line 837
    iput-object v6, p0, Landroidx/media/MediaController2ImplBase;->mPlaylist:Ljava/util/List;

    .line 838
    iput-object v7, p0, Landroidx/media/MediaController2ImplBase;->mCurrentMediaItem:Landroidx/media/MediaItem2;

    .line 839
    iput-object v9, p0, Landroidx/media/MediaController2ImplBase;->mPlaylistMetadata:Landroidx/media/MediaMetadata2;

    .line 840
    const/4 v12, 0x1

    iput-boolean v12, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    .line 841
    iput-object v8, p0, Landroidx/media/MediaController2ImplBase;->mPlaybackInfo:Landroidx/media/MediaController2$PlaybackInfo;

    .line 842
    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 843
    :try_start_4
    iget-object v11, p0, Landroidx/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v12, Landroidx/media/MediaController2ImplBase$3;

    invoke-direct {v12, p0, v0}, Landroidx/media/MediaController2ImplBase$3;-><init>(Landroidx/media/MediaController2ImplBase;Landroidx/media/SessionCommandGroup2;)V

    invoke-interface {v11, v12}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 853
    if-eqz v10, :cond_5

    .line 856
    invoke-virtual {p0}, Landroidx/media/MediaController2ImplBase;->close()V

    .line 859
    :cond_5
    return-void

    .line 842
    :catchall_0
    move-exception v12

    :try_start_5
    monitor-exit v11
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v12
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 853
    :catchall_1
    move-exception v11

    if-eqz v10, :cond_6

    .line 856
    invoke-virtual {p0}, Landroidx/media/MediaController2ImplBase;->close()V

    :cond_6
    throw v11
.end method

.method public pause()V
    .locals 4

    .line 327
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 328
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 329
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 330
    monitor-exit v0

    return-void

    .line 332
    :cond_0
    const/4 v1, 0x2

    invoke-direct {p0, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(I)V

    .line 333
    monitor-exit v0

    .line 334
    return-void

    .line 333
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public play()V
    .locals 4

    .line 316
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 317
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 318
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 319
    monitor-exit v0

    return-void

    .line 321
    :cond_0
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(I)V

    .line 322
    monitor-exit v0

    .line 323
    return-void

    .line 322
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public playFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "mediaId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 405
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 406
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 407
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 408
    monitor-exit v0

    return-void

    .line 410
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 411
    .local v1, "args":Landroid/os/Bundle;
    const-string v2, "androidx.media.argument.MEDIA_ID"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    const-string v2, "androidx.media.argument.EXTRAS"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 413
    const/16 v2, 0x16

    invoke-direct {p0, v2, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 414
    .end local v1    # "args":Landroid/os/Bundle;
    monitor-exit v0

    .line 415
    return-void

    .line 414
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public playFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 419
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 420
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 421
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 422
    monitor-exit v0

    return-void

    .line 424
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 425
    .local v1, "args":Landroid/os/Bundle;
    const-string v2, "androidx.media.argument.QUERY"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 426
    const-string v2, "androidx.media.argument.EXTRAS"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 427
    const/16 v2, 0x18

    invoke-direct {p0, v2, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 428
    .end local v1    # "args":Landroid/os/Bundle;
    monitor-exit v0

    .line 429
    return-void

    .line 428
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public playFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 433
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 434
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 435
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 436
    monitor-exit v0

    return-void

    .line 438
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 439
    .local v1, "args":Landroid/os/Bundle;
    const-string v2, "androidx.media.argument.URI"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 440
    const-string v2, "androidx.media.argument.EXTRAS"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 441
    const/16 v2, 0x17

    invoke-direct {p0, v2, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 442
    .end local v1    # "args":Landroid/os/Bundle;
    monitor-exit v0

    .line 443
    return-void

    .line 442
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public prepare()V
    .locals 4

    .line 349
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 350
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 351
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 352
    monitor-exit v0

    return-void

    .line 354
    :cond_0
    const/4 v1, 0x6

    invoke-direct {p0, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(I)V

    .line 355
    monitor-exit v0

    .line 356
    return-void

    .line 355
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public prepareFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "mediaId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 447
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 448
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 449
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 450
    monitor-exit v0

    return-void

    .line 452
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 453
    .local v1, "args":Landroid/os/Bundle;
    const-string v2, "androidx.media.argument.MEDIA_ID"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    const-string v2, "androidx.media.argument.EXTRAS"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 455
    const/16 v2, 0x19

    invoke-direct {p0, v2, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 456
    .end local v1    # "args":Landroid/os/Bundle;
    monitor-exit v0

    .line 457
    return-void

    .line 456
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public prepareFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 461
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 462
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 463
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 464
    monitor-exit v0

    return-void

    .line 466
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 467
    .local v1, "args":Landroid/os/Bundle;
    const-string v2, "androidx.media.argument.QUERY"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    const-string v2, "androidx.media.argument.EXTRAS"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 469
    const/16 v2, 0x1b

    invoke-direct {p0, v2, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 470
    .end local v1    # "args":Landroid/os/Bundle;
    monitor-exit v0

    .line 471
    return-void

    .line 470
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public prepareFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 475
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 476
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 477
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 478
    monitor-exit v0

    return-void

    .line 480
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 481
    .local v1, "args":Landroid/os/Bundle;
    const-string v2, "androidx.media.argument.URI"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 482
    const-string v2, "androidx.media.argument.EXTRAS"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 483
    const/16 v2, 0x1a

    invoke-direct {p0, v2, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 484
    .end local v1    # "args":Landroid/os/Bundle;
    monitor-exit v0

    .line 485
    return-void

    .line 484
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public removePlaylistItem(Landroidx/media/MediaItem2;)V
    .locals 3
    .param p1, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 688
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 689
    .local v0, "args":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.MEDIA_ITEM"

    invoke-virtual {p1}, Landroidx/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 690
    const/16 v1, 0x10

    invoke-direct {p0, v1, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 691
    return-void
.end method

.method public replacePlaylistItem(ILandroidx/media/MediaItem2;)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 695
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 696
    .local v0, "args":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.PLAYLIST_INDEX"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 697
    const-string v1, "androidx.media.argument.MEDIA_ITEM"

    invoke-virtual {p2}, Landroidx/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 698
    const/16 v1, 0x11

    invoke-direct {p0, v1, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 699
    return-void
.end method

.method public reset()V
    .locals 4

    .line 338
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 339
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 340
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 341
    monitor-exit v0

    return-void

    .line 343
    :cond_0
    const/4 v1, 0x3

    invoke-direct {p0, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(I)V

    .line 344
    monitor-exit v0

    .line 345
    return-void

    .line 344
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public rewind()V
    .locals 4

    .line 371
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 372
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 373
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 374
    monitor-exit v0

    return-void

    .line 376
    :cond_0
    const/16 v1, 0x8

    invoke-direct {p0, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(I)V

    .line 377
    monitor-exit v0

    .line 378
    return-void

    .line 377
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public seekTo(J)V
    .locals 4
    .param p1, "pos"    # J

    .line 382
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 383
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 384
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 385
    monitor-exit v0

    return-void

    .line 387
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 388
    .local v1, "args":Landroid/os/Bundle;
    const-string v2, "androidx.media.argument.SEEK_POSITION"

    invoke-virtual {v1, v2, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 389
    const/16 v2, 0x9

    invoke-direct {p0, v2, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 390
    .end local v1    # "args":Landroid/os/Bundle;
    monitor-exit v0

    .line 391
    return-void

    .line 390
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public selectRoute(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "route"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 765
    if-eqz p1, :cond_0

    .line 768
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 769
    .local v0, "args":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.ROUTE_BUNDLE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 770
    const/16 v1, 0x26

    invoke-direct {p0, v1, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 771
    return-void

    .line 766
    .end local v0    # "args":Landroid/os/Bundle;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "route shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public sendCustomCommand(Landroidx/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 4
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

    .line 634
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 635
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 636
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 637
    monitor-exit v0

    return-void

    .line 639
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 640
    .local v1, "bundle":Landroid/os/Bundle;
    const-string v2, "androidx.media.argument.CUSTOM_COMMAND"

    invoke-virtual {p1}, Landroidx/media/SessionCommand2;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 641
    const-string v2, "androidx.media.argument.ARGUMENTS"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 642
    const-string v2, "androidx.media.controller.command.BY_CUSTOM_COMMAND"

    invoke-direct {p0, v2, v1, p3}, Landroidx/media/MediaController2ImplBase;->sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    .line 643
    .end local v1    # "bundle":Landroid/os/Bundle;
    monitor-exit v0

    .line 644
    return-void

    .line 643
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setInstance(Landroidx/media/MediaController2;)V
    .locals 0
    .param p1, "controller"    # Landroidx/media/MediaController2;

    .line 243
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase;->mInstance:Landroidx/media/MediaController2;

    .line 244
    return-void
.end method

.method public setPlaybackSpeed(F)V
    .locals 4
    .param p1, "speed"    # F

    .line 576
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 577
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 578
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 579
    monitor-exit v0

    return-void

    .line 581
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 582
    .local v1, "args":Landroid/os/Bundle;
    const-string v2, "androidx.media.argument.PLAYBACK_SPEED"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 583
    const/16 v2, 0x27

    invoke-direct {p0, v2, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 584
    .end local v1    # "args":Landroid/os/Bundle;
    monitor-exit v0

    .line 585
    return-void

    .line 584
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setPlaylist(Ljava/util/List;Landroidx/media/MediaMetadata2;)V
    .locals 3
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

    .line 655
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    if-eqz p1, :cond_1

    .line 658
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 659
    .local v0, "args":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.PLAYLIST"

    invoke-static {p1}, Landroidx/media/MediaUtils2;->toMediaItem2ParcelableArray(Ljava/util/List;)[Landroid/os/Parcelable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 660
    const-string v1, "androidx.media.argument.PLAYLIST_METADATA"

    if-nez p2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroidx/media/MediaMetadata2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    :goto_0
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 661
    const/16 v1, 0x13

    invoke-direct {p0, v1, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 662
    return-void

    .line 656
    .end local v0    # "args":Landroid/os/Bundle;
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "list shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRating(Ljava/lang/String;Landroidx/media/Rating2;)V
    .locals 4
    .param p1, "mediaId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "rating"    # Landroidx/media/Rating2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 619
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 620
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 621
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 622
    monitor-exit v0

    return-void

    .line 624
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 625
    .local v1, "args":Landroid/os/Bundle;
    const-string v2, "androidx.media.argument.MEDIA_ID"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 626
    const-string v2, "androidx.media.argument.RATING"

    invoke-virtual {p2}, Landroidx/media/Rating2;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 627
    const/16 v2, 0x1c

    invoke-direct {p0, v2, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 628
    .end local v1    # "args":Landroid/os/Bundle;
    monitor-exit v0

    .line 629
    return-void

    .line 628
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setRepeatMode(I)V
    .locals 2
    .param p1, "repeatMode"    # I

    .line 734
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 735
    .local v0, "args":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.REPEAT_MODE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 736
    const/16 v1, 0xe

    invoke-direct {p0, v1, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 737
    return-void
.end method

.method public setShuffleMode(I)V
    .locals 2
    .param p1, "shuffleMode"    # I

    .line 748
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 749
    .local v0, "args":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.SHUFFLE_MODE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 750
    const/16 v1, 0xd

    invoke-direct {p0, v1, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 751
    return-void
.end method

.method public setVolumeTo(II)V
    .locals 4
    .param p1, "value"    # I
    .param p2, "flags"    # I

    .line 489
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 490
    :try_start_0
    iget-boolean v1, p0, Landroidx/media/MediaController2ImplBase;->mConnected:Z

    if-nez v1, :cond_0

    .line 491
    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 492
    monitor-exit v0

    return-void

    .line 494
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 495
    .local v1, "args":Landroid/os/Bundle;
    const-string v2, "androidx.media.argument.VOLUME"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 496
    const-string v2, "androidx.media.argument.VOLUME_FLAGS"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 497
    const/16 v2, 0xa

    invoke-direct {p0, v2, v1}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 498
    .end local v1    # "args":Landroid/os/Bundle;
    monitor-exit v0

    .line 499
    return-void

    .line 498
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public skipBackward()V
    .locals 0

    .line 401
    return-void
.end method

.method public skipForward()V
    .locals 0

    .line 396
    return-void
.end method

.method public skipToNextItem()V
    .locals 1

    .line 715
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(I)V

    .line 716
    return-void
.end method

.method public skipToPlaylistItem(Landroidx/media/MediaItem2;)V
    .locals 3
    .param p1, "item"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 720
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 721
    .local v0, "args":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.MEDIA_ITEM"

    invoke-virtual {p1}, Landroidx/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 722
    const/16 v1, 0xc

    invoke-direct {p0, v1, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 723
    return-void
.end method

.method public skipToPreviousItem()V
    .locals 1

    .line 710
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(I)V

    .line 711
    return-void
.end method

.method public subscribeRoutesInfo()V
    .locals 1

    .line 755
    const/16 v0, 0x24

    invoke-direct {p0, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(I)V

    .line 756
    return-void
.end method

.method public unsubscribeRoutesInfo()V
    .locals 1

    .line 760
    const/16 v0, 0x25

    invoke-direct {p0, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(I)V

    .line 761
    return-void
.end method

.method public updatePlaylistMetadata(Landroidx/media/MediaMetadata2;)V
    .locals 3
    .param p1, "metadata"    # Landroidx/media/MediaMetadata2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 666
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 667
    .local v0, "args":Landroid/os/Bundle;
    const-string v1, "androidx.media.argument.PLAYLIST_METADATA"

    if-nez p1, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroidx/media/MediaMetadata2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    :goto_0
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 668
    const/16 v1, 0x15

    invoke-direct {p0, v1, v0}, Landroidx/media/MediaController2ImplBase;->sendCommand(ILandroid/os/Bundle;)V

    .line 669
    return-void
.end method
