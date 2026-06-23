.class Lcom/spd/navi/NaviManager$2;
.super Landroid/database/ContentObserver;
.source "NaviManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/navi/NaviManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/spd/navi/NaviManager;


# direct methods
.method constructor <init>(Lcom/spd/navi/NaviManager;Landroid/os/Handler;)V
    .locals 0
    .param p1, "this$0"    # Lcom/spd/navi/NaviManager;
    .param p2, "x0"    # Landroid/os/Handler;

    .line 85
    iput-object p1, p0, Lcom/spd/navi/NaviManager$2;->this$0:Lcom/spd/navi/NaviManager;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1
    .param p1, "selfChange"    # Z

    .line 87
    iget-object v0, p0, Lcom/spd/navi/NaviManager$2;->this$0:Lcom/spd/navi/NaviManager;

    invoke-static {v0}, Lcom/spd/navi/NaviManager;->access$100(Lcom/spd/navi/NaviManager;)V

    .line 88
    return-void
.end method
