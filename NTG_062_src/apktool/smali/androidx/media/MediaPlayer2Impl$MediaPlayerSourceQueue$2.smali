.class Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$2;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->moveToNext()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

.field final synthetic val$src2:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    .line 2206
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$2;->this$1:Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$2;->val$src2:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/BaseMediaPlayer$PlayerEventCallback;)V
    .locals 2
    .param p1, "cb"    # Landroidx/media/BaseMediaPlayer$PlayerEventCallback;

    .line 2209
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$2;->this$1:Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    iget-object v0, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$800(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$2;->val$src2:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    iget v1, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayerState:I

    invoke-virtual {p1, v0, v1}, Landroidx/media/BaseMediaPlayer$PlayerEventCallback;->onPlayerStateChanged(Landroidx/media/BaseMediaPlayer;I)V

    .line 2210
    return-void
.end method
