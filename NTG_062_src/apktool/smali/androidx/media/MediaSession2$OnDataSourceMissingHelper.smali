.class public interface abstract Landroidx/media/MediaSession2$OnDataSourceMissingHelper;
.super Ljava/lang/Object;
.source "MediaSession2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaSession2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnDataSourceMissingHelper"
.end annotation


# virtual methods
.method public abstract onDataSourceMissing(Landroidx/media/MediaSession2;Landroidx/media/MediaItem2;)Landroidx/media/DataSourceDesc;
    .param p1    # Landroidx/media/MediaSession2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method
