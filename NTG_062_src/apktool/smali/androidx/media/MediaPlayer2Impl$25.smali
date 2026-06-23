.class Landroidx/media/MediaPlayer2Impl$25;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl;->setPlaybackParamsInternal(Landroid/media/PlaybackParams;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;

.field final synthetic val$params:Landroid/media/PlaybackParams;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;Landroid/media/PlaybackParams;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlayer2Impl;

    .line 1458
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$25;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$25;->val$params:Landroid/media/PlaybackParams;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/BaseMediaPlayer$PlayerEventCallback;)V
    .locals 2
    .param p1, "cb"    # Landroidx/media/BaseMediaPlayer$PlayerEventCallback;

    .line 1461
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$25;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$800(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$25;->val$params:Landroid/media/PlaybackParams;

    invoke-virtual {v1}, Landroid/media/PlaybackParams;->getSpeed()F

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroidx/media/BaseMediaPlayer$PlayerEventCallback;->onPlaybackSpeedChanged(Landroidx/media/BaseMediaPlayer;F)V

    .line 1462
    return-void
.end method
