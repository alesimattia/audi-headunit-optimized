.class Lcom/spd/xhsntg/DvrHelper$2;
.super Ljava/lang/Object;
.source "DvrHelper.java"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/xhsntg/DvrHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/spd/xhsntg/DvrHelper;


# direct methods
.method constructor <init>(Lcom/spd/xhsntg/DvrHelper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/spd/xhsntg/DvrHelper;

    .line 184
    iput-object p1, p0, Lcom/spd/xhsntg/DvrHelper$2;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public binderDied()V
    .locals 3

    .line 187
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$2;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$000(Lcom/spd/xhsntg/DvrHelper;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "service binderDied"

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$2;->this$0:Lcom/spd/xhsntg/DvrHelper;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/spd/xhsntg/DvrHelper;->access$402(Lcom/spd/xhsntg/DvrHelper;Z)Z

    .line 189
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$2;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0, v1}, Lcom/spd/xhsntg/DvrHelper;->access$602(Lcom/spd/xhsntg/DvrHelper;Z)Z

    .line 190
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$2;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$100(Lcom/spd/xhsntg/DvrHelper;)Lcom/spd/dvr/aidl/IDVRService;

    move-result-object v0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 191
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$2;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$100(Lcom/spd/xhsntg/DvrHelper;)Lcom/spd/dvr/aidl/IDVRService;

    move-result-object v0

    invoke-interface {v0}, Lcom/spd/dvr/aidl/IDVRService;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-interface {v0, p0, v1}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    .line 192
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$2;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0, v2}, Lcom/spd/xhsntg/DvrHelper;->access$102(Lcom/spd/xhsntg/DvrHelper;Lcom/spd/dvr/aidl/IDVRService;)Lcom/spd/dvr/aidl/IDVRService;

    .line 194
    :cond_0
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$2;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$500(Lcom/spd/xhsntg/DvrHelper;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x66

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 195
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$2;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0, v2}, Lcom/spd/xhsntg/DvrHelper;->access$700(Lcom/spd/xhsntg/DvrHelper;Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;)V

    .line 196
    return-void
.end method
