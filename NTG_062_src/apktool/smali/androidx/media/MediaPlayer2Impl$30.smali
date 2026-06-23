.class Landroidx/media/MediaPlayer2Impl$30;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


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

.field final synthetic val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlayer2Impl;

    .line 1558
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$30;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$30;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 3
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .line 1561
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$30;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$30;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v1}, Landroidx/media/MediaPlayer2Impl;->access$100(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->onPrepared(Landroid/media/MediaPlayer;)Landroidx/media/MediaPlayer2Impl$DataSourceError;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/media/MediaPlayer2Impl;->access$400(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$DataSourceError;)V

    .line 1562
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$30;->this$0:Landroidx/media/MediaPlayer2Impl;

    new-instance v1, Landroidx/media/MediaPlayer2Impl$30$1;

    invoke-direct {v1, p0}, Landroidx/media/MediaPlayer2Impl$30$1;-><init>(Landroidx/media/MediaPlayer2Impl$30;)V

    invoke-static {v0, v1}, Landroidx/media/MediaPlayer2Impl;->access$600(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;)V

    .line 1570
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$30;->this$0:Landroidx/media/MediaPlayer2Impl;

    new-instance v1, Landroidx/media/MediaPlayer2Impl$30$2;

    invoke-direct {v1, p0}, Landroidx/media/MediaPlayer2Impl$30$2;-><init>(Landroidx/media/MediaPlayer2Impl$30;)V

    invoke-static {v0, v1}, Landroidx/media/MediaPlayer2Impl;->access$900(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;)V

    .line 1576
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$30;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$1000(Landroidx/media/MediaPlayer2Impl;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 1577
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$30;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v1}, Landroidx/media/MediaPlayer2Impl;->access$1100(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$Task;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$30;->this$0:Landroidx/media/MediaPlayer2Impl;

    .line 1578
    invoke-static {v1}, Landroidx/media/MediaPlayer2Impl;->access$1100(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$Task;

    move-result-object v1

    invoke-static {v1}, Landroidx/media/MediaPlayer2Impl$Task;->access$1200(Landroidx/media/MediaPlayer2Impl$Task;)I

    move-result v1

    const/4 v2, 0x6

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$30;->this$0:Landroidx/media/MediaPlayer2Impl;

    .line 1579
    invoke-static {v1}, Landroidx/media/MediaPlayer2Impl;->access$1100(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$Task;

    move-result-object v1

    invoke-static {v1}, Landroidx/media/MediaPlayer2Impl$Task;->access$1300(Landroidx/media/MediaPlayer2Impl$Task;)Landroidx/media/DataSourceDesc;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$30;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-virtual {v2}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroidx/media/DataSourceDesc;

    move-result-object v2

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$30;->this$0:Landroidx/media/MediaPlayer2Impl;

    .line 1580
    invoke-static {v1}, Landroidx/media/MediaPlayer2Impl;->access$1100(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$Task;

    move-result-object v1

    invoke-static {v1}, Landroidx/media/MediaPlayer2Impl$Task;->access$1400(Landroidx/media/MediaPlayer2Impl$Task;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1581
    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$30;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v1}, Landroidx/media/MediaPlayer2Impl;->access$1100(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$Task;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroidx/media/MediaPlayer2Impl$Task;->access$1500(Landroidx/media/MediaPlayer2Impl$Task;I)V

    .line 1582
    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$30;->this$0:Landroidx/media/MediaPlayer2Impl;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroidx/media/MediaPlayer2Impl;->access$1102(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$Task;)Landroidx/media/MediaPlayer2Impl$Task;

    .line 1583
    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$30;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v1}, Landroidx/media/MediaPlayer2Impl;->access$1600(Landroidx/media/MediaPlayer2Impl;)V

    .line 1585
    :cond_0
    monitor-exit v0

    .line 1586
    return-void

    .line 1585
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
