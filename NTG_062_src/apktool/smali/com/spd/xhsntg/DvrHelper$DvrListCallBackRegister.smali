.class Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;
.super Ljava/lang/Object;
.source "DvrHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/xhsntg/DvrHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DvrListCallBackRegister"
.end annotation


# instance fields
.field private m_current_list_type:I

.field private m_file_item_list:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/spd/dvr/entity/aidl/FileInfo;",
            ">;"
        }
    .end annotation
.end field

.field private m_file_list_count:I

.field final synthetic this$0:Lcom/spd/xhsntg/DvrHelper;


# direct methods
.method private constructor <init>(Lcom/spd/xhsntg/DvrHelper;I)V
    .locals 0
    .param p2, "listType"    # I

    .line 328
    iput-object p1, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 324
    const/4 p1, -0x1

    iput p1, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->m_current_list_type:I

    .line 325
    iput p1, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->m_file_list_count:I

    .line 326
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->m_file_item_list:Ljava/util/HashMap;

    .line 329
    iput p2, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->m_current_list_type:I

    .line 330
    return-void
.end method

.method synthetic constructor <init>(Lcom/spd/xhsntg/DvrHelper;ILcom/spd/xhsntg/DvrHelper$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/spd/xhsntg/DvrHelper;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/spd/xhsntg/DvrHelper$1;

    .line 322
    invoke-direct {p0, p1, p2}, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;-><init>(Lcom/spd/xhsntg/DvrHelper;I)V

    return-void
.end method

.method static synthetic access$1000(Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;

    .line 322
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->m_file_item_list:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;)I
    .locals 1
    .param p0, "x0"    # Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;

    .line 322
    iget v0, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->m_file_list_count:I

    return v0
.end method

.method static synthetic access$1102(Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;I)I
    .locals 0
    .param p0, "x0"    # Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;
    .param p1, "x1"    # I

    .line 322
    iput p1, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->m_file_list_count:I

    return p1
.end method

.method static synthetic access$1200(Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;)V
    .locals 0
    .param p0, "x0"    # Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;

    .line 322
    invoke-direct {p0}, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->refreshList()V

    return-void
.end method

.method private refreshList()V
    .locals 4

    .line 333
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$100(Lcom/spd/xhsntg/DvrHelper;)Lcom/spd/dvr/aidl/IDVRService;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 336
    const/4 v0, -0x1

    :try_start_0
    iput v0, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->m_file_list_count:I

    .line 337
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->m_file_item_list:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 338
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$800(Lcom/spd/xhsntg/DvrHelper;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;

    .line 340
    .local v1, "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    iget v2, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->m_current_list_type:I

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;->onFileInfoChanged(II)V

    .line 341
    .end local v1    # "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    goto :goto_0

    .line 342
    :cond_0
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$000(Lcom/spd/xhsntg/DvrHelper;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DvrListCallBackRegister refreshList: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->m_current_list_type:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 343
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->this$0:Lcom/spd/xhsntg/DvrHelper;

    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper;->access$100(Lcom/spd/xhsntg/DvrHelper;)Lcom/spd/dvr/aidl/IDVRService;

    move-result-object v0

    iget v1, p0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->m_current_list_type:I

    invoke-interface {v0, v1}, Lcom/spd/dvr/aidl/IDVRService;->refreshFileInfo(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 346
    goto :goto_1

    .line 344
    :catch_0
    move-exception v0

    .line 345
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 348
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_1
    :goto_1
    return-void
.end method
