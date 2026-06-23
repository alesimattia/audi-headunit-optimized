.class Landroidx/media/MediaPlaylistAgent$4;
.super Ljava/lang/Object;
.source "MediaPlaylistAgent.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlaylistAgent;->notifyRepeatModeChanged()V
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

    .line 228
    iput-object p1, p0, Landroidx/media/MediaPlaylistAgent$4;->this$0:Landroidx/media/MediaPlaylistAgent;

    iput-object p2, p0, Landroidx/media/MediaPlaylistAgent$4;->val$callback:Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 231
    iget-object v0, p0, Landroidx/media/MediaPlaylistAgent$4;->val$callback:Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;

    iget-object v1, p0, Landroidx/media/MediaPlaylistAgent$4;->this$0:Landroidx/media/MediaPlaylistAgent;

    iget-object v2, p0, Landroidx/media/MediaPlaylistAgent$4;->this$0:Landroidx/media/MediaPlaylistAgent;

    .line 232
    invoke-virtual {v2}, Landroidx/media/MediaPlaylistAgent;->getRepeatMode()I

    move-result v2

    .line 231
    invoke-virtual {v0, v1, v2}, Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;->onRepeatModeChanged(Landroidx/media/MediaPlaylistAgent;I)V

    .line 233
    return-void
.end method
