.class Landroidx/media/MediaPlayer2Impl$33$1;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl$33;->onInfo(Landroid/media/MediaPlayer;II)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaPlayer2Impl$33;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl$33;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaPlayer2Impl$33;

    .line 1616
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$33$1;->this$1:Landroidx/media/MediaPlayer2Impl$33;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/MediaPlayer2$EventCallback;)V
    .locals 4
    .param p1, "cb"    # Landroidx/media/MediaPlayer2$EventCallback;

    .line 1619
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$33$1;->this$1:Landroidx/media/MediaPlayer2Impl$33;

    iget-object v0, v0, Landroidx/media/MediaPlayer2Impl$33;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$33$1;->this$1:Landroidx/media/MediaPlayer2Impl$33;

    iget-object v1, v1, Landroidx/media/MediaPlayer2Impl$33;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-virtual {v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroidx/media/DataSourceDesc;

    move-result-object v1

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v1, v2, v3}, Landroidx/media/MediaPlayer2$EventCallback;->onInfo(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;II)V

    .line 1621
    return-void
.end method
