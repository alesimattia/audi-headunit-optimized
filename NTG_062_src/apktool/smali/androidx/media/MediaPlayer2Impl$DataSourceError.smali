.class Landroidx/media/MediaPlayer2Impl$DataSourceError;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaPlayer2Impl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DataSourceError"
.end annotation


# instance fields
.field final mDSD:Landroidx/media/DataSourceDesc;

.field final mExtra:I

.field final mWhat:I


# direct methods
.method constructor <init>(Landroidx/media/DataSourceDesc;II)V
    .locals 0
    .param p1, "dsd"    # Landroidx/media/DataSourceDesc;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .line 2029
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2030
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$DataSourceError;->mDSD:Landroidx/media/DataSourceDesc;

    .line 2031
    iput p2, p0, Landroidx/media/MediaPlayer2Impl$DataSourceError;->mWhat:I

    .line 2032
    iput p3, p0, Landroidx/media/MediaPlayer2Impl$DataSourceError;->mExtra:I

    .line 2033
    return-void
.end method
