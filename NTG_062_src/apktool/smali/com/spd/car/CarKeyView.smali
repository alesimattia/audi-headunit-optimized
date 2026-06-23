.class public Lcom/spd/car/CarKeyView;
.super Landroid/widget/FrameLayout;
.source "CarKeyView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/view/View$OnLongClickListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "CarKeyView"


# instance fields
.field private mBrightness:I

.field private mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

.field private mViewType:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 32
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/spd/car/CarKeyView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/spd/car/CarKeyView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .line 40
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    const/4 v0, 0x0

    iput v0, p0, Lcom/spd/car/CarKeyView;->mViewType:I

    .line 43
    invoke-direct {p0}, Lcom/spd/car/CarKeyView;->initView()V

    .line 44
    return-void
.end method

.method private getBrightness()I
    .locals 3

    .line 111
    invoke-virtual {p0}, Lcom/spd/car/CarKeyView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "screen_brightness"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private initView()V
    .locals 6

    .line 47
    invoke-virtual {p0}, Lcom/spd/car/CarKeyView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f070002

    invoke-static {v0, v1, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 48
    const v0, 0x7f050018

    invoke-virtual {p0, v0}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    const v1, 0x7f05004b

    invoke-virtual {p0, v1}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    const v2, 0x7f050051

    invoke-virtual {p0, v2}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    const v3, 0x7f050041

    invoke-virtual {p0, v3}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    const v4, 0x7f05004e

    invoke-virtual {p0, v4}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    const v5, 0x7f05003b

    invoke-virtual {p0, v5}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    const v5, 0x7f05003c

    invoke-virtual {p0, v5}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    const v5, 0x7f05003d

    invoke-virtual {p0, v5}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    const v5, 0x7f05003e

    invoke-virtual {p0, v5}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    invoke-virtual {p0, v0}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 59
    invoke-virtual {p0, v1}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 60
    invoke-virtual {p0, v2}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 61
    invoke-virtual {p0, v3}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 62
    invoke-virtual {p0, v4}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 63
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/spd/car/CarKeyView;->updateViewType(I)V

    .line 64
    invoke-virtual {p0, p0}, Lcom/spd/car/CarKeyView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 65
    invoke-direct {p0}, Lcom/spd/car/CarKeyView;->getBrightness()I

    move-result v0

    iput v0, p0, Lcom/spd/car/CarKeyView;->mBrightness:I

    .line 66
    return-void
.end method

.method private setKey(II)V
    .locals 3
    .param p1, "key"    # I
    .param p2, "action"    # I

    .line 148
    const-string v0, "CarKeyView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setKey:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",action:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    iget-object v0, p0, Lcom/spd/car/CarKeyView;->mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

    if-eqz v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/spd/car/CarKeyView;->mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

    invoke-virtual {v0, p1, p2}, Lcom/spd/xhsntg/CarInfoManager;->setKeyEvent(II)V

    .line 152
    :cond_0
    return-void
.end method

.method private updateViewType(I)V
    .locals 6
    .param p1, "type"    # I

    .line 69
    iput p1, p0, Lcom/spd/car/CarKeyView;->mViewType:I

    .line 70
    const v0, 0x7f050051

    invoke-virtual {p0, v0}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 71
    .local v1, "view":Landroid/widget/ImageView;
    const/4 v2, 0x1

    if-ne p1, v2, :cond_0

    const v3, 0x7f0400bf

    goto :goto_0

    :cond_0
    const v3, 0x7f0400c3

    :goto_0
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 72
    invoke-virtual {p0, v0}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 73
    const v0, 0x7f050041

    invoke-virtual {p0, v0}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v3, 0x8

    const/4 v4, 0x0

    if-ne p1, v2, :cond_1

    move v5, v4

    goto :goto_1

    :cond_1
    move v5, v3

    :goto_1
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 74
    const v0, 0x7f05004e

    invoke-virtual {p0, v0}, Lcom/spd/car/CarKeyView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-ne p1, v2, :cond_2

    move v3, v4

    nop

    :cond_2
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 75
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    .line 83
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 84
    invoke-direct {p0}, Lcom/spd/car/CarKeyView;->getBrightness()I

    move-result v0

    iput v0, p0, Lcom/spd/car/CarKeyView;->mBrightness:I

    .line 85
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .line 89
    const-string v0, "CarKeyView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onClick:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, 0x5

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 102
    :pswitch_0
    iget v0, p0, Lcom/spd/car/CarKeyView;->mBrightness:I

    add-int/lit8 v0, v0, 0xa

    iput v0, p0, Lcom/spd/car/CarKeyView;->mBrightness:I

    .line 103
    invoke-virtual {p0}, Lcom/spd/car/CarKeyView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/spd/system/service/SpdManager;->getInstance(Landroid/content/Context;)Lcom/spd/system/service/SpdManager;

    move-result-object v0

    iget v3, p0, Lcom/spd/car/CarKeyView;->mBrightness:I

    invoke-virtual {v0, v1, v3, v2}, Lcom/spd/system/service/SpdManager;->setSystemCmd(III)I

    .line 104
    goto :goto_0

    .line 98
    :pswitch_1
    iget v0, p0, Lcom/spd/car/CarKeyView;->mBrightness:I

    add-int/lit8 v0, v0, -0xa

    iput v0, p0, Lcom/spd/car/CarKeyView;->mBrightness:I

    .line 99
    invoke-virtual {p0}, Lcom/spd/car/CarKeyView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/spd/system/service/SpdManager;->getInstance(Landroid/content/Context;)Lcom/spd/system/service/SpdManager;

    move-result-object v0

    iget v3, p0, Lcom/spd/car/CarKeyView;->mBrightness:I

    invoke-virtual {v0, v1, v3, v2}, Lcom/spd/system/service/SpdManager;->setSystemCmd(III)I

    .line 100
    goto :goto_0

    .line 95
    :pswitch_2
    const/16 v0, 0x82

    invoke-direct {p0, v0, v2}, Lcom/spd/car/CarKeyView;->setKey(II)V

    .line 96
    goto :goto_0

    .line 92
    :pswitch_3
    const/16 v0, 0x81

    invoke-direct {p0, v0, v2}, Lcom/spd/car/CarKeyView;->setKey(II)V

    .line 93
    nop

    .line 108
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f05003b
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 156
    const-string v0, "CarKeyView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLongClick:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    iget v0, p0, Lcom/spd/car/CarKeyView;->mViewType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    invoke-direct {p0, v0}, Lcom/spd/car/CarKeyView;->updateViewType(I)V

    .line 158
    return v1
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .line 116
    const-string v0, "CarKeyView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onTouch:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 118
    .local v0, "action":I
    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_0

    .line 119
    const/4 v0, 0x1

    goto :goto_1

    .line 120
    :cond_0
    if-eq v0, v3, :cond_2

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 123
    :cond_1
    return v2

    .line 121
    :cond_2
    :goto_0
    const/4 v0, 0x0

    .line 125
    :goto_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    .line 142
    return v2

    .line 133
    :sswitch_0
    iget v1, p0, Lcom/spd/car/CarKeyView;->mViewType:I

    if-ne v1, v3, :cond_3

    const/4 v1, 0x4

    goto :goto_2

    :cond_3
    const/4 v1, 0x2

    :goto_2
    invoke-direct {p0, v1, v0}, Lcom/spd/car/CarKeyView;->setKey(II)V

    .line 134
    goto :goto_3

    .line 139
    :sswitch_1
    const/4 v1, 0x6

    invoke-direct {p0, v1, v0}, Lcom/spd/car/CarKeyView;->setKey(II)V

    .line 140
    goto :goto_3

    .line 130
    :sswitch_2
    invoke-direct {p0, v3, v0}, Lcom/spd/car/CarKeyView;->setKey(II)V

    .line 131
    goto :goto_3

    .line 136
    :sswitch_3
    const/4 v1, 0x5

    invoke-direct {p0, v1, v0}, Lcom/spd/car/CarKeyView;->setKey(II)V

    .line 137
    goto :goto_3

    .line 127
    :sswitch_4
    invoke-direct {p0, v1, v0}, Lcom/spd/car/CarKeyView;->setKey(II)V

    .line 128
    nop

    .line 144
    :goto_3
    return v2

    :sswitch_data_0
    .sparse-switch
        0x7f050018 -> :sswitch_4
        0x7f050041 -> :sswitch_3
        0x7f05004b -> :sswitch_2
        0x7f05004e -> :sswitch_1
        0x7f050051 -> :sswitch_0
    .end sparse-switch
.end method

.method public setCarInfoManage(Lcom/spd/xhsntg/CarInfoManager;)V
    .locals 0
    .param p1, "manager"    # Lcom/spd/xhsntg/CarInfoManager;

    .line 78
    iput-object p1, p0, Lcom/spd/car/CarKeyView;->mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

    .line 79
    return-void
.end method
