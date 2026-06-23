.class abstract Landroidx/media/MediaSession2$BuilderBase;
.super Ljava/lang/Object;
.source "MediaSession2.java"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaSession2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "BuilderBase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroidx/media/MediaSession2;",
        "U:",
        "Landroidx/media/MediaSession2$BuilderBase<",
        "TT;TU;TC;>;C:",
        "Landroidx/media/MediaSession2$SessionCallback;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field mBaseImpl:Landroidx/media/MediaSession2ImplBase$BuilderBase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/media/MediaSession2ImplBase$BuilderBase<",
            "TT;TC;>;"
        }
    .end annotation
.end field

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

    .line 1640
    .local p0, "this":Landroidx/media/MediaSession2$BuilderBase;, "Landroidx/media/MediaSession2$BuilderBase<TT;TU;TC;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1641
    if-eqz p1, :cond_0

    .line 1644
    iput-object p1, p0, Landroidx/media/MediaSession2$BuilderBase;->mContext:Landroid/content/Context;

    .line 1645
    return-void

    .line 1642
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "context shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method build()Landroidx/media/MediaSession2;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1749
    .local p0, "this":Landroidx/media/MediaSession2$BuilderBase;, "Landroidx/media/MediaSession2$BuilderBase<TT;TU;TC;>;"
    iget-object v0, p0, Landroidx/media/MediaSession2$BuilderBase;->mBaseImpl:Landroidx/media/MediaSession2ImplBase$BuilderBase;

    invoke-virtual {v0}, Landroidx/media/MediaSession2ImplBase$BuilderBase;->build()Landroidx/media/MediaSession2;

    move-result-object v0

    return-object v0
.end method

.method setId(Ljava/lang/String;)Landroidx/media/MediaSession2$BuilderBase;
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TU;"
        }
    .end annotation

    .line 1716
    .local p0, "this":Landroidx/media/MediaSession2$BuilderBase;, "Landroidx/media/MediaSession2$BuilderBase<TT;TU;TC;>;"
    if-eqz p1, :cond_0

    .line 1719
    iget-object v0, p0, Landroidx/media/MediaSession2$BuilderBase;->mBaseImpl:Landroidx/media/MediaSession2ImplBase$BuilderBase;

    invoke-virtual {v0, p1}, Landroidx/media/MediaSession2ImplBase$BuilderBase;->setId(Ljava/lang/String;)V

    .line 1720
    return-object p0

    .line 1717
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "id shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setImpl(Landroidx/media/MediaSession2ImplBase$BuilderBase;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media/MediaSession2ImplBase$BuilderBase<",
            "TT;TC;>;)V"
        }
    .end annotation

    .line 1753
    .local p0, "this":Landroidx/media/MediaSession2$BuilderBase;, "Landroidx/media/MediaSession2$BuilderBase<TT;TU;TC;>;"
    .local p1, "impl":Landroidx/media/MediaSession2ImplBase$BuilderBase;, "Landroidx/media/MediaSession2ImplBase$BuilderBase<TT;TC;>;"
    iput-object p1, p0, Landroidx/media/MediaSession2$BuilderBase;->mBaseImpl:Landroidx/media/MediaSession2ImplBase$BuilderBase;

    .line 1754
    return-void
.end method

