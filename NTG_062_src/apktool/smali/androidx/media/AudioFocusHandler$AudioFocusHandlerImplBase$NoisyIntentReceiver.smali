.class Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$NoisyIntentReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AudioFocusHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NoisyIntentReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;


# direct methods
.method private constructor <init>(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)V
    .locals 0

    .line 355
    iput-object p1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$NoisyIntentReceiver;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;Landroidx/media/AudioFocusHandler$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;
    .param p2, "x1"    # Landroidx/media/AudioFocusHandler$1;

    .line 355
    invoke-direct {p0, p1}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$NoisyIntentReceiver;-><init>(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 362
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$NoisyIntentReceiver;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$200(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 363
    :try_start_0
    iget-object v1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$NoisyIntentReceiver;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v1}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$300(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 364
    monitor-exit v0

    return-void

    .line 366
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 367
    const-string v0, "android.media.AUDIO_BECOMING_NOISY"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 369
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$NoisyIntentReceiver;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$200(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 370
    const/4 v1, 0x0

    :try_start_1
    iget-object v2, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$NoisyIntentReceiver;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v2}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$400(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Landroidx/media/AudioAttributesCompat;

    move-result-object v2

    if-nez v2, :cond_1

    .line 371
    monitor-exit v0

    return-void

    .line 373
    :cond_1
    iget-object v2, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$NoisyIntentReceiver;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v2}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$400(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Landroidx/media/AudioAttributesCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/media/AudioAttributesCompat;->getUsage()I

    move-result v2

    move v1, v2

    .line 374
    .local v1, "usage":I
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 375
    const/4 v0, 0x1

    if-eq v1, v0, :cond_3

    const/16 v0, 0xe

    if-eq v1, v0, :cond_2

    .end local v1    # "usage":I
    goto :goto_0

    .line 384
    .restart local v1    # "usage":I
    :cond_2
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$NoisyIntentReceiver;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$500(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Landroidx/media/MediaSession2;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media/MediaSession2;->getPlayer()Landroidx/media/BaseMediaPlayer;

    move-result-object v0

    .line 385
    .local v0, "player":Landroidx/media/BaseMediaPlayer;
    if-eqz v0, :cond_4

    .line 386
    invoke-virtual {v0}, Landroidx/media/BaseMediaPlayer;->getPlayerVolume()F

    move-result v2

    const v3, 0x3e4ccccd    # 0.2f

    mul-float/2addr v2, v3

    invoke-virtual {v0, v2}, Landroidx/media/BaseMediaPlayer;->setPlayerVolume(F)V

    goto :goto_0

    .line 379
    .end local v0    # "player":Landroidx/media/BaseMediaPlayer;
    :cond_3
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$NoisyIntentReceiver;->this$0:Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    invoke-static {v0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->access$500(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Landroidx/media/MediaSession2;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media/MediaSession2;->pause()V

    .line 380
    goto :goto_0

    .line 374
    .end local v1    # "usage":I
    :catchall_0
    move-exception v2

    .restart local v1    # "usage":I
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 395
    .end local v1    # "usage":I
    :cond_4
    :goto_0
    return-void

    .line 366
    :catchall_1
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v1
.end method
