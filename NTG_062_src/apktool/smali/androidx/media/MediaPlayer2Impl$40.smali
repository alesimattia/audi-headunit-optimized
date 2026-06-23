.class Landroidx/media/MediaPlayer2Impl$40;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnMediaTimeDiscontinuityListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl;->setUpListeners(Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;

.field final synthetic val$completionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field final synthetic val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;Landroid/media/MediaPlayer$OnCompletionListener;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlayer2Impl;

    .line 1740
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$40;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$40;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    iput-object p3, p0, Landroidx/media/MediaPlayer2Impl$40;->val$completionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMediaTimeDiscontinuity(Landroid/media/MediaPlayer;Landroid/media/MediaTimestamp;)V
    .locals 3
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "timestamp"    # Landroid/media/MediaTimestamp;

    .line 1744
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$40;->this$0:Landroidx/media/MediaPlayer2Impl;

    new-instance v1, Landroidx/media/MediaPlayer2Impl$40$1;

    invoke-direct {v1, p0, p2}, Landroidx/media/MediaPlayer2Impl$40$1;-><init>(Landroidx/media/MediaPlayer2Impl$40;Landroid/media/MediaTimestamp;)V

    invoke-static {v0, v1}, Landroidx/media/MediaPlayer2Impl;->access$600(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;)V

    .line 1751
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$40;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$40;->val$completionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$40;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-static {v0, v1, v2, p2}, Landroidx/media/MediaPlayer2Impl;->access$1900(Landroidx/media/MediaPlayer2Impl;Landroid/media/MediaPlayer$OnCompletionListener;Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;Landroid/media/MediaTimestamp;)V

    .line 1752
    return-void
.end method
