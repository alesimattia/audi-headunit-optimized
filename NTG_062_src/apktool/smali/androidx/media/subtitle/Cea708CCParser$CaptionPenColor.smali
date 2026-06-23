.class public Landroidx/media/subtitle/Cea708CCParser$CaptionPenColor;
.super Ljava/lang/Object;
.source "Cea708CCParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/subtitle/Cea708CCParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CaptionPenColor"
.end annotation


# instance fields
.field public final backgroundColor:Landroidx/media/subtitle/Cea708CCParser$CaptionColor;

.field public final edgeColor:Landroidx/media/subtitle/Cea708CCParser$CaptionColor;

.field public final foregroundColor:Landroidx/media/subtitle/Cea708CCParser$CaptionColor;


# direct methods
.method constructor <init>(Landroidx/media/subtitle/Cea708CCParser$CaptionColor;Landroidx/media/subtitle/Cea708CCParser$CaptionColor;Landroidx/media/subtitle/Cea708CCParser$CaptionColor;)V
    .locals 0
    .param p1, "foregroundColor"    # Landroidx/media/subtitle/Cea708CCParser$CaptionColor;
    .param p2, "backgroundColor"    # Landroidx/media/subtitle/Cea708CCParser$CaptionColor;
    .param p3, "edgeColor"    # Landroidx/media/subtitle/Cea708CCParser$CaptionColor;

    .line 823
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 824
    iput-object p1, p0, Landroidx/media/subtitle/Cea708CCParser$CaptionPenColor;->foregroundColor:Landroidx/media/subtitle/Cea708CCParser$CaptionColor;

    .line 825
    iput-object p2, p0, Landroidx/media/subtitle/Cea708CCParser$CaptionPenColor;->backgroundColor:Landroidx/media/subtitle/Cea708CCParser$CaptionColor;

    .line 826
    iput-object p3, p0, Landroidx/media/subtitle/Cea708CCParser$CaptionPenColor;->edgeColor:Landroidx/media/subtitle/Cea708CCParser$CaptionColor;

    .line 827
    return-void
.end method
