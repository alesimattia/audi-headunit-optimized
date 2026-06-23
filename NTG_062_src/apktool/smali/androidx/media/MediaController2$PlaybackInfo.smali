.class public final Landroidx/media/MediaController2$PlaybackInfo;
.super Ljava/lang/Object;
.source "MediaController2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaController2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PlaybackInfo"
.end annotation


# static fields
.field private static final KEY_AUDIO_ATTRIBUTES:Ljava/lang/String; = "android.media.audio_info.audio_attrs"

.field private static final KEY_CONTROL_TYPE:Ljava/lang/String; = "android.media.audio_info.control_type"

.field private static final KEY_CURRENT_VOLUME:Ljava/lang/String; = "android.media.audio_info.current_volume"

.field private static final KEY_MAX_VOLUME:Ljava/lang/String; = "android.media.audio_info.max_volume"

.field private static final KEY_PLAYBACK_TYPE:Ljava/lang/String; = "android.media.audio_info.playback_type"

.field public static final PLAYBACK_TYPE_LOCAL:I = 0x1

.field public static final PLAYBACK_TYPE_REMOTE:I = 0x2


# instance fields
.field private final mAudioAttrsCompat:Landroidx/media/AudioAttributesCompat;

.field private final mControlType:I

.field private final mCurrentVolume:I

.field private final mMaxVolume:I

.field private final mPlaybackType:I


# direct methods
.method constructor <init>(ILandroidx/media/AudioAttributesCompat;III)V
    .locals 0
    .param p1, "playbackType"    # I
    .param p2, "attrs"    # Landroidx/media/AudioAttributesCompat;
    .param p3, "controlType"    # I
    .param p4, "max"    # I
    .param p5, "current"    # I

    .line 957
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 958
    iput p1, p0, Landroidx/media/MediaController2$PlaybackInfo;->mPlaybackType:I

    .line 959
    iput-object p2, p0, Landroidx/media/MediaController2$PlaybackInfo;->mAudioAttrsCompat:Landroidx/media/AudioAttributesCompat;

    .line 960
    iput p3, p0, Landroidx/media/MediaController2$PlaybackInfo;->mControlType:I

    .line 961
    iput p4, p0, Landroidx/media/MediaController2$PlaybackInfo;->mMaxVolume:I

    .line 962
    iput p5, p0, Landroidx/media/MediaController2$PlaybackInfo;->mCurrentVolume:I

    .line 963
    return-void
.end method

.method static createPlaybackInfo(ILandroidx/media/AudioAttributesCompat;III)Landroidx/media/MediaController2$PlaybackInfo;
    .locals 7
    .param p0, "playbackType"    # I
    .param p1, "attrs"    # Landroidx/media/AudioAttributesCompat;
    .param p2, "controlType"    # I
    .param p3, "max"    # I
    .param p4, "current"    # I

    .line 1036
    new-instance v6, Landroidx/media/MediaController2$PlaybackInfo;

    move-object v0, v6

    move v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Landroidx/media/MediaController2$PlaybackInfo;-><init>(ILandroidx/media/AudioAttributesCompat;III)V

    return-object v6
.end method

.method static fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaController2$PlaybackInfo;
    .locals 6
    .param p0, "bundle"    # Landroid/os/Bundle;

    .line 1040
    if-nez p0, :cond_0

    .line 1041
    const/4 v0, 0x0

    return-object v0

    .line 1043
    :cond_0
    const-string v0, "android.media.audio_info.playback_type"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 1044
    .local v0, "volumeType":I
    const-string v1, "android.media.audio_info.control_type"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 1045
    .local v1, "volumeControl":I
    const-string v2, "android.media.audio_info.max_volume"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 1046
    .local v2, "maxVolume":I
    const-string v3, "android.media.audio_info.current_volume"

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 1047
    .local v3, "currentVolume":I
    const-string v4, "android.media.audio_info.audio_attrs"

    .line 1048
    invoke-virtual {p0, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v4

    .line 1047
    invoke-static {v4}, Landroidx/media/AudioAttributesCompat;->fromBundle(Landroid/os/Bundle;)Landroidx/media/AudioAttributesCompat;

    move-result-object v4

    .line 1049
    .local v4, "attrs":Landroidx/media/AudioAttributesCompat;
    invoke-static {v0, v4, v1, v2, v3}, Landroidx/media/MediaController2$PlaybackInfo;->createPlaybackInfo(ILandroidx/media/AudioAttributesCompat;III)Landroidx/media/MediaController2$PlaybackInfo;

    move-result-object v5

    return-object v5
.end method


# virtual methods
.method public getAudioAttributes()Landroidx/media/AudioAttributesCompat;
    .locals 1

    .line 987
    iget-object v0, p0, Landroidx/media/MediaController2$PlaybackInfo;->mAudioAttrsCompat:Landroidx/media/AudioAttributesCompat;

    return-object v0
.end method

.method public getControlType()I
    .locals 1

    .line 1001
    iget v0, p0, Landroidx/media/MediaController2$PlaybackInfo;->mControlType:I

    return v0
.end method

.method public getCurrentVolume()I
    .locals 1

    .line 1019
    iget v0, p0, Landroidx/media/MediaController2$PlaybackInfo;->mCurrentVolume:I

    return v0
.end method

.method public getMaxVolume()I
    .locals 1

    .line 1010
    iget v0, p0, Landroidx/media/MediaController2$PlaybackInfo;->mMaxVolume:I

    return v0
.end method

.method public getPlaybackType()I
    .locals 1

    .line 975
    iget v0, p0, Landroidx/media/MediaController2$PlaybackInfo;->mPlaybackType:I

    return v0
.end method

.method toBundle()Landroid/os/Bundle;
    .locals 3

    .line 1023
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1024
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "android.media.audio_info.playback_type"

    iget v2, p0, Landroidx/media/MediaController2$PlaybackInfo;->mPlaybackType:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1025
    const-string v1, "android.media.audio_info.control_type"

    iget v2, p0, Landroidx/media/MediaController2$PlaybackInfo;->mControlType:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1026
    const-string v1, "android.media.audio_info.max_volume"

    iget v2, p0, Landroidx/media/MediaController2$PlaybackInfo;->mMaxVolume:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1027
    const-string v1, "android.media.audio_info.current_volume"

    iget v2, p0, Landroidx/media/MediaController2$PlaybackInfo;->mCurrentVolume:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1028
    iget-object v1, p0, Landroidx/media/MediaController2$PlaybackInfo;->mAudioAttrsCompat:Landroidx/media/AudioAttributesCompat;

    if-eqz v1, :cond_0

    .line 1029
    const-string v1, "android.media.audio_info.audio_attrs"

    iget-object v2, p0, Landroidx/media/MediaController2$PlaybackInfo;->mAudioAttrsCompat:Landroidx/media/AudioAttributesCompat;

    invoke-virtual {v2}, Landroidx/media/AudioAttributesCompat;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 1031
    :cond_0
    return-object v0
.end method
