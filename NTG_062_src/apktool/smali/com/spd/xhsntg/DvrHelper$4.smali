.class Lcom/spd/xhsntg/DvrHelper$4;
.super Landroid/os/Handler;
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

    .line 228
    iput-object p1, p0, Lcom/spd/xhsntg/DvrHelper$4;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 231
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 233
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$4;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$800(Lcom/spd/xhsntg/DvrHelper;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 236
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_3

    .line 267
    :pswitch_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 268
    .local v0, "type":I
    iget v1, p1, Landroid/os/Message;->arg2:I

    .line 269
    .local v1, "count":I
    iget-object v2, p0, Lcom/spd/xhsntg/DvrHelper$4;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v2, v0, v1}, Lcom/spd/xhsntg/DvrHelper;->access$900(Lcom/spd/xhsntg/DvrHelper;II)V

    .line 270
    goto :goto_3

    .line 259
    .end local v0    # "type":I
    .end local v1    # "count":I
    :pswitch_1
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 260
    .local v0, "arg1":I
    iget v1, p1, Landroid/os/Message;->arg2:I

    .line 261
    .local v1, "arg2":I
    iget-object v2, p0, Lcom/spd/xhsntg/DvrHelper$4;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v2}, Lcom/spd/xhsntg/DvrHelper;->access$800(Lcom/spd/xhsntg/DvrHelper;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;

    .line 263
    .local v3, "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    invoke-interface {v3, v0, v1}, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;->onDvrStateChanged(II)V

    .line 264
    .end local v3    # "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    goto :goto_0

    .line 265
    :cond_0
    goto :goto_3

    .line 253
    .end local v0    # "arg1":I
    .end local v1    # "arg2":I
    :pswitch_2
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$4;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$800(Lcom/spd/xhsntg/DvrHelper;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;

    .line 255
    .local v1, "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    invoke-interface {v1}, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;->onServiceDisconnected()V

    .line 256
    .end local v1    # "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    goto :goto_1

    .line 257
    :cond_1
    goto :goto_3

    .line 239
    :pswitch_3
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_2

    .line 241
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;

    .line 242
    .local v0, "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    invoke-interface {v0}, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;->onServiceConnected()V

    .line 243
    .end local v0    # "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    goto :goto_3

    .line 246
    :cond_2
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$4;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$800(Lcom/spd/xhsntg/DvrHelper;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;

    .line 248
    .restart local v1    # "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    invoke-interface {v1}, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;->onServiceConnected()V

    .line 249
    .end local v1    # "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    goto :goto_2

    .line 251
    :cond_3
    nop

    .line 274
    :cond_4
    :goto_3
    return-void

    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
