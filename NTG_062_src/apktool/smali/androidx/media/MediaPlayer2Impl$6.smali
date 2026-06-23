.class Landroidx/media/MediaPlayer2Impl$6;
.super Landroidx/media/MediaPlayer2Impl$Task;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl;->setAudioAttributes(Landroidx/media/AudioAttributesCompat;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;

.field final synthetic val$attributes:Landroidx/media/AudioAttributesCompat;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;IZLandroidx/media/AudioAttributesCompat;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlayer2Impl;
    .param p2, "mediaCallType"    # I
    .param p3, "needToWaitForEventToComplete"    # Z

    .line 370
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$6;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput-object p4, p0, Landroidx/media/MediaPlayer2Impl$6;->val$attributes:Landroidx/media/AudioAttributesCompat;

    invoke-direct {p0, p1, p2, p3}, Landroidx/media/MediaPlayer2Impl$Task;-><init>(Landroidx/media/MediaPlayer2Impl;IZ)V

    return-void
.end method


# virtual methods
.method process()V
    .locals 4

    .line 374
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$6;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$200(Landroidx/media/MediaPlayer2Impl;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 375
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$6;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v3, p0, Landroidx/media/MediaPlayer2Impl$6;->val$attributes:Landroidx/media/AudioAttributesCompat;

    invoke-static {v2, v3}, Landroidx/media/MediaPlayer2Impl;->access$302(Landroidx/media/MediaPlayer2Impl;Landroidx/media/AudioAttributesCompat;)Landroidx/media/AudioAttributesCompat;

    .line 376
    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$6;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v2}, Landroidx/media/MediaPlayer2Impl;->access$300(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/AudioAttributesCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/media/AudioAttributesCompat;->unwrap()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/AudioAttributes;

    move-object v1, v2

    .line 377
    .local v1, "attr":Landroid/media/AudioAttributes;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 378
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$6;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$100(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setAudioAttributes(Landroid/media/AudioAttributes;)V

    .line 379
    return-void

    .line 377
    .end local v1    # "attr":Landroid/media/AudioAttributes;
    :catchall_0
    move-exception v2

    .restart local v1    # "attr":Landroid/media/AudioAttributes;
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method
