.class Lcom/spd/xhsntg/DvrHelper$1;
.super Ljava/lang/Object;
.source "DvrHelper.java"

# interfaces
.implements Landroid/content/ServiceConnection;


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

    .line 158
    iput-object p1, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 5
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .line 161
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$000(Lcom/spd/xhsntg/DvrHelper;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onServiceConnected:"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {p2}, Lcom/spd/dvr/aidl/IDVRService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/spd/dvr/aidl/IDVRService;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/DvrHelper;->access$102(Lcom/spd/xhsntg/DvrHelper;Lcom/spd/dvr/aidl/IDVRService;)Lcom/spd/dvr/aidl/IDVRService;

    .line 163
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    .line 164
    .local v0, "thread":Ljava/lang/String;
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v1}, Lcom/spd/xhsntg/DvrHelper;->access$000(Lcom/spd/xhsntg/DvrHelper;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Thread name1:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    :try_start_0
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v1}, Lcom/spd/xhsntg/DvrHelper;->access$100(Lcom/spd/xhsntg/DvrHelper;)Lcom/spd/dvr/aidl/IDVRService;

    move-result-object v1

    invoke-interface {v1}, Lcom/spd/dvr/aidl/IDVRService;->asBinder()Landroid/os/IBinder;

    move-result-object v1

    iget-object v2, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v2}, Lcom/spd/xhsntg/DvrHelper;->access$200(Lcom/spd/xhsntg/DvrHelper;)Landroid/os/IBinder$DeathRecipient;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V

    .line 167
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v1}, Lcom/spd/xhsntg/DvrHelper;->access$000(Lcom/spd/xhsntg/DvrHelper;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "onServiceConnected: registerCallback"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v1}, Lcom/spd/xhsntg/DvrHelper;->access$100(Lcom/spd/xhsntg/DvrHelper;)Lcom/spd/dvr/aidl/IDVRService;

    move-result-object v1

    iget-object v2, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v2}, Lcom/spd/xhsntg/DvrHelper;->access$300(Lcom/spd/xhsntg/DvrHelper;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    iget-object v3, v3, Lcom/spd/xhsntg/DvrHelper;->mCallback:Lcom/spd/dvr/aidl/IDVRServiceCallback;

    invoke-interface {v1, v2, v3}, Lcom/spd/dvr/aidl/IDVRService;->registerDVRServiceCallback(Ljava/lang/String;Lcom/spd/dvr/aidl/IDVRServiceCallback;)V

    .line 169
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/spd/xhsntg/DvrHelper;->access$402(Lcom/spd/xhsntg/DvrHelper;Z)Z

    .line 170
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v1}, Lcom/spd/xhsntg/DvrHelper;->access$500(Lcom/spd/xhsntg/DvrHelper;)Landroid/os/Handler;

    move-result-object v1

    const/16 v2, 0x65

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    goto :goto_0

    .line 171
    :catch_0
    move-exception v1

    .line 172
    .local v1, "e":Landroid/os/RemoteException;
    iget-object v2, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v2}, Lcom/spd/xhsntg/DvrHelper;->access$000(Lcom/spd/xhsntg/DvrHelper;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ERROR:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    .end local v1    # "e":Landroid/os/RemoteException;
    :goto_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;

    .line 177
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$000(Lcom/spd/xhsntg/DvrHelper;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onServiceDisconnected"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/spd/xhsntg/DvrHelper;->access$402(Lcom/spd/xhsntg/DvrHelper;Z)Z

    .line 179
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0, v1}, Lcom/spd/xhsntg/DvrHelper;->access$602(Lcom/spd/xhsntg/DvrHelper;Z)Z

    .line 180
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$500(Lcom/spd/xhsntg/DvrHelper;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x66

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 181
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$1;->this$0:Lcom/spd/xhsntg/DvrHelper;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/spd/xhsntg/DvrHelper;->access$700(Lcom/spd/xhsntg/DvrHelper;Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;)V

    .line 182
    return-void
.end method
