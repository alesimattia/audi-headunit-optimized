.class Landroidx/media/MediaPlayer2Impl$13$1;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl$13;->process()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaPlayer2Impl$13;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl$13;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaPlayer2Impl$13;

    .line 591
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$13$1;->this$1:Landroidx/media/MediaPlayer2Impl$13;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/MediaPlayer2$EventCallback;)V
    .locals 2
    .param p1, "cb"    # Landroidx/media/MediaPlayer2$EventCallback;

    .line 594
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$13$1;->this$1:Landroidx/media/MediaPlayer2Impl$13;

    iget-object v0, v0, Landroidx/media/MediaPlayer2Impl$13;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$13$1;->this$1:Landroidx/media/MediaPlayer2Impl$13;

    iget-object v1, v1, Landroidx/media/MediaPlayer2Impl$13;->val$label:Ljava/lang/Object;

    invoke-virtual {p1, v0, v1}, Landroidx/media/MediaPlayer2$EventCallback;->onCommandLabelReached(Landroidx/media/MediaPlayer2;Ljava/lang/Object;)V

    .line 595
    return-void
.end method
