.class public Lcom/spd/navi/WeCarNaviFrameManager;
.super Ljava/lang/Object;
.source "WeCarNaviFrameManager.java"

# Stub: il supporto Tencent WeCar e' stato rimosso per alleggerire l'app.
# NaviManager chiama solo <init>(Context), setFrameLayout, initFrameManager, uninitFrameManager.


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "c_context"    # Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public initFrameManager()V
    .locals 0

    return-void
.end method

.method public setFrameLayout(Landroid/widget/FrameLayout;)V
    .locals 0
    .param p1, "c_root_view"    # Landroid/widget/FrameLayout;

    return-void
.end method

.method public uninitFrameManager()V
    .locals 0

    return-void
.end method
