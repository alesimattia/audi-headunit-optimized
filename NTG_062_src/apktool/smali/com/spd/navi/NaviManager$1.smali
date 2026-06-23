.class Lcom/spd/navi/NaviManager$1;
.super Ljava/lang/Object;
.source "NaviManager.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/spd/navi/NaviManager;->setFrameLayout(Landroid/widget/FrameLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/spd/navi/NaviManager;


# direct methods
.method constructor <init>(Lcom/spd/navi/NaviManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/spd/navi/NaviManager;

    .line 35
    iput-object p1, p0, Lcom/spd/navi/NaviManager$1;->this$0:Lcom/spd/navi/NaviManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8
    .param p1, "v"    # Landroid/view/View;

    .line 38
    iget-object v0, p0, Lcom/spd/navi/NaviManager$1;->this$0:Lcom/spd/navi/NaviManager;

    invoke-static {v0}, Lcom/spd/navi/NaviManager;->access$000(Lcom/spd/navi/NaviManager;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 39
    .local v0, "cv":Landroid/content/ContentResolver;
    const-string v1, "SETTING_NAVI_APP"

    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 40
    .local v1, "c_app_componet_name":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 42
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 43
    iget-object v2, p0, Lcom/spd/navi/NaviManager$1;->this$0:Lcom/spd/navi/NaviManager;

    invoke-static {v2}, Lcom/spd/navi/NaviManager;->access$000(Lcom/spd/navi/NaviManager;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 44
    .local v2, "manager":Landroid/content/pm/PackageManager;
    invoke-virtual {v2, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    .line 46
    .local v3, "c_intent":Landroid/content/Intent;
    :try_start_0
    iget-object v4, p0, Lcom/spd/navi/NaviManager$1;->this$0:Lcom/spd/navi/NaviManager;

    invoke-static {v4}, Lcom/spd/navi/NaviManager;->access$000(Lcom/spd/navi/NaviManager;)Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    goto :goto_0

    .line 48
    :catch_0
    move-exception v4

    .line 50
    .local v4, "e":Ljava/lang/Exception;
    const/high16 v5, 0x10200000

    .line 52
    .local v5, "launchFlags":I
    new-instance v6, Landroid/content/Intent;

    const-string v7, "com.spd.action.settingui"

    invoke-direct {v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    move-object v3, v6

    .line 53
    const-string v6, "index"

    const/16 v7, 0x2710

    invoke-virtual {v3, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 54
    invoke-virtual {v3, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 56
    :try_start_1
    iget-object v6, p0, Lcom/spd/navi/NaviManager$1;->this$0:Lcom/spd/navi/NaviManager;

    invoke-static {v6}, Lcom/spd/navi/NaviManager;->access$000(Lcom/spd/navi/NaviManager;)Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 61
    goto :goto_0

    .line 58
    :catch_1
    move-exception v6

    .line 64
    .end local v2    # "manager":Landroid/content/pm/PackageManager;
    .end local v3    # "c_intent":Landroid/content/Intent;
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v5    # "launchFlags":I
    :cond_0
    :goto_0
    return-void
.end method
