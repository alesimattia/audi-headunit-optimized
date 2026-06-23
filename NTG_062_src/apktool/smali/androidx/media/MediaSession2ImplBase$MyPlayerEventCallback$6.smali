.class Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$6;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->onSeekCompleted(Landroidx/media/BaseMediaPlayer;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

.field final synthetic val$mpb:Landroidx/media/BaseMediaPlayer;

.field final synthetic val$position:J

.field final synthetic val$session:Landroidx/media/MediaSession2ImplBase;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroidx/media/MediaSession2ImplBase;Landroidx/media/BaseMediaPlayer;J)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

    .line 1354
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$6;->this$0:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$6;->val$session:Landroidx/media/MediaSession2ImplBase;

    iput-object p3, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$6;->val$mpb:Landroidx/media/BaseMediaPlayer;

    iput-wide p4, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$6;->val$position:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1357
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$6;->val$session:Landroidx/media/MediaSession2ImplBase;

    invoke-virtual {v0}, Landroidx/media/MediaSession2ImplBase;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$6;->val$session:Landroidx/media/MediaSession2ImplBase;

    invoke-virtual {v1}, Landroidx/media/MediaSession2ImplBase;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$6;->val$mpb:Landroidx/media/BaseMediaPlayer;

    iget-wide v3, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$6;->val$position:J

    invoke-virtual {v0, v1, v2, v3, v4}, Landroidx/media/MediaSession2$SessionCallback;->onSeekCompleted(Landroidx/media/MediaSession2;Landroidx/media/BaseMediaPlayer;J)V

    .line 1358
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$6;->val$session:Landroidx/media/MediaSession2ImplBase;

    new-instance v1, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$6$1;

    invoke-direct {v1, p0}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$6$1;-><init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$6;)V

    invoke-static {v0, v1}, Landroidx/media/MediaSession2ImplBase;->access$400(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1364
    return-void
.end method
