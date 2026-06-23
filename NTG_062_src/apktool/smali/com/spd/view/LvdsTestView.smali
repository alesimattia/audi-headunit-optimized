.class public Lcom/spd/view/LvdsTestView;
.super Landroid/widget/LinearLayout;
.source "LvdsTestView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "LvdsTestView"


# instance fields
.field private mBriET:Landroid/widget/EditText;

.field private mBriValue:I

.field private mContET:Landroid/widget/EditText;

.field private mContValue:I

.field private mHiET:Landroid/widget/EditText;

.field private mHiValue:I

.field private mLowET:Landroid/widget/EditText;

.field private mLowValue:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 25
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/spd/view/LvdsTestView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 29
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/spd/view/LvdsTestView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .line 33
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 35
    invoke-direct {p0}, Lcom/spd/view/LvdsTestView;->initView()V

    .line 36
    return-void
.end method

.method static synthetic access$000(Lcom/spd/view/LvdsTestView;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/spd/view/LvdsTestView;

    .line 18
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mHiET:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$100(Lcom/spd/view/LvdsTestView;Landroid/widget/EditText;I)V
    .locals 0
    .param p0, "x0"    # Lcom/spd/view/LvdsTestView;
    .param p1, "x1"    # Landroid/widget/EditText;
    .param p2, "x2"    # I

    .line 18
    invoke-direct {p0, p1, p2}, Lcom/spd/view/LvdsTestView;->setPkgDelay(Landroid/widget/EditText;I)V

    return-void
.end method

.method static synthetic access$200(Lcom/spd/view/LvdsTestView;I)V
    .locals 0
    .param p0, "x0"    # Lcom/spd/view/LvdsTestView;
    .param p1, "x1"    # I

    .line 18
    invoke-direct {p0, p1}, Lcom/spd/view/LvdsTestView;->setPkgDelayHi(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/spd/view/LvdsTestView;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/spd/view/LvdsTestView;

    .line 18
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mLowET:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$400(Lcom/spd/view/LvdsTestView;I)V
    .locals 0
    .param p0, "x0"    # Lcom/spd/view/LvdsTestView;
    .param p1, "x1"    # I

    .line 18
    invoke-direct {p0, p1}, Lcom/spd/view/LvdsTestView;->setPkgDelayLow(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/spd/view/LvdsTestView;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/spd/view/LvdsTestView;

    .line 18
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mBriET:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$600(Lcom/spd/view/LvdsTestView;I)V
    .locals 0
    .param p0, "x0"    # Lcom/spd/view/LvdsTestView;
    .param p1, "x1"    # I

    .line 18
    invoke-direct {p0, p1}, Lcom/spd/view/LvdsTestView;->setLvdsBrightness(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/spd/view/LvdsTestView;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/spd/view/LvdsTestView;

    .line 18
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mContET:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$800(Lcom/spd/view/LvdsTestView;I)V
    .locals 0
    .param p0, "x0"    # Lcom/spd/view/LvdsTestView;
    .param p1, "x1"    # I

    .line 18
    invoke-direct {p0, p1}, Lcom/spd/view/LvdsTestView;->setLvdsContrast(I)V

    return-void
.end method

.method private formatValue(I)I
    .locals 1
    .param p1, "value"    # I

    .line 274
    const/4 v0, -0x1

    if-ge p1, v0, :cond_0

    .line 275
    const/4 p1, -0x1

    goto :goto_0

    .line 276
    :cond_0
    const/16 v0, 0xff

    if-le p1, v0, :cond_1

    .line 277
    const/16 p1, 0xff

    .line 279
    :cond_1
    :goto_0
    return p1
.end method

.method private getLvdsBrightness()I
    .locals 3

    .line 363
    invoke-virtual {p0}, Lcom/spd/view/LvdsTestView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "SETTING_AVM_LVDS_BRIGHTNESS"

    const/16 v2, 0x80

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private getLvdsContrast()I
    .locals 3

    .line 367
    invoke-virtual {p0}, Lcom/spd/view/LvdsTestView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "SETTING_AVM_LVDS_CONTRAST"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private getPkgDelay(Landroid/widget/EditText;)I
    .locals 3
    .param p1, "editText"    # Landroid/widget/EditText;

    .line 256
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 257
    return v0

    .line 259
    :cond_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 260
    .local v1, "str":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 261
    return v0

    .line 263
    :cond_1
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private getPkgDelayHi()I
    .locals 3

    .line 319
    invoke-virtual {p0}, Lcom/spd/view/LvdsTestView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "SETTING_PKT_DELAY_HI"

    const/4 v2, -0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private getPkgDelayLow()I
    .locals 3

    .line 315
    invoke-virtual {p0}, Lcom/spd/view/LvdsTestView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "SETTING_PKT_DELAY_LOW"

    const/4 v2, -0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private initView()V
    .locals 2

    .line 39
    invoke-virtual {p0}, Lcom/spd/view/LvdsTestView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f070014

    invoke-static {v0, v1, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 40
    const v0, 0x7f050021

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/spd/view/LvdsTestView;->mHiET:Landroid/widget/EditText;

    .line 41
    const v0, 0x7f050022

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/spd/view/LvdsTestView;->mLowET:Landroid/widget/EditText;

    .line 42
    const v0, 0x7f05001f

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/spd/view/LvdsTestView;->mBriET:Landroid/widget/EditText;

    .line 43
    const v0, 0x7f050020

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/spd/view/LvdsTestView;->mContET:Landroid/widget/EditText;

    .line 44
    const v0, 0x7f050011

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    const v0, 0x7f050012

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    const v0, 0x7f050014

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    const v0, 0x7f050015

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    const v0, 0x7f050016

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    const v0, 0x7f050013

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    const v0, 0x7f05000a

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    const v0, 0x7f05000b

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    const v0, 0x7f05000e

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    const v0, 0x7f05000f

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    const v0, 0x7f05000c

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    const v0, 0x7f050010

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    const v0, 0x7f05000d

    invoke-virtual {p0, v0}, Lcom/spd/view/LvdsTestView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    invoke-direct {p0}, Lcom/spd/view/LvdsTestView;->getPkgDelayHi()I

    move-result v0

    iput v0, p0, Lcom/spd/view/LvdsTestView;->mHiValue:I

    .line 59
    invoke-direct {p0}, Lcom/spd/view/LvdsTestView;->getPkgDelayLow()I

    move-result v0

    iput v0, p0, Lcom/spd/view/LvdsTestView;->mLowValue:I

    .line 60
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mHiET:Landroid/widget/EditText;

    iget v1, p0, Lcom/spd/view/LvdsTestView;->mHiValue:I

    invoke-direct {p0, v0, v1}, Lcom/spd/view/LvdsTestView;->setPkgDelay(Landroid/widget/EditText;I)V

    .line 61
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mLowET:Landroid/widget/EditText;

    iget v1, p0, Lcom/spd/view/LvdsTestView;->mLowValue:I

    invoke-direct {p0, v0, v1}, Lcom/spd/view/LvdsTestView;->setPkgDelay(Landroid/widget/EditText;I)V

    .line 63
    invoke-direct {p0}, Lcom/spd/view/LvdsTestView;->getLvdsBrightness()I

    move-result v0

    iput v0, p0, Lcom/spd/view/LvdsTestView;->mBriValue:I

    .line 64
    invoke-direct {p0}, Lcom/spd/view/LvdsTestView;->getLvdsContrast()I

    move-result v0

    iput v0, p0, Lcom/spd/view/LvdsTestView;->mContValue:I

    .line 65
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mBriET:Landroid/widget/EditText;

    iget v1, p0, Lcom/spd/view/LvdsTestView;->mBriValue:I

    invoke-direct {p0, v0, v1}, Lcom/spd/view/LvdsTestView;->setPkgDelay(Landroid/widget/EditText;I)V

    .line 66
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mContET:Landroid/widget/EditText;

    iget v1, p0, Lcom/spd/view/LvdsTestView;->mContValue:I

    invoke-direct {p0, v0, v1}, Lcom/spd/view/LvdsTestView;->setPkgDelay(Landroid/widget/EditText;I)V

    .line 68
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mHiET:Landroid/widget/EditText;

    new-instance v1, Lcom/spd/view/LvdsTestView$1;

    invoke-direct {v1, p0}, Lcom/spd/view/LvdsTestView$1;-><init>(Lcom/spd/view/LvdsTestView;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 98
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mLowET:Landroid/widget/EditText;

    new-instance v1, Lcom/spd/view/LvdsTestView$2;

    invoke-direct {v1, p0}, Lcom/spd/view/LvdsTestView$2;-><init>(Lcom/spd/view/LvdsTestView;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 129
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mBriET:Landroid/widget/EditText;

    new-instance v1, Lcom/spd/view/LvdsTestView$3;

    invoke-direct {v1, p0}, Lcom/spd/view/LvdsTestView$3;-><init>(Lcom/spd/view/LvdsTestView;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 160
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mContET:Landroid/widget/EditText;

    new-instance v1, Lcom/spd/view/LvdsTestView$4;

    invoke-direct {v1, p0}, Lcom/spd/view/LvdsTestView$4;-><init>(Lcom/spd/view/LvdsTestView;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 190
    return-void
.end method

.method private resetLvdsBrightness()V
    .locals 3

    .line 351
    const/16 v0, 0x80

    iput v0, p0, Lcom/spd/view/LvdsTestView;->mBriValue:I

    .line 352
    invoke-virtual {p0}, Lcom/spd/view/LvdsTestView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "SETTING_AVM_LVDS_BRIGHTNESS"

    iget v2, p0, Lcom/spd/view/LvdsTestView;->mBriValue:I

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 353
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mBriET:Landroid/widget/EditText;

    iget v1, p0, Lcom/spd/view/LvdsTestView;->mBriValue:I

    invoke-direct {p0, v0, v1}, Lcom/spd/view/LvdsTestView;->setPkgDelay(Landroid/widget/EditText;I)V

    .line 354
    return-void
.end method

.method private resetLvdsContrast()V
    .locals 3

    .line 357
    const/4 v0, 0x0

    iput v0, p0, Lcom/spd/view/LvdsTestView;->mContValue:I

    .line 358
    invoke-virtual {p0}, Lcom/spd/view/LvdsTestView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "SETTING_AVM_LVDS_CONTRAST"

    iget v2, p0, Lcom/spd/view/LvdsTestView;->mContValue:I

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 359
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mContET:Landroid/widget/EditText;

    iget v1, p0, Lcom/spd/view/LvdsTestView;->mContValue:I

    invoke-direct {p0, v0, v1}, Lcom/spd/view/LvdsTestView;->setPkgDelay(Landroid/widget/EditText;I)V

    .line 360
    return-void
.end method

.method private resetPkgDelayHi()V
    .locals 3

    .line 309
    const/4 v0, -0x1

    iput v0, p0, Lcom/spd/view/LvdsTestView;->mHiValue:I

    .line 310
    invoke-virtual {p0}, Lcom/spd/view/LvdsTestView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "SETTING_PKT_DELAY_HI"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 311
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mHiET:Landroid/widget/EditText;

    iget v1, p0, Lcom/spd/view/LvdsTestView;->mHiValue:I

    invoke-direct {p0, v0, v1}, Lcom/spd/view/LvdsTestView;->setPkgDelay(Landroid/widget/EditText;I)V

    .line 312
    return-void
.end method

.method private resetPkgDelayLow()V
    .locals 3

    .line 303
    const/4 v0, -0x1

    iput v0, p0, Lcom/spd/view/LvdsTestView;->mLowValue:I

    .line 304
    invoke-virtual {p0}, Lcom/spd/view/LvdsTestView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "SETTING_PKT_DELAY_LOW"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 305
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mLowET:Landroid/widget/EditText;

    iget v1, p0, Lcom/spd/view/LvdsTestView;->mLowValue:I

    invoke-direct {p0, v0, v1}, Lcom/spd/view/LvdsTestView;->setPkgDelay(Landroid/widget/EditText;I)V

    .line 306
    return-void
.end method

.method private setLvdsBrightness(I)V
    .locals 3
    .param p1, "value"    # I

    .line 323
    const-string v0, "LvdsTestView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setLvdsBrightness:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    if-gez p1, :cond_0

    .line 325
    const/4 p1, 0x0

    goto :goto_0

    .line 326
    :cond_0
    const/16 v0, 0xff

    if-le p1, v0, :cond_1

    .line 327
    const/16 p1, 0xff

    .line 329
    :cond_1
    :goto_0
    iget v0, p0, Lcom/spd/view/LvdsTestView;->mBriValue:I

    if-eq v0, p1, :cond_2

    .line 330
    iput p1, p0, Lcom/spd/view/LvdsTestView;->mBriValue:I

    .line 331
    invoke-virtual {p0}, Lcom/spd/view/LvdsTestView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "SETTING_AVM_LVDS_BRIGHTNESS"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 332
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mBriET:Landroid/widget/EditText;

    invoke-direct {p0, v0, p1}, Lcom/spd/view/LvdsTestView;->setPkgDelay(Landroid/widget/EditText;I)V

    .line 334
    :cond_2
    return-void
.end method

.method private setLvdsContrast(I)V
    .locals 3
    .param p1, "value"    # I

    .line 337
    const-string v0, "LvdsTestView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setLvdsContrast:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    const/16 v0, -0x64

    if-ge p1, v0, :cond_0

    .line 339
    const/16 p1, -0x64

    goto :goto_0

    .line 340
    :cond_0
    const/16 v0, 0x64

    if-le p1, v0, :cond_1

    .line 341
    const/16 p1, 0x64

    .line 343
    :cond_1
    :goto_0
    iget v0, p0, Lcom/spd/view/LvdsTestView;->mContValue:I

    if-eq v0, p1, :cond_2

    .line 344
    iput p1, p0, Lcom/spd/view/LvdsTestView;->mContValue:I

    .line 345
    invoke-virtual {p0}, Lcom/spd/view/LvdsTestView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "SETTING_AVM_LVDS_CONTRAST"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 346
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mContET:Landroid/widget/EditText;

    invoke-direct {p0, v0, p1}, Lcom/spd/view/LvdsTestView;->setPkgDelay(Landroid/widget/EditText;I)V

    .line 348
    :cond_2
    return-void
.end method

.method private setPkgDelay(Landroid/widget/EditText;I)V
    .locals 2
    .param p1, "editText"    # Landroid/widget/EditText;
    .param p2, "value"    # I

    .line 267
    if-nez p1, :cond_0

    .line 268
    return-void

    .line 270
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 271
    return-void
.end method

.method private setPkgDelayHi(I)V
    .locals 3
    .param p1, "value"    # I

    .line 293
    const-string v0, "LvdsTestView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setPkgDelayHi:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    invoke-direct {p0, p1}, Lcom/spd/view/LvdsTestView;->formatValue(I)I

    move-result p1

    .line 295
    iget v0, p0, Lcom/spd/view/LvdsTestView;->mHiValue:I

    if-eq v0, p1, :cond_0

    .line 296
    iput p1, p0, Lcom/spd/view/LvdsTestView;->mHiValue:I

    .line 297
    invoke-virtual {p0}, Lcom/spd/view/LvdsTestView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "SETTING_PKT_DELAY_HI"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 298
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mHiET:Landroid/widget/EditText;

    invoke-direct {p0, v0, p1}, Lcom/spd/view/LvdsTestView;->setPkgDelay(Landroid/widget/EditText;I)V

    .line 300
    :cond_0
    return-void
.end method

.method private setPkgDelayLow(I)V
    .locals 3
    .param p1, "value"    # I

    .line 283
    const-string v0, "LvdsTestView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setPkgDelayLow:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    invoke-direct {p0, p1}, Lcom/spd/view/LvdsTestView;->formatValue(I)I

    move-result p1

    .line 285
    iget v0, p0, Lcom/spd/view/LvdsTestView;->mLowValue:I

    if-eq v0, p1, :cond_0

    .line 286
    iput p1, p0, Lcom/spd/view/LvdsTestView;->mLowValue:I

    .line 287
    invoke-virtual {p0}, Lcom/spd/view/LvdsTestView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "SETTING_PKT_DELAY_LOW"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 288
    iget-object v0, p0, Lcom/spd/view/LvdsTestView;->mLowET:Landroid/widget/EditText;

    invoke-direct {p0, v0, p1}, Lcom/spd/view/LvdsTestView;->setPkgDelay(Landroid/widget/EditText;I)V

    .line 290
    :cond_0
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 194
    const/4 v0, 0x0

    .line 195
    .local v0, "value":I
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_0

    .line 217
    :pswitch_0
    invoke-direct {p0}, Lcom/spd/view/LvdsTestView;->resetPkgDelayLow()V

    .line 218
    goto/16 :goto_0

    .line 212
    :pswitch_1
    iget-object v1, p0, Lcom/spd/view/LvdsTestView;->mLowET:Landroid/widget/EditText;

    invoke-direct {p0, v1}, Lcom/spd/view/LvdsTestView;->getPkgDelay(Landroid/widget/EditText;)I

    move-result v0

    .line 213
    add-int/lit8 v0, v0, 0x1

    .line 214
    invoke-direct {p0, v0}, Lcom/spd/view/LvdsTestView;->setPkgDelayLow(I)V

    .line 215
    goto :goto_0

    .line 207
    :pswitch_2
    iget-object v1, p0, Lcom/spd/view/LvdsTestView;->mLowET:Landroid/widget/EditText;

    invoke-direct {p0, v1}, Lcom/spd/view/LvdsTestView;->getPkgDelay(Landroid/widget/EditText;)I

    move-result v0

    .line 208
    add-int/lit8 v0, v0, -0x1

    .line 209
    invoke-direct {p0, v0}, Lcom/spd/view/LvdsTestView;->setPkgDelayLow(I)V

    .line 210
    goto :goto_0

    .line 220
    :pswitch_3
    invoke-direct {p0}, Lcom/spd/view/LvdsTestView;->resetPkgDelayHi()V

    .line 221
    goto :goto_0

    .line 202
    :pswitch_4
    iget-object v1, p0, Lcom/spd/view/LvdsTestView;->mHiET:Landroid/widget/EditText;

    invoke-direct {p0, v1}, Lcom/spd/view/LvdsTestView;->getPkgDelay(Landroid/widget/EditText;)I

    move-result v0

    .line 203
    add-int/lit8 v0, v0, 0x1

    .line 204
    invoke-direct {p0, v0}, Lcom/spd/view/LvdsTestView;->setPkgDelayHi(I)V

    .line 205
    goto :goto_0

    .line 197
    :pswitch_5
    iget-object v1, p0, Lcom/spd/view/LvdsTestView;->mHiET:Landroid/widget/EditText;

    invoke-direct {p0, v1}, Lcom/spd/view/LvdsTestView;->getPkgDelay(Landroid/widget/EditText;)I

    move-result v0

    .line 198
    add-int/lit8 v0, v0, -0x1

    .line 199
    invoke-direct {p0, v0}, Lcom/spd/view/LvdsTestView;->setPkgDelayHi(I)V

    .line 200
    goto :goto_0

    .line 247
    :pswitch_6
    invoke-direct {p0}, Lcom/spd/view/LvdsTestView;->resetLvdsContrast()V

    .line 248
    goto :goto_0

    .line 242
    :pswitch_7
    iget-object v1, p0, Lcom/spd/view/LvdsTestView;->mContET:Landroid/widget/EditText;

    invoke-direct {p0, v1}, Lcom/spd/view/LvdsTestView;->getPkgDelay(Landroid/widget/EditText;)I

    move-result v0

    .line 243
    add-int/lit8 v0, v0, 0x1

    .line 244
    invoke-direct {p0, v0}, Lcom/spd/view/LvdsTestView;->setLvdsContrast(I)V

    .line 245
    goto :goto_0

    .line 237
    :pswitch_8
    iget-object v1, p0, Lcom/spd/view/LvdsTestView;->mContET:Landroid/widget/EditText;

    invoke-direct {p0, v1}, Lcom/spd/view/LvdsTestView;->getPkgDelay(Landroid/widget/EditText;)I

    move-result v0

    .line 238
    add-int/lit8 v0, v0, -0x1

    .line 239
    invoke-direct {p0, v0}, Lcom/spd/view/LvdsTestView;->setLvdsContrast(I)V

    .line 240
    goto :goto_0

    .line 223
    :pswitch_9
    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Lcom/spd/view/LvdsTestView;->setVisibility(I)V

    .line 224
    goto :goto_0

    .line 250
    :pswitch_a
    invoke-direct {p0}, Lcom/spd/view/LvdsTestView;->resetLvdsBrightness()V

    goto :goto_0

    .line 232
    :pswitch_b
    iget-object v1, p0, Lcom/spd/view/LvdsTestView;->mBriET:Landroid/widget/EditText;

    invoke-direct {p0, v1}, Lcom/spd/view/LvdsTestView;->getPkgDelay(Landroid/widget/EditText;)I

    move-result v0

    .line 233
    add-int/lit8 v0, v0, 0x1

    .line 234
    invoke-direct {p0, v0}, Lcom/spd/view/LvdsTestView;->setLvdsBrightness(I)V

    .line 235
    goto :goto_0

    .line 227
    :pswitch_c
    iget-object v1, p0, Lcom/spd/view/LvdsTestView;->mBriET:Landroid/widget/EditText;

    invoke-direct {p0, v1}, Lcom/spd/view/LvdsTestView;->getPkgDelay(Landroid/widget/EditText;)I

    move-result v0

    .line 228
    add-int/lit8 v0, v0, -0x1

    .line 229
    invoke-direct {p0, v0}, Lcom/spd/view/LvdsTestView;->setLvdsBrightness(I)V

    .line 230
    nop

    .line 253
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f05000a
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
