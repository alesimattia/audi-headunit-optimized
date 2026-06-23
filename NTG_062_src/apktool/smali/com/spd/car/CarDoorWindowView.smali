.class public Lcom/spd/car/CarDoorWindowView;
.super Landroid/widget/FrameLayout;
.source "CarDoorWindowView.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CarDoorWindowView"


# instance fields
.field private mAttached:Z

.field private mBenzCarType:I

.field private mCarBgId:I

.field private mCarDoorFrontLeftOn:I

.field private mCarDoorFrontRightOn:I

.field private mCarDoorHoodOn:I

.field private mCarDoorLeftOff:I

.field private mCarDoorRearLeftOn:I

.field private mCarDoorRearRightOn:I

.field private mCarDoorRightOff:I

.field private mCarDoorTrunkOn:I

.field private mContentObserver:Landroid/database/ContentObserver;

.field private mDoorBgView:Landroid/widget/ImageView;

.field private mDoorFrontLeftView:Landroid/view/View;

.field private mDoorFrontRightView:Landroid/view/View;

.field private mDoorHoodView:Landroid/view/View;

.field private mDoorRearLeftView:Landroid/view/View;

.field private mDoorRearRightView:Landroid/view/View;

.field private mDoorTrunkView:Landroid/view/View;

.field private mSingleDoorOpenIndex:I

