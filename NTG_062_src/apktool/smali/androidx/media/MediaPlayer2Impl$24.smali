.class Landroidx/media/MediaPlayer2Impl$24;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnDrmConfigHelper;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaPlayer2Impl;->setOnDrmConfigHelper(Landroidx/media/MediaPlayer2$OnDrmConfigHelper;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaPlayer2Impl;

.field final synthetic val$listener:Landroidx/media/MediaPlayer2$OnDrmConfigHelper;


# direct methods
.method constructor <init>(Landroidx/media/MediaPlayer2Impl;Landroidx/media/MediaPlayer2$OnDrmConfigHelper;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaPlayer2Impl;

    .line 1189
    iput-object p1, p0, Landroidx/media/MediaPlayer2Impl$24;->this$0:Landroidx/media/MediaPlayer2Impl;

    iput-object p2, p0, Landroidx/media/MediaPlayer2Impl$24;->val$listener:Landroidx/media/MediaPlayer2$OnDrmConfigHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDrmConfig(Landroid/media/MediaPlayer;)V
    .locals 4
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .line 1192
    iget-object v0, p0, Landroidx/media/MediaPlayer2Impl$24;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroidx/media/MediaPlayer2Impl;->access$100(Landroidx/media/MediaPlayer2Impl;)Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getSourceForPlayer(Landroid/media/MediaPlayer;)Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;

    move-result-object v0

    .line 1193
    .local v0, "src":Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroidx/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroidx/media/DataSourceDesc;

    move-result-object v1

    .line 1194
    .local v1, "dsd":Landroidx/media/DataSourceDesc;
    :goto_0
    iget-object v2, p0, Landroidx/media/MediaPlayer2Impl$24;->val$listener:Landroidx/media/MediaPlayer2$OnDrmConfigHelper;

    iget-object v3, p0, Landroidx/media/MediaPlayer2Impl$24;->this$0:Landroidx/media/MediaPlayer2Impl;

    invoke-interface {v2, v3, v1}, Landroidx/media/MediaPlayer2$OnDrmConfigHelper;->onDrmConfig(Landroidx/media/MediaPlayer2;Landroidx/media/DataSourceDesc;)V

    .line 1195
    return-void
.end method
