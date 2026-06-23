.class public final Landroidx/media/MediaSession2$Builder;
.super Landroidx/media/MediaSession2$BuilderBase;
.source "MediaSession2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaSession2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/media/MediaSession2$BuilderBase<",
        "Landroidx/media/MediaSession2;",
        "Landroidx/media/MediaSession2$Builder;",
        "Landroidx/media/MediaSession2$SessionCallback;",
        ">;"
    }
.end annotation


# instance fields
.field private mImpl:Landroidx/media/MediaSession2ImplBase$Builder;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 1207
    invoke-direct {p0, p1}, Landroidx/media/MediaSession2$BuilderBase;-><init>(Landroid/content/Context;)V

    .line 1208
    new-instance v0, Landroidx/media/MediaSession2ImplBase$Builder;

    invoke-direct {v0, p1}, Landroidx/media/MediaSession2ImplBase$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/media/MediaSession2$Builder;->mImpl:Landroidx/media/MediaSession2ImplBase$Builder;

    .line 1209
    iget-object v0, p0, Landroidx/media/MediaSession2$Builder;->mImpl:Landroidx/media/MediaSession2ImplBase$Builder;

    invoke-virtual {p0, v0}, Landroidx/media/MediaSession2$Builder;->setImpl(Landroidx/media/MediaSession2ImplBase$BuilderBase;)V

    .line 1210
    return-void
.end method


# virtual methods
.method public build()Landroidx/media/MediaSession2;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1245
    invoke-super {p0}, Landroidx/media/MediaSession2$BuilderBase;->build()Landroidx/media/MediaSession2;

    move-result-object v0

    return-object v0
.end method

.method public setId(Ljava/lang/String;)Landroidx/media/MediaSession2$Builder;
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1234
    invoke-super {p0, p1}, Landroidx/media/MediaSession2$BuilderBase;->setId(Ljava/lang/String;)Landroidx/media/MediaSession2$BuilderBase;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaSession2$Builder;

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

    .line 1203
    invoke-virtual {p0, p1}, Landroidx/media/MediaSession2$Builder;->setId(Ljava/lang/String;)Landroidx/media/MediaSession2$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setPlayer(Landroidx/media/BaseMediaPlayer;)Landroidx/media/MediaSession2$Builder;
    .locals 1
    .param p1, "player"    # Landroidx/media/BaseMediaPlayer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1214
    invoke-super {p0, p1}, Landroidx/media/MediaSession2$BuilderBase;->setPlayer(Landroidx/media/BaseMediaPlayer;)Landroidx/media/MediaSession2$BuilderBase;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaSession2$Builder;

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

    .line 1203
    invoke-virtual {p0, p1}, Landroidx/media/MediaSession2$Builder;->setPlayer(Landroidx/media/BaseMediaPlayer;)Landroidx/media/MediaSession2$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setPlaylistAgent(Landroidx/media/MediaPlaylistAgent;)Landroidx/media/MediaSession2$Builder;
    .locals 1
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1219
    invoke-super {p0, p1}, Landroidx/media/MediaSession2$BuilderBase;->setPlaylistAgent(Landroidx/media/MediaPlaylistAgent;)Landroidx/media/MediaSession2$BuilderBase;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaSession2$Builder;

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

    .line 1203
    invoke-virtual {p0, p1}, Landroidx/media/MediaSession2$Builder;->setPlaylistAgent(Landroidx/media/MediaPlaylistAgent;)Landroidx/media/MediaSession2$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setSessionActivity(Landroid/app/PendingIntent;)Landroidx/media/MediaSession2$Builder;
    .locals 1
    .param p1, "pi"    # Landroid/app/PendingIntent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1229
    invoke-super {p0, p1}, Landroidx/media/MediaSession2$BuilderBase;->setSessionActivity(Landroid/app/PendingIntent;)Landroidx/media/MediaSession2$BuilderBase;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaSession2$Builder;

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

    .line 1203
    invoke-virtual {p0, p1}, Landroidx/media/MediaSession2$Builder;->setSessionActivity(Landroid/app/PendingIntent;)Landroidx/media/MediaSession2$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setSessionCallback(Ljava/util/concurrent/Executor;Landroidx/media/MediaSession2$SessionCallback;)Landroidx/media/MediaSession2$Builder;
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "callback"    # Landroidx/media/MediaSession2$SessionCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1240
    invoke-super {p0, p1, p2}, Landroidx/media/MediaSession2$BuilderBase;->setSessionCallback(Ljava/util/concurrent/Executor;Landroidx/media/MediaSession2$SessionCallback;)Landroidx/media/MediaSession2$BuilderBase;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaSession2$Builder;

    return-object v0
.end method

.method public bridge synthetic setSessionCallback(Ljava/util/concurrent/Executor;Landroidx/media/MediaSession2$SessionCallback;)Landroidx/media/MediaSession2$BuilderBase;
    .locals 0
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/media/MediaSession2$SessionCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1203
    invoke-virtual {p0, p1, p2}, Landroidx/media/MediaSession2$Builder;->setSessionCallback(Ljava/util/concurrent/Executor;Landroidx/media/MediaSession2$SessionCallback;)Landroidx/media/MediaSession2$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setVolumeProvider(Landroidx/media/VolumeProviderCompat;)Landroidx/media/MediaSession2$Builder;
    .locals 1
    .param p1, "volumeProvider"    # Landroidx/media/VolumeProviderCompat;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1224
    invoke-super {p0, p1}, Landroidx/media/MediaSession2$BuilderBase;->setVolumeProvider(Landroidx/media/VolumeProviderCompat;)Landroidx/media/MediaSession2$BuilderBase;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaSession2$Builder;

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

    .line 1203
    invoke-virtual {p0, p1}, Landroidx/media/MediaSession2$Builder;->setVolumeProvider(Landroidx/media/VolumeProviderCompat;)Landroidx/media/MediaSession2$Builder;

    move-result-object p1

    return-object p1
.end method
