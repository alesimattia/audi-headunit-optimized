.class Landroidx/media/MediaPlayer2Impl$5;
.super Landroidx/media/MediaPlayer2Impl$Task;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl;->skipToNext()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;IZ)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlayer2Impl;
    .param p2, "mediaCallType"    # I
    .param p3, "needToWaitForEventToComplete"    # Z

    .line 293
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$5;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-direct {p0, p1, p2, p3}, Landroidx/media/MediaPlayer2Impl$Task;-><init>(Landroidx/media/MediaPlayer2Impl;IZ)V

    return-void
.end method


# virtual methods
.method process()V
    .locals 1

    .line 296
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$5;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$100(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->skipToNext()V

    .line 297
    return-void
.end method
