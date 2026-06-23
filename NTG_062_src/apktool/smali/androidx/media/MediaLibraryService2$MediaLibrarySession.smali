.class public final Landroidx/media/MediaLibraryService2$MediaLibrarySession;
.super Landroidx/media/MediaSession2;
.source "MediaLibraryService2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaLibraryService2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MediaLibrarySession"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/MediaLibraryService2$MediaLibrarySession$Builder;,
        Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;
    }
.end annotation


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2$SupportLibraryImpl;)V
    .locals 0
    .param p1, "impl"    # Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 267
    invoke-direct {p0, p1}, Landroidx/media/MediaSession2;-><init>(Landroidx/media/MediaSession2$SupportLibraryImpl;)V

    .line 268
    return-void
.end method

.method private getService()Landroidx/media/MediaLibraryService2;
    .locals 1

    .line 324
    invoke-virtual {p0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaLibraryService2;

    return-object v0
.end method

.method private getServiceCompat()Landroidx/media/MediaBrowserServiceCompat;
    .locals 1

    .line 328
    invoke-direct {p0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getService()Landroidx/media/MediaLibraryService2;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media/MediaLibraryService2;->getServiceCompat()Landroidx/media/MediaBrowserServiceCompat;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method getCallback()Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;
    .locals 1

    .line 333
    invoke-super {p0}, Landroidx/media/MediaSession2;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;

    return-object v0
.end method

.method bridge synthetic getCallback()Landroidx/media/MediaSession2$SessionCallback;
    .locals 1

    .line 75
    invoke-virtual {p0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getCallback()Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;

    move-result-object v0

    return-object v0
.end method

.method public notifyChildrenChanged(Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 7
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "parentId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "itemCount"    # I
    .param p4, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 285
    nop

    .line 286
    invoke-direct {p0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getServiceCompat()Landroidx/media/MediaBrowserServiceCompat;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroidx/media/MediaBrowserServiceCompat;->getSubscribingBrowsers(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 287
    .local v0, "subscribingBrowsers":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaSessionManager$RemoteUserInfo;>;"
    invoke-virtual {p0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getImpl()Landroidx/media/MediaSession2$SupportLibraryImpl;

    move-result-object v1

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    move-object v6, v0

    invoke-virtual/range {v1 .. v6}, Landroidx/media/MediaSession2$SupportLibraryImpl;->notifyChildrenChanged(Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;ILandroid/os/Bundle;Ljava/util/List;)V

    .line 289
    return-void
.end method

.method public notifyChildrenChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 1
    .param p1, "parentId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "itemCount"    # I
    .param p3, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 303
    if-nez p3, :cond_0

    .line 304
    invoke-direct {p0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getServiceCompat()Landroidx/media/MediaBrowserServiceCompat;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/media/MediaBrowserServiceCompat;->notifyChildrenChanged(Ljava/lang/String;)V

    goto :goto_0

    .line 306
    :cond_0
    invoke-direct {p0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getServiceCompat()Landroidx/media/MediaBrowserServiceCompat;

    move-result-object v0

    invoke-virtual {v0, p1, p3}, Landroidx/media/MediaBrowserServiceCompat;->notifyChildrenChanged(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 308
    :goto_0
    return-void
.end method

.method public notifySearchResultChanged(Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 1
    .param p1, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "query"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "itemCount"    # I
    .param p4, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 320
    invoke-virtual {p0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getImpl()Landroidx/media/MediaSession2$SupportLibraryImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Landroidx/media/MediaSession2$SupportLibraryImpl;->notifySearchResultChanged(Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 321
    return-void
.end method
