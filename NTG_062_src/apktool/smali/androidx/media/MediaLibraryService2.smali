.class public abstract Landroidx/media/MediaLibraryService2;
.super Landroidx/media/MediaSessionService2;
.source "MediaLibraryService2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/MediaLibraryService2$MyBrowserService;,
        Landroidx/media/MediaLibraryService2$LibraryRoot;,
        Landroidx/media/MediaLibraryService2$MediaLibrarySession;
    }
.end annotation


# static fields
.field public static final SERVICE_INTERFACE:Ljava/lang/String; = "android.media.MediaLibraryService2"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 64
    invoke-direct {p0}, Landroidx/media/MediaSessionService2;-><init>()V

    .line 481
    return-void
.end method

.method static synthetic access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;
    .locals 1
    .param p0, "x0"    # Landroidx/media/MediaLibraryService2;

    .line 64
    invoke-direct {p0}, Landroidx/media/MediaLibraryService2;->getLibrarySession()Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v0

    return-object v0
.end method

.method private getLibrarySession()Landroidx/media/MediaLibraryService2$MediaLibrarySession;
    .locals 1

    .line 358
    invoke-virtual {p0}, Landroidx/media/MediaLibraryService2;->getSession()Landroidx/media/MediaSession2;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    return-object v0
.end method


# virtual methods
.method createBrowserServiceCompat()Landroidx/media/MediaBrowserServiceCompat;
    .locals 2

    .line 339
    new-instance v0, Landroidx/media/MediaLibraryService2$MyBrowserService;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/media/MediaLibraryService2$MyBrowserService;-><init>(Landroidx/media/MediaLibraryService2;Landroidx/media/MediaLibraryService2$1;)V

    return-object v0
.end method

.method getSessionType()I
    .locals 1

    .line 344
    const/4 v0, 0x2

    return v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .line 363
    invoke-super {p0, p1}, Landroidx/media/MediaSessionService2;->onBind(Landroid/content/Intent;)Landroid/os/IBinder;

    move-result-object v0

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    .line 349
    invoke-super {p0}, Landroidx/media/MediaSessionService2;->onCreate()V

    .line 351
    invoke-virtual {p0}, Landroidx/media/MediaLibraryService2;->getSession()Landroidx/media/MediaSession2;

    move-result-object v0

    .line 352
    .local v0, "session":Landroidx/media/MediaSession2;
    instance-of v1, v0, Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    if-eqz v1, :cond_0

    .line 355
    return-void

    .line 353
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Expected MediaLibrarySession, but returned MediaSession2"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public abstract onCreateSession(Ljava/lang/String;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method public bridge synthetic onCreateSession(Ljava/lang/String;)Landroidx/media/MediaSession2;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 64
    invoke-virtual {p0, p1}, Landroidx/media/MediaLibraryService2;->onCreateSession(Ljava/lang/String;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object p1

    return-object p1
.end method
