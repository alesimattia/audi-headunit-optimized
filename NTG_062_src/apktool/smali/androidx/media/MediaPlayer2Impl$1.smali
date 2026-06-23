.class Landroidx/media/MediaPlayer2Impl$1;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroidx/media/MediaPlayer2Impl$Mp2EventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl;->handleDataSourceError(Landroidx/media/MediaPlayer2Impl$DataSourceError;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;

.field final synthetic val$err:Landroidx/media/MediaPlayer2Impl$DataSourceError;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2Impl$DataSourceError;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlayer2Impl;

    .line 161
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$1;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$1;->val$err:Landroidx/media/MediaPlayer2Impl$DataSourceError;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroidx/media/MediaPlayer2$EventCallback;)V
    .locals 4
    .param p1, "callback"    # Landroidx/media/MediaPlayer2$EventCallback;

    .line 164
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$1;->this$0:Landroidx/media/MediaPlayer2Impl;

    iget-object v1, p0, Landroidx/media/MediaPlayer2Impl$1;->val$err:Landroidx/media/MediaPlayer2Impl$DataSourceError;

    iget-object v1, v1, Landroidx/media/MediaPlayer2Impl$DataSourceError;->mDSD:Landroidx/media/DataSourceDesc;

    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$1;->val$err:Landroidx/media/MediaPlayer2Impl$DataSourceError;

    iget v2, v2, Landroidx/media/MediaPlayer2Impl$DataSourceError;->mWhat:I

    iget-object v3, p0, Landroidx/media/MediaPlayer2Impl$1;->val$err:Landroidx/media/MediaPlayer2Impl$DataSourceError;

    iget v3, v3, Landroidx/media/MediaPlayer2Impl$DataSourceError;->mExtra:I

    invoke-virtual {p1, v0, v1, v2, v3}, Landroidx/media/MediaPlayer2$EventCallback;->onError(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;II)V

    .line 165
    return-void
.end method
