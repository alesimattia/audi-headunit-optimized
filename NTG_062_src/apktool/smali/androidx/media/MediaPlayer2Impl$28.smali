.class Landroidx/media/MediaPlayer2Impl$28;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl;->notifyDrmEvent(Landroidx/media/MediaPlayer2Impl$DrmEventNotifier;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;

.field final synthetic val$notifier:Landroidx/media/MediaPlayer2Impl$DrmEventNotifier;

.field final synthetic val$record:Landroid/util/Pair;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$DrmEventNotifier;Landroid/util/Pair;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlayer2Impl;

    .line 1506
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$28;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$28;->val$notifier:Landroidx/media/MediaPlayer2Impl$DrmEventNotifier;

    iput-object p3, p0, Landroidx/media/MediaPlayer2Impl$28;->val$record:Landroid/util/Pair;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1509
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$28;->val$notifier:Landroidx/media/MediaPlayer2Impl$DrmEventNotifier;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$28;->val$record:Landroid/util/Pair;

    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Landroidx/media/MediaPlayer2$DrmEventCallback;

    invoke-interface {v0, v1}, Landroidx/media/MediaPlayer2Impl$DrmEventNotifier;->notify(Landroidx/media/MediaPlayer2$DrmEventCallback;)V

    .line 1510
    return-void
.end method
