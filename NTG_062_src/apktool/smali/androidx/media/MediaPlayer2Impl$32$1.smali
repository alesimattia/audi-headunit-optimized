.class Landroidx/media/MediaPlayer2Impl$32$1;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl$32;->onVideoSizeChanged(Landroid/media/MediaPlayer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaPlayer2Impl$32;

.field final synthetic val$height:I

.field final synthetic val$width:I


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl$32;II)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaPlayer2Impl$32;

    .line 1603
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$32$1;->this$1:Landroidx/media/MediaPlayer2Impl$32;

    iput p2, p0, Landroidx/media/MediaPlayer2Impl$32$1;->val$width:I

    iput p3, p0, Landroidx/media/MediaPlayer2Impl$32$1;->val$height:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/MediaPlayer2$EventCallback;)V
    .locals 4
    .param p1, "cb"    # Landroidx/media/MediaPlayer2$EventCallback;

    .line 1606
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$32$1;->this$1:Landroidx/media/MediaPlayer2Impl$32;

    iget-object v0, v0, Landroidx/media/MediaPlayer2Impl$32;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$32$1;->this$1:Landroidx/media/MediaPlayer2Impl$32;

    iget-object v1, v1, Landroidx/media/MediaPlayer2Impl$32;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-virtual {v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroidx/media/DataSourceDesc;

    move-result-object v1

    iget v2, p0, Landroidx/media/MediaPlayer2Impl$32$1;->val$width:I

    iget v3, p0, Landroidx/media/MediaPlayer2Impl$32$1;->val$height:I

    invoke-virtual {p1, v0, v1, v2, v3}, Landroidx/media/MediaPlayer2$EventCallback;->onVideoSizeChanged(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;II)V

    .line 1607
    return-void
.end method
