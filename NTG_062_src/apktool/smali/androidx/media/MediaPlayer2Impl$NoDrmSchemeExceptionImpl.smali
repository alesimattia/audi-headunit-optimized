.class public final Landroidx/media/MediaPlayer2Impl$NoDrmSchemeExceptionImpl;
.super Landroidx/media/MediaPlayer2$NoDrmSchemeException;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaPlayer2Impl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "NoDrmSchemeExceptionImpl"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "detailMessage"    # Ljava/lang/String;

    .line 1939
    invoke-direct {p0, p1}, Landroidx/media/MediaPlayer2$NoDrmSchemeException;-><init>(Ljava/lang/String;)V

    .line 1940
    return-void
.end method
