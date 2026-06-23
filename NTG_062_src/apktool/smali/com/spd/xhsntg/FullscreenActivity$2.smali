.class Lcom/spd/xhsntg/FullscreenActivity$2;
.super Landroid/content/BroadcastReceiver;
.source "FullscreenActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/xhsntg/FullscreenActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/spd/xhsntg/FullscreenActivity;


# direct methods
.method constructor <init>(Lcom/spd/xhsntg/FullscreenActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/spd/xhsntg/FullscreenActivity;

    .line 440
    iput-object p1, p0, Lcom/spd/xhsntg/FullscreenActivity$2;->this$0:Lcom/spd/xhsntg/FullscreenActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 444
    return-void
.end method
