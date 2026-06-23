.class public abstract Landroidx/media/MediaPlayer2$DrmEventCallback;
.super Ljava/lang/Object;
.source "MediaPlayer2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaPlayer2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "DrmEventCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1464
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDrmInfo(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;Landroidx/media/MediaPlayer2$DrmInfo;)V
    .locals 0
    .param p1, "mp"    # Landroidx/media/MediaPlayer2;
    .param p2, "dsd"    # Landroidx/media/DataSourceDesc;
    .param p3, "drmInfo"    # Landroidx/media/MediaPlayer2$DrmInfo;

    .line 1473
    return-void
.end method

.method public onDrmPrepared(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;I)V
    .locals 0
    .param p1, "mp"    # Landroidx/media/MediaPlayer2;
    .param p2, "dsd"    # Landroidx/media/DataSourceDesc;
    .param p3, "status"    # I

    .line 1484
    return-void
.end method
