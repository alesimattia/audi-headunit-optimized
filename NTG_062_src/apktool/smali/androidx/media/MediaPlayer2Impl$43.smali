.class Landroidx/media/MediaPlayer2Impl$43;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnDrmPreparedListener;


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

    .line 1777
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$43;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$43;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDrmPrepared(Landroid/media/MediaPlayer;I)V
    .locals 2
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "status"    # I

    .line 1780
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$43;->this$0:Landroidx/media/MediaPlayer2Impl;

    new-instance v1, Landroidx/media/MediaPlayer2Impl$43$1;

    invoke-direct {v1, p0, p2}, Landroidx/media/MediaPlayer2Impl$43$1;-><init>(Landroidx/media/MediaPlayer2Impl$43;I)V

    invoke-static {v0, v1}, Landroidx/media/MediaPlayer2Impl;->access$2000(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$DrmEventNotifier;)V

    .line 1788
    return-void
.end method
