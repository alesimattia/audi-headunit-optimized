.class Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaPlayer2Impl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MediaPlayerSource"
.end annotation


# instance fields
.field final mBufferedPercentage:Ljava/util/concurrent/atomic/AtomicInteger;

.field mBufferingState:I

.field volatile mDSD:Landroidx/media/DataSourceDesc;

.field mMp2State:I

.field mPlayPending:Z

.field final mPlayer:Landroid/media/MediaPlayer;

.field mPlayerState:I

.field mSourceState:I

.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;Landroidx/media/DataSourceDesc;)V
    .locals 2
    .param p2, "dsd"    # Landroidx/media/DataSourceDesc;

    .line 2048
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2040
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    .line 2041
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mBufferedPercentage:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2042
    iput v1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mSourceState:I

    .line 2043
    const/16 v0, 0x3e9

    iput v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mMp2State:I

    .line 2044
    iput v1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mBufferingState:I

    .line 2045
    iput v1, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayerState:I

    .line 2049
    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mDSD:Landroidx/media/DataSourceDesc;

    .line 2050
    invoke-static {p1, p0}, Landroidx/media/MediaPlayer2Impl;->access$2200(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;)V

    .line 2051
    return-void
.end method


# virtual methods
.method getDSD()Landroidx/media/DataSourceDesc;
    .locals 1

    .line 2054
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->mDSD:Landroidx/media/DataSourceDesc;

    return-object v0
.end method
