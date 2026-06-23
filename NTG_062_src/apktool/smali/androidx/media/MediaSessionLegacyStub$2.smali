.class Landroidx/media/MediaSessionLegacyStub$2;
.super Ljava/lang/Object;
.source "MediaSessionLegacyStub.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSessionLegacyStub;->onPlay()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSessionLegacyStub;


# direct methods
.method constructor <init>(Landroidx/media/MediaSessionLegacyStub;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSessionLegacyStub;

    .line 147
    iput-object p1, p0, Landroidx/media/MediaSessionLegacyStub$2;->this$0:Landroidx/media/MediaSessionLegacyStub;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 150
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub$2;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v0, v0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 151
    return-void

    .line 153
    :cond_0
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub$2;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v0, v0, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v0}, Landroidx/media/MediaSession2$SupportLibraryImpl;->play()V

    .line 154
    return-void
.end method
