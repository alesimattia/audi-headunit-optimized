.class Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->onBufferingStateChanged(Landroidx/media/BaseMediaPlayer;Landroidx/media/DataSourceDesc;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

.field final synthetic val$dsd:Landroidx/media/DataSourceDesc;

.field final synthetic val$mpb:Landroidx/media/BaseMediaPlayer;

.field final synthetic val$session:Landroidx/media/MediaSession2ImplBase;

.field final synthetic val$state:I


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroidx/media/MediaSession2ImplBase;Landroidx/media/DataSourceDesc;Landroidx/media/BaseMediaPlayer;I)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

    .line 1309
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;->this$0:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;->val$session:Landroidx/media/MediaSession2ImplBase;

    iput-object p3, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;->val$dsd:Landroidx/media/DataSourceDesc;

    iput-object p4, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;->val$mpb:Landroidx/media/BaseMediaPlayer;

    iput p5, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;->val$state:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1312
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;->this$0:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;->val$session:Landroidx/media/MediaSession2ImplBase;

    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;->val$dsd:Landroidx/media/DataSourceDesc;

    invoke-static {v0, v1, v2}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->access$300(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroidx/media/MediaSession2ImplBase;Landroidx/media/DataSourceDesc;)Landroidx/media/MediaItem2;

    move-result-object v0

    .line 1313
    .local v0, "item":Landroidx/media/MediaItem2;
    if-nez v0, :cond_0

    .line 1314
    return-void

    .line 1316
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;->val$session:Landroidx/media/MediaSession2ImplBase;

    invoke-virtual {v1}, Landroidx/media/MediaSession2ImplBase;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;->val$session:Landroidx/media/MediaSession2ImplBase;

    .line 1317
    invoke-virtual {v2}, Landroidx/media/MediaSession2ImplBase;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;->val$mpb:Landroidx/media/BaseMediaPlayer;

    iget v4, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;->val$state:I

    .line 1316
    invoke-virtual {v1, v2, v3, v0, v4}, Landroidx/media/MediaSession2$SessionCallback;->onBufferingStateChanged(Landroidx/media/MediaSession2;Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaItem2;I)V

    .line 1318
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;->val$session:Landroidx/media/MediaSession2ImplBase;

    new-instance v2, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4$1;

    invoke-direct {v2, p0, v0}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4$1;-><init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$4;Landroidx/media/MediaItem2;)V

    invoke-static {v1, v2}, Landroidx/media/MediaSession2ImplBase;->access$400(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1324
    return-void
.end method
