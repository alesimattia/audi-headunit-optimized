.class final Landroidx/media/MediaPlayer2Impl$15;
.super Landroid/media/MediaDataSource;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl;->handleDataSource(Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field mDataSource:Landroidx/media/Media2DataSource;

.field final synthetic val$dsd:Landroidx/media/DataSourceDesc;


# direct methods
.method constructor <init>(Landroidx/media/DataSourceDesc;)V
    .locals 0

    .line 667
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$15;->val$dsd:Landroidx/media/DataSourceDesc;

    invoke-direct {p0}, Landroid/media/MediaDataSource;-><init>()V

    .line 668
    iget-object p1, p0, Landroidx/media/MediaPlayer2Impl$15;->val$dsd:Landroidx/media/DataSourceDesc;

    invoke-virtual {p1}, Landroidx/media/DataSourceDesc;->getMedia2DataSource()Landroidx/media/Media2DataSource;

    move-result-object p1

    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$15;->mDataSource:Landroidx/media/Media2DataSource;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 682
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$15;->mDataSource:Landroidx/media/Media2DataSource;

    invoke-virtual {v0}, Landroidx/media/Media2DataSource;->close()V

    .line 683
    return-void
.end method

.method public getSize()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 677
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$15;->mDataSource:Landroidx/media/Media2DataSource;

    invoke-virtual {v0}, Landroidx/media/Media2DataSource;->getSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public readAt(J[BII)I
    .locals 6
    .param p1, "position"    # J
    .param p3, "buffer"    # [B
    .param p4, "offset"    # I
    .param p5, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 672
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$15;->mDataSource:Landroidx/media/Media2DataSource;

    move-wide v1, p1

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroidx/media/Media2DataSource;->readAt(J[BII)I

    move-result v0

    return v0
.end method
