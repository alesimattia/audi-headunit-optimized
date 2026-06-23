.class Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->onCurrentDataSourceChanged(Landroidx/media/BaseMediaPlayer;Landroidx/media/DataSourceDesc;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

.field final synthetic val$dsd:Landroidx/media/DataSourceDesc;

.field final synthetic val$player:Landroidx/media/BaseMediaPlayer;

.field final synthetic val$session:Landroidx/media/MediaSession2ImplBase;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroidx/media/DataSourceDesc;Landroidx/media/MediaSession2ImplBase;Landroidx/media/BaseMediaPlayer;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

    .line 1188
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->this$0:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$dsd:Landroidx/media/DataSourceDesc;

    iput-object p3, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$session:Landroidx/media/MediaSession2ImplBase;

    iput-object p4, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$player:Landroidx/media/BaseMediaPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1192
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$dsd:Landroidx/media/DataSourceDesc;

    if-nez v0, :cond_0

    .line 1195
    const/4 v0, 0x0

    .local v0, "item":Landroidx/media/MediaItem2;
    goto :goto_0

    .line 1197
    .end local v0    # "item":Landroidx/media/MediaItem2;
    :cond_0
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->this$0:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$session:Landroidx/media/MediaSession2ImplBase;

    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$dsd:Landroidx/media/DataSourceDesc;

    invoke-static {v0, v1, v2}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->access$300(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroidx/media/MediaSession2ImplBase;Landroidx/media/DataSourceDesc;)Landroidx/media/MediaItem2;

    move-result-object v0

    .line 1198
    .restart local v0    # "item":Landroidx/media/MediaItem2;
    if-nez v0, :cond_1

    .line 1199
    const-string v1, "MS2ImplBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot obtain media item from the dsd="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$dsd:Landroidx/media/DataSourceDesc;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1200
    return-void

    .line 1203
    :cond_1
    :goto_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$session:Landroidx/media/MediaSession2ImplBase;

    invoke-virtual {v1}, Landroidx/media/MediaSession2ImplBase;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$session:Landroidx/media/MediaSession2ImplBase;

    invoke-virtual {v2}, Landroidx/media/MediaSession2ImplBase;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$player:Landroidx/media/BaseMediaPlayer;

    invoke-virtual {v1, v2, v3, v0}, Landroidx/media/MediaSession2$SessionCallback;->onCurrentMediaItemChanged(Landroidx/media/MediaSession2;Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaItem2;)V

    .line 1205
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$session:Landroidx/media/MediaSession2ImplBase;

    new-instance v2, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1$1;

    invoke-direct {v2, p0, v0}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1$1;-><init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$1;Landroidx/media/MediaItem2;)V

    invoke-static {v1, v2}, Landroidx/media/MediaSession2ImplBase;->access$400(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1211
    return-void
.end method
