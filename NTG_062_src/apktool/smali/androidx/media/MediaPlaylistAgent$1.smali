.class Landroidx/media/MediaPlaylistAgent$1;
.super Ljava/lang/Object;
.source "MediaPlaylistAgent.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlaylistAgent;->notifyPlaylistChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlaylistAgent;

.field final synthetic val$callback:Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;

.field final synthetic val$metadata:Landroidx/media/MediaMetadata2;

.field final synthetic val$playlist:Ljava/util/List;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlaylistAgent;Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;Ljava/util/List;Landroidx/media/MediaMetadata2;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlaylistAgent;

    .line 165
    iput-object p1, p0, Landroidx/media/MediaPlaylistAgent$1;->this$0:Landroidx/media/MediaPlaylistAgent;

    iput-object p2, p0, Landroidx/media/MediaPlaylistAgent$1;->val$callback:Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;

    iput-object p3, p0, Landroidx/media/MediaPlaylistAgent$1;->val$playlist:Ljava/util/List;

    iput-object p4, p0, Landroidx/media/MediaPlaylistAgent$1;->val$metadata:Landroidx/media/MediaMetadata2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 168
    iget-object v0, p0, Landroidx/media/MediaPlaylistAgent$1;->val$callback:Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;

    iget-object v1, p0, Landroidx/media/MediaPlaylistAgent$1;->this$0:Landroidx/media/MediaPlaylistAgent;

    iget-object v2, p0, Landroidx/media/MediaPlaylistAgent$1;->val$playlist:Ljava/util/List;

    iget-object v3, p0, Landroidx/media/MediaPlaylistAgent$1;->val$metadata:Landroidx/media/MediaMetadata2;

    invoke-virtual {v0, v1, v2, v3}, Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;->onPlaylistChanged(Landroidx/media/MediaPlaylistAgent;Ljava/util/List;Landroidx/media/MediaMetadata2;)V

    .line 170
    return-void
.end method