.method setPlayer(Landroidx/media/BaseMediaPlayer;)Landroidx/media/MediaSession2$BuilderBase;
    .locals 2
    .param p1, "player"    # Landroidx/media/BaseMediaPlayer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media/BaseMediaPlayer;",
            ")TU;"
        }
    .end annotation

    .line 1655
    .local p0, "this":Landroidx/media/MediaSession2$BuilderBase;, "Landroidx/media/MediaSession2$BuilderBase<TT;TU;TC;>;"
    if-eqz p1, :cond_0

    .line 1658
    iget-object v0, p0, Landroidx/media/MediaSession2$BuilderBase;->mBaseImpl:Landroidx/media/MediaSession2ImplBase$BuilderBase;

    invoke-virtual {v0, p1}, Landroidx/media/MediaSession2ImplBase$BuilderBase;->setPlayer(Landroidx/media/BaseMediaPlayer;)V

    .line 1659
    return-object p0

    .line 1656
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "player shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setPlaylistAgent(Landroidx/media/MediaPlaylistAgent;)Landroidx/media/MediaSession2$BuilderBase;
    .locals 2
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media/MediaPlaylistAgent;",
            ")TU;"
        }
    .end annotation

    .line 1675
    .local p0, "this":Landroidx/media/MediaSession2$BuilderBase;, "Landroidx/media/MediaSession2$BuilderBase<TT;TU;TC;>;"
    if-eqz p1, :cond_0

    .line 1678
    iget-object v0, p0, Landroidx/media/MediaSession2$BuilderBase;->mBaseImpl:Landroidx/media/MediaSession2ImplBase$BuilderBase;

    invoke-virtual {v0, p1}, Landroidx/media/MediaSession2ImplBase$BuilderBase;->setPlaylistAgent(Landroidx/media/MediaPlaylistAgent;)V

    .line 1679
    return-object p0

    .line 1676
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "playlistAgent shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setSessionActivity(Landroid/app/PendingIntent;)Landroidx/media/MediaSession2$BuilderBase;
    .locals 1
    .param p1, "pi"    # Landroid/app/PendingIntent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/PendingIntent;",
            ")TU;"
        }
    .end annotation

    .line 1701
    .local p0, "this":Landroidx/media/MediaSession2$BuilderBase;, "Landroidx/media/MediaSession2$BuilderBase<TT;TU;TC;>;"
    iget-object v0, p0, Landroidx/media/MediaSession2$BuilderBase;->mBaseImpl:Landroidx/media/MediaSession2ImplBase$BuilderBase;

    invoke-virtual {v0, p1}, Landroidx/media/MediaSession2ImplBase$BuilderBase;->setSessionActivity(Landroid/app/PendingIntent;)V

    .line 1702
    return-object p0
.end method

.method setSessionCallback(Ljava/util/concurrent/Executor;Landroidx/media/MediaSession2$SessionCallback;)Landroidx/media/MediaSession2$BuilderBase;
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/media/MediaSession2$SessionCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "TC;)TU;"
        }
    .end annotation

    .line 1731
    .local p0, "this":Landroidx/media/MediaSession2$BuilderBase;, "Landroidx/media/MediaSession2$BuilderBase<TT;TU;TC;>;"
    .local p2, "callback":Landroidx/media/MediaSession2$SessionCallback;, "TC;"
    if-eqz p1, :cond_1

    .line 1734
    if-eqz p2, :cond_0

    .line 1737
    iget-object v0, p0, Landroidx/media/MediaSession2$BuilderBase;->mBaseImpl:Landroidx/media/MediaSession2ImplBase$BuilderBase;

    invoke-virtual {v0, p1, p2}, Landroidx/media/MediaSession2ImplBase$BuilderBase;->setSessionCallback(Ljava/util/concurrent/Executor;Landroidx/media/MediaSession2$SessionCallback;)V

    .line 1738
    return-object p0

    .line 1735
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "callback shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1732
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "executor shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setVolumeProvider(Landroidx/media/VolumeProviderCompat;)Landroidx/media/MediaSession2$BuilderBase;
    .locals 1
    .param p1, "volumeProvider"    # Landroidx/media/VolumeProviderCompat;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media/VolumeProviderCompat;",
            ")TU;"
        }
    .end annotation

    .line 1689
    .local p0, "this":Landroidx/media/MediaSession2$BuilderBase;, "Landroidx/media/MediaSession2$BuilderBase<TT;TU;TC;>;"
    iget-object v0, p0, Landroidx/media/MediaSession2$BuilderBase;->mBaseImpl:Landroidx/media/MediaSession2ImplBase$BuilderBase;

    invoke-virtual {v0, p1}, Landroidx/media/MediaSession2ImplBase$BuilderBase;->setVolumeProvider(Landroidx/media/VolumeProviderCompat;)V

    .line 1690
    return-object p0
.end method
