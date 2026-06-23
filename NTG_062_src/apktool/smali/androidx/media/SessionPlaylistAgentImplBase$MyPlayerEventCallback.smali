.class Landroidx/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;
.super Landroidx/media/BaseMediaPlayer$PlayerEventCallback;
.source "SessionPlaylistAgentImplBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/SessionPlaylistAgentImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyPlayerEventCallback"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/SessionPlaylistAgentImplBase;


# direct methods
.method private constructor <init>(Landroidx/media/SessionPlaylistAgentImplBase;)V
    .locals 0

    .line 69
    iput-object p1, p0, Landroidx/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;->this$0:Landroidx/media/SessionPlaylistAgentImplBase;

    invoke-direct {p0}, Landroidx/media/BaseMediaPlayer$PlayerEventCallback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroidx/media/SessionPlaylistAgentImplBase;Landroidx/media/SessionPlaylistAgentImplBase$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/media/SessionPlaylistAgentImplBase;
    .param p2, "x1"    # Landroidx/media/SessionPlaylistAgentImplBase$1;

    .line 69
    invoke-direct {p0, p1}, Landroidx/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;-><init>(Landroidx/media/SessionPlaylistAgentImplBase;)V

    return-void
.end method


# virtual methods
.method public onCurrentDataSourceChanged(Landroidx/media/BaseMediaPlayer;Landroidx/media/DataSourceDesc;)V
    .locals 5
    .param p1, "mpb"    # Landroidx/media/BaseMediaPlayer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "dsd"    # Landroidx/media/DataSourceDesc;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 73
    iget-object v0, p0, Landroidx/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;->this$0:Landroidx/media/SessionPlaylistAgentImplBase;

    invoke-static {v0}, Landroidx/media/SessionPlaylistAgentImplBase;->access$000(Landroidx/media/SessionPlaylistAgentImplBase;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 74
    :try_start_0
    iget-object v1, p0, Landroidx/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;->this$0:Landroidx/media/SessionPlaylistAgentImplBase;

    invoke-static {v1}, Landroidx/media/SessionPlaylistAgentImplBase;->access$100(Landroidx/media/SessionPlaylistAgentImplBase;)Landroidx/media/BaseMediaPlayer;

    move-result-object v1

    if-eq v1, p1, :cond_0

    .line 75
    monitor-exit v0

    return-void

    .line 77
    :cond_0
    if-nez p2, :cond_1

    iget-object v1, p0, Landroidx/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;->this$0:Landroidx/media/SessionPlaylistAgentImplBase;

    invoke-static {v1}, Landroidx/media/SessionPlaylistAgentImplBase;->access$200(Landroidx/media/SessionPlaylistAgentImplBase;)Landroidx/media/SessionPlaylistAgentImplBase$PlayItem;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 78
    iget-object v1, p0, Landroidx/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;->this$0:Landroidx/media/SessionPlaylistAgentImplBase;

    iget-object v2, p0, Landroidx/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;->this$0:Landroidx/media/SessionPlaylistAgentImplBase;

    iget-object v3, p0, Landroidx/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;->this$0:Landroidx/media/SessionPlaylistAgentImplBase;

    invoke-static {v3}, Landroidx/media/SessionPlaylistAgentImplBase;->access$200(Landroidx/media/SessionPlaylistAgentImplBase;)Landroidx/media/SessionPlaylistAgentImplBase$PlayItem;

    move-result-object v3

    iget v3, v3, Landroidx/media/SessionPlaylistAgentImplBase$PlayItem;->shuffledIdx:I

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Landroidx/media/SessionPlaylistAgentImplBase;->access$300(Landroidx/media/SessionPlaylistAgentImplBase;II)Landroidx/media/SessionPlaylistAgentImplBase$PlayItem;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/media/SessionPlaylistAgentImplBase;->access$202(Landroidx/media/SessionPlaylistAgentImplBase;Landroidx/media/SessionPlaylistAgentImplBase$PlayItem;)Landroidx/media/SessionPlaylistAgentImplBase$PlayItem;

    .line 79
    iget-object v1, p0, Landroidx/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;->this$0:Landroidx/media/SessionPlaylistAgentImplBase;

    invoke-static {v1}, Landroidx/media/SessionPlaylistAgentImplBase;->access$400(Landroidx/media/SessionPlaylistAgentImplBase;)V

    .line 81
    :cond_1
    monitor-exit v0

    .line 82
    return-void

    .line 81
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
