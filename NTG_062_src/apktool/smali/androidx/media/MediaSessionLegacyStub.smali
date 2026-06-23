.class Landroidx/media/MediaSessionLegacyStub;
.super Landroid/support/v4/media/session/MediaSessionCompat$Callback;
.source "MediaSessionLegacyStub.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;,
        Landroidx/media/MediaSessionLegacyStub$Session2Runnable;
    }
.end annotation


# static fields
.field private static final DEBUG:Z

.field private static final TAG:Ljava/lang/String; = "MS2StubImplBase"

.field private static final sCommandsForOnCommandRequest:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroidx/media/SessionCommand2;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mAllowedCommandGroupMap:Landroidx/collection/ArrayMap;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/ArrayMap<",
            "Landroidx/media/MediaSession2$ControllerInfo;",
            "Landroidx/media/SessionCommandGroup2;",
            ">;"
        }
    .end annotation
.end field

.field private final mConnectingControllers:Ljava/util/Set;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/os/IBinder;",
            ">;"
        }
    .end annotation
.end field

.field final mContext:Landroid/content/Context;

.field private final mControllers:Landroidx/collection/ArrayMap;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/ArrayMap<",
            "Landroid/os/IBinder;",
            "Landroidx/media/MediaSession2$ControllerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field final mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 98
    const-string v0, "MS2StubImplBase"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Landroidx/media/MediaSessionLegacyStub;->DEBUG:Z

    .line 100
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Landroidx/media/MediaSessionLegacyStub;->sCommandsForOnCommandRequest:Landroid/util/SparseArray;

    .line 104
    new-instance v0, Landroidx/media/SessionCommandGroup2;

    invoke-direct {v0}, Landroidx/media/SessionCommandGroup2;-><init>()V

    .line 105
    .local v0, "group":Landroidx/media/SessionCommandGroup2;
    invoke-virtual {v0}, Landroidx/media/SessionCommandGroup2;->addAllPlaybackCommands()V

    .line 106
    invoke-virtual {v0}, Landroidx/media/SessionCommandGroup2;->addAllPlaylistCommands()V

    .line 107
    invoke-virtual {v0}, Landroidx/media/SessionCommandGroup2;->addAllVolumeCommands()V

    .line 108
    invoke-virtual {v0}, Landroidx/media/SessionCommandGroup2;->getCommands()Ljava/util/Set;

    move-result-object v1

    .line 109
    .local v1, "commands":Ljava/util/Set;, "Ljava/util/Set<Landroidx/media/SessionCommand2;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/media/SessionCommand2;

    .line 110
    .local v3, "command":Landroidx/media/SessionCommand2;
    sget-object v4, Landroidx/media/MediaSessionLegacyStub;->sCommandsForOnCommandRequest:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroidx/media/SessionCommand2;->getCommandCode()I

    move-result v5

    invoke-virtual {v4, v5, v3}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 111
    .end local v3    # "command":Landroidx/media/SessionCommand2;
    goto :goto_0

    .line 112
    .end local v0    # "group":Landroidx/media/SessionCommandGroup2;
    .end local v1    # "commands":Ljava/util/Set;, "Ljava/util/Set<Landroidx/media/SessionCommand2;>;"
    :cond_0
    return-void
.end method

