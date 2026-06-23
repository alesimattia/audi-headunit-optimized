.class Landroidx/media/MediaSessionLegacyStub$5;
.super Ljava/lang/Object;
.source "MediaSessionLegacyStub.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSessionLegacyStub;->onSeekTo(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSessionLegacyStub;

.field final synthetic val$pos:J


# direct methods
.method constructor <init>(Landroidx/media/MediaSessionLegacyStub;J)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSessionLegacyStub;

    .line 186
    iput-object p1, p0, Landroidx/media/MediaSessionLegacyStub$5;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iput-wide p2, p0, Landroidx/media/MediaSessionLegacyStub$5;->val$pos:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 189
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub$5;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v0, v0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 190
    return-void

    .line 192
    :cond_0
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub$5;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v0, v0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    iget-wide v1, p0, Landroidx/media/MediaSessionLegacyStub$5;->val$pos:J

    invoke-virtual {v0, v1, v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->seekTo(J)V

    .line 193
    return-void
.end method
