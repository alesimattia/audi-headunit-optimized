.class public final Landroidx/media/MediaSession2$CommandButton$Builder;
.super Ljava/lang/Object;
.source "MediaSession2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaSession2$CommandButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private mCommand:Landroidx/media/SessionCommand2;

.field private mDisplayName:Ljava/lang/String;

.field private mEnabled:Z

.field private mExtras:Landroid/os/Bundle;

.field private mIconResId:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1445
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Landroidx/media/MediaSession2$CommandButton;
    .locals 8
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1515
    new-instance v7, Landroidx/media/MediaSession2$CommandButton;

    iget-object v1, p0, Landroidx/media/MediaSession2$CommandButton$Builder;->mCommand:Landroidx/media/SessionCommand2;

    iget v2, p0, Landroidx/media/MediaSession2$CommandButton$Builder;->mIconResId:I

    iget-object v3, p0, Landroidx/media/MediaSession2$CommandButton$Builder;->mDisplayName:Ljava/lang/String;

    iget-object v4, p0, Landroidx/media/MediaSession2$CommandButton$Builder;->mExtras:Landroid/os/Bundle;

    iget-boolean v5, p0, Landroidx/media/MediaSession2$CommandButton$Builder;->mEnabled:Z

    const/4 v6, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Landroidx/media/MediaSession2$CommandButton;-><init>(Landroidx/media/SessionCommand2;ILjava/lang/String;Landroid/os/Bundle;ZLandroidx/media/MediaSession2$1;)V

    return-object v7
.end method

.method public setCommand(Landroidx/media/SessionCommand2;)Landroidx/media/MediaSession2$CommandButton$Builder;
    .locals 0
    .param p1, "command"    # Landroidx/media/SessionCommand2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1459
    iput-object p1, p0, Landroidx/media/MediaSession2$CommandButton$Builder;->mCommand:Landroidx/media/SessionCommand2;

    .line 1460
    return-object p0
.end method

.method public setDisplayName(Ljava/lang/String;)Landroidx/media/MediaSession2$CommandButton$Builder;
    .locals 0
    .param p1, "displayName"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1483
    iput-object p1, p0, Landroidx/media/MediaSession2$CommandButton$Builder;->mDisplayName:Ljava/lang/String;

    .line 1484
    return-object p0
.end method

.method public setEnabled(Z)Landroidx/media/MediaSession2$CommandButton$Builder;
    .locals 0
    .param p1, "enabled"    # Z
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1495
    iput-boolean p1, p0, Landroidx/media/MediaSession2$CommandButton$Builder;->mEnabled:Z

    .line 1496
    return-object p0
.end method

.method public setExtras(Landroid/os/Bundle;)Landroidx/media/MediaSession2$CommandButton$Builder;
    .locals 0
    .param p1, "extras"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1505
    iput-object p1, p0, Landroidx/media/MediaSession2$CommandButton$Builder;->mExtras:Landroid/os/Bundle;

    .line 1506
    return-object p0
.end method

.method public setIconResId(I)Landroidx/media/MediaSession2$CommandButton$Builder;
    .locals 0
    .param p1, "resId"    # I
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1473
    iput p1, p0, Landroidx/media/MediaSession2$CommandButton$Builder;->mIconResId:I

    .line 1474
    return-object p0
.end method
