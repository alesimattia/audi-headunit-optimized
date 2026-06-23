.class public Lcom/spd/view/MyViewPageAdapter;
.super Landroidx/viewpager/widget/PagerAdapter;
.source "MyViewPageAdapter.java"


# instance fields
.field private m_context:Landroid/content/Context;

.field private m_navi_frame_layout:Landroid/widget/FrameLayout;

.field private m_navi_manager:Lcom/spd/navi/NaviManager;

.field private m_test_view_1:Lcom/spd/car/CarDoorWindowView;

.field private m_test_view_2:Lcom/spd/car/CarMileageSpeedView;

.field private m_test_view_3:Lcom/spd/car/CarKeyView;

.field private m_test_view_4:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 27
    invoke-direct {p0}, Landroidx/viewpager/widget/PagerAdapter;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/spd/view/MyViewPageAdapter;->m_context:Landroid/content/Context;

    .line 29
    const v0, 0x7f070004

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_navi_frame_layout:Landroid/widget/FrameLayout;

    .line 30
    new-instance v0, Lcom/spd/car/CarDoorWindowView;

    invoke-direct {v0, p1}, Lcom/spd/car/CarDoorWindowView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_test_view_1:Lcom/spd/car/CarDoorWindowView;

    .line 31
    new-instance v0, Lcom/spd/car/CarMileageSpeedView;

    invoke-direct {v0, p1}, Lcom/spd/car/CarMileageSpeedView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_test_view_2:Lcom/spd/car/CarMileageSpeedView;

    .line 32
    new-instance v0, Lcom/spd/car/CarKeyView;

    invoke-direct {v0, p1}, Lcom/spd/car/CarKeyView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_test_view_3:Lcom/spd/car/CarKeyView;

    .line 33
    new-instance v0, Lcom/spd/navi/NaviManager;

    invoke-direct {v0, p1}, Lcom/spd/navi/NaviManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_navi_manager:Lcom/spd/navi/NaviManager;

    .line 34
    iget-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_navi_manager:Lcom/spd/navi/NaviManager;

    iget-object v1, p0, Lcom/spd/view/MyViewPageAdapter;->m_navi_frame_layout:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Lcom/spd/navi/NaviManager;->setFrameLayout(Landroid/widget/FrameLayout;)V

    # pagina diagnostica (debug overlay)
    invoke-static {p1}, Lcom/spd/xhsntg/DebugLog;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_test_view_4:Landroid/view/View;

    .line 35
    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 1
    .param p1, "container"    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I
    .param p3, "object"    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 100
    move-object v0, p3

    check-cast v0, Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 101
    return-void
.end method

.method public getCount()I
    .locals 1

    .line 65
    const/4 v0, 0x5

    return v0
.end method

.method public initManager()V
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_navi_manager:Lcom/spd/navi/NaviManager;

    invoke-virtual {v0}, Lcom/spd/navi/NaviManager;->initFrameManager()V

    .line 40
    return-void
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 1
    .param p1, "container"    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 76
    const/4 v0, 0x0

    .line 77
    .local v0, "c_result":Landroid/view/View;
    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 89
    :pswitch_0
    iget-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_test_view_3:Lcom/spd/car/CarKeyView;

    goto :goto_0

    # pagina diagnostica (debug overlay)
    :pswitch_4
    iget-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_test_view_4:Landroid/view/View;

    goto :goto_0

    .line 80
    :pswitch_1
    iget-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_navi_frame_layout:Landroid/widget/FrameLayout;

    .line 81
    goto :goto_0

    .line 86
    :pswitch_2
    iget-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_test_view_2:Lcom/spd/car/CarMileageSpeedView;

    .line 87
    goto :goto_0

    .line 83
    :pswitch_3
    iget-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_test_view_1:Lcom/spd/car/CarDoorWindowView;

    .line 84
    nop

    .line 93
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 94
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "object"    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 70
    if-ne p1, p2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setCarInfoManager(Lcom/spd/xhsntg/CarInfoManager;)V
    .locals 1
    .param p1, "manager"    # Lcom/spd/xhsntg/CarInfoManager;

    .line 60
    iget-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_test_view_3:Lcom/spd/car/CarKeyView;

    invoke-virtual {v0, p1}, Lcom/spd/car/CarKeyView;->setCarInfoManage(Lcom/spd/xhsntg/CarInfoManager;)V

    .line 61
    return-void
.end method

.method public uninitManager()V
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_navi_manager:Lcom/spd/navi/NaviManager;

    invoke-virtual {v0}, Lcom/spd/navi/NaviManager;->uninitFrameManager()V

    .line 45
    return-void
.end method

.method public updateDoors(ZZZZZZ)V
    .locals 7
    .param p1, "hood"    # Z
    .param p2, "trunk"    # Z
    .param p3, "frontLeft"    # Z
    .param p4, "frontRight"    # Z
    .param p5, "rearLeft"    # Z
    .param p6, "rearRight"    # Z

    .line 48
    iget-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_test_view_1:Lcom/spd/car/CarDoorWindowView;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/spd/car/CarDoorWindowView;->updateBenzCarDoor(ZZZZZZ)V

    .line 49
    return-void
.end method

.method public updateMileage(II)V
    .locals 1
    .param p1, "value"    # I
    .param p2, "unit"    # I

    .line 56
    iget-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_test_view_2:Lcom/spd/car/CarMileageSpeedView;

    invoke-virtual {v0, p1, p2}, Lcom/spd/car/CarMileageSpeedView;->updateMileage(II)V

    .line 57
    return-void
.end method

.method public updateSpeed(FI)V
    .locals 1
    .param p1, "speed"    # F
    .param p2, "unit"    # I

    .line 52
    iget-object v0, p0, Lcom/spd/view/MyViewPageAdapter;->m_test_view_2:Lcom/spd/car/CarMileageSpeedView;

    invoke-virtual {v0, p1, p2}, Lcom/spd/car/CarMileageSpeedView;->updateSpeed(FI)V

    .line 53
    return-void
.end method
