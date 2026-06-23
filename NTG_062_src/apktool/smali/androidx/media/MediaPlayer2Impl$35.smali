.class Landroidx/media/MediaPlayer2Impl$35;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


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

    .line 1652
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$35;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$35;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 2
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .line 1655
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$35;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$100(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->onError(Landroid/media/MediaPlayer;)V

    .line 1656
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$35;->this$0:Landroidx/media/MediaPlayer2Impl;

    new-instance v1, Landroidx/media/MediaPlayer2Impl$35$1;

    invoke-direct {v1, p0, p2, p3}, Landroidx/media/MediaPlayer2Impl$35$1;-><init>(Landroidx/media/MediaPlayer2Impl$35;II)V

    invoke-static {v0, v1}, Landroidx/media/MediaPlayer2Impl;->access$600(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;)V

    .line 1663
    const/4 v0, 0x1

    return v0
.end method
