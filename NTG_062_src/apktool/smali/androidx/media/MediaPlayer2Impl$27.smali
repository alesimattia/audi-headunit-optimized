.class Landroidx/media/MediaPlayer2Impl$27;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl;->notifyPlayerEvent(Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;

.field final synthetic val$cb:Landroidx/media/BaseMediaPlayer$PlayerEventCallback;

.field final synthetic val$notifier:Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;Landroidx/media/BaseMediaPlayer$PlayerEventCallback;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlayer2Impl;

    .line 1491
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$27;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$27;->val$notifier:Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;

    iput-object p3, p0, Landroidx/media/MediaPlayer2Impl$27;->val$cb:Landroidx/media/BaseMediaPlayer$PlayerEventCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1494
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$27;->val$notifier:Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$27;->val$cb:Landroidx/media/BaseMediaPlayer$PlayerEventCallback;

    invoke-interface {v0, v1}, Landroidx/media/MediaPlayer2Impl$PlayerEventNotifier;->notify(Landroidx/media/BaseMediaPlayer$PlayerEventCallback;)V

    .line 1495
    return-void
.end method
