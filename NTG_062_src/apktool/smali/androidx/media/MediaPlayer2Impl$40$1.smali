.class Landroidx/media/MediaPlayer2Impl$40$1;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl$40;->onMediaTimeDiscontinuity(Landroid/media/MediaPlayer;Landroid/media/MediaTimestamp;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaPlayer2Impl$40;

.field final synthetic val$timestamp:Landroid/media/MediaTimestamp;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl$40;Landroid/media/MediaTimestamp;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaPlayer2Impl$40;

    .line 1744
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$40$1;->this$1:Landroidx/media/MediaPlayer2Impl$40;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$40$1;->val$timestamp:Landroid/media/MediaTimestamp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/MediaPlayer2$EventCallback;)V
    .locals 3
    .param p1, "cb"    # Landroidx/media/MediaPlayer2$EventCallback;

    .line 1747
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$40$1;->this$1:Landroidx/media/MediaPlayer2Impl$40;

    iget-object v0, v0, Landroidx/media/MediaPlayer2Impl$40;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$40$1;->this$1:Landroidx/media/MediaPlayer2Impl$40;

    iget-object v1, v1, Landroidx/media/MediaPlayer2Impl$40;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    .line 1748
    invoke-virtual {v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroidx/media/DataSourceDesc;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$40$1;->val$timestamp:Landroid/media/MediaTimestamp;

    .line 1747
    invoke-virtual {p1, v0, v1, v2}, Landroidx/media/MediaPlayer2$EventCallback;->onMediaTimeDiscontinuity(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;Landroid/media/MediaTimestamp;)V

    .line 1749
    return-void
.end method
