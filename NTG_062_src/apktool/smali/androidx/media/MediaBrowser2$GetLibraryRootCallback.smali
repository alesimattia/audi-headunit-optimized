.class Landroidx/media/MediaBrowser2$GetLibraryRootCallback;
.super Landroid/support/v4/media/MediaBrowserCompat$ConnectionCallback;
.source "MediaBrowser2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaBrowser2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GetLibraryRootCallback"
.end annotation


# instance fields
.field private final mExtras:Landroid/os/Bundle;

.field final synthetic this$0:Landroidx/media/MediaBrowser2;


# direct methods
.method constructor <init>(Landroidx/media/MediaBrowser2;Landroid/os/Bundle;)V
    .locals 0
    .param p2, "extras"    # Landroid/os/Bundle;

    .line 454
    iput-object p1, p0, Landroidx/media/MediaBrowser2$GetLibraryRootCallback;->this$0:Landroidx/media/MediaBrowser2;

    .line 455
    invoke-direct {p0}, Landroid/support/v4/media/MediaBrowserCompat$ConnectionCallback;-><init>()V

    .line 456
    iput-object p2, p0, Landroidx/media/MediaBrowser2$GetLibraryRootCallback;->mExtras:Landroid/os/Bundle;

    .line 457
    return-void
.end method

.method static synthetic access$300(Landroidx/media/MediaBrowser2$GetLibraryRootCallback;)Landroid/os/Bundle;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaBrowser2$GetLibraryRootCallback;

    .line 451
    iget-object v0, p0, Landroidx/media/MediaBrowser2$GetLibraryRootCallback;->mExtras:Landroid/os/Bundle;

    return-object v0
.end method


# virtual methods
.method public onConnected()V
    .locals 2

    .line 461
    iget-object v0, p0, Landroidx/media/MediaBrowser2$GetLibraryRootCallback;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v0}, Landroidx/media/MediaBrowser2;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroidx/media/MediaBrowser2$GetLibraryRootCallback$1;

    invoke-direct {v1, p0}, Landroidx/media/MediaBrowser2$GetLibraryRootCallback$1;-><init>(Landroidx/media/MediaBrowser2$GetLibraryRootCallback;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 476
    return-void
.end method

.method public onConnectionFailed()V
    .locals 1

    .line 485
    iget-object v0, p0, Landroidx/media/MediaBrowser2$GetLibraryRootCallback;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v0}, Landroidx/media/MediaBrowser2;->close()V

    .line 486
    return-void
.end method

.method public onConnectionSuspended()V
    .locals 1

    .line 480
    iget-object v0, p0, Landroidx/media/MediaBrowser2$GetLibraryRootCallback;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v0}, Landroidx/media/MediaBrowser2;->close()V

    .line 481
    return-void
.end method
