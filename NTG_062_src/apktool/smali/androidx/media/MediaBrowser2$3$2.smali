.class Landroidx/media/MediaBrowser2$3$2;
.super Ljava/lang/Object;
.source "MediaBrowser2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaBrowser2$3;->onError(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaBrowser2$3;


# direct methods
.method constructor <init>(Landroidx/media/MediaBrowser2$3;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaBrowser2$3;

    .line 336
    iput-object p1, p0, Landroidx/media/MediaBrowser2$3$2;->this$1:Landroidx/media/MediaBrowser2$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 339
    iget-object v0, p0, Landroidx/media/MediaBrowser2$3$2;->this$1:Landroidx/media/MediaBrowser2$3;

    iget-object v0, v0, Landroidx/media/MediaBrowser2$3;->this$0:Landroidx/media/MediaBrowser2;

    invoke-virtual {v0}, Landroidx/media/MediaBrowser2;->getCallback()Landroidx/media/MediaBrowser2$BrowserCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaBrowser2$3$2;->this$1:Landroidx/media/MediaBrowser2$3;

    iget-object v1, v1, Landroidx/media/MediaBrowser2$3;->this$0:Landroidx/media/MediaBrowser2;

    iget-object v2, p0, Landroidx/media/MediaBrowser2$3$2;->this$1:Landroidx/media/MediaBrowser2$3;

    iget-object v2, v2, Landroidx/media/MediaBrowser2$3;->val$mediaId:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroidx/media/MediaBrowser2$BrowserCallback;->onGetItemDone(Landroidx/media/MediaBrowser2;Ljava/lang/String;Landroidx/media/MediaItem2;)V

    .line 340
    return-void
.end method
