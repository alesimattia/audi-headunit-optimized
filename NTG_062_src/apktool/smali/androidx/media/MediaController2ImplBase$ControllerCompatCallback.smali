.class final Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;
.super Landroid/support/v4/media/session/MediaControllerCompat$Callback;
.source "MediaController2ImplBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaController2ImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ControllerCompatCallback"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaController2ImplBase;


# direct methods
.method private constructor <init>(Landroidx/media/MediaController2ImplBase;)V
    .locals 0

    .line 984
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-direct {p0}, Landroid/support/v4/media/session/MediaControllerCompat$Callback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroidx/media/MediaController2ImplBase;Landroidx/media/MediaController2ImplBase$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p2, "x1"    # Landroidx/media/MediaController2ImplBase$1;

    .line 984
    invoke-direct {p0, p1}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;-><init>(Landroidx/media/MediaController2ImplBase;)V

    return-void
.end method


# virtual methods
.method public onMetadataChanged(Landroid/support/v4/media/MediaMetadataCompat;)V
    .locals 2
    .param p1, "metadata"    # Landroid/support/v4/media/MediaMetadataCompat;

    .line 1038
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 1039
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1, p1}, Landroidx/media/MediaController2ImplBase;->access$1702(Landroidx/media/MediaController2ImplBase;Landroid/support/v4/media/MediaMetadataCompat;)Landroid/support/v4/media/MediaMetadataCompat;

    .line 1040
    monitor-exit v0

    .line 1041
    return-void

    .line 1040
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onPlaybackStateChanged(Landroid/support/v4/media/session/PlaybackStateCompat;)V
    .locals 2
    .param p1, "state"    # Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 1031
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 1032
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1, p1}, Landroidx/media/MediaController2ImplBase;->access$1602(Landroidx/media/MediaController2ImplBase;Landroid/support/v4/media/session/PlaybackStateCompat;)Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 1033
    monitor-exit v0

    .line 1034
    return-void

    .line 1033
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onSessionDestroyed()V
    .locals 1

    .line 1026
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-virtual {v0}, Landroidx/media/MediaController2ImplBase;->close()V

    .line 1027
    return-void
.end method

