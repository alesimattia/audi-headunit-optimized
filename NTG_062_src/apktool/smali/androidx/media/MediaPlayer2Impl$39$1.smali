.class Landroidx/media/MediaPlayer2Impl$39$1;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl$39;->onBufferingUpdate(Landroid/media/MediaPlayer;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaPlayer2Impl$39;

.field final synthetic val$percent:I


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl$39;I)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaPlayer2Impl$39;

    .line 1730
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$39$1;->this$1:Landroidx/media/MediaPlayer2Impl$39;

    iput p2, p0, Landroidx/media/MediaPlayer2Impl$39$1;->val$percent:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/MediaPlayer2$EventCallback;)V
    .locals 4
    .param p1, "cb"    # Landroidx/media/MediaPlayer2$EventCallback;

    .line 1733
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$39$1;->this$1:Landroidx/media/MediaPlayer2Impl$39;

    iget-object v0, v0, Landroidx/media/MediaPlayer2Impl$39;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$39$1;->this$1:Landroidx/media/MediaPlayer2Impl$39;

    iget-object v1, v1, Landroidx/media/MediaPlayer2Impl$39;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-virtual {v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroidx/media/DataSourceDesc;

    move-result-object v1

    iget v2, p0, Landroidx/media/MediaPlayer2Impl$39$1;->val$percent:I

    const/16 v3, 0x2c0

    invoke-virtual {p1, v0, v1, v3, v2}, Landroidx/media/MediaPlayer2$EventCallback;->onInfo(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;II)V

    .line 1735
    return-void
.end method
