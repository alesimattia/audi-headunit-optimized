.class Landroidx/media/MediaSession2Stub;
.super Landroid/support/v4/media/session/MediaSessionCompat$Callback;
.source "MediaSession2Stub.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/MediaSession2Stub$Controller2Cb;,
        Landroidx/media/MediaSession2Stub$Session2Runnable;
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

    .line 141
    const-string v0, "MS2StubImplBase"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Landroidx/media/MediaSession2Stub;->DEBUG:Z

    .line 143
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Landroidx/media/MediaSession2Stub;->sCommandsForOnCommandRequest:Landroid/util/SparseArray;

    .line 147
    new-instance v0, Landroidx/media/SessionCommandGroup2;

    invoke-direct {v0}, Landroidx/media/SessionCommandGroup2;-><init>()V

    .line 148
    .local v0, "group":Landroidx/media/SessionCommandGroup2;
    invoke-virtual {v0}, Landroidx/media/SessionCommandGroup2;->addAllPlaybackCommands()V

    .line 149
    invoke-virtual {v0}, Landroidx/media/SessionCommandGroup2;->addAllPlaylistCommands()V

    .line 150
    invoke-virtual {v0}, Landroidx/media/SessionCommandGroup2;->addAllVolumeCommands()V

    .line 151
    invoke-virtual {v0}, Landroidx/media/SessionCommandGroup2;->getCommands()Ljava/util/Set;

    move-result-object v1

    .line 152
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

    .line 153
    .local v3, "command":Landroidx/media/SessionCommand2;
    sget-object v4, Landroidx/media/MediaSession2Stub;->sCommandsForOnCommandRequest:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroidx/media/SessionCommand2;->getCommandCode()I

    move-result v5

    invoke-virtual {v4, v5, v3}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 154
    .end local v3    # "command":Landroidx/media/SessionCommand2;
    goto :goto_0

    .line 155
    .end local v0    # "group":Landroidx/media/SessionCommandGroup2;
    .end local v1    # "commands":Ljava/util/Set;, "Ljava/util/Set<Landroidx/media/SessionCommand2;>;"
    :cond_0
    return-void
.end method

