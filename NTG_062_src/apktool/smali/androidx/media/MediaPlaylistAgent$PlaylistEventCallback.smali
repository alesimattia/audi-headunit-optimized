.class public abstract Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;
.super Ljava/lang/Object;
.source "MediaPlaylistAgent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaPlaylistAgent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "PlaylistEventCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 424
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPlaylistChanged(Landroidx/media/MediaPlaylistAgent;Ljava/util/List;Landroidx/media/MediaMetadata2;)V
    .locals 0
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "metadata"    # Landroidx/media/MediaMetadata2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
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

    .line 433
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    return-void
.end method

.method public onPlaylistMetadataChanged(Landroidx/media/MediaPlaylistAgent;Landroidx/media/MediaMetadata2;)V
    .locals 0
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Landroidx/media/MediaMetadata2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 442
    return-void
.end method

.method public onRepeatModeChanged(Landroidx/media/MediaPlaylistAgent;I)V
    .locals 0
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "repeatMode"    # I

    .line 467
    return-void
.end method

.method public onShuffleModeChanged(Landroidx/media/MediaPlaylistAgent;I)V
    .locals 0
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "shuffleMode"    # I

    .line 454
    return-void
.end method
