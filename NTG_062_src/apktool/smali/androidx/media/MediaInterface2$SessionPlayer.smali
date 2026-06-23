.class abstract Landroidx/media/MediaInterface2$SessionPlayer;
.super Ljava/lang/Object;
.source "MediaInterface2.java"

# interfaces
.implements Landroidx/media/MediaInterface2$SessionPlaybackControl;
.implements Landroidx/media/MediaInterface2$SessionPlaylistControl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaInterface2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "SessionPlayer"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract notifyError(ILandroid/os/Bundle;)V
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method abstract skipBackward()V
.end method

.method abstract skipForward()V
.end method
