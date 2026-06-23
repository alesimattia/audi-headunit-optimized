.class Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->onPlayerStateChanged(Landroidx/media/BaseMediaPlayer;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

.field final synthetic val$player:Landroidx/media/BaseMediaPlayer;

.field final synthetic val$session:Landroidx/media/MediaSession2ImplBase;

.field final synthetic val$state:I


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroidx/media/MediaSession2ImplBase;ILandroidx/media/BaseMediaPlayer;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

    .line 1284
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;->this$0:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;->val$session:Landroidx/media/MediaSession2ImplBase;

    iput p3, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;->val$state:I

    iput-object p4, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;->val$player:Landroidx/media/BaseMediaPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1289
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;->val$session:Landroidx/media/MediaSession2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaSession2ImplBase;->access$500(Landroidx/media/MediaSession2ImplBase;)Landroidx/media/AudioFocusHandler;

    move-result-object v0

    iget v1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;->val$state:I

    invoke-virtual {v0, v1}, Landroidx/media/AudioFocusHandler;->onPlayerStateChanged(I)V

    .line 1290
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;->val$session:Landroidx/media/MediaSession2ImplBase;

    invoke-virtual {v0}, Landroidx/media/MediaSession2ImplBase;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;->val$session:Landroidx/media/MediaSession2ImplBase;

    .line 1291
    invoke-virtual {v1}, Landroidx/media/MediaSession2ImplBase;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;->val$player:Landroidx/media/BaseMediaPlayer;

    iget v3, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;->val$state:I

    .line 1290
    invoke-virtual {v0, v1, v2, v3}, Landroidx/media/MediaSession2$SessionCallback;->onPlayerStateChanged(Landroidx/media/MediaSession2;Landroidx/media/BaseMediaPlayer;I)V

    .line 1292
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;->val$session:Landroidx/media/MediaSession2ImplBase;

    new-instance v1, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3$1;

    invoke-direct {v1, p0}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3$1;-><init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$3;)V

    invoke-static {v0, v1}, Landroidx/media/MediaSession2ImplBase;->access$400(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1298
    return-void
.end method
