.class Landroidx/media/MediaPlayer2Impl$18;
.super Landroidx/media/MediaPlayer2Impl$Task;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl;->seekTo(JI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;

.field final synthetic val$mode:I

.field final synthetic val$msec:J


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;IZJI)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlayer2Impl;
    .param p2, "mediaCallType"    # I
    .param p3, "needToWaitForEventToComplete"    # Z

    .line 842
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$18;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput-wide p4, p0, Landroidx/media/MediaPlayer2Impl$18;->val$msec:J

    iput p6, p0, Landroidx/media/MediaPlayer2Impl$18;->val$mode:I

    invoke-direct {p0, p1, p2, p3}, Landroidx/media/MediaPlayer2Impl$Task;-><init>(Landroidx/media/MediaPlayer2Impl;IZ)V

    return-void
.end method


# virtual methods
.method process()V
    .locals 4

    .line 845
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$18;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$100(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    move-result-object v0

    iget-wide v1, p0, Landroidx/media/MediaPlayer2Impl$18;->val$msec:J

    iget v3, p0, Landroidx/media/MediaPlayer2Impl$18;->val$mode:I

    invoke-virtual {v0, v1, v2, v3}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->seekTo(JI)V

    .line 846
    return-void
.end method
