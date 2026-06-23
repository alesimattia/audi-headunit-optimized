.class final Lcom/spd/carinfo/CarInfo$H;
.super Landroid/os/Handler;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "H"
.end annotation


# static fields
.field private static final BUNDLE_MSG_CHANGED:I = 0x68

.field private static final CONNECT_CHANGED:I = 0x64

.field private static final FLOAT_MSG_CHANGED:I = 0x66

.field private static final INT_MSG_CHANGED:I = 0x65

.field private static final STRING_MSG_CHANGED:I = 0x67


# instance fields
.field final synthetic this$0:Lcom/spd/carinfo/CarInfo;


# direct methods
.method public constructor <init>(Lcom/spd/carinfo/CarInfo;Landroid/os/Looper;)V
    .locals 0
    .param p2, "looper"    # Landroid/os/Looper;

    .line 368
    iput-object p1, p0, Lcom/spd/carinfo/CarInfo$H;->this$0:Lcom/spd/carinfo/CarInfo;

    .line 369
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 370
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .line 374
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo$H;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-static {v0}, Lcom/spd/carinfo/CarInfo;->access$700(Lcom/spd/carinfo/CarInfo;)Lcom/spd/carinfo/CarInfo$Callback;

    move-result-object v0

    if-nez v0, :cond_0

    .line 375
    return-void

    .line 378
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    .line 407
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/Bundle;

    .line 408
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "what"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 409
    .local v1, "what":I
    const-string v2, "arg0"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    .line 410
    .local v2, "arg0":Landroid/os/Bundle;
    const-string v3, "arg1"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 411
    .local v3, "arg1":I
    iget-object v4, p0, Lcom/spd/carinfo/CarInfo$H;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-static {v4}, Lcom/spd/carinfo/CarInfo;->access$700(Lcom/spd/carinfo/CarInfo;)Lcom/spd/carinfo/CarInfo$Callback;

    move-result-object v4

    invoke-interface {v4, v1, v2, v3}, Lcom/spd/carinfo/CarInfo$Callback;->onCarInfoDataChanged(ILjava/lang/Object;I)V

    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "what":I
    .end local v2    # "arg0":Landroid/os/Bundle;
    .end local v3    # "arg1":I
    goto/16 :goto_1

    .line 399
    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/Bundle;

    .line 400
    .restart local v0    # "bundle":Landroid/os/Bundle;
    const-string v1, "what"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 401
    .restart local v1    # "what":I
    const-string v2, "arg0"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 402
    .local v2, "arg0":Ljava/lang/String;
    const-string v3, "arg1"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 403
    .restart local v3    # "arg1":I
    iget-object v4, p0, Lcom/spd/carinfo/CarInfo$H;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-static {v4}, Lcom/spd/carinfo/CarInfo;->access$700(Lcom/spd/carinfo/CarInfo;)Lcom/spd/carinfo/CarInfo$Callback;

    move-result-object v4

    invoke-interface {v4, v1, v2, v3}, Lcom/spd/carinfo/CarInfo$Callback;->onCarInfoDataChanged(ILjava/lang/Object;I)V

    .line 405
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "what":I
    .end local v2    # "arg0":Ljava/lang/String;
    .end local v3    # "arg1":I
    goto :goto_1

    .line 391
    :pswitch_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/Bundle;

    .line 392
    .restart local v0    # "bundle":Landroid/os/Bundle;
    const-string v1, "what"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 393
    .restart local v1    # "what":I
    const-string v2, "arg0"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v2

    .line 394
    .local v2, "arg0":F
    const-string v3, "arg1"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 395
    .restart local v3    # "arg1":I
    iget-object v4, p0, Lcom/spd/carinfo/CarInfo$H;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-static {v4}, Lcom/spd/carinfo/CarInfo;->access$700(Lcom/spd/carinfo/CarInfo;)Lcom/spd/carinfo/CarInfo$Callback;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-interface {v4, v1, v5, v3}, Lcom/spd/carinfo/CarInfo$Callback;->onCarInfoDataChanged(ILjava/lang/Object;I)V

    .line 397
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "what":I
    .end local v2    # "arg0":F
    .end local v3    # "arg1":I
    goto :goto_1

    .line 383
    :pswitch_3
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/Bundle;

    .line 384
    .restart local v0    # "bundle":Landroid/os/Bundle;
    const-string v1, "what"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 385
    .restart local v1    # "what":I
    const-string v2, "arg0"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 386
    .local v2, "arg0":I
    const-string v3, "arg1"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 387
    .restart local v3    # "arg1":I
    iget-object v4, p0, Lcom/spd/carinfo/CarInfo$H;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-static {v4}, Lcom/spd/carinfo/CarInfo;->access$700(Lcom/spd/carinfo/CarInfo;)Lcom/spd/carinfo/CarInfo$Callback;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v1, v5, v3}, Lcom/spd/carinfo/CarInfo$Callback;->onCarInfoDataChanged(ILjava/lang/Object;I)V

    .line 389
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "what":I
    .end local v2    # "arg0":I
    .end local v3    # "arg1":I
    goto :goto_1

    .line 380
    :pswitch_4
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo$H;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-static {v0}, Lcom/spd/carinfo/CarInfo;->access$700(Lcom/spd/carinfo/CarInfo;)Lcom/spd/carinfo/CarInfo$Callback;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    invoke-interface {v0, v2}, Lcom/spd/carinfo/CarInfo$Callback;->onCarInfoConnectedChanged(Z)V

    .line 381
    nop

    .line 415
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
