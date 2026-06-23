.class interface abstract Landroidx/media/MediaInterface2$SessionPlaylistControl;
.super Ljava/lang/Object;
.source "MediaInterface2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaInterface2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "SessionPlaylistControl"
.end annotation


# virtual methods
.method public abstract addPlaylistItem(ILandroidx/media/MediaItem2;)V
.end method

.method public abstract clearOnDataSourceMissingHelper()V
.end method

.method public abstract getCurrentMediaItem()Landroidx/media/MediaItem2;
.end method

.method public abstract getPlaylist()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getPlaylistMetadata()Landroidx/media/MediaMetadata2;
.end method

.method public abstract getRepeatMode()I
.end method

.method public abstract getShuffleMode()I
.end method

.method public abstract removePlaylistItem(Landroidx/media/MediaItem2;)V
.end method

.method public abstract replacePlaylistItem(ILandroidx/media/MediaItem2;)V
.end method

.method public abstract setOnDataSourceMissingHelper(Landroidx/media/MediaSession2$OnDataSourceMissingHelper;)V
.end method

.method public abstract setPlaylist(Ljava/util/List;Landroidx/media/MediaMetadata2;)V
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
.end method

.method public abstract setRepeatMode(I)V
.end method

.method public abstract setShuffleMode(I)V
.end method

.method public abstract skipToNextItem()V
.end method

.method public abstract skipToPlaylistItem(Landroidx/media/MediaItem2;)V
.end method

.method public abstract skipToPreviousItem()V
.end method

.method public abstract updatePlaylistMetadata(Landroidx/media/MediaMetadata2;)V
.end method
