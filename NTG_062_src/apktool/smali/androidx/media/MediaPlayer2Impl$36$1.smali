.class Landroidx/media/MediaPlayer2Impl$36$1;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl$36;->onSeekComplete(Landroid/media/MediaPlayer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaPlayer2Impl$36;

.field final synthetic val$seekPos:J


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl$36;J)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaPlayer2Impl$36;

    .line 1686
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$36$1;->this$1:Landroidx/media/MediaPlayer2Impl$36;

    iput-wide p2, p0, Landroidx/media/MediaPlayer2Impl$36$1;->val$seekPos:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/BaseMediaPlayer$PlayerEventCallback;)V
    .locals 3
    .param p1, "cb"    # Landroidx/media/BaseMediaPlayer$PlayerEventCallback;

    .line 1691
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$36$1;->this$1:Landroidx/media/MediaPlayer2Impl$36;

    iget-object v0, v0, Landroidx/media/MediaPlayer2Impl$36;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$800(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;

    move-result-object v0

    iget-wide v1, p0, Landroidx/media/MediaPlayer2Impl$36$1;->val$seekPos:J

    invoke-virtual {p1, v0, v1, v2}, Landroidx/media/BaseMediaPlayer$PlayerEventCallback;->onSeekCompleted(Landroidx/media/BaseMediaPlayer;J)V

    .line 1692
    return-void
.end method
