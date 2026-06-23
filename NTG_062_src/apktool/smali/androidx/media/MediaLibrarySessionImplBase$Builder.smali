.class final Landroidx/media/MediaLibrarySessionImplBase$Builder;
.super Landroidx/media/MediaSession2ImplBase$BuilderBase;
.source "MediaLibrarySessionImplBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaLibrarySessionImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/media/MediaSession2ImplBase$BuilderBase<",
        "Landroidx/media/MediaLibraryService2$MediaLibrarySession;",
        "Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 50
    invoke-direct {p0, p1}, Landroidx/media/MediaSession2ImplBase$BuilderBase;-><init>(Landroid/content/Context;)V

    .line 51
    return-void
.end method


# virtual methods
.method public build()Landroidx/media/MediaLibraryService2$MediaLibrarySession;
    .locals 12
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 55
    iget-object v0, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    if-nez v0, :cond_0

    .line 56
    new-instance v0, Landroidx/media/MediaSession2ImplBase$MainHandlerExecutor;

    iget-object v1, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroidx/media/MediaSession2ImplBase$MainHandlerExecutor;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 58
    :cond_0
    iget-object v0, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder;->mCallback:Landroidx/media/MediaSession2$SessionCallback;

    if-nez v0, :cond_1

    .line 59
    new-instance v0, Landroidx/media/MediaLibrarySessionImplBase$Builder$1;

    invoke-direct {v0, p0}, Landroidx/media/MediaLibrarySessionImplBase$Builder$1;-><init>(Landroidx/media/MediaLibrarySessionImplBase$Builder;)V

    iput-object v0, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder;->mCallback:Landroidx/media/MediaSession2$SessionCallback;

    .line 61
    :cond_1
    new-instance v0, Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    new-instance v11, Landroidx/media/MediaLibrarySessionImplBase;

    iget-object v2, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder;->mContext:Landroid/content/Context;

    new-instance v3, Landroid/support/v4/media/session/MediaSessionCompat;

    iget-object v1, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder;->mContext:Landroid/content/Context;

    iget-object v4, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder;->mId:Ljava/lang/String;

    invoke-direct {v3, v1, v4}, Landroid/support/v4/media/session/MediaSessionCompat;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v4, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder;->mId:Ljava/lang/String;

    iget-object v5, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder;->mPlayer:Landroidx/media/BaseMediaPlayer;

    iget-object v6, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder;->mPlaylistAgent:Landroidx/media/MediaPlaylistAgent;

    iget-object v7, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder;->mVolumeProvider:Landroidx/media/VolumeProviderCompat;

    iget-object v8, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder;->mSessionActivity:Landroid/app/PendingIntent;

    iget-object v9, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    iget-object v10, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder;->mCallback:Landroidx/media/MediaSession2$SessionCallback;

    move-object v1, v11

    invoke-direct/range {v1 .. v10}, Landroidx/media/MediaLibrarySessionImplBase;-><init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat;Ljava/lang/String;Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaPlaylistAgent;Landroidx/media/VolumeProviderCompat;Landroid/app/PendingIntent;Ljava/util/concurrent/Executor;Landroidx/media/MediaSession2$SessionCallback;)V

    invoke-direct {v0, v11}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;-><init>(Landroidx/media/MediaSession2$SupportLibraryImpl;)V

    return-object v0
.end method

.method public bridge synthetic build()Landroidx/media/MediaSession2;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 47
    invoke-virtual {p0}, Landroidx/media/MediaLibrarySessionImplBase$Builder;->build()Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v0

    return-object v0
.end method