.method constructor <init>(Landroidx/media/MediaSession2$SupportLibraryImpl;)V
    .locals 1
    .param p1, "session"    # Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 127
    invoke-direct {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;-><init>()V

    .line 114
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    .line 119
    new-instance v0, Landroidx/collection/ArrayMap;

    invoke-direct {v0}, Landroidx/collection/ArrayMap;-><init>()V

    iput-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mControllers:Landroidx/collection/ArrayMap;

    .line 121
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mConnectingControllers:Ljava/util/Set;

    .line 123
    new-instance v0, Landroidx/collection/ArrayMap;

    invoke-direct {v0}, Landroidx/collection/ArrayMap;-><init>()V

    iput-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mAllowedCommandGroupMap:Landroidx/collection/ArrayMap;

    .line 128
    iput-object p1, p0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 129
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mContext:Landroid/content/Context;

    .line 130
    return-void
.end method

.method static synthetic access$000(Landroidx/media/MediaSessionLegacyStub;Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;)Z
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaSessionLegacyStub;
    .param p1, "x1"    # Landroidx/media/MediaSession2$ControllerInfo;
    .param p2, "x2"    # Landroidx/media/SessionCommand2;

    .line 95
    invoke-direct {p0, p1, p2}, Landroidx/media/MediaSessionLegacyStub;->isAllowedCommand(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100()Landroid/util/SparseArray;
    .locals 1

    .line 95
    sget-object v0, Landroidx/media/MediaSessionLegacyStub;->sCommandsForOnCommandRequest:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$200(Landroidx/media/MediaSessionLegacyStub;Landroidx/media/MediaSession2$ControllerInfo;I)Z
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaSessionLegacyStub;
    .param p1, "x1"    # Landroidx/media/MediaSession2$ControllerInfo;
    .param p2, "x2"    # I

    .line 95
    invoke-direct {p0, p1, p2}, Landroidx/media/MediaSessionLegacyStub;->isAllowedCommand(Landroidx/media/MediaSession2$ControllerInfo;I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300()Z
    .locals 1

    .line 95
    sget-boolean v0, Landroidx/media/MediaSessionLegacyStub;->DEBUG:Z

    return v0
.end method

.method static synthetic access$400(Landroidx/media/MediaSessionLegacyStub;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaSessionLegacyStub;

    .line 95
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$500(Landroidx/media/MediaSessionLegacyStub;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaSessionLegacyStub;

    .line 95
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mConnectingControllers:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$600(Landroidx/media/MediaSessionLegacyStub;)Landroidx/collection/ArrayMap;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaSessionLegacyStub;

    .line 95
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mControllers:Landroidx/collection/ArrayMap;

    return-object v0
.end method

.method static synthetic access$700(Landroidx/media/MediaSessionLegacyStub;)Landroidx/collection/ArrayMap;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaSessionLegacyStub;

    .line 95
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mAllowedCommandGroupMap:Landroidx/collection/ArrayMap;

    return-object v0
.end method

.method private connect(Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 3
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "cb"    # Landroid/os/ResultReceiver;

    .line 309
    invoke-direct {p0, p1}, Landroidx/media/MediaSessionLegacyStub;->createControllerInfo(Landroid/os/Bundle;)Landroidx/media/MediaSession2$ControllerInfo;

    move-result-object v0

    .line 310
    .local v0, "controllerInfo":Landroidx/media/MediaSession2$ControllerInfo;
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaSessionLegacyStub$7;

    invoke-direct {v2, p0, v0, p2}, Landroidx/media/MediaSessionLegacyStub$7;-><init>(Landroidx/media/MediaSessionLegacyStub;Landroidx/media/MediaSession2$ControllerInfo;Landroid/os/ResultReceiver;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 395
    return-void
.end method

.method private createControllerInfo(Landroid/os/Bundle;)Landroidx/media/MediaSession2$ControllerInfo;
    .locals 6
    .param p1, "extras"    # Landroid/os/Bundle;

    .line 300
    const-string v0, "androidx.media.argument.ICONTROLLER_CALLBACK"

    .line 301
    invoke-static {p1, v0}, Landroidx/core/app/BundleCompat;->getBinder(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 300
    invoke-static {v0}, Landroid/support/v4/media/session/IMediaControllerCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/support/v4/media/session/IMediaControllerCallback;

    move-result-object v0

    .line 302
    .local v0, "callback":Landroid/support/v4/media/session/IMediaControllerCallback;
    const-string v1, "androidx.media.argument.PACKAGE_NAME"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 303
    .local v1, "packageName":Ljava/lang/String;
    const-string v2, "androidx.media.argument.UID"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 304
    .local v2, "uid":I
    const-string v3, "androidx.media.argument.PID"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 305
    .local v3, "pid":I
    new-instance v4, Landroidx/media/MediaSession2$ControllerInfo;

    new-instance v5, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;

    invoke-direct {v5, p0, v0}, Landroidx/media/MediaSessionLegacyStub$ControllerLegacyCb;-><init>(Landroidx/media/MediaSessionLegacyStub;Landroid/support/v4/media/session/IMediaControllerCallback;)V

    invoke-direct {v4, v1, v3, v2, v5}, Landroidx/media/MediaSession2$ControllerInfo;-><init>(Ljava/lang/String;IILandroidx/media/MediaSession2$ControllerCb;)V

    return-object v4
.end method

.method private disconnect(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "extras"    # Landroid/os/Bundle;

    .line 398
    invoke-direct {p0, p1}, Landroidx/media/MediaSessionLegacyStub;->createControllerInfo(Landroid/os/Bundle;)Landroidx/media/MediaSession2$ControllerInfo;

    move-result-object v0

    .line 399
    .local v0, "controllerInfo":Landroidx/media/MediaSession2$ControllerInfo;
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaSessionLegacyStub$8;

    invoke-direct {v2, p0, v0}, Landroidx/media/MediaSessionLegacyStub$8;-><init>(Landroidx/media/MediaSessionLegacyStub;Landroidx/media/MediaSession2$ControllerInfo;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 408
    return-void
.end method

.method private isAllowedCommand(Landroidx/media/MediaSession2$ControllerInfo;I)Z
    .locals 3
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
    .param p2, "commandCode"    # I

    .line 223
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 224
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaSessionLegacyStub;->mAllowedCommandGroupMap:Landroidx/collection/ArrayMap;

    invoke-virtual {v2, p1}, Landroidx/collection/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media/SessionCommandGroup2;

    move-object v1, v2

    .line 225
    .local v1, "allowedCommands":Landroidx/media/SessionCommandGroup2;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 226
    if-eqz v1, :cond_0

    invoke-virtual {v1, p2}, Landroidx/media/SessionCommandGroup2;->hasCommand(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 225
    .end local v1    # "allowedCommands":Landroidx/media/SessionCommandGroup2;
    :catchall_0
    move-exception v2

    .restart local v1    # "allowedCommands":Landroidx/media/SessionCommandGroup2;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method private isAllowedCommand(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;)Z
    .locals 3
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
    .param p2, "command"    # Landroidx/media/SessionCommand2;

    .line 215
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 216
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaSessionLegacyStub;->mAllowedCommandGroupMap:Landroidx/collection/ArrayMap;

    invoke-virtual {v2, p1}, Landroidx/collection/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media/SessionCommandGroup2;

    move-object v1, v2

    .line 217
    .local v1, "allowedCommands":Landroidx/media/SessionCommandGroup2;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 218
    if-eqz v1, :cond_0

    invoke-virtual {v1, p2}, Landroidx/media/SessionCommandGroup2;->hasCommand(Landroidx/media/SessionCommand2;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 217
    .end local v1    # "allowedCommands":Landroidx/media/SessionCommandGroup2;
    :catchall_0
    move-exception v2

    .restart local v1    # "allowedCommands":Landroidx/media/SessionCommandGroup2;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method private onCommand2(Landroid/os/IBinder;ILandroidx/media/MediaSessionLegacyStub$Session2Runnable;)V
    .locals 1
    .param p1, "caller"    # Landroid/os/IBinder;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "commandCode"    # I
    .param p3, "runnable"    # Landroidx/media/MediaSessionLegacyStub$Session2Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 231
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Landroidx/media/MediaSessionLegacyStub;->onCommand2Internal(Landroid/os/IBinder;Landroidx/media/SessionCommand2;ILandroidx/media/MediaSessionLegacyStub$Session2Runnable;)V

    .line 232
    return-void
.end method

.method private onCommand2(Landroid/os/IBinder;Landroidx/media/SessionCommand2;Landroidx/media/MediaSessionLegacyStub$Session2Runnable;)V
    .locals 1
    .param p1, "caller"    # Landroid/os/IBinder;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "sessionCommand"    # Landroidx/media/SessionCommand2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "runnable"    # Landroidx/media/MediaSessionLegacyStub$Session2Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 236
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Landroidx/media/MediaSessionLegacyStub;->onCommand2Internal(Landroid/os/IBinder;Landroidx/media/SessionCommand2;ILandroidx/media/MediaSessionLegacyStub$Session2Runnable;)V

    .line 237
    return-void
.end method

.method private onCommand2Internal(Landroid/os/IBinder;Landroidx/media/SessionCommand2;ILandroidx/media/MediaSessionLegacyStub$Session2Runnable;)V
    .locals 9
    .param p1, "caller"    # Landroid/os/IBinder;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "sessionCommand"    # Landroidx/media/SessionCommand2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "commandCode"    # I
    .param p4, "runnable"    # Landroidx/media/MediaSessionLegacyStub$Session2Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 243
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 244
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaSessionLegacyStub;->mControllers:Landroidx/collection/ArrayMap;

    invoke-virtual {v2, p1}, Landroidx/collection/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media/MediaSession2$ControllerInfo;

    move-object v1, v2

    .line 245
    .local v1, "controller":Landroidx/media/MediaSession2$ControllerInfo;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 246
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    if-eqz v0, :cond_1

    if-nez v1, :cond_0

    goto :goto_0

    .line 249
    :cond_0
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v2, Landroidx/media/MediaSessionLegacyStub$6;

    move-object v3, v2

    move-object v4, p0

    move-object v5, p2

    move-object v6, v1

    move v7, p3

    move-object v8, p4

    invoke-direct/range {v3 .. v8}, Landroidx/media/MediaSessionLegacyStub$6;-><init>(Landroidx/media/MediaSessionLegacyStub;Landroidx/media/SessionCommand2;Landroidx/media/MediaSession2$ControllerInfo;ILandroidx/media/MediaSessionLegacyStub$Session2Runnable;)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 288
    return-void

    .line 247
    :cond_1
    :goto_0
    return-void

    .line 245
    .end local v1    # "controller":Landroidx/media/MediaSession2$ControllerInfo;
    :catchall_0
    move-exception v2

    .restart local v1    # "controller":Landroidx/media/MediaSession2$ControllerInfo;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method


# virtual methods
.method getConnectedControllers()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/media/MediaSession2$ControllerInfo;",
            ">;"
        }
    .end annotation

    .line 198
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 199
    .local v0, "controllers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/media/MediaSession2$ControllerInfo;>;"
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 200
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    :try_start_0
    iget-object v3, p0, Landroidx/media/MediaSessionLegacyStub;->mControllers:Landroidx/collection/ArrayMap;

    invoke-virtual {v3}, Landroidx/collection/ArrayMap;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 201
    iget-object v3, p0, Landroidx/media/MediaSessionLegacyStub;->mControllers:Landroidx/collection/ArrayMap;

    invoke-virtual {v3, v2}, Landroidx/collection/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 203
    .end local v2    # "i":I
    :cond_0
    monitor-exit v1

    .line 204
    return-object v0

    .line 203
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public onPause()V
    .locals 2

    .line 160
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroidx/media/MediaSessionLegacyStub$3;

    invoke-direct {v1, p0}, Landroidx/media/MediaSessionLegacyStub$3;-><init>(Landroidx/media/MediaSessionLegacyStub;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 169
    return-void
.end method

.method public onPlay()V
    .locals 2

    .line 147
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroidx/media/MediaSessionLegacyStub$2;

    invoke-direct {v1, p0}, Landroidx/media/MediaSessionLegacyStub$2;-><init>(Landroidx/media/MediaSessionLegacyStub;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 156
    return-void
.end method

.method public onPrepare()V
    .locals 2

    .line 134
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroidx/media/MediaSessionLegacyStub$1;

    invoke-direct {v1, p0}, Landroidx/media/MediaSessionLegacyStub$1;-><init>(Landroidx/media/MediaSessionLegacyStub;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 143
    return-void
.end method

.method public onSeekTo(J)V
    .locals 2
    .param p1, "pos"    # J

    .line 186
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroidx/media/MediaSessionLegacyStub$5;

    invoke-direct {v1, p0, p1, p2}, Landroidx/media/MediaSessionLegacyStub$5;-><init>(Landroidx/media/MediaSessionLegacyStub;J)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 195
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 173
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroidx/media/MediaSessionLegacyStub$4;

    invoke-direct {v1, p0}, Landroidx/media/MediaSessionLegacyStub$4;-><init>(Landroidx/media/MediaSessionLegacyStub;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 182
    return-void
.end method

.method removeControllerInfo(Landroidx/media/MediaSession2$ControllerInfo;)V
    .locals 4
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;

    .line 291
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 292
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub;->mControllers:Landroidx/collection/ArrayMap;

    invoke-virtual {p1}, Landroidx/media/MediaSession2$ControllerInfo;->getId()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/collection/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media/MediaSession2$ControllerInfo;

    move-object p1, v1

    .line 293
    sget-boolean v1, Landroidx/media/MediaSessionLegacyStub;->DEBUG:Z

    if-eqz v1, :cond_0

    .line 294
    const-string v1, "MS2StubImplBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "releasing "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    :cond_0
    monitor-exit v0

    .line 297
    return-void

    .line 296
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method setAllowedCommands(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommandGroup2;)V
    .locals 2
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
    .param p2, "commands"    # Landroidx/media/SessionCommandGroup2;

    .line 208
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 209
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub;->mAllowedCommandGroupMap:Landroidx/collection/ArrayMap;

    invoke-virtual {v1, p1, p2}, Landroidx/collection/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    monitor-exit v0

    .line 211
    return-void

    .line 210
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
