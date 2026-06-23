.class Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;
.super Landroidx/media/subtitle/ClosedCaptionWidget;
.source "Cea708CaptionRenderer.java"

# interfaces
.implements Landroidx/media/subtitle/Cea708CCParser$DisplayListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/subtitle/Cea708CaptionRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Cea708CCWidget"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;,
        Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;,
        Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;,
        Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;,
        Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$ScaledLayout;
    }
.end annotation


# instance fields
.field private final mCCHandler:Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;

.field final synthetic this$0:Landroidx/media/subtitle/Cea708CaptionRenderer;


# direct methods
.method constructor <init>(Landroidx/media/subtitle/Cea708CaptionRenderer;Landroid/content/Context;)V
    .locals 1
    .param p1, "this$0"    # Landroidx/media/subtitle/Cea708CaptionRenderer;
    .param p2, "context"    # Landroid/content/Context;

    .line 125
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;-><init>(Landroidx/media/subtitle/Cea708CaptionRenderer;Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 126
    return-void
.end method

.method constructor <init>(Landroidx/media/subtitle/Cea708CaptionRenderer;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "this$0"    # Landroidx/media/subtitle/Cea708CaptionRenderer;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .line 129
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;-><init>(Landroidx/media/subtitle/Cea708CaptionRenderer;Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 130
    return-void
.end method

.method constructor <init>(Landroidx/media/subtitle/Cea708CaptionRenderer;Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6
    .param p1, "this$0"    # Landroidx/media/subtitle/Cea708CaptionRenderer;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .param p4, "defStyleAttr"    # I

    .line 133
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;-><init>(Landroidx/media/subtitle/Cea708CaptionRenderer;Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 134
    return-void
.end method

.method constructor <init>(Landroidx/media/subtitle/Cea708CaptionRenderer;Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 2
    .param p1, "this$0"    # Landroidx/media/subtitle/Cea708CaptionRenderer;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .param p4, "defStyleAttr"    # I
    .param p5, "defStyleRes"    # I

    .line 137
    iput-object p1, p0, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->this$0:Landroidx/media/subtitle/Cea708CaptionRenderer;

    .line 138
    invoke-direct {p0, p2, p3, p4, p5}, Landroidx/media/subtitle/ClosedCaptionWidget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 140
    new-instance v0, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;

    iget-object v1, p0, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->mClosedCaptionLayout:Landroidx/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;

    check-cast v1, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    invoke-direct {v0, p0, v1}, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;-><init>(Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;)V

    iput-object v0, p0, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->mCCHandler:Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;

    .line 141
    return-void
.end method


# virtual methods
.method public createCaptionLayout(Landroid/content/Context;)Landroidx/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 145
    new-instance v0, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    invoke-direct {v0, p0, p1}, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;-><init>(Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;Landroid/content/Context;)V

    return-object v0
.end method

.method public emitEvent(Landroidx/media/subtitle/Cea708CCParser$CaptionEvent;)V
    .locals 2
    .param p1, "event"    # Landroidx/media/subtitle/Cea708CCParser$CaptionEvent;

    .line 150
    iget-object v0, p0, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->mCCHandler:Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;

    invoke-virtual {v0, p1}, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->processCaptionEvent(Landroidx/media/subtitle/Cea708CCParser$CaptionEvent;)V

    .line 152
    invoke-virtual {p0}, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->getHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->setSize(II)V

    .line 154
    iget-object v0, p0, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->mListener:Landroidx/media/subtitle/SubtitleTrack$RenderingWidget$OnChangedListener;

    if-eqz v0, :cond_0

    .line 155
    iget-object v0, p0, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->mListener:Landroidx/media/subtitle/SubtitleTrack$RenderingWidget$OnChangedListener;

    invoke-interface {v0, p0}, Landroidx/media/subtitle/SubtitleTrack$RenderingWidget$OnChangedListener;->onChanged(Landroidx/media/subtitle/SubtitleTrack$RenderingWidget;)V

    .line 157
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 161
    invoke-super {p0, p1}, Landroidx/media/subtitle/ClosedCaptionWidget;->onDraw(Landroid/graphics/Canvas;)V

    .line 162
    iget-object v0, p0, Landroidx/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->mClosedCaptionLayout:Landroidx/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    .line 163
    return-void
.end method
