.class final Landroidx/media/MediaSession2ImplBase$Builder;
.super Landroidx/media/MediaSession2ImplBase$BuilderBase;
.source "MediaSession2ImplBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaSession2ImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/media/MediaSession2ImplBase$BuilderBase<",
        "Landroidx/media/MediaSession2;",
        "Landroidx/media/MediaSession2$SessionCallback;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 1507
    invoke-direct {p0, p1}, Landroidx/media/MediaSession2ImplBase$BuilderBase;-><init>(Landroid/content/Context;)V

    .line 1508
    return-void
.end method


# virtual methods
.method public build()Landroidx/media/MediaSession2;
    .locals 12
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1512
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$Builder;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    if-nez v0, :cond_0

    .line 1513
    new-instance v0, Landroidx/media/MediaSession2ImplBase$MainHandlerExecutor;

    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$Builder;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroidx/media/MediaSession2ImplBase$MainHandlerExecutor;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/media/MediaSession2ImplBase$Builder;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 1515
    :cond_0
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$Builder;->mCallback:Landroidx/media/MediaSession2$SessionCallback;

    if-nez v0, :cond_1

    .line 1516
    new-instance v0, Landroidx/media/MediaSession2ImplBase$Builder$1;

    invoke-direct {v0, p0}, Landroidx/media/MediaSession2ImplBase$Builder$1;-><init>(Landroidx/media/MediaSession2ImplBase$Builder;)V

    iput-object v0, p0, Landroidx/media/MediaSession2ImplBase$Builder;->mCallback:Landroidx/media/MediaSession2$SessionCallback;

    .line 1518
    :cond_1
    new-instance v0, Landroidx/media/MediaSession2;

    new-instance v11, Landroidx/media/MediaSession2ImplBase;

    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase$Builder;->mContext:Landroid/content/Context;

    new-instance v3, Landroid/support/v4/media/session/MediaSessionCompat;

    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$Builder;->mContext:Landroid/content/Context;

    iget-object v4, p0, Landroidx/media/MediaSession2ImplBase$Builder;->mId:Ljava/lang/String;

    invoke-direct {v3, v1, v4}, Landroid/support/v4/media/session/MediaSessionCompat;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v4, p0, Landroidx/media/MediaSession2ImplBase$Builder;->mId:Ljava/lang/String;

    iget-object v5, p0, Landroidx/media/MediaSession2ImplBase$Builder;->mPlayer:Landroidx/media/BaseMediaPlayer;

    iget-object v6, p0, Landroidx/media/MediaSession2ImplBase$Builder;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;

    iget-object v7, p0, Landroidx/media/MediaSession2ImplBase$Builder;->mVolumeProvider:Landroidx/media/VolumeProviderCompat;

    iget-object v8, p0, Landroidx/media/MediaSession2ImplBase$Builder;->mSessionActivity:Landroid/app/PendingIntent;

    iget-object v9, p0, Landroidx/media/MediaSession2ImplBase$Builder;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    iget-object v10, p0, Landroidx/media/MediaSession2ImplBase$Builder;->mCallback:Landroidx/media/MediaSession2$SessionCallback;

    move-object v1, v11

    invoke-direct/range {v1 .. v10}, Landroidx/media/MediaSession2ImplBase;-><init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat;Ljava/lang/String;Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaPlaylistAgent;Landroidx/media/VolumeProviderCompat;Landroid/app/PendingIntent;Ljava/util/concurrent/Executor;Landroidx/media/MediaSession2$SessionCallback;)V

    invoke-direct {v0, v11}, Landroidx/media/MediaSession2;-><init>(Landroidx/media/MediaSession2$SupportLibraryImpl;)V

    return-object v0
.end method
