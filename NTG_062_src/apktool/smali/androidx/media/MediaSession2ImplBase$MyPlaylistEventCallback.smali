.class Landroidx/media/MediaSession2ImplBase$MyPlaylistEventCallback;
.super Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;
.source "MediaSession2ImplBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaSession2ImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MyPlaylistEventCallback"
.end annotation


# instance fields
.field private final mSession:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/media/MediaSession2ImplBase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroidx/media/MediaSession2ImplBase;)V
    .locals 1
    .param p1, "session"    # Landroidx/media/MediaSession2ImplBase;

    .line 1398
    invoke-direct {p0}, Landroidx/media/MediaPlaylistAgent$PlaylistEventCallback;-><init>()V

    .line 1399
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlaylistEventCallback;->mSession:Ljava/lang/ref/WeakReference;

    .line 1400
    return-void
.end method

.method synthetic constructor <init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaSession2ImplBase$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/media/MediaSession2ImplBase;
    .param p2, "x1"    # Landroidx/media/MediaSession2ImplBase$1;

    .line 1395
    invoke-direct {p0, p1}, Landroidx/media/MediaSession2ImplBase$MyPlaylistEventCallback;-><init>(Landroidx/media/MediaSession2ImplBase;)V

    return-void
.end method


# virtual methods
.method public onPlaylistChanged(Landroidx/media/MediaPlaylistAgent;Ljava/util/List;Landroidx/media/MediaMetadata2;)V
    .locals 1
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
    .param p3, "metadata"    # Landroidx/media/MediaMetadata2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media/MediaPlaylistAgent;",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;",
            "Landroidx/media/MediaMetadata2;",
            ")V"
        }
    .end annotation

    .line 1405
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlaylistEventCallback;->mSession:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaSession2ImplBase;

    .line 1406
    .local v0, "session":Landroidx/media/MediaSession2ImplBase;
    if-nez v0, :cond_0

    .line 1407
    return-void

    .line 1409
    :cond_0
    invoke-static {v0, p1, p2, p3}, Landroidx/media/MediaSession2ImplBase;->access$600(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaPlaylistAgent;Ljava/util/List;Landroidx/media/MediaMetadata2;)V

    .line 1410
    return-void
.end method

.method public onPlaylistMetadataChanged(Landroidx/media/MediaPlaylistAgent;Landroidx/media/MediaMetadata2;)V
    .locals 1
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
    .param p2, "metadata"    # Landroidx/media/MediaMetadata2;

    .line 1415
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlaylistEventCallback;->mSession:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaSession2ImplBase;

    .line 1416
    .local v0, "session":Landroidx/media/MediaSession2ImplBase;
    if-nez v0, :cond_0

    .line 1417
    return-void

    .line 1419
    :cond_0
    invoke-static {v0, p1, p2}, Landroidx/media/MediaSession2ImplBase;->access$700(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaPlaylistAgent;Landroidx/media/MediaMetadata2;)V

    .line 1420
    return-void
.end method

.method public onRepeatModeChanged(Landroidx/media/MediaPlaylistAgent;I)V
    .locals 1
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
    .param p2, "repeatMode"    # I

    .line 1424
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlaylistEventCallback;->mSession:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaSession2ImplBase;

    .line 1425
    .local v0, "session":Landroidx/media/MediaSession2ImplBase;
    if-nez v0, :cond_0

    .line 1426
    return-void

    .line 1428
    :cond_0
    invoke-static {v0, p1, p2}, Landroidx/media/MediaSession2ImplBase;->access$800(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaPlaylistAgent;I)V

    .line 1429
    return-void
.end method

.method public onShuffleModeChanged(Landroidx/media/MediaPlaylistAgent;I)V
    .locals 1
    .param p1, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
    .param p2, "shuffleMode"    # I

    .line 1433
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlaylistEventCallback;->mSession:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaSession2ImplBase;

    .line 1434
    .local v0, "session":Landroidx/media/MediaSession2ImplBase;
    if-nez v0, :cond_0

    .line 1435
    return-void

    .line 1437
    :cond_0
    invoke-static {v0, p1, p2}, Landroidx/media/MediaSession2ImplBase;->access$900(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaPlaylistAgent;I)V

    .line 1438
    return-void
.end method
