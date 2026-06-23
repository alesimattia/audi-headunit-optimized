.class public final Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;
.super Landroidx/media/MediaSession2$BuilderBase;
.source "MediaLibraryService2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaLibraryService2$MediaLibrarySession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/media/MediaSession2$BuilderBase<",
        "Landroidx/media/MediaLibraryService2$MediaLibrarySession;",
        "Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;",
        "Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;",
        ">;"
    }
.end annotation


# instance fields
.field private mImpl:Landroidx/media/MediaLibrarySessionImplBase$Builder;


# direct methods
.method public constructor <init>(Landroidx/media/MediaLibraryService2;Ljava/util/concurrent/Executor;Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;)V
    .locals 1
    .param p1, "service"    # Landroidx/media/MediaLibraryService2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "callbackExecutor"    # Ljava/util/concurrent/Executor;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "callback"    # Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 228
    invoke-direct {p0, p1}, Landroidx/media/MediaSession2$BuilderBase;-><init>(Landroid/content/Context;)V

    .line 229
    new-instance v0, Landroidx/media/MediaLibrarySessionImplBase$Builder;

    invoke-direct {v0, p1}, Landroidx/media/MediaLibrarySessionImplBase$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;->mImpl:Landroidx/media/MediaLibrarySessionImplBase$Builder;

    .line 230
    iget-object v0, p0, Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;->mImpl:Landroidx/media/MediaLibrarySessionImplBase$Builder;

    invoke-virtual {p0, v0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;->setImpl(Landroidx/media/MediaSession2ImplBase$BuilderBase;)V

    .line 231
    invoke-virtual {p0, p2, p3}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;->setSessionCallback(Ljava/util/concurrent/Executor;Landroidx/media/MediaSession2$SessionCallback;)Landroidx/media/MediaSession2$BuilderBase;

    .line 232
    return-void
.end method


# virtual methods
.method public build()Landroidx/media/MediaLibraryService2$MediaLibrarySession;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 262
    invoke-super {p0}, Landroidx/media/MediaSession2$BuilderBase;->build()Landroidx/media/MediaSession2;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    return-object v0
.end method

.method public bridge synthetic build()Landroidx/media/MediaSession2;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 217
    invoke-virtual {p0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;->build()Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v0

    return-object v0
.end method

.method public setId(Ljava/lang/String;)Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 257
    invoke-super {p0, p1}, Landroidx/media/MediaSession2$BuilderBase;->setId(Ljava/lang/String;)Landroidx/media/MediaSession2$BuilderBase;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;

    return-object v0
.end method

.method public bridge synthetic setId(Ljava/lang/String;)Landroidx/media/MediaSession2$BuilderBase;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 217
    invoke-virtual {p0, p1}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;->setId(Ljava/lang/String;)Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setPlayer(Landroidx/media/BaseMediaPlayer;)Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;
    .locals 1
    .param p1, "player"    # Landroidx/media/BaseMediaPlayer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 236
    invoke-super {p0, p1}, Landroidx/media/MediaSession2$BuilderBase;->setPlayer(Landroidx/media/BaseMediaPlayer;)Landroidx/media/MediaSession2$BuilderBase;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;

    return-object v0
.end method

.method public bridge synthetic setPlayer(Landroidx/media/BaseMediaPlayer;)Landroidx/media/MediaSession2$BuilderBase;
    .locals 0
    .param p1    # Landroidx/media/BaseMediaPlayer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 217
    invoke-virtual {p0, p1}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;->setPlayer(Landroidx/media/BaseMediaPlayer;)Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setPlaylistAgent(Landroidx/media/MediaPlaylistAgent;)Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;
    .locals 1
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 241
    invoke-super {p0, p1}, Landroidx/media/MediaSession2$BuilderBase;->setPlaylistAgent(Landroidx/media/MediaPlaylistAgent;)Landroidx/media/MediaSession2$BuilderBase;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;

    return-object v0
.end method

.method public bridge synthetic setPlaylistAgent(Landroidx/media/MediaPlaylistAgent;)Landroidx/media/MediaSession2$BuilderBase;
    .locals 0
    .param p1    # Landroidx/media/MediaPlaylistAgent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 217
    invoke-virtual {p0, p1}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;->setPlaylistAgent(Landroidx/media/MediaPlaylistAgent;)Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setSessionActivity(Landroid/app/PendingIntent;)Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;
    .locals 1
    .param p1, "pi"    # Landroid/app/PendingIntent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 252
    invoke-super {p0, p1}, Landroidx/media/MediaSession2$BuilderBase;->setSessionActivity(Landroid/app/PendingIntent;)Landroidx/media/MediaSession2$BuilderBase;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;

    return-object v0
.end method

.method public bridge synthetic setSessionActivity(Landroid/app/PendingIntent;)Landroidx/media/MediaSession2$BuilderBase;
    .locals 0
    .param p1    # Landroid/app/PendingIntent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 217
    invoke-virtual {p0, p1}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;->setSessionActivity(Landroid/app/PendingIntent;)Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setVolumeProvider(Landroidx/media/VolumeProviderCompat;)Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;
    .locals 1
    .param p1, "volumeProvider"    # Landroidx/media/VolumeProviderCompat;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 247
    invoke-super {p0, p1}, Landroidx/media/MediaSession2$BuilderBase;->setVolumeProvider(Landroidx/media/VolumeProviderCompat;)Landroidx/media/MediaSession2$BuilderBase;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;

    return-object v0
.end method

.method public bridge synthetic setVolumeProvider(Landroidx/media/VolumeProviderCompat;)Landroidx/media/MediaSession2$BuilderBase;
    .locals 0
    .param p1    # Landroidx/media/VolumeProviderCompat;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 217
    invoke-virtual {p0, p1}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;->setVolumeProvider(Landroidx/media/VolumeProviderCompat;)Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;

    move-result-object p1

    return-object p1
.end method
