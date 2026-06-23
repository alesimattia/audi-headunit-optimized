.class public Landroidx/media/MediaBrowser2$BrowserCallback;
.super Landroidx/media/MediaController2$ControllerCallback;
.source "MediaBrowser2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaBrowser2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BrowserCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 73
    invoke-direct {p0}, Landroidx/media/MediaController2$ControllerCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onChildrenChanged(Landroidx/media/MediaBrowser2;Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "browser"    # Landroidx/media/MediaBrowser2;
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

    .line 102
    return-void
.end method

.method public onGetChildrenDone(Landroidx/media/MediaBrowser2;Ljava/lang/String;IILjava/util/List;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "browser"    # Landroidx/media/MediaBrowser2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "parentId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "page"    # I
    .param p4, "pageSize"    # I
    .param p5    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media/MediaBrowser2;",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .line 119
    .local p5, "result":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    return-void
.end method

.method public onGetItemDone(Landroidx/media/MediaBrowser2;Ljava/lang/String;Landroidx/media/MediaItem2;)V
    .locals 0
    .param p1, "browser"    # Landroidx/media/MediaBrowser2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "mediaId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "result"    # Landroidx/media/MediaItem2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 132
    return-void
.end method

.method public onGetLibraryRootDone(Landroidx/media/MediaBrowser2;Landroid/os/Bundle;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "browser"    # Landroidx/media/MediaBrowser2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "rootHints"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "rootMediaId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "rootExtra"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 86
    return-void
.end method

.method public onGetSearchResultDone(Landroidx/media/MediaBrowser2;Ljava/lang/String;IILjava/util/List;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "browser"    # Landroidx/media/MediaBrowser2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "query"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "page"    # I
    .param p4, "pageSize"    # I
    .param p5    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media/MediaBrowser2;",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .line 164
    .local p5, "result":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    return-void
.end method

.method public onSearchResultChanged(Landroidx/media/MediaBrowser2;Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "browser"    # Landroidx/media/MediaBrowser2;
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

    .line 144
    return-void
.end method
