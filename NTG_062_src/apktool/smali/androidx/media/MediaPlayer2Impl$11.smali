.class Landroidx/media/MediaPlayer2Impl$11;
.super Landroidx/media/MediaPlayer2Impl$Task;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl;->setPlaybackSpeed(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;

.field final synthetic val$speed:F


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;IZF)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlayer2Impl;
    .param p2, "mediaCallType"    # I
    .param p3, "needToWaitForEventToComplete"    # Z

    .line 488
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$11;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput p4, p0, Landroidx/media/MediaPlayer2Impl$11;->val$speed:F

    invoke-direct {p0, p1, p2, p3}, Landroidx/media/MediaPlayer2Impl$Task;-><init>(Landroidx/media/MediaPlayer2Impl;IZ)V

    return-void
.end method


# virtual methods
.method process()V
    .locals 3

    .line 491
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$11;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$11;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-virtual {v1}, Landroidx/media/MediaPlayer2Impl;->getPlaybackParams()Landroid/media/PlaybackParams;

    move-result-object v1

    iget v2, p0, Landroidx/media/MediaPlayer2Impl$11;->val$speed:F

    invoke-virtual {v1, v2}, Landroid/media/PlaybackParams;->setSpeed(F)Landroid/media/PlaybackParams;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/media/MediaPlayer2Impl;->access$500(Landroidx/media/MediaPlayer2Impl;Landroid/media/PlaybackParams;)V

    .line 492
    return-void
.end method
