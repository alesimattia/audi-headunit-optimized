.class Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$6;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setBufferingState(Landroid/media/MediaPlayer;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

.field final synthetic val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

.field final synthetic val$state:I


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;I)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    .line 2459
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$6;->this$1:Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$6;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    iput p3, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$6;->val$state:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/BaseMediaPlayer$PlayerEventCallback;)V
    .locals 3
    .param p1, "cb"    # Landroidx/media/BaseMediaPlayer$PlayerEventCallback;

    .line 2462
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$6;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroidx/media/DataSourceDesc;

    move-result-object v0

    .line 2463
    .local v0, "dsd":Landroidx/media/DataSourceDesc;
    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$6;->this$1:Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    iget-object v1, v1, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v1}, Landroidx/media/MediaPlayer2Impl;->access$800(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;

    move-result-object v1

    iget v2, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$6;->val$state:I

    invoke-virtual {p1, v1, v0, v2}, Landroidx/media/BaseMediaPlayer$PlayerEventCallback;->onBufferingStateChanged(Landroidx/media/BaseMediaPlayer;Landroidx/media/DataSourceDesc;I)V

    .line 2464
    return-void
.end method
