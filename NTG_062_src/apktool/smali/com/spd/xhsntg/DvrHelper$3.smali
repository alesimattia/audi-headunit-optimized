.class Lcom/spd/xhsntg/DvrHelper$3;
.super Lcom/spd/dvr/aidl/IDVRServiceCallback$Stub;
.source "DvrHelper.java"


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

    .line 199
    iput-object p1, p0, Lcom/spd/xhsntg/DvrHelper$3;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-direct {p0}, Lcom/spd/dvr/aidl/IDVRServiceCallback$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public onDvrStateChanged(II)V
    .locals 3
    .param p1, "i"    # I
    .param p2, "i1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 203
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$3;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$000(Lcom/spd/xhsntg/DvrHelper;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDvrStateChanged: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 205
    .local v0, "c_msg":Landroid/os/Message;
    const/16 v1, 0x67

    iput v1, v0, Landroid/os/Message;->what:I

    .line 206
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 207
    iput p2, v0, Landroid/os/Message;->arg2:I

    .line 208
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper$3;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v1}, Lcom/spd/xhsntg/DvrHelper;->access$500(Lcom/spd/xhsntg/DvrHelper;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 209
    return-void
.end method

.method public onFileInfoChanged(II)V
    .locals 3
    .param p1, "i"    # I
    .param p2, "i1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 213
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$3;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$000(Lcom/spd/xhsntg/DvrHelper;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onFileInfoChanged: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 215
    .local v0, "c_msg":Landroid/os/Message;
    const/16 v1, 0x68

    iput v1, v0, Landroid/os/Message;->what:I

    .line 216
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 217
    iput p2, v0, Landroid/os/Message;->arg2:I

    .line 218
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper$3;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v1}, Lcom/spd/xhsntg/DvrHelper;->access$500(Lcom/spd/xhsntg/DvrHelper;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 219
    return-void
.end method
