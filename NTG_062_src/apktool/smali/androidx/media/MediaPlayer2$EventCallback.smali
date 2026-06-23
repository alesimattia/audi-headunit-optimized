.class public abstract Landroidx/media/MediaPlayer2$EventCallback;
.super Ljava/lang/Object;
.source "MediaPlayer2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaPlayer2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "EventCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 865
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallCompleted(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;II)V
    .locals 0
    .param p1, "mp"    # Landroidx/media/MediaPlayer2;
    .param p2, "dsd"    # Landroidx/media/DataSourceDesc;
    .param p3, "what"    # I
    .param p4, "status"    # I

    .line 933
    return-void
.end method

.method public onCommandLabelReached(Landroidx/media/MediaPlayer2;Ljava/lang/Object;)V
    .locals 0
    .param p1, "mp"    # Landroidx/media/MediaPlayer2;
    .param p2, "label"    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 965
    return-void
.end method

.method public onError(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;II)V
    .locals 0
    .param p1, "mp"    # Landroidx/media/MediaPlayer2;
    .param p2, "dsd"    # Landroidx/media/DataSourceDesc;
    .param p3, "what"    # I
    .param p4, "extra"    # I

    .line 910
    return-void
.end method

.method public onInfo(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;II)V
    .locals 0
    .param p1, "mp"    # Landroidx/media/MediaPlayer2;
    .param p2, "dsd"    # Landroidx/media/DataSourceDesc;
    .param p3, "what"    # I
    .param p4, "extra"    # I

    .line 921
    return-void
.end method

.method public onMediaTimeDiscontinuity(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;Landroid/media/MediaTimestamp;)V
    .locals 0
    .param p1, "mp"    # Landroidx/media/MediaPlayer2;
    .param p2, "dsd"    # Landroidx/media/DataSourceDesc;
    .param p3, "timestamp"    # Landroid/media/MediaTimestamp;

    .line 956
    return-void
.end method

.method public onSubtitleData(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;Landroid/media/SubtitleData;)V
    .locals 0
    .param p1, "mp"    # Landroidx/media/MediaPlayer2;
    .param p2, "dsd"    # Landroidx/media/DataSourceDesc;
    .param p3, "data"    # Landroid/media/SubtitleData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 974
    return-void
.end method

.method public onTimedMetaDataAvailable(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;Landroid/media/TimedMetaData;)V
    .locals 0
    .param p1, "mp"    # Landroidx/media/MediaPlayer2;
    .param p2, "dsd"    # Landroidx/media/DataSourceDesc;
    .param p3, "data"    # Landroid/media/TimedMetaData;

    .line 898
    return-void
.end method

.method public onVideoSizeChanged(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;II)V
    .locals 0
    .param p1, "mp"    # Landroidx/media/MediaPlayer2;
    .param p2, "dsd"    # Landroidx/media/DataSourceDesc;
    .param p3, "width"    # I
    .param p4, "height"    # I

    .line 878
    return-void
.end method
