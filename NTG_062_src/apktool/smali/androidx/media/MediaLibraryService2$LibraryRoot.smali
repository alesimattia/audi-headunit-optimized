.class public final Landroidx/media/MediaLibraryService2$LibraryRoot;
.super Ljava/lang/Object;
.source "MediaLibraryService2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaLibraryService2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LibraryRoot"
.end annotation


# static fields
.field public static final EXTRA_OFFLINE:Ljava/lang/String; = "android.media.extra.OFFLINE"

.field public static final EXTRA_RECENT:Ljava/lang/String; = "android.media.extra.RECENT"

.field public static final EXTRA_SUGGESTED:Ljava/lang/String; = "android.media.extra.SUGGESTED"


# instance fields
.field private final mExtras:Landroid/os/Bundle;

.field private final mRootId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "rootId"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 458
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 459
    if-eqz p1, :cond_0

    .line 462
    iput-object p1, p0, Landroidx/media/MediaLibraryService2$LibraryRoot;->mRootId:Ljava/lang/String;

    .line 463
    iput-object p2, p0, Landroidx/media/MediaLibraryService2$LibraryRoot;->mExtras:Landroid/os/Bundle;

    .line 464
    return-void

    .line 460
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "rootId shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getExtras()Landroid/os/Bundle;
    .locals 1

    .line 477
    iget-object v0, p0, Landroidx/media/MediaLibraryService2$LibraryRoot;->mExtras:Landroid/os/Bundle;

    return-object v0
.end method

.method public getRootId()Ljava/lang/String;
    .locals 1

    .line 470
    iget-object v0, p0, Landroidx/media/MediaLibraryService2$LibraryRoot;->mRootId:Ljava/lang/String;

    return-object v0
.end method
