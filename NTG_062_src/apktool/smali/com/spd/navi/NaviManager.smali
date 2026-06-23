.class public Lcom/spd/navi/NaviManager;
.super Ljava/lang/Object;
.source "NaviManager.java"


# static fields
.field private static final CLASS_TAG:Ljava/lang/String;

.field private static SETTING_NAVI_APP:Ljava/lang/String;

.field public static TAG:Ljava/lang/String;


# instance fields
.field private m_a_map_auto_navi_frame_manager:Lcom/spd/navi/AmapAutoNaviFrameManager;

.field private m_context:Landroid/content/Context;

.field private m_navi_frame:Landroid/widget/FrameLayout;

.field private m_we_car_navi_frame_manager:Lcom/spd/navi/WeCarNaviFrameManager;

.field private naviAppSettingsObserver:Landroid/database/ContentObserver;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 16
    const-string v0, "NAVI-HOME"

    sput-object v0, Lcom/spd/navi/NaviManager;->TAG:Ljava/lang/String;

    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-class v1, Lcom/spd/navi/NaviManager;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/navi/NaviManager;->CLASS_TAG:Ljava/lang/String;

    .line 67
    const-string v0, "SETTING_NAVI_APP"

    sput-object v0, Lcom/spd/navi/NaviManager;->SETTING_NAVI_APP:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    new-instance v0, Lcom/spd/navi/NaviManager$2;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/spd/navi/NaviManager$2;-><init>(Lcom/spd/navi/NaviManager;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/spd/navi/NaviManager;->naviAppSettingsObserver:Landroid/database/ContentObserver;

    .line 26
    iput-object p1, p0, Lcom/spd/navi/NaviManager;->m_context:Landroid/content/Context;

    .line 27
    new-instance v0, Lcom/spd/navi/AmapAutoNaviFrameManager;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/spd/navi/AmapAutoNaviFrameManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/spd/navi/NaviManager;->m_a_map_auto_navi_frame_manager:Lcom/spd/navi/AmapAutoNaviFrameManager;

    .line 28
    new-instance v0, Lcom/spd/navi/WeCarNaviFrameManager;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/spd/navi/WeCarNaviFrameManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/spd/navi/NaviManager;->m_we_car_navi_frame_manager:Lcom/spd/navi/WeCarNaviFrameManager;

    .line 29
    return-void
.end method

.method static synthetic access$000(Lcom/spd/navi/NaviManager;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/spd/navi/NaviManager;

    .line 14
    iget-object v0, p0, Lcom/spd/navi/NaviManager;->m_context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/spd/navi/NaviManager;)V
    .locals 0
    .param p0, "x0"    # Lcom/spd/navi/NaviManager;

    .line 14
    invoke-direct {p0}, Lcom/spd/navi/NaviManager;->naviAppUpdate()V

    return-void
.end method

.method private naviAppUpdate()V
    .locals 5

    .line 92
    iget-object v0, p0, Lcom/spd/navi/NaviManager;->m_context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 93
    .local v0, "cv":Landroid/content/ContentResolver;
    const-string v1, "SETTING_NAVI_APP"

    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 94
    .local v1, "c_app_componet_name":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 96
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 97
    const-string v2, "com.autonavi.amapauto"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 99
    sget-object v2, Lcom/spd/navi/NaviManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/spd/navi/NaviManager;->CLASS_TAG:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "naviAppUpdate: amapauto"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    iget-object v2, p0, Lcom/spd/navi/NaviManager;->m_we_car_navi_frame_manager:Lcom/spd/navi/WeCarNaviFrameManager;

    invoke-virtual {v2}, Lcom/spd/navi/WeCarNaviFrameManager;->uninitFrameManager()V

    .line 101
    iget-object v2, p0, Lcom/spd/navi/NaviManager;->m_a_map_auto_navi_frame_manager:Lcom/spd/navi/AmapAutoNaviFrameManager;

    invoke-virtual {v2}, Lcom/spd/navi/AmapAutoNaviFrameManager;->initFrameManager()V

    goto :goto_0

    .line 103
    :cond_0
    const-string v2, "com.tencent.wecarnavi"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 105
    sget-object v2, Lcom/spd/navi/NaviManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/spd/navi/NaviManager;->CLASS_TAG:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "naviAppUpdate: wecarnavi"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    iget-object v2, p0, Lcom/spd/navi/NaviManager;->m_a_map_auto_navi_frame_manager:Lcom/spd/navi/AmapAutoNaviFrameManager;

    invoke-virtual {v2}, Lcom/spd/navi/AmapAutoNaviFrameManager;->uninitFrameManager()V

    .line 107
    iget-object v2, p0, Lcom/spd/navi/NaviManager;->m_we_car_navi_frame_manager:Lcom/spd/navi/WeCarNaviFrameManager;

    invoke-virtual {v2}, Lcom/spd/navi/WeCarNaviFrameManager;->initFrameManager()V

    .line 110
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public initFrameManager()V
    .locals 4

    .line 71
    invoke-direct {p0}, Lcom/spd/navi/NaviManager;->naviAppUpdate()V

    .line 72
    iget-object v0, p0, Lcom/spd/navi/NaviManager;->m_context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/spd/navi/NaviManager;->SETTING_NAVI_APP:Ljava/lang/String;

    .line 73
    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/spd/navi/NaviManager;->naviAppSettingsObserver:Landroid/database/ContentObserver;

    .line 72
    const/4 v3, 0x1

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 76
    return-void
.end method

.method public setFrameLayout(Landroid/widget/FrameLayout;)V
    .locals 2
    .param p1, "c_root_view"    # Landroid/widget/FrameLayout;

    .line 32
    iput-object p1, p0, Lcom/spd/navi/NaviManager;->m_navi_frame:Landroid/widget/FrameLayout;

    .line 33
    iget-object v0, p0, Lcom/spd/navi/NaviManager;->m_a_map_auto_navi_frame_manager:Lcom/spd/navi/AmapAutoNaviFrameManager;

    invoke-virtual {v0, p1}, Lcom/spd/navi/AmapAutoNaviFrameManager;->setFrameLayout(Landroid/widget/FrameLayout;)V

    .line 34
    iget-object v0, p0, Lcom/spd/navi/NaviManager;->m_we_car_navi_frame_manager:Lcom/spd/navi/WeCarNaviFrameManager;

    invoke-virtual {v0, p1}, Lcom/spd/navi/WeCarNaviFrameManager;->setFrameLayout(Landroid/widget/FrameLayout;)V

    .line 35
    iget-object v0, p0, Lcom/spd/navi/NaviManager;->m_navi_frame:Landroid/widget/FrameLayout;

    new-instance v1, Lcom/spd/navi/NaviManager$1;

    invoke-direct {v1, p0}, Lcom/spd/navi/NaviManager$1;-><init>(Lcom/spd/navi/NaviManager;)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    return-void
.end method

.method public uninitFrameManager()V
    .locals 2

    .line 80
    iget-object v0, p0, Lcom/spd/navi/NaviManager;->m_context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/spd/navi/NaviManager;->naviAppSettingsObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 81
    iget-object v0, p0, Lcom/spd/navi/NaviManager;->m_a_map_auto_navi_frame_manager:Lcom/spd/navi/AmapAutoNaviFrameManager;

    invoke-virtual {v0}, Lcom/spd/navi/AmapAutoNaviFrameManager;->uninitFrameManager()V

    .line 82
    iget-object v0, p0, Lcom/spd/navi/NaviManager;->m_we_car_navi_frame_manager:Lcom/spd/navi/WeCarNaviFrameManager;

    invoke-virtual {v0}, Lcom/spd/navi/WeCarNaviFrameManager;->uninitFrameManager()V

    .line 83
    return-void
.end method