.field private prevIsLeftDoor:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 35
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/spd/car/CarDoorWindowView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
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

    .line 39
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/spd/car/CarDoorWindowView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .line 43
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 219
    new-instance v0, Lcom/spd/car/CarDoorWindowView$1;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/spd/car/CarDoorWindowView$1;-><init>(Lcom/spd/car/CarDoorWindowView;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/spd/car/CarDoorWindowView;->mContentObserver:Landroid/database/ContentObserver;

    .line 45
    invoke-virtual {p0}, Lcom/spd/car/CarDoorWindowView;->initView()V

    .line 46
    return-void
.end method

.method static synthetic access$000(Lcom/spd/car/CarDoorWindowView;)V
    .locals 0
    .param p0, "x0"    # Lcom/spd/car/CarDoorWindowView;

    .line 20
    invoke-direct {p0}, Lcom/spd/car/CarDoorWindowView;->resetBenzCarDoorIcon()V

    return-void
.end method

.method private getDoorResourceId(Ljava/lang/String;)I
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/spd/car/CarDoorWindowView;->mBenzCarType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, "res":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/spd/car/CarDoorWindowView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "drawable"

    invoke-virtual {p0}, Lcom/spd/car/CarDoorWindowView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method private resetBenzCarDoorIcon()V
    .locals 9

    .line 114
    invoke-virtual {p0}, Lcom/spd/car/CarDoorWindowView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "SETTING_BENZ_CAR_TYPE"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v0, 0x2

    .line 115
    .local v0, "type":I
    const-string v1, "CarDoorWindowView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "resetBenzCarDoorIcon:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    iget v1, p0, Lcom/spd/car/CarDoorWindowView;->mBenzCarType:I

    if-eq v0, v1, :cond_6

    .line 118
    iput v0, p0, Lcom/spd/car/CarDoorWindowView;->mBenzCarType:I

    .line 120
    const-string v1, "carinfo_audi_car_door_front_left"

    invoke-direct {p0, v1}, Lcom/spd/car/CarDoorWindowView;->getDoorResourceId(Ljava/lang/String;)I

    move-result v1

    .line 121
    .local v1, "frontLeftId":I
    const-string v2, "carinfo_audi_car_door_front_right"

    invoke-direct {p0, v2}, Lcom/spd/car/CarDoorWindowView;->getDoorResourceId(Ljava/lang/String;)I

    move-result v2

    .line 122
    .local v2, "frontRightId":I
    const-string v3, "carinfo_audi_car_door_rear_left"

    invoke-direct {p0, v3}, Lcom/spd/car/CarDoorWindowView;->getDoorResourceId(Ljava/lang/String;)I

    move-result v3

    .line 123
    .local v3, "rearLeftId":I
    const-string v4, "carinfo_audi_car_door_rear_right"

    invoke-direct {p0, v4}, Lcom/spd/car/CarDoorWindowView;->getDoorResourceId(Ljava/lang/String;)I

    move-result v4

    .line 124
    .local v4, "rearRightId":I
    const-string v5, "carinfo_audi_car_door_hood"

    invoke-direct {p0, v5}, Lcom/spd/car/CarDoorWindowView;->getDoorResourceId(Ljava/lang/String;)I

    move-result v5

    .line 125
    .local v5, "hoodId":I
    const-string v6, "carinfo_audi_car_door_trunk"

    invoke-direct {p0, v6}, Lcom/spd/car/CarDoorWindowView;->getDoorResourceId(Ljava/lang/String;)I

    move-result v6

    .line 126
    .local v6, "trunkId":I
    const-string v7, "carinfo_audi_car_door_bg"

    invoke-direct {p0, v7}, Lcom/spd/car/CarDoorWindowView;->getDoorResourceId(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/spd/car/CarDoorWindowView;->mCarBgId:I

    .line 128
    const-string v7, "carinfo_audi_car_door_left_off"

    invoke-direct {p0, v7}, Lcom/spd/car/CarDoorWindowView;->getDoorResourceId(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorLeftOff:I

    .line 129
    const-string v7, "carinfo_audi_car_door_left_front"

    invoke-direct {p0, v7}, Lcom/spd/car/CarDoorWindowView;->getDoorResourceId(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorFrontLeftOn:I

    .line 130
    const-string v7, "carinfo_audi_car_door_right_front"

    invoke-direct {p0, v7}, Lcom/spd/car/CarDoorWindowView;->getDoorResourceId(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorFrontRightOn:I

    .line 131
    const-string v7, "carinfo_audi_car_door_right_off"

    invoke-direct {p0, v7}, Lcom/spd/car/CarDoorWindowView;->getDoorResourceId(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorRightOff:I

    .line 132
    const-string v7, "carinfo_audi_car_door_left_rear"

    invoke-direct {p0, v7}, Lcom/spd/car/CarDoorWindowView;->getDoorResourceId(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorRearLeftOn:I

    .line 133
    const-string v7, "carinfo_audi_car_door_right_rear"

    invoke-direct {p0, v7}, Lcom/spd/car/CarDoorWindowView;->getDoorResourceId(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorRearRightOn:I

    .line 134
    const-string v7, "carinfo_audi_car_door_hood_on"

    invoke-direct {p0, v7}, Lcom/spd/car/CarDoorWindowView;->getDoorResourceId(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorHoodOn:I

    .line 135
    const-string v7, "carinfo_audi_car_door_trunk_on"

    invoke-direct {p0, v7}, Lcom/spd/car/CarDoorWindowView;->getDoorResourceId(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorTrunkOn:I

    .line 138
    iget-object v7, p0, Lcom/spd/car/CarDoorWindowView;->mDoorHoodView:Landroid/view/View;

    check-cast v7, Landroid/widget/ImageView;

    invoke-direct {p0, v7, v5}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    .line 139
    iget-object v7, p0, Lcom/spd/car/CarDoorWindowView;->mDoorTrunkView:Landroid/view/View;

    check-cast v7, Landroid/widget/ImageView;

    invoke-direct {p0, v7, v6}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    .line 140
    iget-object v7, p0, Lcom/spd/car/CarDoorWindowView;->mDoorFrontLeftView:Landroid/view/View;

    check-cast v7, Landroid/widget/ImageView;

    invoke-direct {p0, v7, v1}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    .line 141
    iget-object v7, p0, Lcom/spd/car/CarDoorWindowView;->mDoorFrontRightView:Landroid/view/View;

    check-cast v7, Landroid/widget/ImageView;

    invoke-direct {p0, v7, v2}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    .line 142
    iget-object v7, p0, Lcom/spd/car/CarDoorWindowView;->mDoorRearLeftView:Landroid/view/View;

    check-cast v7, Landroid/widget/ImageView;

    invoke-direct {p0, v7, v3}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    .line 143
    iget-object v7, p0, Lcom/spd/car/CarDoorWindowView;->mDoorRearRightView:Landroid/view/View;

    check-cast v7, Landroid/widget/ImageView;

    invoke-direct {p0, v7, v4}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    .line 145
    iget v7, p0, Lcom/spd/car/CarDoorWindowView;->mSingleDoorOpenIndex:I

    const/4 v8, 0x1

    if-ne v7, v8, :cond_0

    .line 146
    iget-object v7, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    iget v8, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorHoodOn:I

    invoke-direct {p0, v7, v8}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    goto :goto_0

    .line 147
    :cond_0
    iget v7, p0, Lcom/spd/car/CarDoorWindowView;->mSingleDoorOpenIndex:I

    const/4 v8, 0x2

    if-ne v7, v8, :cond_1

    .line 148
    iget-object v7, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    iget v8, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorTrunkOn:I

    invoke-direct {p0, v7, v8}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    goto :goto_0

    .line 149
    :cond_1
    iget v7, p0, Lcom/spd/car/CarDoorWindowView;->mSingleDoorOpenIndex:I

    const/4 v8, 0x3

    if-ne v7, v8, :cond_2

    .line 150
    iget-object v7, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    iget v8, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorFrontLeftOn:I

    invoke-direct {p0, v7, v8}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    goto :goto_0

    .line 151
    :cond_2
    iget v7, p0, Lcom/spd/car/CarDoorWindowView;->mSingleDoorOpenIndex:I

    const/4 v8, 0x4

    if-ne v7, v8, :cond_3

    .line 152
    iget-object v7, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    iget v8, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorFrontRightOn:I

    invoke-direct {p0, v7, v8}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    goto :goto_0

    .line 153
    :cond_3
    iget v7, p0, Lcom/spd/car/CarDoorWindowView;->mSingleDoorOpenIndex:I

    const/4 v8, 0x5

    if-ne v7, v8, :cond_4

    .line 154
    iget-object v7, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    iget v8, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorRearLeftOn:I

    invoke-direct {p0, v7, v8}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    goto :goto_0

    .line 155
    :cond_4
    iget v7, p0, Lcom/spd/car/CarDoorWindowView;->mSingleDoorOpenIndex:I

    const/4 v8, 0x6

    if-ne v7, v8, :cond_5

    .line 156
    iget-object v7, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    iget v8, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorRearRightOn:I

    invoke-direct {p0, v7, v8}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    goto :goto_0

    .line 158
    :cond_5
    iget-object v7, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    iget v8, p0, Lcom/spd/car/CarDoorWindowView;->mCarBgId:I

    invoke-direct {p0, v7, v8}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    .line 161
    .end local v1    # "frontLeftId":I
    .end local v2    # "frontRightId":I
    .end local v3    # "rearLeftId":I
    .end local v4    # "rearRightId":I
    .end local v5    # "hoodId":I
    .end local v6    # "trunkId":I
    :cond_6
    :goto_0
    return-void
.end method

.method private updateResource(Landroid/widget/ImageView;I)V
    .locals 1
    .param p1, "v"    # Landroid/widget/ImageView;
    .param p2, "id"    # I

    .line 92
    if-eqz p1, :cond_1

    .line 93
    if-lez p2, :cond_0

    .line 94
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 96
    :cond_0
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 99
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public initView()V
    .locals 2

    .line 70
    const/4 v0, -0x1

    iput v0, p0, Lcom/spd/car/CarDoorWindowView;->mBenzCarType:I

    .line 71
    const v0, 0x7f070001

    .line 72
    .local v0, "layoutId":I
    invoke-virtual {p0}, Lcom/spd/car/CarDoorWindowView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-virtual {v1, v0, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 73
    const v1, 0x7f05002b

    invoke-virtual {p0, v1}, Lcom/spd/car/CarDoorWindowView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    .line 74
    const v1, 0x7f05002e

    invoke-virtual {p0, v1}, Lcom/spd/car/CarDoorWindowView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorHoodView:Landroid/view/View;

    .line 75
    const v1, 0x7f050031

    invoke-virtual {p0, v1}, Lcom/spd/car/CarDoorWindowView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorTrunkView:Landroid/view/View;

    .line 76
    const v1, 0x7f05002c

    invoke-virtual {p0, v1}, Lcom/spd/car/CarDoorWindowView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorFrontLeftView:Landroid/view/View;

    .line 77
    const v1, 0x7f05002d

    invoke-virtual {p0, v1}, Lcom/spd/car/CarDoorWindowView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorFrontRightView:Landroid/view/View;

    .line 78
    const v1, 0x7f05002f

    invoke-virtual {p0, v1}, Lcom/spd/car/CarDoorWindowView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorRearLeftView:Landroid/view/View;

    .line 79
    const v1, 0x7f050030

    invoke-virtual {p0, v1}, Lcom/spd/car/CarDoorWindowView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorRearRightView:Landroid/view/View;

    .line 81
    invoke-direct {p0}, Lcom/spd/car/CarDoorWindowView;->resetBenzCarDoorIcon()V

    .line 82
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 4

    .line 52
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 53
    iget-boolean v0, p0, Lcom/spd/car/CarDoorWindowView;->mAttached:Z

    if-nez v0, :cond_0

    .line 54
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/spd/car/CarDoorWindowView;->mAttached:Z

    .line 55
    const-string v1, "SETTING_BENZ_CAR_TYPE"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 56
    .local v1, "uri":Landroid/net/Uri;
    invoke-virtual {p0}, Lcom/spd/car/CarDoorWindowView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, p0, Lcom/spd/car/CarDoorWindowView;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v2, v1, v0, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 58
    .end local v1    # "uri":Landroid/net/Uri;
    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 62
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 63
    iget-boolean v0, p0, Lcom/spd/car/CarDoorWindowView;->mAttached:Z

    if-eqz v0, :cond_0

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/spd/car/CarDoorWindowView;->mAttached:Z

    .line 65
    invoke-virtual {p0}, Lcom/spd/car/CarDoorWindowView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 67
    :cond_0
    return-void
.end method

.method public updateBenzCarDoor(ZZZZZZ)V
    .locals 5
    .param p1, "hood"    # Z
    .param p2, "trunk"    # Z
    .param p3, "frontLeft"    # Z
    .param p4, "frontRight"    # Z
    .param p5, "rearLeft"    # Z
    .param p6, "rearRight"    # Z

    .line 164
    add-int v0, p1, p2

    add-int/2addr v0, p3

    add-int/2addr v0, p4

    add-int/2addr v0, p5

    add-int/2addr v0, p6

    .line 165
    .local v0, "doorCount":I
    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x4

    if-le v0, v1, :cond_6

    .line 166
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorHoodView:Landroid/view/View;

    if-eqz p1, :cond_0

    move v4, v2

    goto :goto_0

    :cond_0
    move v4, v3

    :goto_0
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 167
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorTrunkView:Landroid/view/View;

    if-eqz p2, :cond_1

    move v4, v2

    goto :goto_1

    :cond_1
    move v4, v3

    :goto_1
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 168
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorFrontLeftView:Landroid/view/View;

    if-eqz p3, :cond_2

    move v4, v2

    goto :goto_2

    :cond_2
    move v4, v3

    :goto_2
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 169
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorFrontRightView:Landroid/view/View;

    if-eqz p4, :cond_3

    move v4, v2

    goto :goto_3

    :cond_3
    move v4, v3

    :goto_3
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 170
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorRearLeftView:Landroid/view/View;

    if-eqz p5, :cond_4

    move v4, v2

    goto :goto_4

    :cond_4
    move v4, v3

    :goto_4
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 171
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorRearRightView:Landroid/view/View;

    if-eqz p6, :cond_5

    move v3, v2

    nop

    :cond_5
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 172
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    iget v3, p0, Lcom/spd/car/CarDoorWindowView;->mCarBgId:I

    invoke-direct {p0, v1, v3}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    .line 173
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 174
    iput v2, p0, Lcom/spd/car/CarDoorWindowView;->mSingleDoorOpenIndex:I

    goto/16 :goto_7

    .line 175
    :cond_6
    if-ne v0, v1, :cond_d

    .line 176
    iget-object v4, p0, Lcom/spd/car/CarDoorWindowView;->mDoorHoodView:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 177
    iget-object v4, p0, Lcom/spd/car/CarDoorWindowView;->mDoorTrunkView:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 178
    iget-object v4, p0, Lcom/spd/car/CarDoorWindowView;->mDoorFrontLeftView:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 179
    iget-object v4, p0, Lcom/spd/car/CarDoorWindowView;->mDoorFrontRightView:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 180
    iget-object v4, p0, Lcom/spd/car/CarDoorWindowView;->mDoorRearLeftView:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 181
    iget-object v4, p0, Lcom/spd/car/CarDoorWindowView;->mDoorRearRightView:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 182
    if-eqz p1, :cond_7

    .line 183
    iget-object v3, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    iget v4, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorHoodOn:I

    invoke-direct {p0, v3, v4}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    .line 184
    iput v1, p0, Lcom/spd/car/CarDoorWindowView;->mSingleDoorOpenIndex:I

    goto :goto_5

    .line 185
    :cond_7
    if-eqz p2, :cond_8

    .line 186
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    iget v3, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorTrunkOn:I

    invoke-direct {p0, v1, v3}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    .line 187
    const/4 v1, 0x2

    iput v1, p0, Lcom/spd/car/CarDoorWindowView;->mSingleDoorOpenIndex:I

    goto :goto_5

    .line 188
    :cond_8
    if-eqz p3, :cond_9

    .line 189
    iget-object v3, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    iget v4, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorFrontLeftOn:I

    invoke-direct {p0, v3, v4}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    .line 190
    const/4 v3, 0x3

    iput v3, p0, Lcom/spd/car/CarDoorWindowView;->mSingleDoorOpenIndex:I

    .line 191
    iput-boolean v1, p0, Lcom/spd/car/CarDoorWindowView;->prevIsLeftDoor:Z

    goto :goto_5

    .line 192
    :cond_9
    if-eqz p4, :cond_a

    .line 193
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    iget v4, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorFrontRightOn:I

    invoke-direct {p0, v1, v4}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    .line 194
    iput v3, p0, Lcom/spd/car/CarDoorWindowView;->mSingleDoorOpenIndex:I

    .line 195
    iput-boolean v2, p0, Lcom/spd/car/CarDoorWindowView;->prevIsLeftDoor:Z

    goto :goto_5

    .line 196
    :cond_a
    if-eqz p5, :cond_b

    .line 197
    iget-object v3, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    iget v4, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorRearLeftOn:I

    invoke-direct {p0, v3, v4}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    .line 198
    const/4 v3, 0x5

    iput v3, p0, Lcom/spd/car/CarDoorWindowView;->mSingleDoorOpenIndex:I

    .line 199
    iput-boolean v1, p0, Lcom/spd/car/CarDoorWindowView;->prevIsLeftDoor:Z

    goto :goto_5

    .line 200
    :cond_b
    if-eqz p6, :cond_c

    .line 201
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    iget v3, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorRearRightOn:I

    invoke-direct {p0, v1, v3}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    .line 202
    const/4 v1, 0x6

    iput v1, p0, Lcom/spd/car/CarDoorWindowView;->mSingleDoorOpenIndex:I

    .line 203
    iput-boolean v2, p0, Lcom/spd/car/CarDoorWindowView;->prevIsLeftDoor:Z

    .line 205
    :cond_c
    :goto_5
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_7

    .line 207
    :cond_d
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorHoodView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 208
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorTrunkView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 209
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorFrontLeftView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 210
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorFrontRightView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 211
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorRearLeftView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 212
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorRearRightView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 213
    iput v2, p0, Lcom/spd/car/CarDoorWindowView;->mSingleDoorOpenIndex:I

    .line 214
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    iget-boolean v3, p0, Lcom/spd/car/CarDoorWindowView;->prevIsLeftDoor:Z

    if-eqz v3, :cond_e

    iget v3, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorLeftOff:I

    goto :goto_6

    :cond_e
    iget v3, p0, Lcom/spd/car/CarDoorWindowView;->mCarDoorRightOff:I

    :goto_6
    invoke-direct {p0, v1, v3}, Lcom/spd/car/CarDoorWindowView;->updateResource(Landroid/widget/ImageView;I)V

    .line 215
    iget-object v1, p0, Lcom/spd/car/CarDoorWindowView;->mDoorBgView:Landroid/widget/ImageView;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 217
    :goto_7
    return-void
.end method
