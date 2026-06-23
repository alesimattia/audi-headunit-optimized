.class Landroidx/media/MediaPlayer2Impl$35$1;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl$35;->onError(Landroid/media/MediaPlayer;II)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaPlayer2Impl$35;

.field final synthetic val$extra:I

.field final synthetic val$what:I


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl$35;II)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaPlayer2Impl$35;

    .line 1656
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$35$1;->this$1:Landroidx/media/MediaPlayer2Impl$35;

    iput p2, p0, Landroidx/media/MediaPlayer2Impl$35$1;->val$what:I

    iput p3, p0, Landroidx/media/MediaPlayer2Impl$35$1;->val$extra:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/MediaPlayer2$EventCallback;)V
    .locals 4
    .param p1, "cb"    # Landroidx/media/MediaPlayer2$EventCallback;

    .line 1659
    invoke-static {}, Landroidx/media/MediaPlayer2Impl;->access$1700()Landroidx/collection/ArrayMap;

    move-result-object v0

    iget v1, p0, Landroidx/media/MediaPlayer2Impl$35$1;->val$what:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroidx/collection/ArrayMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1660
    .local v0, "w":I
    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$35$1;->this$1:Landroidx/media/MediaPlayer2Impl$35;

    iget-object v1, v1, Landroidx/media/MediaPlayer2Impl$35;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$35$1;->this$1:Landroidx/media/MediaPlayer2Impl$35;

    iget-object v2, v2, Landroidx/media/MediaPlayer2Impl$35;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-virtual {v2}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroidx/media/DataSourceDesc;

    move-result-object v2

    iget v3, p0, Landroidx/media/MediaPlayer2Impl$35$1;->val$extra:I

    invoke-virtual {p1, v1, v2, v0, v3}, Landroidx/media/MediaPlayer2$EventCallback;->onError(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;II)V

    .line 1661
    return-void
.end method
