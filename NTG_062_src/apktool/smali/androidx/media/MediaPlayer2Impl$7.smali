.class Landroidx/media/MediaPlayer2Impl$7;
.super Landroidx/media/MediaPlayer2Impl$Task;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl;->setDataSource(Landroidx/media/DataSourceDesc;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;

.field final synthetic val$dsd:Landroidx/media/DataSourceDesc;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;IZLandroidx/media/DataSourceDesc;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlayer2Impl;
    .param p2, "mediaCallType"    # I
    .param p3, "needToWaitForEventToComplete"    # Z

    .line 399
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$7;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput-object p4, p0, Landroidx/media/MediaPlayer2Impl$7;->val$dsd:Landroidx/media/DataSourceDesc;

    invoke-direct {p0, p1, p2, p3}, Landroidx/media/MediaPlayer2Impl$Task;-><init>(Landroidx/media/MediaPlayer2Impl;IZ)V

    return-void
.end method


# virtual methods
.method process()V
    .locals 3

    .line 402
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$7;->val$dsd:Landroidx/media/DataSourceDesc;

    const-string v1, "the DataSourceDesc cannot be null"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    :try_start_0
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$7;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$100(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$7;->val$dsd:Landroidx/media/DataSourceDesc;

    invoke-virtual {v0, v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setFirst(Landroidx/media/DataSourceDesc;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 408
    goto :goto_0

    .line 406
    :catch_0
    move-exception v0

    .line 407
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "MediaPlayer2Impl"

    const-string v2, "process: setDataSource"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 409
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method
