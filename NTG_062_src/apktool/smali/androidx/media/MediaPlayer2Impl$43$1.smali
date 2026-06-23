.class Landroidx/media/MediaPlayer2Impl$43$1;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$DrmEventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl$43;->onDrmPrepared(Landroid/media/MediaPlayer;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaPlayer2Impl$43;

.field final synthetic val$status:I


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl$43;I)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaPlayer2Impl$43;

    .line 1780
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$43$1;->this$1:Landroidx/media/MediaPlayer2Impl$43;

    iput p2, p0, Landroidx/media/MediaPlayer2Impl$43$1;->val$status:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/MediaPlayer2$DrmEventCallback;)V
    .locals 3
    .param p1, "cb"    # Landroidx/media/MediaPlayer2$DrmEventCallback;

    .line 1783
    invoke-static {}, Landroidx/media/MediaPlayer2Impl;->access$2100()Landroidx/collection/ArrayMap;

    move-result-object v0

    iget v1, p0, Landroidx/media/MediaPlayer2Impl$43$1;->val$status:I

    .line 1784
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1783
    invoke-virtual {v0, v1, v2}, Landroidx/collection/ArrayMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1785
    .local v0, "s":I
    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$43$1;->this$1:Landroidx/media/MediaPlayer2Impl$43;

    iget-object v1, v1, Landroidx/media/MediaPlayer2Impl$43;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$43$1;->this$1:Landroidx/media/MediaPlayer2Impl$43;

    iget-object v2, v2, Landroidx/media/MediaPlayer2Impl$43;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-virtual {v2}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroidx/media/DataSourceDesc;

    move-result-object v2

    invoke-virtual {p1, v1, v2, v0}, Landroidx/media/MediaPlayer2$DrmEventCallback;->onDrmPrepared(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;I)V

    .line 1786
    return-void
.end method
