.class Landroidx/media/MediaPlayer2Impl$8;
.super Landroidx/media/MediaPlayer2Impl$Task;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl;->setNextDataSource(Landroidx/media/DataSourceDesc;)V
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

    .line 423
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$8;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput-object p4, p0, Landroidx/media/MediaPlayer2Impl$8;->val$dsd:Landroidx/media/DataSourceDesc;

    invoke-direct {p0, p1, p2, p3}, Landroidx/media/MediaPlayer2Impl$Task;-><init>(Landroidx/media/MediaPlayer2Impl;IZ)V

    return-void
.end method


# virtual methods
.method process()V
    .locals 3

    .line 426
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$8;->val$dsd:Landroidx/media/DataSourceDesc;

    const-string v1, "the DataSourceDesc cannot be null"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$8;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$8;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v1}, Landroidx/media/MediaPlayer2Impl;->access$100(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$8;->val$dsd:Landroidx/media/DataSourceDesc;

    invoke-virtual {v1, v2}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setNext(Landroidx/media/DataSourceDesc;)Landroidx/media/MediaPlayer2Impl$DataSourceError;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/media/MediaPlayer2Impl;->access$400(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$DataSourceError;)V

    .line 428
    return-void
.end method
