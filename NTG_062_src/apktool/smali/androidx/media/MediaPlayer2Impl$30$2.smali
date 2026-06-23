.class Landroidx/media/MediaPlayer2Impl$30$2;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl$30;->onPrepared(Landroid/media/MediaPlayer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaPlayer2Impl$30;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl$30;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaPlayer2Impl$30;

    .line 1570
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$30$2;->this$1:Landroidx/media/MediaPlayer2Impl$30;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/BaseMediaPlayer$PlayerEventCallback;)V
    .locals 2
    .param p1, "cb"    # Landroidx/media/BaseMediaPlayer$PlayerEventCallback;

    .line 1573
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$30$2;->this$1:Landroidx/media/MediaPlayer2Impl$30;

    iget-object v0, v0, Landroidx/media/MediaPlayer2Impl$30;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$800(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$BaseMediaPlayerImpl;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$30$2;->this$1:Landroidx/media/MediaPlayer2Impl$30;

    iget-object v1, v1, Landroidx/media/MediaPlayer2Impl$30;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-virtual {v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroidx/media/DataSourceDesc;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroidx/media/BaseMediaPlayer$PlayerEventCallback;->onMediaPrepared(Landroidx/media/BaseMediaPlayer;Landroidx/media/DataSourceDesc;)V

    .line 1574
    return-void
.end method
