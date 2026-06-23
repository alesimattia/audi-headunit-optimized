.class Landroidx/media/MediaPlaylistAgent$3;
.super Ljava/lang/Object;
.source "MediaPlaylistAgent.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlaylistAgent;->notifyShuffleModeChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlaylistAgent;

.field final synthetic val$callback:Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlaylistAgent;Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlaylistAgent;

    .line 207
    iput-object p1, p0, Landroidx/media/MediaPlaylistAgent$3;->this$0:Landroidx/media/MediaPlaylistAgent;

    iput-object p2, p0, Landroidx/media/MediaPlaylistAgent$3;->val$callback:Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 210
    iget-object v0, p0, Landroidx/media/MediaPlaylistAgent$3;->val$callback:Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;

    iget-object v1, p0, Landroidx/media/MediaPlaylistAgent$3;->this$0:Landroidx/media/MediaPlaylistAgent;

    iget-object v2, p0, Landroidx/media/MediaPlaylistAgent$3;->this$0:Landroidx/media/MediaPlaylistAgent;

    .line 211
    invoke-virtual {v2}, Landroidx/media/MediaPlaylistAgent;->getShuffleMode()I

    move-result v2

    .line 210
    invoke-virtual {v0, v1, v2}, Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;->onShuffleModeChanged(Landroidx/media/MediaPlaylistAgent;I)V

    .line 212
    return-void
.end method
