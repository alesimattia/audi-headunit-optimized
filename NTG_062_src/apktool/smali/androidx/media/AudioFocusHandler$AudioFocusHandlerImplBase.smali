.class Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;
.super Ljava/lang/Object;
.source "AudioFocusHandler.java"

# interfaces
.implements Landroidx/media/AudioFocusHandler$AudioFocusHandlerImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/AudioFocusHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AudioFocusHandlerImplBase"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;,
        Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$NoisyIntentReceiver;
    }
.end annotation


# static fields
.field private static final VOLUME_DUCK_FACTOR:F = 0.2f


# instance fields
.field private mAudioAttributes:Landroidx/media/AudioAttributesCompat;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mAudioFocusListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

.field private final mAudioManager:Landroid/media/AudioManager;

.field private final mBecomingNoisyIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mHasAudioFocus:Z
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mHasRegisteredReceiver:Z
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mIntentFilter:Landroid/content/IntentFilter;

.field private final mLock:Ljava/lang/Object;

.field private mResumeWhenAudioFocusGain:Z
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mSession:Landroidx/media/MediaSession2;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2;)V
    .locals 3
    .param p1, "session"    # Landroidx/media/MediaSession2;

    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    new-instance v0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$NoisyIntentReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$NoisyIntentReceiver;-><init>(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;Landroidx/media/AudioFocusHandler$1;)V

    iput-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mBecomingNoisyIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 128
    new-instance v0, Landroid/content/IntentFilter;

    const-string v2, "android.media.AUDIO_BECOMING_NOISY"

    invoke-direct {v0, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mIntentFilter:Landroid/content/IntentFilter;

    .line 130
    new-instance v0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;

    invoke-direct {v0, p0, v1}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase$AudioFocusListener;-><init>(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;Landroidx/media/AudioFocusHandler$1;)V

    iput-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mAudioFocusListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 131
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mLock:Ljava/lang/Object;

    .line 145
    iput-object p1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mSession:Landroidx/media/MediaSession2;

    .line 146
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mSession:Landroidx/media/MediaSession2;

    invoke-virtual {v0}, Landroidx/media/MediaSession2;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mAudioManager:Landroid/media/AudioManager;

    .line 148
    return-void
.end method

.method private abandonAudioFocusLocked()V
    .locals 2
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .line 268
    iget-boolean v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mHasAudioFocus:Z

    if-nez v0, :cond_0

    .line 269
    return-void

    .line 274
    :cond_0
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mAudioManager:Landroid/media/AudioManager;

    iget-object v1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mAudioFocusListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 275
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mHasAudioFocus:Z

    .line 276
    iput-boolean v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mResumeWhenAudioFocusGain:Z

    .line 277
    return-void
.end method

.method static synthetic access$200(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    .line 121
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$300(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Z
    .locals 1
    .param p0, "x0"    # Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    .line 121
    iget-boolean v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mHasRegisteredReceiver:Z

    return v0
.end method

.method static synthetic access$400(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Landroidx/media/AudioAttributesCompat;
    .locals 1
    .param p0, "x0"    # Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    .line 121
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mAudioAttributes:Landroidx/media/AudioAttributesCompat;

    return-object v0
.end method

.method static synthetic access$500(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Landroidx/media/MediaSession2;
    .locals 1
    .param p0, "x0"    # Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    .line 121
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mSession:Landroidx/media/MediaSession2;

    return-object v0
.end method

.method static synthetic access$600(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;)Z
    .locals 1
    .param p0, "x0"    # Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;

    .line 121
    iget-boolean v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mResumeWhenAudioFocusGain:Z

    return v0
.end method

.method static synthetic access$602(Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;Z)Z
    .locals 0
    .param p0, "x0"    # Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;
    .param p1, "x1"    # Z

    .line 121
    iput-boolean p1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mResumeWhenAudioFocusGain:Z

    return p1
.end method

.method private convertAudioAttributesToFocusGainLocked()I
    .locals 3
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .line 311
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mAudioAttributes:Landroidx/media/AudioAttributesCompat;

    .line 313
    .local v0, "audioAttributesCompat":Landroidx/media/AudioAttributesCompat;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 314
    return v1

    .line 318
    :cond_0
    invoke-virtual {v0}, Landroidx/media/AudioAttributesCompat;->getUsage()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 352
    :pswitch_0
    return v1

    .line 330
    :pswitch_1
    const/4 v1, 0x2

    return v1

    .line 323
    :pswitch_2
    const/4 v1, 0x1

    return v1

    .line 345
    :pswitch_3
    const/4 v1, 0x3

    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method private registerReceiverLocked()V
    .locals 3
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .line 281
    iget-boolean v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mHasRegisteredReceiver:Z

    if-eqz v0, :cond_0

    .line 282
    return-void

    .line 289
    :cond_0
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mSession:Landroidx/media/MediaSession2;

    invoke-virtual {v0}, Landroidx/media/MediaSession2;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mBecomingNoisyIntentReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 290
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mHasRegisteredReceiver:Z

    .line 291
    return-void
.end method

.method private requestAudioFocusLocked()Z
    .locals 6
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .line 240
    invoke-direct {p0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->convertAudioAttributesToFocusGainLocked()I

    move-result v0

    .line 241
    .local v0, "focusGain":I
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 243
    return v1

    .line 247
    :cond_0
    iget-object v2, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mAudioManager:Landroid/media/AudioManager;

    iget-object v3, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mAudioFocusListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    iget-object v4, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mAudioAttributes:Landroidx/media/AudioAttributesCompat;

    .line 248
    invoke-virtual {v4}, Landroidx/media/AudioAttributesCompat;->getVolumeControlStream()I

    move-result v4

    .line 247
    invoke-virtual {v2, v3, v4, v0}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    move-result v2

    .line 249
    .local v2, "audioFocusRequestResult":I
    const/4 v3, 0x0

    if-ne v2, v1, :cond_1

    .line 250
    iput-boolean v1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mHasAudioFocus:Z

    goto :goto_0

    .line 252
    :cond_1
    const-string v1, "AudioFocusHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "requestAudioFocus("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ") failed (return="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ") playback wouldn\'t start."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    iput-boolean v3, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mHasAudioFocus:Z

    .line 259
    :goto_0
    iput-boolean v3, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mResumeWhenAudioFocusGain:Z

    .line 260
    iget-boolean v1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mHasAudioFocus:Z

    return v1
.end method

.method private unregisterReceiverLocked()V
    .locals 2
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .line 295
    iget-boolean v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mHasRegisteredReceiver:Z

    if-nez v0, :cond_0

    .line 296
    return-void

    .line 301
    :cond_0
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mSession:Landroidx/media/MediaSession2;

    invoke-virtual {v0}, Landroidx/media/MediaSession2;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mBecomingNoisyIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 302
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mHasRegisteredReceiver:Z

    .line 303
    return-void
.end method

.method private updateAudioAttributesIfNeeded()V
    .locals 4

    .line 152
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mSession:Landroidx/media/MediaSession2;

    invoke-virtual {v0}, Landroidx/media/MediaSession2;->getVolumeProvider()Landroidx/media/VolumeProviderCompat;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 154
    const/4 v0, 0x0

    .local v0, "attributes":Landroidx/media/AudioAttributesCompat;
    goto :goto_1

    .line 156
    .end local v0    # "attributes":Landroidx/media/AudioAttributesCompat;
    :cond_0
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mSession:Landroidx/media/MediaSession2;

    invoke-virtual {v0}, Landroidx/media/MediaSession2;->getPlayer()Landroidx/media/BaseMediaPlayer;

    move-result-object v0

    .line 157
    .local v0, "player":Landroidx/media/BaseMediaPlayer;
    if-nez v0, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Landroidx/media/BaseMediaPlayer;->getAudioAttributes()Landroidx/media/AudioAttributesCompat;

    move-result-object v1

    .end local v0    # "player":Landroidx/media/BaseMediaPlayer;
    :goto_0
    move-object v0, v1

    .line 159
    .local v0, "attributes":Landroidx/media/AudioAttributesCompat;
    :goto_1
    iget-object v1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 160
    :try_start_0
    iget-object v2, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mAudioAttributes:Landroidx/media/AudioAttributesCompat;

    invoke-static {v0, v2}, Landroidx/core/util/ObjectsCompat;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 162
    monitor-exit v1

    return-void

    .line 167
    :cond_2
    iput-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mAudioAttributes:Landroidx/media/AudioAttributesCompat;

    .line 168
    iget-boolean v2, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mHasAudioFocus:Z

    if-eqz v2, :cond_3

    .line 169
    invoke-direct {p0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->requestAudioFocusLocked()Z

    move-result v2

    iput-boolean v2, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mHasAudioFocus:Z

    .line 170
    iget-boolean v2, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mHasAudioFocus:Z

    if-nez v2, :cond_3

    .line 171
    const-string v2, "AudioFocusHandler"

    const-string v3, "Failed to regain audio focus."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    :cond_3
    monitor-exit v1

    .line 175
    return-void

    .line 174
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 221
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 222
    :try_start_0
    invoke-direct {p0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->unregisterReceiverLocked()V

    .line 223
    invoke-direct {p0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->abandonAudioFocusLocked()V

    .line 224
    monitor-exit v0

    .line 225
    return-void

    .line 224
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onPauseRequested()Z
    .locals 2

    .line 190
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 191
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mResumeWhenAudioFocusGain:Z

    .line 192
    monitor-exit v0

    .line 193
    const/4 v0, 0x1

    return v0

    .line 192
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onPlayRequested()Z
    .locals 2

    .line 179
    invoke-direct {p0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->updateAudioAttributesIfNeeded()V

    .line 180
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 181
    :try_start_0
    invoke-direct {p0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->requestAudioFocusLocked()Z

    move-result v1

    if-nez v1, :cond_0

    .line 182
    const/4 v1, 0x0

    monitor-exit v0

    return v1

    .line 184
    :cond_0
    monitor-exit v0

    .line 185
    const/4 v0, 0x1

    return v0

    .line 184
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onPlayerStateChanged(I)V
    .locals 2
    .param p1, "playerState"    # I

    .line 198
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 199
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 212
    :pswitch_0
    :try_start_0
    invoke-direct {p0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->abandonAudioFocusLocked()V

    .line 213
    invoke-direct {p0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->unregisterReceiverLocked()V

    goto :goto_0

    .line 208
    :pswitch_1
    invoke-direct {p0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->updateAudioAttributesIfNeeded()V

    .line 209
    invoke-direct {p0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->registerReceiverLocked()V

    .line 210
    goto :goto_0

    .line 204
    :pswitch_2
    invoke-direct {p0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->updateAudioAttributesIfNeeded()V

    .line 205
    invoke-direct {p0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->unregisterReceiverLocked()V

    .line 206
    goto :goto_0

    .line 201
    :pswitch_3
    invoke-direct {p0}, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->abandonAudioFocusLocked()V

    .line 202
    nop

    .line 216
    :goto_0
    monitor-exit v0

    .line 217
    return-void

    .line 216
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public sendIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .line 229
    iget-object v0, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mBecomingNoisyIntentReceiver:Landroid/content/BroadcastReceiver;

    iget-object v1, p0, Landroidx/media/AudioFocusHandler$AudioFocusHandlerImplBase;->mSession:Landroidx/media/MediaSession2;

    invoke-virtual {v1}, Landroidx/media/MediaSession2;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Landroid/content/BroadcastReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    .line 230
    return-void
.end method
