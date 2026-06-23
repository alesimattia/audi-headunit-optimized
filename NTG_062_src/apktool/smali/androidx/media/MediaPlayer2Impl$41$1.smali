.class Landroidx/media/MediaPlayer2Impl$41$1;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl$41;->onSubtitleData(Landroid/media/MediaPlayer;Landroid/media/SubtitleData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaPlayer2Impl$41;

.field final synthetic val$data:Landroid/media/SubtitleData;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl$41;Landroid/media/SubtitleData;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaPlayer2Impl$41;

    .line 1757
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$41$1;->this$1:Landroidx/media/MediaPlayer2Impl$41;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$41$1;->val$data:Landroid/media/SubtitleData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/MediaPlayer2$EventCallback;)V
    .locals 3
    .param p1, "cb"    # Landroidx/media/MediaPlayer2$EventCallback;

    .line 1760
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$41$1;->this$1:Landroidx/media/MediaPlayer2Impl$41;

    iget-object v0, v0, Landroidx/media/MediaPlayer2Impl$41;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$41$1;->this$1:Landroidx/media/MediaPlayer2Impl$41;

    iget-object v1, v1, Landroidx/media/MediaPlayer2Impl$41;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-virtual {v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroidx/media/DataSourceDesc;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$41$1;->val$data:Landroid/media/SubtitleData;

    invoke-virtual {p1, v0, v1, v2}, Landroidx/media/MediaPlayer2$EventCallback;->onSubtitleData(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;Landroid/media/SubtitleData;)V

    .line 1761
    return-void
.end method
