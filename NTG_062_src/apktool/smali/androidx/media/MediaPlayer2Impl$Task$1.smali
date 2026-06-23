.class Landroidx/media/MediaPlayer2Impl$Task$1;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl$Task;->sendCompleteNotification(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaPlayer2Impl$Task;

.field final synthetic val$status:I


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl$Task;I)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaPlayer2Impl$Task;

    .line 2014
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$Task$1;->this$1:Landroidx/media/MediaPlayer2Impl$Task;

    iput p2, p0, Landroidx/media/MediaPlayer2Impl$Task$1;->val$status:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/MediaPlayer2$EventCallback;)V
    .locals 4
    .param p1, "cb"    # Landroidx/media/MediaPlayer2$EventCallback;

    .line 2017
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$Task$1;->this$1:Landroidx/media/MediaPlayer2Impl$Task;

    iget-object v0, v0, Landroidx/media/MediaPlayer2Impl$Task;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$Task$1;->this$1:Landroidx/media/MediaPlayer2Impl$Task;

    .line 2018
    invoke-static {v1}, Landroidx/media/MediaPlayer2Impl$Task;->access$1300(Landroidx/media/MediaPlayer2Impl$Task;)Landroidx/media/DataSourceDesc;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$Task$1;->this$1:Landroidx/media/MediaPlayer2Impl$Task;

    invoke-static {v2}, Landroidx/media/MediaPlayer2Impl$Task;->access$1200(Landroidx/media/MediaPlayer2Impl$Task;)I

    move-result v2

    iget v3, p0, Landroidx/media/MediaPlayer2Impl$Task$1;->val$status:I

    .line 2017
    invoke-virtual {p1, v0, v1, v2, v3}, Landroidx/media/MediaPlayer2$EventCallback;->onCallCompleted(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;II)V

    .line 2019
    return-void
.end method
