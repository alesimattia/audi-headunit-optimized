.class Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->onMediaPrepared(Landroidx/media/BaseMediaPlayer;Landroidx/media/DataSourceDesc;)V
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


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroidx/media/MediaSession2ImplBase;Landroidx/media/DataSourceDesc;Landroidx/media/BaseMediaPlayer;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

    .line 1221
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;->this$0:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;->val$session:Landroidx/media/MediaSession2ImplBase;

    iput-object p3, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;->val$dsd:Landroidx/media/DataSourceDesc;

    iput-object p4, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;->val$mpb:Landroidx/media/BaseMediaPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1224
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;->this$0:Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;

    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;->val$session:Landroidx/media/MediaSession2ImplBase;

    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;->val$dsd:Landroidx/media/DataSourceDesc;

    invoke-static {v0, v1, v2}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;->access$300(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroidx/media/MediaSession2ImplBase;Landroidx/media/DataSourceDesc;)Landroidx/media/MediaItem2;

    move-result-object v0

    .line 1225
    .local v0, "item":Landroidx/media/MediaItem2;
    if-nez v0, :cond_0

    .line 1226
    return-void

    .line 1228
    :cond_0
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;->val$session:Landroidx/media/MediaSession2ImplBase;

    invoke-virtual {v1}, Landroidx/media/MediaSession2ImplBase;->getCurrentMediaItem()Landroidx/media/MediaItem2;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/media/MediaItem2;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1229
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;->val$session:Landroidx/media/MediaSession2ImplBase;

    invoke-virtual {v1}, Landroidx/media/MediaSession2ImplBase;->getDuration()J

    move-result-wide v1

    .line 1230
    .local v1, "duration":J
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-gez v3, :cond_1

    .line 1231
    return-void

    .line 1233
    :cond_1
    invoke-virtual {v0}, Landroidx/media/MediaItem2;->getMetadata()Landroidx/media/MediaMetadata2;

    move-result-object v3

    .line 1234
    .local v3, "metadata":Landroidx/media/MediaMetadata2;
    if-eqz v3, :cond_4

    .line 1235
    const-string v4, "android.media.metadata.DURATION"

    invoke-virtual {v3, v4}, Landroidx/media/MediaMetadata2;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 1236
    new-instance v4, Landroidx/media/MediaMetadata2$Builder;

    invoke-direct {v4, v3}, Landroidx/media/MediaMetadata2$Builder;-><init>(Landroidx/media/MediaMetadata2;)V

    const-string v5, "android.media.metadata.DURATION"

    invoke-virtual {v4, v5, v1, v2}, Landroidx/media/MediaMetadata2$Builder;->putLong(Ljava/lang/String;J)Landroidx/media/MediaMetadata2$Builder;

    move-result-object v4

    .line 1237
    invoke-virtual {v4}, Landroidx/media/MediaMetadata2$Builder;->build()Landroidx/media/MediaMetadata2;

    move-result-object v3

    goto :goto_0

    .line 1239
    :cond_2
    const-string v4, "android.media.metadata.DURATION"

    .line 1240
    invoke-virtual {v3, v4}, Landroidx/media/MediaMetadata2;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 1241
    .local v4, "durationFromMetadata":J
    cmp-long v6, v1, v4

    if-eqz v6, :cond_3

    .line 1244
    const-string v6, "MS2ImplBase"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "duration mismatch for an item. duration from player="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v8, " duration from metadata="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v8, ". May be a timing issue?"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1253
    :cond_3
    const/4 v3, 0x0

    .line 1254
    .end local v4    # "durationFromMetadata":J
    goto :goto_0

    .line 1256
    :cond_4
    new-instance v4, Landroidx/media/MediaMetadata2$Builder;

    invoke-direct {v4}, Landroidx/media/MediaMetadata2$Builder;-><init>()V

    const-string v5, "android.media.metadata.DURATION"

    .line 1257
    invoke-virtual {v4, v5, v1, v2}, Landroidx/media/MediaMetadata2$Builder;->putLong(Ljava/lang/String;J)Landroidx/media/MediaMetadata2$Builder;

    move-result-object v4

    const-string v5, "android.media.metadata.MEDIA_ID"

    .line 1259
    invoke-virtual {v0}, Landroidx/media/MediaItem2;->getMediaId()Ljava/lang/String;

    move-result-object v6

    .line 1258
    invoke-virtual {v4, v5, v6}, Landroidx/media/MediaMetadata2$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroidx/media/MediaMetadata2$Builder;

    move-result-object v4

    .line 1260
    invoke-virtual {v4}, Landroidx/media/MediaMetadata2$Builder;->build()Landroidx/media/MediaMetadata2;

    move-result-object v3

    .line 1262
    :goto_0
    if-eqz v3, :cond_5

    .line 1263
    invoke-virtual {v0, v3}, Landroidx/media/MediaItem2;->setMetadata(Landroidx/media/MediaMetadata2;)V

    .line 1264
    iget-object v4, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;->val$session:Landroidx/media/MediaSession2ImplBase;

    new-instance v5, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2$1;

    invoke-direct {v5, p0}, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2$1;-><init>(Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;)V

    invoke-static {v4, v5}, Landroidx/media/MediaSession2ImplBase;->access$400(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V

    .line 1273
    .end local v1    # "duration":J
    .end local v3    # "metadata":Landroidx/media/MediaMetadata2;
    :cond_5
    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;->val$session:Landroidx/media/MediaSession2ImplBase;

    invoke-virtual {v1}, Landroidx/media/MediaSession2ImplBase;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;->val$session:Landroidx/media/MediaSession2ImplBase;

    invoke-virtual {v2}, Landroidx/media/MediaSession2ImplBase;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaSession2ImplBase$MyPlayerEventCallback$2;->val$mpb:Landroidx/media/BaseMediaPlayer;

    invoke-virtual {v1, v2, v3, v0}, Landroidx/media/MediaSession2$SessionCallback;->onMediaPrepared(Landroidx/media/MediaSession2;Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaItem2;)V

    .line 1274
    return-void
.end method
