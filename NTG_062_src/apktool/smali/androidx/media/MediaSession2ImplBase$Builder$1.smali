.class Landroidx/media/MediaSession2ImplBase$Builder$1;
.super Landroidx/media/MediaSession2$SessionCallback;
.source "MediaSession2ImplBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase$Builder;->build()Landroidx/media/MediaSession2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2ImplBase$Builder;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase$Builder;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase$Builder;

    .line 1516
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$Builder$1;->this$0:Landroidx/media/MediaSession2ImplBase$Builder;

    invoke-direct {p0}, Landroidx/media/MediaSession2$SessionCallback;-><init>()V

    return-void
.end method