.method constructor <init>(Landroidx/media/MediaSession2$SupportLibraryImpl;)V
    .locals 1
    .param p1, "session"    # Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 170
    invoke-direct {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;-><init>()V

    .line 157
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/media/MediaSession2Stub;->mLock:Ljava/lang/Object;

    .line 162
    new-instance v0, Landroidx/collection/ArrayMap;

    invoke-direct {v0}, Landroidx/collection/ArrayMap;-><init>()V

    iput-object v0, p0, Landroidx/media/MediaSession2Stub;->mControllers:Landroidx/collection/ArrayMap;

    .line 164
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/media/MediaSession2Stub;->mConnectingControllers:Ljava/util/Set;

    .line 166
    new-instance v0, Landroidx/collection/ArrayMap;

    invoke-direct {v0}, Landroidx/collection/ArrayMap;-><init>()V

    iput-object v0, p0, Landroidx/media/MediaSession2Stub;->mAllowedCommandGroupMap:Landroidx/collection/ArrayMap;

    .line 171
    iput-object p1, p0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 172
    iget-object v0, p0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Landroidx/media/MediaSession2Stub;->mContext:Landroid/content/Context;

    .line 173
    return-void
.end method

.method static synthetic access$000(Landroidx/media/MediaSession2Stub;Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;)Z
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaSession2Stub;
    .param p1, "x1"    # Landroidx/media/MediaSession2$ControllerInfo;
    .param p2, "x2"    # Landroidx/media/SessionCommand2;

    .line 138
    invoke-direct {p0, p1, p2}, Landroidx/media/MediaSession2Stub;->isAllowedCommand(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100()Landroid/util/SparseArray;
    .locals 1

    .line 138
    sget-object v0, Landroidx/media/MediaSession2Stub;->sCommandsForOnCommandRequest:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$200(Landroidx/media/MediaSession2Stub;Landroidx/media/MediaSession2$ControllerInfo;I)Z
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaSession2Stub;
    .param p1, "x1"    # Landroidx/media/MediaSession2$ControllerInfo;
    .param p2, "x2"    # I

    .line 138
    invoke-direct {p0, p1, p2}, Landroidx/media/MediaSession2Stub;->isAllowedCommand(Landroidx/media/MediaSession2$ControllerInfo;I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300()Z
    .locals 1

    .line 138
    sget-boolean v0, Landroidx/media/MediaSession2Stub;->DEBUG:Z

    return v0
.end method

.method static synthetic access$400(Landroidx/media/MediaSession2Stub;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaSession2Stub;

    .line 138
    iget-object v0, p0, Landroidx/media/MediaSession2Stub;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$500(Landroidx/media/MediaSession2Stub;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaSession2Stub;

    .line 138
    iget-object v0, p0, Landroidx/media/MediaSession2Stub;->mConnectingControllers:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$600(Landroidx/media/MediaSession2Stub;)Landroidx/collection/ArrayMap;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaSession2Stub;

    .line 138
    iget-object v0, p0, Landroidx/media/MediaSession2Stub;->mControllers:Landroidx/collection/ArrayMap;

    return-object v0
.end method

.method static synthetic access$700(Landroidx/media/MediaSession2Stub;)Landroidx/collection/ArrayMap;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaSession2Stub;

    .line 138
    iget-object v0, p0, Landroidx/media/MediaSession2Stub;->mAllowedCommandGroupMap:Landroidx/collection/ArrayMap;

    return-object v0
.end method

.method private connect(Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 3
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "cb"    # Landroid/os/ResultReceiver;

    .line 523
    invoke-direct {p0, p1}, Landroidx/media/MediaSession2Stub;->createControllerInfo(Landroid/os/Bundle;)Landroidx/media/MediaSession2$ControllerInfo;

    move-result-object v0

    .line 524
    .local v0, "controllerInfo":Landroidx/media/MediaSession2$ControllerInfo;
    iget-object v1, p0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaSession2Stub$4;

    invoke-direct {v2, p0, v0, p2}, Landroidx/media/MediaSession2Stub$4;-><init>(Landroidx/media/MediaSession2Stub;Landroidx/media/MediaSession2$ControllerInfo;Landroid/os/ResultReceiver;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 609
    return-void
.end method

.method private createControllerInfo(Landroid/os/Bundle;)Landroidx/media/MediaSession2$ControllerInfo;
    .locals 6
    .param p1, "extras"    # Landroid/os/Bundle;

    .line 514
    const-string v0, "androidx.media.argument.ICONTROLLER_CALLBACK"

    .line 515
    invoke-static {p1, v0}, Landroidx/core/app/BundleCompat;->getBinder(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 514
    invoke-static {v0}, Landroid/support/v4/media/session/IMediaControllerCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/support/v4/media/session/IMediaControllerCallback;

    move-result-object v0

    .line 516
    .local v0, "callback":Landroid/support/v4/media/session/IMediaControllerCallback;
    const-string v1, "androidx.media.argument.PACKAGE_NAME"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 517
    .local v1, "packageName":Ljava/lang/String;
    const-string v2, "androidx.media.argument.UID"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 518
    .local v2, "uid":I
    const-string v3, "androidx.media.argument.PID"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 519
    .local v3, "pid":I
    new-instance v4, Landroidx/media/MediaSession2$ControllerInfo;

    new-instance v5, Landroidx/media/MediaSession2Stub$Controller2Cb;

    invoke-direct {v5, p0, v0}, Landroidx/media/MediaSession2Stub$Controller2Cb;-><init>(Landroidx/media/MediaSession2Stub;Landroid/support/v4/media/session/IMediaControllerCallback;)V

    invoke-direct {v4, v1, v3, v2, v5}, Landroidx/media/MediaSession2$ControllerInfo;-><init>(Ljava/lang/String;IILandroidx/media/MediaSession2$ControllerCb;)V

    return-object v4
.end method

.method private disconnect(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "extras"    # Landroid/os/Bundle;

    .line 612
    invoke-direct {p0, p1}, Landroidx/media/MediaSession2Stub;->createControllerInfo(Landroid/os/Bundle;)Landroidx/media/MediaSession2$ControllerInfo;

    move-result-object v0

    .line 613
    .local v0, "controllerInfo":Landroidx/media/MediaSession2$ControllerInfo;
    iget-object v1, p0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaSession2Stub$5;

    invoke-direct {v2, p0, v0}, Landroidx/media/MediaSession2Stub$5;-><init>(Landroidx/media/MediaSession2Stub;Landroidx/media/MediaSession2$ControllerInfo;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 622
    return-void
.end method

.method private isAllowedCommand(Landroidx/media/MediaSession2$ControllerInfo;I)Z
    .locals 3
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
    .param p2, "commandCode"    # I

    .line 437
    iget-object v0, p0, Landroidx/media/MediaSession2Stub;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 438
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaSession2Stub;->mAllowedCommandGroupMap:Landroidx/collection/ArrayMap;

    invoke-virtual {v2, p1}, Landroidx/collection/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media/SessionCommandGroup2;

    move-object v1, v2

    .line 439
    .local v1, "allowedCommands":Landroidx/media/SessionCommandGroup2;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 440
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

    .line 439
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

    .line 429
    iget-object v0, p0, Landroidx/media/MediaSession2Stub;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 430
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaSession2Stub;->mAllowedCommandGroupMap:Landroidx/collection/ArrayMap;

    invoke-virtual {v2, p1}, Landroidx/collection/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media/SessionCommandGroup2;

    move-object v1, v2

    .line 431
    .local v1, "allowedCommands":Landroidx/media/SessionCommandGroup2;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 432
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

    .line 431
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

.method private onCommand2(Landroid/os/IBinder;ILandroidx/media/MediaSession2Stub$Session2Runnable;)V
    .locals 1
    .param p1, "caller"    # Landroid/os/IBinder;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "commandCode"    # I
    .param p3, "runnable"    # Landroidx/media/MediaSession2Stub$Session2Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 445
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Landroidx/media/MediaSession2Stub;->onCommand2Internal(Landroid/os/IBinder;Landroidx/media/SessionCommand2;ILandroidx/media/MediaSession2Stub$Session2Runnable;)V

    .line 446
    return-void
.end method

.method private onCommand2(Landroid/os/IBinder;Landroidx/media/SessionCommand2;Landroidx/media/MediaSession2Stub$Session2Runnable;)V
    .locals 1
    .param p1, "caller"    # Landroid/os/IBinder;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "sessionCommand"    # Landroidx/media/SessionCommand2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "runnable"    # Landroidx/media/MediaSession2Stub$Session2Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 450
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Landroidx/media/MediaSession2Stub;->onCommand2Internal(Landroid/os/IBinder;Landroidx/media/SessionCommand2;ILandroidx/media/MediaSession2Stub$Session2Runnable;)V

    .line 451
    return-void
.end method

.method private onCommand2Internal(Landroid/os/IBinder;Landroidx/media/SessionCommand2;ILandroidx/media/MediaSession2Stub$Session2Runnable;)V
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
    .param p4, "runnable"    # Landroidx/media/MediaSession2Stub$Session2Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 457
    iget-object v0, p0, Landroidx/media/MediaSession2Stub;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 458
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaSession2Stub;->mControllers:Landroidx/collection/ArrayMap;

    invoke-virtual {v2, p1}, Landroidx/collection/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media/MediaSession2$ControllerInfo;

    move-object v1, v2

    .line 459
    .local v1, "controller":Landroidx/media/MediaSession2$ControllerInfo;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 460
    iget-object v0, p0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    if-eqz v0, :cond_1

    if-nez v1, :cond_0

    goto :goto_0

    .line 463
    :cond_0
    iget-object v0, p0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v2, Landroidx/media/MediaSession2Stub$3;

    move-object v3, v2

    move-object v4, p0

    move-object v5, p2

    move-object v6, v1

    move v7, p3

    move-object v8, p4

    invoke-direct/range {v3 .. v8}, Landroidx/media/MediaSession2Stub$3;-><init>(Landroidx/media/MediaSession2Stub;Landroidx/media/SessionCommand2;Landroidx/media/MediaSession2$ControllerInfo;ILandroidx/media/MediaSession2Stub$Session2Runnable;)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 502
    return-void

    .line 461
    :cond_1
    :goto_0
    return-void

    .line 459
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

    .line 412
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 413
    .local v0, "controllers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/media/MediaSession2$ControllerInfo;>;"
    iget-object v1, p0, Landroidx/media/MediaSession2Stub;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 414
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    :try_start_0
    iget-object v3, p0, Landroidx/media/MediaSession2Stub;->mControllers:Landroidx/collection/ArrayMap;

    invoke-virtual {v3}, Landroidx/collection/ArrayMap;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 415
    iget-object v3, p0, Landroidx/media/MediaSession2Stub;->mControllers:Landroidx/collection/ArrayMap;

    invoke-virtual {v3, v2}, Landroidx/collection/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 414
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 417
    .end local v2    # "i":I
    :cond_0
    monitor-exit v1

    .line 418
    return-object v0

    .line 417
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public onCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 5
    .param p1, "command"    # Ljava/lang/String;
    .param p2, "extras"    # Landroid/os/Bundle;
    .param p3, "cb"    # Landroid/os/ResultReceiver;

    .line 177
    if-eqz p2, :cond_0

    .line 178
    const-class v0, Landroidx/media/MediaSession2;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 180
    :cond_0
    const/4 v0, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    const v2, -0x5850615e

    if-eq v1, v2, :cond_4

    const v2, -0x22f8a77c

    if-eq v1, v2, :cond_3

    const v2, -0xbbc2f81

    if-eq v1, v2, :cond_2

    const v2, 0x1ffd1723

    if-eq v1, v2, :cond_1

    goto :goto_0

    :cond_1
    const-string v1, "androidx.media.controller.command.BY_COMMAND_CODE"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const/4 v0, 0x2

    goto :goto_0

    :cond_2
    const-string v1, "androidx.media.controller.command.BY_CUSTOM_COMMAND"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const/4 v0, 0x3

    goto :goto_0

    :cond_3
    const-string v1, "androidx.media.controller.command.CONNECT"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const/4 v0, 0x0

    goto :goto_0

    :cond_4
    const-string v1, "androidx.media.controller.command.DISCONNECT"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const/4 v0, 0x1

    :cond_5
    :goto_0
    packed-switch v0, :pswitch_data_0

    goto :goto_2

    .line 390
    :pswitch_0
    const-string v0, "androidx.media.argument.CUSTOM_COMMAND"

    .line 391
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Landroidx/media/SessionCommand2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/SessionCommand2;

    move-result-object v0

    .line 392
    .local v0, "customCommand":Landroidx/media/SessionCommand2;
    const-string v1, "androidx.media.argument.ICONTROLLER_CALLBACK"

    .line 393
    invoke-static {p2, v1}, Landroidx/core/app/BundleCompat;->getBinder(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    .line 392
    invoke-static {v1}, Landroid/support/v4/media/session/IMediaControllerCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/support/v4/media/session/IMediaControllerCallback;

    move-result-object v1

    .line 394
    .local v1, "caller":Landroid/support/v4/media/session/IMediaControllerCallback;
    if-eqz v1, :cond_7

    if-nez v0, :cond_6

    goto :goto_1

    .line 398
    :cond_6
    const-string v2, "androidx.media.argument.ARGUMENTS"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    .line 399
    .local v2, "args":Landroid/os/Bundle;
    invoke-interface {v1}, Landroid/support/v4/media/session/IMediaControllerCallback;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    new-instance v4, Landroidx/media/MediaSession2Stub$2;

    invoke-direct {v4, p0, v0, v2, p3}, Landroidx/media/MediaSession2Stub$2;-><init>(Landroidx/media/MediaSession2Stub;Landroidx/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    invoke-direct {p0, v3, v0, v4}, Landroidx/media/MediaSession2Stub;->onCommand2(Landroid/os/IBinder;Landroidx/media/SessionCommand2;Landroidx/media/MediaSession2Stub$Session2Runnable;)V

    .line 406
    goto :goto_2

    .line 395
    .end local v2    # "args":Landroid/os/Bundle;
    :cond_7
    :goto_1
    return-void

    .line 188
    .end local v0    # "customCommand":Landroidx/media/SessionCommand2;
    .end local v1    # "caller":Landroid/support/v4/media/session/IMediaControllerCallback;
    :pswitch_1
    const-string v0, "androidx.media.argument.COMMAND_CODE"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 189
    .local v0, "commandCode":I
    const-string v1, "androidx.media.argument.ICONTROLLER_CALLBACK"

    .line 190
    invoke-static {p2, v1}, Landroidx/core/app/BundleCompat;->getBinder(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    .line 189
    invoke-static {v1}, Landroid/support/v4/media/session/IMediaControllerCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/support/v4/media/session/IMediaControllerCallback;

    move-result-object v1

    .line 191
    .restart local v1    # "caller":Landroid/support/v4/media/session/IMediaControllerCallback;
    if-nez v1, :cond_8

    .line 192
    return-void

    .line 195
    :cond_8
    invoke-interface {v1}, Landroid/support/v4/media/session/IMediaControllerCallback;->asBinder()Landroid/os/IBinder;

    move-result-object v2

    new-instance v3, Landroidx/media/MediaSession2Stub$1;

    invoke-direct {v3, p0, v0, p2}, Landroidx/media/MediaSession2Stub$1;-><init>(Landroidx/media/MediaSession2Stub;ILandroid/os/Bundle;)V

    invoke-direct {p0, v2, v0, v3}, Landroidx/media/MediaSession2Stub;->onCommand2(Landroid/os/IBinder;ILandroidx/media/MediaSession2Stub$Session2Runnable;)V

    .line 387
    goto :goto_2

    .line 185
    .end local v0    # "commandCode":I
    .end local v1    # "caller":Landroid/support/v4/media/session/IMediaControllerCallback;
    :pswitch_2
    invoke-direct {p0, p2}, Landroidx/media/MediaSession2Stub;->disconnect(Landroid/os/Bundle;)V

    .line 186
    goto :goto_2

    .line 182
    :pswitch_3
    invoke-direct {p0, p2, p3}, Landroidx/media/MediaSession2Stub;->connect(Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    .line 183
    nop

    .line 409
    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method removeControllerInfo(Landroidx/media/MediaSession2$ControllerInfo;)V
    .locals 4
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;

    .line 505
    iget-object v0, p0, Landroidx/media/MediaSession2Stub;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 506
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2Stub;->mControllers:Landroidx/collection/ArrayMap;

    invoke-virtual {p1}, Landroidx/media/MediaSession2$ControllerInfo;->getId()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/collection/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media/MediaSession2$ControllerInfo;

    move-object p1, v1

    .line 507
    sget-boolean v1, Landroidx/media/MediaSession2Stub;->DEBUG:Z

    if-eqz v1, :cond_0

    .line 508
    const-string v1, "MS2StubImplBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "releasing "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    :cond_0
    monitor-exit v0

    .line 511
    return-void

    .line 510
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

    .line 422
    iget-object v0, p0, Landroidx/media/MediaSession2Stub;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 423
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2Stub;->mAllowedCommandGroupMap:Landroidx/collection/ArrayMap;

    invoke-virtual {v1, p1, p2}, Landroidx/collection/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    monitor-exit v0

    .line 425
    return-void

    .line 424
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
