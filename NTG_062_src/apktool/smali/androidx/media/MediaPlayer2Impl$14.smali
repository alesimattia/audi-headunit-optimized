.class Landroidx/media/MediaPlayer2Impl$14;
.super Landroidx/media/MediaPlayer2Impl$Task;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl;->setSurface(Landroid/view/Surface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;

.field final synthetic val$surface:Landroid/view/Surface;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;IZLandroid/view/Surface;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlayer2Impl;
    .param p2, "mediaCallType"    # I
    .param p3, "needToWaitForEventToComplete"    # Z

    .line 622
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$14;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput-object p4, p0, Landroidx/media/MediaPlayer2Impl$14;->val$surface:Landroid/view/Surface;

    invoke-direct {p0, p1, p2, p3}, Landroidx/media/MediaPlayer2Impl$Task;-><init>(Landroidx/media/MediaPlayer2Impl;IZ)V

    return-void
.end method


# virtual methods
.method process()V
    .locals 2

    .line 625
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$14;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$100(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$14;->val$surface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setSurface(Landroid/view/Surface;)V

    .line 626
    return-void
.end method
