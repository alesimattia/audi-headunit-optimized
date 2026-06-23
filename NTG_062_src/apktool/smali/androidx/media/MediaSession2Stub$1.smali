.class Landroidx/media/MediaSession2Stub$1;
.super Ljava/lang/Object;
.source "MediaSession2Stub.java"

# interfaces
.implements Landroidx/media/MediaSession2Stub$Session2Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2Stub;->onCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2Stub;

.field final synthetic val$commandCode:I

.field final synthetic val$extras:Landroid/os/Bundle;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2Stub;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2Stub;

    .line 195
    iput-object p1, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iput p2, p0, Landroidx/media/MediaSession2Stub$1;->val$commandCode:I

    iput-object p3, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Landroidx/media/MediaSession2$ControllerInfo;)V
    .locals 5
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;

    .line 198
    iget v0, p0, Landroidx/media/MediaSession2Stub$1;->val$commandCode:I

    const/16 v1, 0x13

    if-eq v0, v1, :cond_4

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    goto/16 :goto_0

    .line 380
    :pswitch_0
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.PLAYBACK_SPEED"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v0

    .line 381
    .local v0, "speed":F
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v1, v1, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v1, v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->setPlaybackSpeed(F)V

    .line 382
    goto/16 :goto_0

    .line 374
    .end local v0    # "speed":F
    :pswitch_1
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.ROUTE_BUNDLE"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 375
    .local v0, "route":Landroid/os/Bundle;
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v1, v1, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 376
    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v2

    .line 375
    invoke-virtual {v1, v2, p1, v0}, Landroidx/media/MediaSession2$SessionCallback;->onSelectRoute(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Landroid/os/Bundle;)V

    .line 377
    goto/16 :goto_0

    .line 369
    .end local v0    # "route":Landroid/os/Bundle;
    :pswitch_2
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v0, v0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v1, v1, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 370
    invoke-virtual {v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v1

    .line 369
    invoke-virtual {v0, v1, p1}, Landroidx/media/MediaSession2$SessionCallback;->onUnsubscribeRoutesInfo(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;)V

    .line 371
    goto/16 :goto_0

    .line 364
    :pswitch_3
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v0, v0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v1, v1, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 365
    invoke-virtual {v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v1

    .line 364
    invoke-virtual {v0, v1, p1}, Landroidx/media/MediaSession2$SessionCallback;->onSubscribeRoutesInfo(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;)V

    .line 366
    goto/16 :goto_0

    .line 356
    :pswitch_4
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.MEDIA_ID"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 357
    .local v0, "mediaId":Ljava/lang/String;
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v2, "androidx.media.argument.RATING"

    .line 358
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 357
    invoke-static {v1}, Landroidx/media/Rating2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/Rating2;

    move-result-object v1

    .line 359
    .local v1, "rating":Landroidx/media/Rating2;
    iget-object v2, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v3, v3, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 360
    invoke-virtual {v3}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v3

    .line 359
    invoke-virtual {v2, v3, p1, v0, v1}, Landroidx/media/MediaSession2$SessionCallback;->onSetRating(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroidx/media/Rating2;)V

    .line 361
    goto/16 :goto_0

    .line 342
    .end local v0    # "mediaId":Ljava/lang/String;
    .end local v1    # "rating":Landroidx/media/Rating2;
    :pswitch_5
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.QUERY"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 343
    .local v0, "query":Ljava/lang/String;
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v2, "androidx.media.argument.EXTRAS"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 344
    .local v1, "extra":Landroid/os/Bundle;
    iget-object v2, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v3, v3, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 345
    invoke-virtual {v3}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v3

    .line 344
    invoke-virtual {v2, v3, p1, v0, v1}, Landroidx/media/MediaSession2$SessionCallback;->onPrepareFromSearch(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 346
    goto/16 :goto_0

    .line 349
    .end local v0    # "query":Ljava/lang/String;
    .end local v1    # "extra":Landroid/os/Bundle;
    :pswitch_6
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.URI"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    .line 350
    .local v0, "uri":Landroid/net/Uri;
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v2, "androidx.media.argument.EXTRAS"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 351
    .restart local v1    # "extra":Landroid/os/Bundle;
    iget-object v2, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v3, v3, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 352
    invoke-virtual {v3}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v3

    .line 351
    invoke-virtual {v2, v3, p1, v0, v1}, Landroidx/media/MediaSession2$SessionCallback;->onPrepareFromUri(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Landroid/net/Uri;Landroid/os/Bundle;)V

    .line 353
    goto/16 :goto_0

    .line 335
    .end local v0    # "uri":Landroid/net/Uri;
    .end local v1    # "extra":Landroid/os/Bundle;
    :pswitch_7
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.MEDIA_ID"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 336
    .local v0, "mediaId":Ljava/lang/String;
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v2, "androidx.media.argument.EXTRAS"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 337
    .restart local v1    # "extra":Landroid/os/Bundle;
    iget-object v2, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v3, v3, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 338
    invoke-virtual {v3}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v3

    .line 337
    invoke-virtual {v2, v3, p1, v0, v1}, Landroidx/media/MediaSession2$SessionCallback;->onPrepareFromMediaId(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 339
    goto/16 :goto_0

    .line 321
    .end local v0    # "mediaId":Ljava/lang/String;
    .end local v1    # "extra":Landroid/os/Bundle;
    :pswitch_8
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.QUERY"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 322
    .local v0, "query":Ljava/lang/String;
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v2, "androidx.media.argument.EXTRAS"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 323
    .restart local v1    # "extra":Landroid/os/Bundle;
    iget-object v2, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v3, v3, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 324
    invoke-virtual {v3}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v3

    .line 323
    invoke-virtual {v2, v3, p1, v0, v1}, Landroidx/media/MediaSession2$SessionCallback;->onPlayFromSearch(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 325
    goto/16 :goto_0

    .line 328
    .end local v0    # "query":Ljava/lang/String;
    .end local v1    # "extra":Landroid/os/Bundle;
    :pswitch_9
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.URI"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    .line 329
    .local v0, "uri":Landroid/net/Uri;
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v2, "androidx.media.argument.EXTRAS"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 330
    .restart local v1    # "extra":Landroid/os/Bundle;
    iget-object v2, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v3, v3, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 331
    invoke-virtual {v3}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v3

    .line 330
    invoke-virtual {v2, v3, p1, v0, v1}, Landroidx/media/MediaSession2$SessionCallback;->onPlayFromUri(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Landroid/net/Uri;Landroid/os/Bundle;)V

    .line 332
    goto/16 :goto_0

    .line 314
    .end local v0    # "uri":Landroid/net/Uri;
    .end local v1    # "extra":Landroid/os/Bundle;
    :pswitch_a
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.MEDIA_ID"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 315
    .local v0, "mediaId":Ljava/lang/String;
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v2, "androidx.media.argument.EXTRAS"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 316
    .restart local v1    # "extra":Landroid/os/Bundle;
    iget-object v2, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v3, v3, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 317
    invoke-virtual {v3}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v3

    .line 316
    invoke-virtual {v2, v3, p1, v0, v1}, Landroidx/media/MediaSession2$SessionCallback;->onPlayFromMediaId(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 318
    goto/16 :goto_0

    .line 235
    .end local v0    # "mediaId":Ljava/lang/String;
    .end local v1    # "extra":Landroid/os/Bundle;
    :pswitch_b
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.PLAYLIST_METADATA"

    .line 236
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 235
    invoke-static {v0}, Landroidx/media/MediaMetadata2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaMetadata2;

    move-result-object v0

    .line 237
    .local v0, "metadata":Landroidx/media/MediaMetadata2;
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v1, v1, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v1, v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->updatePlaylistMetadata(Landroidx/media/MediaMetadata2;)V

    .line 238
    goto/16 :goto_0

    .line 254
    .end local v0    # "metadata":Landroidx/media/MediaMetadata2;
    :pswitch_c
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.PLAYLIST_INDEX"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 255
    .local v0, "index":I
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v2, "androidx.media.argument.MEDIA_ITEM"

    .line 256
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 255
    invoke-static {v1}, Landroidx/media/MediaItem2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaItem2;

    move-result-object v1

    .line 257
    .local v1, "item":Landroidx/media/MediaItem2;
    iget-object v2, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2, v0, v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->replacePlaylistItem(ILandroidx/media/MediaItem2;)V

    .line 258
    goto/16 :goto_0

    .line 248
    .end local v0    # "index":I
    .end local v1    # "item":Landroidx/media/MediaItem2;
    :pswitch_d
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.MEDIA_ITEM"

    .line 249
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 248
    invoke-static {v0}, Landroidx/media/MediaItem2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaItem2;

    move-result-object v0

    .line 250
    .local v0, "item":Landroidx/media/MediaItem2;
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v1, v1, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v1, v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->removePlaylistItem(Landroidx/media/MediaItem2;)V

    .line 251
    goto/16 :goto_0

    .line 241
    .end local v0    # "item":Landroidx/media/MediaItem2;
    :pswitch_e
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.PLAYLIST_INDEX"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 242
    .local v0, "index":I
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v2, "androidx.media.argument.MEDIA_ITEM"

    .line 243
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 242
    invoke-static {v1}, Landroidx/media/MediaItem2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaItem2;

    move-result-object v1

    .line 244
    .restart local v1    # "item":Landroidx/media/MediaItem2;
    iget-object v2, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2, v0, v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->addPlaylistItem(ILandroidx/media/MediaItem2;)V

    .line 245
    goto/16 :goto_0

    .line 217
    .end local v0    # "index":I
    .end local v1    # "item":Landroidx/media/MediaItem2;
    :pswitch_f
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.REPEAT_MODE"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 218
    .local v0, "repeatMode":I
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v1, v1, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v1, v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->setRepeatMode(I)V

    .line 219
    goto/16 :goto_0

    .line 222
    .end local v0    # "repeatMode":I
    :pswitch_10
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.SHUFFLE_MODE"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 223
    .local v0, "shuffleMode":I
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v1, v1, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v1, v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->setShuffleMode(I)V

    .line 224
    goto/16 :goto_0

    .line 269
    .end local v0    # "shuffleMode":I
    :pswitch_11
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.MEDIA_ITEM"

    .line 270
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 269
    invoke-static {v0}, Landroidx/media/MediaItem2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaItem2;

    move-result-object v0

    .line 271
    .local v0, "item":Landroidx/media/MediaItem2;
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v1, v1, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v1, v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->skipToPlaylistItem(Landroidx/media/MediaItem2;)V

    .line 272
    goto/16 :goto_0

    .line 289
    .end local v0    # "item":Landroidx/media/MediaItem2;
    :pswitch_12
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.VOLUME_DIRECTION"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 290
    .local v0, "direction":I
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v2, "androidx.media.argument.VOLUME_FLAGS"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 291
    .local v1, "flags":I
    iget-object v2, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getVolumeProvider()Landroidx/media/VolumeProviderCompat;

    move-result-object v2

    .line 292
    .local v2, "vp":Landroidx/media/VolumeProviderCompat;
    if-nez v2, :cond_1

    .line 293
    iget-object v3, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v3, v3, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v3}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getSessionCompat()Landroid/support/v4/media/session/MediaSessionCompat;

    move-result-object v3

    .line 294
    .local v3, "sessionCompat":Landroid/support/v4/media/session/MediaSessionCompat;
    if-eqz v3, :cond_0

    .line 295
    invoke-virtual {v3}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Landroid/support/v4/media/session/MediaControllerCompat;->adjustVolume(II)V

    .line 298
    .end local v3    # "sessionCompat":Landroid/support/v4/media/session/MediaSessionCompat;
    :cond_0
    goto/16 :goto_0

    .line 299
    :cond_1
    invoke-virtual {v2, v0}, Landroidx/media/VolumeProviderCompat;->onAdjustVolume(I)V

    .line 301
    goto/16 :goto_0

    .line 275
    .end local v0    # "direction":I
    .end local v1    # "flags":I
    .end local v2    # "vp":Landroidx/media/VolumeProviderCompat;
    :pswitch_13
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.VOLUME"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 276
    .local v0, "value":I
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v2, "androidx.media.argument.VOLUME_FLAGS"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 277
    .restart local v1    # "flags":I
    iget-object v2, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getVolumeProvider()Landroidx/media/VolumeProviderCompat;

    move-result-object v2

    .line 278
    .restart local v2    # "vp":Landroidx/media/VolumeProviderCompat;
    if-nez v2, :cond_3

    .line 279
    iget-object v3, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v3, v3, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v3}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getSessionCompat()Landroid/support/v4/media/session/MediaSessionCompat;

    move-result-object v3

    .line 280
    .restart local v3    # "sessionCompat":Landroid/support/v4/media/session/MediaSessionCompat;
    if-eqz v3, :cond_2

    .line 281
    invoke-virtual {v3}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Landroid/support/v4/media/session/MediaControllerCompat;->setVolumeTo(II)V

    .line 283
    .end local v3    # "sessionCompat":Landroid/support/v4/media/session/MediaSessionCompat;
    :cond_2
    goto/16 :goto_0

    .line 284
    :cond_3
    invoke-virtual {v2, v0}, Landroidx/media/VolumeProviderCompat;->onSetVolumeTo(I)V

    .line 286
    goto/16 :goto_0

    .line 212
    .end local v0    # "value":I
    .end local v1    # "flags":I
    .end local v2    # "vp":Landroidx/media/VolumeProviderCompat;
    :pswitch_14
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.SEEK_POSITION"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 213
    .local v0, "seekPos":J
    iget-object v2, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2, v0, v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->seekTo(J)V

    .line 214
    goto/16 :goto_0

    .line 304
    .end local v0    # "seekPos":J
    :pswitch_15
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v0, v0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v1, v1, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 305
    invoke-virtual {v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v1

    .line 304
    invoke-virtual {v0, v1, p1}, Landroidx/media/MediaSession2$SessionCallback;->onRewind(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;)V

    .line 306
    goto :goto_0

    .line 309
    :pswitch_16
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v0, v0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v1, v1, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 310
    invoke-virtual {v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v1

    .line 309
    invoke-virtual {v0, v1, p1}, Landroidx/media/MediaSession2$SessionCallback;->onFastForward(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;)V

    .line 311
    goto :goto_0

    .line 209
    :pswitch_17
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v0, v0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->prepare()V

    .line 210
    goto :goto_0

    .line 265
    :pswitch_18
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v0, v0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->skipToPreviousItem()V

    .line 266
    goto :goto_0

    .line 261
    :pswitch_19
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v0, v0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->skipToNextItem()V

    .line 262
    goto :goto_0

    .line 206
    :pswitch_1a
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v0, v0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->reset()V

    .line 207
    goto :goto_0

    .line 203
    :pswitch_1b
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v0, v0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->pause()V

    .line 204
    goto :goto_0

    .line 200
    :pswitch_1c
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v0, v0, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->play()V

    .line 201
    goto :goto_0

    .line 227
    :cond_4
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v1, "androidx.media.argument.PLAYLIST"

    .line 228
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v0

    .line 227
    invoke-static {v0}, Landroidx/media/MediaUtils2;->fromMediaItem2ParcelableArray([Landroid/os/Parcelable;)Ljava/util/List;

    move-result-object v0

    .line 229
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$1;->val$extras:Landroid/os/Bundle;

    const-string v2, "androidx.media.argument.PLAYLIST_METADATA"

    .line 230
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 229
    invoke-static {v1}, Landroidx/media/MediaMetadata2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaMetadata2;

    move-result-object v1

    .line 231
    .local v1, "metadata":Landroidx/media/MediaMetadata2;
    iget-object v2, p0, Landroidx/media/MediaSession2Stub$1;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2, v0, v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->setPlaylist(Ljava/util/List;Landroidx/media/MediaMetadata2;)V

    .line 232
    nop

    .line 385
    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    .end local v1    # "metadata":Landroidx/media/MediaMetadata2;
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x15
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x24
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
