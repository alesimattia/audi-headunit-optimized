.class Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$1;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->onCompletion(Landroid/media/MediaPlayer;)Landroidx/media/MediaPlayer2Impl$DataSourceError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

.field final synthetic val$dsd:Landroidx/media/DataSourceDesc;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;Landroidx/media/DataSourceDesc;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    .line 2185
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$1;->this$1:Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$1;->val$dsd:Landroidx/media/DataSourceDesc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/MediaPlayer2$EventCallback;)V
    .locals 4
    .param p1, "callback"    # Landroidx/media/MediaPlayer2$EventCallback;

    .line 2188
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$1;->this$1:Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    iget-object v0, v0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue$1;->val$dsd:Landroidx/media/DataSourceDesc;

    const/4 v2, 0x6

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v1, v2, v3}, Landroidx/media/MediaPlayer2$EventCallback;->onInfo(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;II)V

    .line 2189
    return-void
.end method