.method public onSessionEvent(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 6
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "extras"    # Landroid/os/Bundle;

    .line 1045
    if-eqz p2, :cond_0

    .line 1046
    const-class v0, Landroidx/media/MediaSession2;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 1048
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, -0x1

    sparse-switch v0, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v0, "androidx.media.session.event.ON_SEEK_COMPLETED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0xe

    goto/16 :goto_1

    :sswitch_1
    const-string v0, "androidx.media.session.event.ON_CHILDREN_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0xf

    goto/16 :goto_1

    :sswitch_2
    const-string v0, "androidx.media.session.event.ON_ALLOWED_COMMANDS_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    goto/16 :goto_1

    :sswitch_3
    const-string v0, "androidx.media.session.event.ON_SEARCH_RESULT_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x10

    goto/16 :goto_1

    :sswitch_4
    const-string v0, "androidx.media.session.event.ON_SHUFFLE_MODE_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x8

    goto/16 :goto_1

    :sswitch_5
    const-string v0, "androidx.media.session.event.ON_PLAYLIST_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x5

    goto/16 :goto_1

    :sswitch_6
    const-string v0, "androidx.media.session.event.SET_CUSTOM_LAYOUT"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0xa

    goto/16 :goto_1

    :sswitch_7
    const-string v0, "androidx.media.session.event.ON_PLAYLIST_METADATA_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x6

    goto :goto_1

    :sswitch_8
    const-string v0, "androidx.media.session.event.SEND_CUSTOM_COMMAND"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x9

    goto :goto_1

    :sswitch_9
    const-string v0, "androidx.media.session.event.ON_REPEAT_MODE_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x7

    goto :goto_1

    :sswitch_a
    const-string v0, "androidx.media.session.event.ON_ROUTES_INFO_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x4

    goto :goto_1

    :sswitch_b
    const-string v0, "androidx.media.session.event.ON_CURRENT_MEDIA_ITEM_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    goto :goto_1

    :sswitch_c
    const-string v0, "androidx.media.session.event.ON_ERROR"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x3

    goto :goto_1

    :sswitch_d
    const-string v0, "androidx.media.session.event.ON_PLAYER_STATE_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :sswitch_e
    const-string v0, "androidx.media.session.event.ON_PLAYBACK_INFO_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0xb

    goto :goto_1

    :sswitch_f
    const-string v0, "androidx.media.session.event.ON_PLAYBACK_SPEED_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0xc

    goto :goto_1

    :sswitch_10
    const-string v0, "androidx.media.session.event.ON_BUFFERING_STATE_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0xd

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v1

    :goto_1
    packed-switch v0, :pswitch_data_0

    goto/16 :goto_5

    .line 1290
    :pswitch_0
    const-string v0, "androidx.media.argument.QUERY"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1291
    .local v0, "query":Ljava/lang/String;
    if-eqz v0, :cond_3

    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v2}, Landroidx/media/MediaController2ImplBase;->access$000(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2;

    move-result-object v2

    instance-of v2, v2, Landroidx/media/MediaBrowser2;

    if-nez v2, :cond_2

    goto :goto_2

    .line 1294
    :cond_2
    const-string v2, "androidx.media.argument.ITEM_COUNT"

    invoke-virtual {p2, v2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 1295
    .local v1, "itemCount":I
    const-string v2, "androidx.media.argument.EXTRAS"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    .line 1296
    .local v2, "searchExtras":Landroid/os/Bundle;
    iget-object v3, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v3}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v3

    new-instance v4, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$17;

    invoke-direct {v4, p0, v0, v1, v2}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$17;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Ljava/lang/String;ILandroid/os/Bundle;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1303
    goto/16 :goto_5

    .line 1292
    .end local v1    # "itemCount":I
    .end local v2    # "searchExtras":Landroid/os/Bundle;
    :cond_3
    :goto_2
    return-void

    .line 1279
    .end local v0    # "query":Ljava/lang/String;
    :pswitch_1
    const-string v0, "androidx.media.argument.MEDIA_ID"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1280
    .local v0, "parentId":Ljava/lang/String;
    if-eqz v0, :cond_5

    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v2}, Landroidx/media/MediaController2ImplBase;->access$000(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2;

    move-result-object v2

    instance-of v2, v2, Landroidx/media/MediaBrowser2;

    if-nez v2, :cond_4

    goto :goto_3

    .line 1283
    :cond_4
    const-string v2, "androidx.media.argument.ITEM_COUNT"

    invoke-virtual {p2, v2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 1284
    .restart local v1    # "itemCount":I
    const-string v2, "androidx.media.argument.EXTRAS"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    .line 1285
    .local v2, "childrenExtras":Landroid/os/Bundle;
    iget-object v3, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v3}, Landroidx/media/MediaController2ImplBase;->access$100(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2$ControllerCallback;

    move-result-object v3

    check-cast v3, Landroidx/media/MediaBrowser2$BrowserCallback;

    iget-object v4, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    .line 1286
    invoke-static {v4}, Landroidx/media/MediaController2ImplBase;->access$000(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2;

    move-result-object v4

    check-cast v4, Landroidx/media/MediaBrowser2;

    .line 1285
    invoke-virtual {v3, v4, v0, v1, v2}, Landroidx/media/MediaBrowser2$BrowserCallback;->onChildrenChanged(Landroidx/media/MediaBrowser2;Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 1287
    goto/16 :goto_5

    .line 1281
    .end local v1    # "itemCount":I
    .end local v2    # "childrenExtras":Landroid/os/Bundle;
    :cond_5
    :goto_3
    return-void

    .line 1261
    .end local v0    # "parentId":Ljava/lang/String;
    :pswitch_2
    const-string v0, "androidx.media.argument.SEEK_POSITION"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 1262
    .local v0, "position":J
    const-string v2, "androidx.media.argument.PLAYBACK_STATE_COMPAT"

    .line 1263
    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 1264
    .local v2, "state":Landroid/support/v4/media/session/PlaybackStateCompat;
    if-nez v2, :cond_6

    .line 1265
    return-void

    .line 1267
    :cond_6
    iget-object v3, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v3}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 1268
    :try_start_0
    iget-object v4, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v4, v2}, Landroidx/media/MediaController2ImplBase;->access$1602(Landroidx/media/MediaController2ImplBase;Landroid/support/v4/media/session/PlaybackStateCompat;)Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 1269
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1270
    iget-object v3, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v3}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v3

    new-instance v4, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$16;

    invoke-direct {v4, p0, v0, v1}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$16;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;J)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1276
    goto/16 :goto_5

    .line 1269
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 1240
    .end local v0    # "position":J
    .end local v2    # "state":Landroid/support/v4/media/session/PlaybackStateCompat;
    :pswitch_3
    const-string v0, "androidx.media.argument.MEDIA_ITEM"

    .line 1241
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 1240
    invoke-static {v0}, Landroidx/media/MediaItem2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaItem2;

    move-result-object v0

    .line 1242
    .local v0, "item":Landroidx/media/MediaItem2;
    const-string v1, "androidx.media.argument.BUFFERING_STATE"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 1243
    .local v1, "bufferingState":I
    const-string v2, "androidx.media.argument.PLAYBACK_STATE_COMPAT"

    .line 1244
    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 1245
    .restart local v2    # "state":Landroid/support/v4/media/session/PlaybackStateCompat;
    if-eqz v0, :cond_8

    if-nez v2, :cond_7

    goto :goto_4

    .line 1248
    :cond_7
    iget-object v3, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v3}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 1249
    :try_start_2
    iget-object v4, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v4, v1}, Landroidx/media/MediaController2ImplBase;->access$2602(Landroidx/media/MediaController2ImplBase;I)I

    .line 1250
    iget-object v4, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v4, v2}, Landroidx/media/MediaController2ImplBase;->access$1602(Landroidx/media/MediaController2ImplBase;Landroid/support/v4/media/session/PlaybackStateCompat;)Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 1251
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1252
    iget-object v3, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v3}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v3

    new-instance v4, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$15;

    invoke-direct {v4, p0, v0, v1}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$15;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Landroidx/media/MediaItem2;I)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1258
    goto/16 :goto_5

    .line 1251
    :catchall_1
    move-exception v4

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v4

    .line 1246
    :cond_8
    :goto_4
    return-void

    .line 1223
    .end local v0    # "item":Landroidx/media/MediaItem2;
    .end local v1    # "bufferingState":I
    .end local v2    # "state":Landroid/support/v4/media/session/PlaybackStateCompat;
    :pswitch_4
    const-string v0, "androidx.media.argument.PLAYBACK_STATE_COMPAT"

    .line 1224
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 1225
    .local v0, "state":Landroid/support/v4/media/session/PlaybackStateCompat;
    if-nez v0, :cond_9

    .line 1226
    return-void

    .line 1228
    :cond_9
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 1229
    :try_start_4
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v2, v0}, Landroidx/media/MediaController2ImplBase;->access$1602(Landroidx/media/MediaController2ImplBase;Landroid/support/v4/media/session/PlaybackStateCompat;)Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 1230
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 1231
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$14;

    invoke-direct {v2, p0, v0}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$14;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Landroid/support/v4/media/session/PlaybackStateCompat;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1237
    goto/16 :goto_5

    .line 1230
    :catchall_2
    move-exception v2

    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v2

    .line 1206
    .end local v0    # "state":Landroid/support/v4/media/session/PlaybackStateCompat;
    :pswitch_5
    const-string v0, "androidx.media.argument.PLAYBACK_INFO"

    .line 1207
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 1206
    invoke-static {v0}, Landroidx/media/MediaController2$PlaybackInfo;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaController2$PlaybackInfo;

    move-result-object v0

    .line 1208
    .local v0, "info":Landroidx/media/MediaController2$PlaybackInfo;
    if-nez v0, :cond_a

    .line 1209
    return-void

    .line 1211
    :cond_a
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 1212
    :try_start_6
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v2, v0}, Landroidx/media/MediaController2ImplBase;->access$2502(Landroidx/media/MediaController2ImplBase;Landroidx/media/MediaController2$PlaybackInfo;)Landroidx/media/MediaController2$PlaybackInfo;

    .line 1213
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 1214
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$13;

    invoke-direct {v2, p0, v0}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$13;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Landroidx/media/MediaController2$PlaybackInfo;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1220
    goto/16 :goto_5

    .line 1213
    :catchall_3
    move-exception v2

    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    throw v2

    .line 1192
    .end local v0    # "info":Landroidx/media/MediaController2$PlaybackInfo;
    :pswitch_6
    const-string v0, "androidx.media.argument.COMMAND_BUTTONS"

    .line 1193
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v0

    .line 1192
    invoke-static {v0}, Landroidx/media/MediaUtils2;->fromCommandButtonParcelableArray([Landroid/os/Parcelable;)Ljava/util/List;

    move-result-object v0

    .line 1194
    .local v0, "layout":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaSession2$CommandButton;>;"
    if-nez v0, :cond_b

    .line 1195
    return-void

    .line 1197
    :cond_b
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$12;

    invoke-direct {v2, p0, v0}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$12;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Ljava/util/List;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1203
    goto/16 :goto_5

    .line 1176
    .end local v0    # "layout":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaSession2$CommandButton;>;"
    :pswitch_7
    const-string v0, "androidx.media.argument.CUSTOM_COMMAND"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 1177
    .local v0, "commandBundle":Landroid/os/Bundle;
    if-nez v0, :cond_c

    .line 1178
    return-void

    .line 1180
    :cond_c
    invoke-static {v0}, Landroidx/media/SessionCommand2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/SessionCommand2;

    move-result-object v1

    .line 1181
    .local v1, "command":Landroidx/media/SessionCommand2;
    const-string v2, "androidx.media.argument.ARGUMENTS"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    .line 1182
    .local v2, "args":Landroid/os/Bundle;
    const-string v3, "androidx.media.argument.RESULT_RECEIVER"

    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/os/ResultReceiver;

    .line 1183
    .local v3, "receiver":Landroid/os/ResultReceiver;
    iget-object v4, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v4}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v4

    new-instance v5, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$11;

    invoke-direct {v5, p0, v1, v2, v3}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$11;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Landroidx/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    invoke-interface {v4, v5}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1189
    goto/16 :goto_5

    .line 1163
    .end local v0    # "commandBundle":Landroid/os/Bundle;
    .end local v1    # "command":Landroidx/media/SessionCommand2;
    .end local v2    # "args":Landroid/os/Bundle;
    .end local v3    # "receiver":Landroid/os/ResultReceiver;
    :pswitch_8
    const-string v0, "androidx.media.argument.SHUFFLE_MODE"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 1164
    .local v0, "shuffleMode":I
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 1165
    :try_start_8
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v2, v0}, Landroidx/media/MediaController2ImplBase;->access$2402(Landroidx/media/MediaController2ImplBase;I)I

    .line 1166
    monitor-exit v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 1167
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$10;

    invoke-direct {v2, p0, v0}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$10;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;I)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1173
    goto/16 :goto_5

    .line 1166
    :catchall_4
    move-exception v2

    :try_start_9
    monitor-exit v1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    throw v2

    .line 1150
    .end local v0    # "shuffleMode":I
    :pswitch_9
    const-string v0, "androidx.media.argument.REPEAT_MODE"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 1151
    .local v0, "repeatMode":I
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 1152
    :try_start_a
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v2, v0}, Landroidx/media/MediaController2ImplBase;->access$2302(Landroidx/media/MediaController2ImplBase;I)I

    .line 1153
    monitor-exit v1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    .line 1154
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$9;

    invoke-direct {v2, p0, v0}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$9;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;I)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1160
    goto/16 :goto_5

    .line 1153
    :catchall_5
    move-exception v2

    :try_start_b
    monitor-exit v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    throw v2

    .line 1136
    .end local v0    # "repeatMode":I
    :pswitch_a
    const-string v0, "androidx.media.argument.PLAYLIST_METADATA"

    .line 1137
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 1136
    invoke-static {v0}, Landroidx/media/MediaMetadata2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaMetadata2;

    move-result-object v0

    .line 1138
    .local v0, "playlistMetadata":Landroidx/media/MediaMetadata2;
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 1139
    :try_start_c
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v2, v0}, Landroidx/media/MediaController2ImplBase;->access$2202(Landroidx/media/MediaController2ImplBase;Landroidx/media/MediaMetadata2;)Landroidx/media/MediaMetadata2;

    .line 1140
    monitor-exit v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    .line 1141
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$8;

    invoke-direct {v2, p0, v0}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$8;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Landroidx/media/MediaMetadata2;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1147
    goto/16 :goto_5

    .line 1140
    :catchall_6
    move-exception v2

    :try_start_d
    monitor-exit v1
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    throw v2

    .line 1119
    .end local v0    # "playlistMetadata":Landroidx/media/MediaMetadata2;
    :pswitch_b
    const-string v0, "androidx.media.argument.PLAYLIST_METADATA"

    .line 1120
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 1119
    invoke-static {v0}, Landroidx/media/MediaMetadata2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaMetadata2;

    move-result-object v0

    .line 1121
    .restart local v0    # "playlistMetadata":Landroidx/media/MediaMetadata2;
    const-string v1, "androidx.media.argument.PLAYLIST"

    .line 1122
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v1

    .line 1121
    invoke-static {v1}, Landroidx/media/MediaUtils2;->fromMediaItem2ParcelableArray([Landroid/os/Parcelable;)Ljava/util/List;

    move-result-object v1

    .line 1123
    .local v1, "playlist":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v2}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 1124
    :try_start_e
    iget-object v3, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v3, v1}, Landroidx/media/MediaController2ImplBase;->access$2102(Landroidx/media/MediaController2ImplBase;Ljava/util/List;)Ljava/util/List;

    .line 1125
    iget-object v3, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v3, v0}, Landroidx/media/MediaController2ImplBase;->access$2202(Landroidx/media/MediaController2ImplBase;Landroidx/media/MediaMetadata2;)Landroidx/media/MediaMetadata2;

    .line 1126
    monitor-exit v2
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_7

    .line 1127
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v2}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$7;

    invoke-direct {v3, p0, v1, v0}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$7;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Ljava/util/List;Landroidx/media/MediaMetadata2;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1133
    goto/16 :goto_5

    .line 1126
    :catchall_7
    move-exception v3

    :try_start_f
    monitor-exit v2
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_7

    throw v3

    .line 1108
    .end local v0    # "playlistMetadata":Landroidx/media/MediaMetadata2;
    .end local v1    # "playlist":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    :pswitch_c
    const-string v0, "androidx.media.argument.ROUTE_BUNDLE"

    .line 1109
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v0

    .line 1108
    invoke-static {v0}, Landroidx/media/MediaUtils2;->toBundleList([Landroid/os/Parcelable;)Ljava/util/List;

    move-result-object v0

    .line 1110
    .local v0, "routes":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$6;

    invoke-direct {v2, p0, v0}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$6;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Ljava/util/List;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1116
    goto/16 :goto_5

    .line 1097
    .end local v0    # "routes":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    :pswitch_d
    const-string v0, "androidx.media.argument.ERROR_CODE"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 1098
    .local v0, "errorCode":I
    const-string v1, "androidx.media.argument.EXTRAS"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 1099
    .local v1, "errorExtras":Landroid/os/Bundle;
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v2}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$5;

    invoke-direct {v3, p0, v0, v1}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$5;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;ILandroid/os/Bundle;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1105
    goto/16 :goto_5

    .line 1083
    .end local v0    # "errorCode":I
    .end local v1    # "errorExtras":Landroid/os/Bundle;
    :pswitch_e
    const-string v0, "androidx.media.argument.MEDIA_ITEM"

    .line 1084
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 1083
    invoke-static {v0}, Landroidx/media/MediaItem2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaItem2;

    move-result-object v0

    .line 1085
    .local v0, "item":Landroidx/media/MediaItem2;
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 1086
    :try_start_10
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v2, v0}, Landroidx/media/MediaController2ImplBase;->access$2002(Landroidx/media/MediaController2ImplBase;Landroidx/media/MediaItem2;)Landroidx/media/MediaItem2;

    .line 1087
    monitor-exit v1
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_8

    .line 1088
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$4;

    invoke-direct {v2, p0, v0}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$4;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Landroidx/media/MediaItem2;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1094
    goto :goto_5

    .line 1087
    :catchall_8
    move-exception v2

    :try_start_11
    monitor-exit v1
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_8

    throw v2

    .line 1064
    .end local v0    # "item":Landroidx/media/MediaItem2;
    :pswitch_f
    const-string v0, "androidx.media.argument.PLAYER_STATE"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 1065
    .local v0, "playerState":I
    const-string v1, "androidx.media.argument.PLAYBACK_STATE_COMPAT"

    .line 1066
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 1067
    .local v1, "state":Landroid/support/v4/media/session/PlaybackStateCompat;
    if-nez v1, :cond_d

    .line 1068
    return-void

    .line 1070
    :cond_d
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v2}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 1071
    :try_start_12
    iget-object v3, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v3, v0}, Landroidx/media/MediaController2ImplBase;->access$1902(Landroidx/media/MediaController2ImplBase;I)I

    .line 1072
    iget-object v3, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v3, v1}, Landroidx/media/MediaController2ImplBase;->access$1602(Landroidx/media/MediaController2ImplBase;Landroid/support/v4/media/session/PlaybackStateCompat;)Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 1073
    monitor-exit v2
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_9

    .line 1074
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v2}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$3;

    invoke-direct {v3, p0, v0}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$3;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;I)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1080
    goto :goto_5

    .line 1073
    :catchall_9
    move-exception v3

    :try_start_13
    monitor-exit v2
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_9

    throw v3

    .line 1050
    .end local v0    # "playerState":I
    .end local v1    # "state":Landroid/support/v4/media/session/PlaybackStateCompat;
    :pswitch_10
    const-string v0, "androidx.media.argument.ALLOWED_COMMANDS"

    .line 1051
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 1050
    invoke-static {v0}, Landroidx/media/SessionCommandGroup2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/SessionCommandGroup2;

    move-result-object v0

    .line 1052
    .local v0, "allowedCommands":Landroidx/media/SessionCommandGroup2;
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 1053
    :try_start_14
    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v2, v0}, Landroidx/media/MediaController2ImplBase;->access$1802(Landroidx/media/MediaController2ImplBase;Landroidx/media/SessionCommandGroup2;)Landroidx/media/SessionCommandGroup2;

    .line 1054
    monitor-exit v1
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_a

    .line 1055
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$400(Landroidx/media/MediaController2ImplBase;)Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$2;

    invoke-direct {v2, p0, v0}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$2;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Landroidx/media/SessionCommandGroup2;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1061
    goto :goto_5

    .line 1054
    :catchall_a
    move-exception v2

    :try_start_15
    monitor-exit v1
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_a

    throw v2

    .line 1306
    .end local v0    # "allowedCommands":Landroidx/media/SessionCommandGroup2;
    :goto_5
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7bcae3fc -> :sswitch_10
        -0x7ad14943 -> :sswitch_f
        -0x5eb3585e -> :sswitch_e
        -0x57afe373 -> :sswitch_d
        -0x3ce9341d -> :sswitch_c
        -0x24c97c72 -> :sswitch_b
        -0x57d366d -> :sswitch_a
        -0x3313129 -> :sswitch_9
        0xdb556b9 -> :sswitch_8
        0x124216cc -> :sswitch_7
        0x18606080 -> :sswitch_6
        0x300da84c -> :sswitch_5
        0x3570ac43 -> :sswitch_4
        0x53560fe4 -> :sswitch_3
        0x6518bbd9 -> :sswitch_2
        0x6f5d0779 -> :sswitch_1
        0x6f922989 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onSessionReady()V
    .locals 4

    .line 987
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    const-string v1, "androidx.media.controller.command.CONNECT"

    new-instance v2, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1;

    iget-object v3, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v3}, Landroidx/media/MediaController2ImplBase;->access$1200(Landroidx/media/MediaController2ImplBase;)Landroid/os/Handler;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$1;-><init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Landroid/os/Handler;)V

    invoke-static {v0, v1, v2}, Landroidx/media/MediaController2ImplBase;->access$1500(Landroidx/media/MediaController2ImplBase;Ljava/lang/String;Landroid/os/ResultReceiver;)V

    .line 1022
    return-void
.end method
