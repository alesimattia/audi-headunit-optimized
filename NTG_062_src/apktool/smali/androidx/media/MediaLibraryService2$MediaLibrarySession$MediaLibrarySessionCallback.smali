.class public Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;
.super Landroidx/media/MediaSession2$SessionCallback;
.source "MediaLibraryService2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaLibraryService2$MediaLibrarySession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaLibrarySessionCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 79
    invoke-direct {p0}, Landroidx/media/MediaSession2$SessionCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetChildren(Landroidx/media/MediaLibraryService2$MediaLibrarySession;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;IILandroid/os/Bundle;)Ljava/util/List;
    .locals 1
    .param p1, "session"    # Landroidx/media/MediaLibraryService2$MediaLibrarySession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "parentId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "page"    # I
    .param p5, "pageSize"    # I
    .param p6, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media/MediaLibraryService2$MediaLibrarySession;",
            "Landroidx/media/MediaSession2$ControllerInfo;",
            "Ljava/lang/String;",
            "II",
            "Landroid/os/Bundle;",
            ")",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;"
        }
    .end annotation

    .line 140
    const/4 v0, 0x0

    return-object v0
.end method

.method public onGetItem(Landroidx/media/MediaLibraryService2$MediaLibrarySession;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;)Landroidx/media/MediaItem2;
    .locals 1
    .param p1, "session"    # Landroidx/media/MediaLibraryService2$MediaLibrarySession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controllerInfo"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "mediaId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 121
    const/4 v0, 0x0

    return-object v0
.end method

.method public onGetLibraryRoot(Landroidx/media/MediaLibraryService2$MediaLibrarySession;Landroidx/media/MediaSession2$ControllerInfo;Landroid/os/Bundle;)Landroidx/media/MediaLibraryService2$LibraryRoot;
    .locals 1
    .param p1, "session"    # Landroidx/media/MediaLibraryService2$MediaLibrarySession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controllerInfo"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 106
    const/4 v0, 0x0

    return-object v0
.end method

.method public onGetSearchResult(Landroidx/media/MediaLibraryService2$MediaLibrarySession;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;IILandroid/os/Bundle;)Ljava/util/List;
    .locals 1
    .param p1, "session"    # Landroidx/media/MediaLibraryService2$MediaLibrarySession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controllerInfo"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "query"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "page"    # I
    .param p5, "pageSize"    # I
    .param p6, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media/MediaLibraryService2$MediaLibrarySession;",
            "Landroidx/media/MediaSession2$ControllerInfo;",
            "Ljava/lang/String;",
            "II",
            "Landroid/os/Bundle;",
            ")",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;"
        }
    .end annotation

    .line 206
    const/4 v0, 0x0

    return-object v0
.end method

.method public onSearch(Landroidx/media/MediaLibraryService2$MediaLibrarySession;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaLibraryService2$MediaLibrarySession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controllerInfo"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "query"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 185
    return-void
.end method

.method public onSubscribe(Landroidx/media/MediaLibraryService2$MediaLibrarySession;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaLibraryService2$MediaLibrarySession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "parentId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 159
    return-void
.end method

.method public onUnsubscribe(Landroidx/media/MediaLibraryService2$MediaLibrarySession;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;)V
    .locals 0
    .param p1, "session"    # Landroidx/media/MediaLibraryService2$MediaLibrarySession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "controller"    # Landroidx/media/MediaSession2$ControllerInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "parentId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 171
    return-void
.end method
