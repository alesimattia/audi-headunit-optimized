.class Landroidx/media/MediaLibrarySessionImplBase$Builder$1;
.super Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;
.source "MediaLibrarySessionImplBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaLibrarySessionImplBase$Builder;->build()Landroidx/media/MediaLibraryService2$MediaLibrarySession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaLibrarySessionImplBase$Builder;


# direct methods
.method constructor <init>(Landroidx/media/MediaLibrarySessionImplBase$Builder;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaLibrarySessionImplBase$Builder;

    .line 59
    iput-object p1, p0, Landroidx/media/MediaLibrarySessionImplBase$Builder$1;->this$0:Landroidx/media/MediaLibrarySessionImplBase$Builder;

    invoke-direct {p0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;-><init>()V

    return-void
.end method
