.class Landroidx/media/MediaPlayer2Impl$42$1;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$DrmEventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl$42;->onDrmInfo(Landroid/media/MediaPlayer;Landroid/media/MediaPlayer$DrmInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaPlayer2Impl$42;

.field final synthetic val$drmInfo:Landroid/media/MediaPlayer$DrmInfo;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl$42;Landroid/media/MediaPlayer$DrmInfo;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaPlayer2Impl$42;

    .line 1768
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$42$1;->this$1:Landroidx/media/MediaPlayer2Impl$42;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$42$1;->val$drmInfo:Landroid/media/MediaPlayer$DrmInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/MediaPlayer2$DrmEventCallback;)V
    .locals 6
    .param p1, "cb"    # Landroidx/media/MediaPlayer2$DrmEventCallback;

    .line 1771
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$42$1;->this$1:Landroidx/media/MediaPlayer2Impl$42;

    iget-object v0, v0, Landroidx/media/MediaPlayer2Impl$42;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$42$1;->this$1:Landroidx/media/MediaPlayer2Impl$42;

    iget-object v1, v1, Landroidx/media/MediaPlayer2Impl$42;->val$src:Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-virtual {v1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroidx/media/DataSourceDesc;

    move-result-object v1

    new-instance v2, Landroidx/media/MediaPlayer2Impl$DrmInfoImpl;

    iget-object v3, p0, Landroidx/media/MediaPlayer2Impl$42$1;->val$drmInfo:Landroid/media/MediaPlayer$DrmInfo;

    .line 1772
    invoke-virtual {v3}, Landroid/media/MediaPlayer$DrmInfo;->getPssh()Ljava/util/Map;

    move-result-object v3

    iget-object v4, p0, Landroidx/media/MediaPlayer2Impl$42$1;->val$drmInfo:Landroid/media/MediaPlayer$DrmInfo;

    invoke-virtual {v4}, Landroid/media/MediaPlayer$DrmInfo;->getSupportedSchemes()[Ljava/util/UUID;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v5}, Landroidx/media/MediaPlayer2Impl$DrmInfoImpl;-><init>(Ljava/util/Map;[Ljava/util/UUID;Landroidx/media/MediaPlayer2Impl$1;)V

    .line 1771
    invoke-virtual {p1, v0, v1, v2}, Landroidx/media/MediaPlayer2$DrmEventCallback;->onDrmInfo(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;Landroidx/media/MediaPlayer2$DrmInfo;)V

    .line 1773
    return-void
.end method
