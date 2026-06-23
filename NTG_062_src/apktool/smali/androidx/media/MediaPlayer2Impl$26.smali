.class Landroidx/media/MediaPlayer2Impl$26;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl;->notifyMediaPlayer2Event(Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;

.field final synthetic val$notifier:Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;

.field final synthetic val$record:Landroid/util/Pair;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;Landroid/util/Pair;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlayer2Impl;

    .line 1473
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$26;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$26;->val$notifier:Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;

    iput-object p3, p0, Landroidx/media/MediaPlayer2Impl$26;->val$record:Landroid/util/Pair;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1476
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$26;->val$notifier:Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$26;->val$record:Landroid/util/Pair;

    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Landroidx/media/MediaPlayer2$EventCallback;

    invoke-interface {v0, v1}, Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;->notify(Landroidx/media/MediaPlayer2$EventCallback;)V

    .line 1477
    return-void
.end method
