.class abstract Landroidx/media/MediaSession2ImplBase$BuilderBase;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaSession2ImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "BuilderBase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroidx/media/MediaSession2;",
        "C:",
        "Landroidx/media/MediaSession2$SessionCallback;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field mCallback:Landroidx/media/MediaSession2$SessionCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TC;"
        }
    .end annotation
.end field

.field mCallbackExecutor:Ljava/util/concurrent/Executor;

.field final mContext:Landroid/content/Context;

.field mId:Ljava/lang/String;

.field mPlayer:Landroidx/media/BaseMediaPlayer;

.field mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;

.field mSessionActivity:Landroid/app/PendingIntent;

.field mVolumeProvider:Landroidx/media/VolumeProviderCompat;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 1452
    .local p0, "this":Landroidx/media/MediaSession2ImplBase$BuilderBase;, "Landroidx/media/MediaSession2ImplBase$BuilderBase<TT;TC;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1453
    if-eqz p1, :cond_0

    .line 1456
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$BuilderBase;->mContext:Landroid/content/Context;

    .line 1458
    const-string v0, "MS2ImplBase"

    iput-object v0, p0, Landroidx/media/MediaSession2ImplBase$BuilderBase;->mId:Ljava/lang/String;

    .line 1459
    return-void

    .line 1454
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "context shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method abstract build()Landroidx/media/MediaSession2;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method setId(Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1484
    .local p0, "this":Landroidx/media/MediaSession2ImplBase$BuilderBase;, "Landroidx/media/MediaSession2ImplBase$BuilderBase<TT;TC;>;"
    if-eqz p1, :cond_0

    .line 1487
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$BuilderBase;->mId:Ljava/lang/String;

    .line 1488
    return-void

    .line 1485
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "id shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setPlayer(Landroidx/media/BaseMediaPlayer;)V
    .locals 2
    .param p1, "player"    # Landroidx/media/BaseMediaPlayer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1462
    .local p0, "this":Landroidx/media/MediaSession2ImplBase$BuilderBase;, "Landroidx/media/MediaSession2ImplBase$BuilderBase<TT;TC;>;"
    if-eqz p1, :cond_0

    .line 1465
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$BuilderBase;->mPlayer:Landroidx/media/BaseMediaPlayer;

    .line 1466
    return-void

    .line 1463
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "player shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setPlaylistAgent(Landroidx/media/MediaPlaylistAgent;)V
    .locals 2
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1469
    .local p0, "this":Landroidx/media/MediaSession2ImplBase$BuilderBase;, "Landroidx/media/MediaSession2ImplBase$BuilderBase<TT;TC;>;"
    if-eqz p1, :cond_0

    .line 1472
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$BuilderBase;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;

    .line 1473
    return-void

    .line 1470
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "playlistAgent shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setSessionActivity(Landroid/app/PendingIntent;)V
    .locals 0
    .param p1, "pi"    # Landroid/app/PendingIntent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1480
    .local p0, "this":Landroidx/media/MediaSession2ImplBase$BuilderBase;, "Landroidx/media/MediaSession2ImplBase$BuilderBase<TT;TC;>;"
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$BuilderBase;->mSessionActivity:Landroid/app/PendingIntent;

    .line 1481
    return-void
.end method

.method setSessionCallback(Ljava/util/concurrent/Executor;Landroidx/media/MediaSession2$SessionCallback;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/media/MediaSession2$SessionCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "TC;)V"
        }
    .end annotation

    .line 1491
    .local p0, "this":Landroidx/media/MediaSession2ImplBase$BuilderBase;, "Landroidx/media/MediaSession2ImplBase$BuilderBase<TT;TC;>;"
    .local p2, "callback":Landroidx/media/MediaSession2$SessionCallback;, "TC;"
    if-eqz p1, :cond_1

    .line 1494
    if-eqz p2, :cond_0

    .line 1497
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$BuilderBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 1498
    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase$BuilderBase;->mCallback:Landroidx/media/MediaSession2$SessionCallback;

    .line 1499
    return-void

    .line 1495
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "callback shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1492
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "executor shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setVolumeProvider(Landroidx/media/VolumeProviderCompat;)V
    .locals 0
    .param p1, "volumeProvider"    # Landroidx/media/VolumeProviderCompat;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1476
    .local p0, "this":Landroidx/media/MediaSession2ImplBase$BuilderBase;, "Landroidx/media/MediaSession2ImplBase$BuilderBase<TT;TC;>;"
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$BuilderBase;->mVolumeProvider:Landroidx/media/VolumeProviderCompat;

    .line 1477
    return-void
.end method
