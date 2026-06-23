.class Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;
.super Ljava/lang/Object;
.source "AudioFocusHandler.java"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AudioFocusListener"
.end annotation


# instance fields
.field private mPlayerDuckingVolume:F

.field private mPlayerVolumeBeforeDucking:F

.field final synthetic this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;


# direct methods
.method private constructor <init>(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)V
    .locals 0

    .line 398
    iput-object p1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;Landroidx/media/AudioFocusHandler$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;
    .param p2, "x1"    # Landroidx/media/AudioFocusHandler$1;

    .line 398
    invoke-direct {p0, p1}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;-><init>(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)V

    return-void
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .locals 6
    .param p1, "focusGain"    # I

    .line 406
    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_2

    .line 437
    :pswitch_0
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$500(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Landroidx/media/MediaSession2;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media/MediaSession2;->pause()V

    .line 439
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$200(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 440
    :try_start_0
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$602(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;Z)Z

    .line 441
    monitor-exit v1

    .line 442
    goto/16 :goto_2

    .line 441
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 468
    :pswitch_1
    iget-object v1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v1}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$500(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Landroidx/media/MediaSession2;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/media/MediaSession2;->pause()V

    .line 470
    iget-object v1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v1}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$200(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 471
    :try_start_1
    iget-object v2, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v2, v0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$602(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;Z)Z

    .line 472
    monitor-exit v1

    goto/16 :goto_2

    :catchall_1
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v0

    .line 444
    :pswitch_2
    iget-object v1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v1}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$200(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 445
    :try_start_2
    iget-object v2, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v2}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$400(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Landroidx/media/AudioAttributesCompat;

    move-result-object v2

    if-nez v2, :cond_0

    .line 447
    monitor-exit v1

    goto/16 :goto_2

    .line 449
    :cond_0
    iget-object v2, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v2}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$400(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Landroidx/media/AudioAttributesCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/media/AudioAttributesCompat;->getContentType()I

    move-result v2

    if-ne v2, v0, :cond_1

    .line 451
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$500(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Landroidx/media/MediaSession2;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media/MediaSession2;->pause()V

    goto :goto_0

    .line 453
    :cond_1
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$500(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Landroidx/media/MediaSession2;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media/MediaSession2;->getPlayer()Landroidx/media/BaseMediaPlayer;

    move-result-object v0

    .line 454
    .local v0, "player":Landroidx/media/BaseMediaPlayer;
    if-eqz v0, :cond_2

    .line 456
    invoke-virtual {v0}, Landroidx/media/BaseMediaPlayer;->getPlayerVolume()F

    move-result v2

    .line 457
    .local v2, "currentVolume":F
    const v3, 0x3e4ccccd    # 0.2f

    mul-float/2addr v3, v2

    .line 458
    .local v3, "duckingVolume":F
    iget-object v4, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v4}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$200(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 459
    :try_start_3
    iput v2, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->mPlayerVolumeBeforeDucking:F

    .line 460
    iput v3, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->mPlayerDuckingVolume:F

    .line 461
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 462
    :try_start_4
    invoke-virtual {v0, v3}, Landroidx/media/BaseMediaPlayer;->setPlayerVolume(F)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .end local v0    # "player":Landroidx/media/BaseMediaPlayer;
    .end local v2    # "currentVolume":F
    .end local v3    # "duckingVolume":F
    goto :goto_0

    .line 461
    .restart local v0    # "player":Landroidx/media/BaseMediaPlayer;
    .restart local v2    # "currentVolume":F
    .restart local v3    # "duckingVolume":F
    :catchall_2
    move-exception v5

    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :try_start_6
    throw v5

    .line 465
    .end local v0    # "player":Landroidx/media/BaseMediaPlayer;
    .end local v2    # "currentVolume":F
    .end local v3    # "duckingVolume":F
    :cond_2
    :goto_0
    monitor-exit v1

    .line 466
    goto :goto_2

    .line 465
    :catchall_3
    move-exception v0

    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw v0

    .line 409
    :cond_3
    iget-object v1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v1}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$500(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Landroidx/media/MediaSession2;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/media/MediaSession2;->getPlayerState()I

    move-result v1

    if-ne v1, v0, :cond_5

    .line 411
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$200(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 412
    :try_start_7
    iget-object v1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v1}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$600(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 413
    monitor-exit v0

    goto :goto_2

    .line 415
    :cond_4
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 416
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$500(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Landroidx/media/MediaSession2;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media/MediaSession2;->play()V

    goto :goto_2

    .line 415
    :catchall_4
    move-exception v1

    :try_start_8
    monitor-exit v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    throw v1

    .line 418
    :cond_5
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$500(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Landroidx/media/MediaSession2;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media/MediaSession2;->getPlayer()Landroidx/media/BaseMediaPlayer;

    move-result-object v0

    .line 419
    .restart local v0    # "player":Landroidx/media/BaseMediaPlayer;
    if-eqz v0, :cond_7

    .line 421
    invoke-virtual {v0}, Landroidx/media/BaseMediaPlayer;->getPlayerVolume()F

    move-result v1

    .line 423
    .local v1, "currentVolume":F
    iget-object v2, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v2}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$200(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 424
    const/4 v3, 0x0

    :try_start_9
    iget v4, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->mPlayerDuckingVolume:F

    cmpl-float v4, v1, v4

    if-eqz v4, :cond_6

    .line 426
    monitor-exit v2

    goto :goto_2

    .line 428
    :cond_6
    iget v4, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;->mPlayerVolumeBeforeDucking:F

    move v3, v4

    .line 429
    .local v3, "volumeBeforeDucking":F
    monitor-exit v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 430
    invoke-virtual {v0, v3}, Landroidx/media/BaseMediaPlayer;->setPlayerVolume(F)V

    .end local v0    # "player":Landroidx/media/BaseMediaPlayer;
    .end local v1    # "currentVolume":F
    .end local v3    # "volumeBeforeDucking":F
    goto :goto_1

    .line 429
    .restart local v0    # "player":Landroidx/media/BaseMediaPlayer;
    .restart local v1    # "currentVolume":F
    :catchall_5
    move-exception v4

    .restart local v3    # "volumeBeforeDucking":F
    :try_start_a
    monitor-exit v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    throw v4

    .line 433
    .end local v0    # "player":Landroidx/media/BaseMediaPlayer;
    .end local v1    # "currentVolume":F
    .end local v3    # "volumeBeforeDucking":F
    :cond_7
    :goto_1
    nop

    .line 475
    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
