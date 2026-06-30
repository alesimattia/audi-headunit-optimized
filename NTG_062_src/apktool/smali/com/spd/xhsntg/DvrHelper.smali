.class public Lcom/spd/xhsntg/DvrHelper;
.super Ljava/lang/Object;
.source "DvrHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;,
        Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    }
.end annotation


# static fields
.field private static final CALL_BACK_EVENT_DVR_STATE_CHANGED:I = 0x67

.field private static final CALL_BACK_EVENT_FILE_INFO_CHANGED:I = 0x68

.field private static final CALL_BACK_EVENT_SERVICE_CONNECTED:I = 0x65

.field private static final CALL_BACK_EVENT_SERVICE_DISCONNECTED:I = 0x66

.field public static final DVR_LIST_MASK_ALL:I = 0x0

.field public static final DVR_LIST_MASK_FRONT:I = 0x10000

.field public static final DVR_LIST_TYPE_PHOTO:I = 0x1

.field public static final DVR_LIST_TYPE_VIDEO:I = 0x0

.field public static final DVR_SEEKTO_CMD:I = 0x3f2

.field private static m_helper:Lcom/spd/xhsntg/DvrHelper;


# instance fields
.field private TAG:Ljava/lang/String;

.field public mCallback:Lcom/spd/dvr/aidl/IDVRServiceCallback;

.field private mDeath:Landroid/os/IBinder$DeathRecipient;

.field private mDvrService:Lcom/spd/dvr/aidl/IDVRService;

.field public mServiceConnection:Landroid/content/ServiceConnection;

.field private m_bind_flag:Z

.field private m_bind_request_flag:Z

.field private m_call_back_handler:Landroid/os/Handler;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation
.end field

.field private m_context:Landroid/content/Context;

.field private m_demo_file_info:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/spd/dvr/entity/aidl/FileInfo;",
            ">;"
        }
    .end annotation
.end field

.field private m_demo_mode:Z

.field private m_dvr_ui_call_back:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;",
            ">;"
        }
    .end annotation
.end field

.field private m_list_register_map:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;",
            ">;"
        }
    .end annotation
.end field

.field private m_name:Ljava/lang/String;

.field private m_temp_service_init_flag:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const-string v0, "com.spd.spddvr"

    iput-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_name:Ljava/lang/String;

    .line 32
    const-string v0, "DvrHelper"

    iput-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_flag:Z

    .line 36
    iput-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_request_flag:Z

    .line 46
    iput-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_temp_service_init_flag:Z

    .line 158
    new-instance v1, Lcom/spd/xhsntg/DvrHelper$1;

    invoke-direct {v1, p0}, Lcom/spd/xhsntg/DvrHelper$1;-><init>(Lcom/spd/xhsntg/DvrHelper;)V

    iput-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 184
    new-instance v1, Lcom/spd/xhsntg/DvrHelper$2;

    invoke-direct {v1, p0}, Lcom/spd/xhsntg/DvrHelper$2;-><init>(Lcom/spd/xhsntg/DvrHelper;)V

    iput-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->mDeath:Landroid/os/IBinder$DeathRecipient;

    .line 199
    new-instance v1, Lcom/spd/xhsntg/DvrHelper$3;

    invoke-direct {v1, p0}, Lcom/spd/xhsntg/DvrHelper$3;-><init>(Lcom/spd/xhsntg/DvrHelper;)V

    iput-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->mCallback:Lcom/spd/dvr/aidl/IDVRServiceCallback;

    .line 226
    new-instance v1, Lcom/spd/xhsntg/DvrHelper$4;

    invoke-direct {v1, p0}, Lcom/spd/xhsntg/DvrHelper$4;-><init>(Lcom/spd/xhsntg/DvrHelper;)V

    iput-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_call_back_handler:Landroid/os/Handler;

    .line 281
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_dvr_ui_call_back:Ljava/util/List;

    .line 350
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_list_register_map:Ljava/util/HashMap;

    .line 365
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_demo_file_info:Ljava/util/HashMap;

    .line 383
    iput-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_demo_mode:Z

    return-void
.end method

.method static synthetic access$000(Lcom/spd/xhsntg/DvrHelper;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/spd/xhsntg/DvrHelper;

    .line 28
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/spd/xhsntg/DvrHelper;)Lcom/spd/dvr/aidl/IDVRService;
    .locals 1
    .param p0, "x0"    # Lcom/spd/xhsntg/DvrHelper;

    .line 28
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    return-object v0
.end method

.method static synthetic access$102(Lcom/spd/xhsntg/DvrHelper;Lcom/spd/dvr/aidl/IDVRService;)Lcom/spd/dvr/aidl/IDVRService;
    .locals 0
    .param p0, "x0"    # Lcom/spd/xhsntg/DvrHelper;
    .param p1, "x1"    # Lcom/spd/dvr/aidl/IDVRService;

    .line 28
    iput-object p1, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    return-object p1
.end method

.method static synthetic access$200(Lcom/spd/xhsntg/DvrHelper;)Landroid/os/IBinder$DeathRecipient;
    .locals 1
    .param p0, "x0"    # Lcom/spd/xhsntg/DvrHelper;

    .line 28
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDeath:Landroid/os/IBinder$DeathRecipient;

    return-object v0
.end method

.method static synthetic access$300(Lcom/spd/xhsntg/DvrHelper;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/spd/xhsntg/DvrHelper;

    .line 28
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_name:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$402(Lcom/spd/xhsntg/DvrHelper;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/spd/xhsntg/DvrHelper;
    .param p1, "x1"    # Z

    .line 28
    iput-boolean p1, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_flag:Z

    return p1
.end method

.method static synthetic access$500(Lcom/spd/xhsntg/DvrHelper;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/spd/xhsntg/DvrHelper;

    .line 28
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_call_back_handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$602(Lcom/spd/xhsntg/DvrHelper;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/spd/xhsntg/DvrHelper;
    .param p1, "x1"    # Z

    .line 28
    iput-boolean p1, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_request_flag:Z

    return p1
.end method

.method static synthetic access$700(Lcom/spd/xhsntg/DvrHelper;Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;)V
    .locals 0
    .param p0, "x0"    # Lcom/spd/xhsntg/DvrHelper;
    .param p1, "x1"    # Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;

    .line 28
    invoke-direct {p0, p1}, Lcom/spd/xhsntg/DvrHelper;->bindService(Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;)V

    return-void
.end method

.method static synthetic access$800(Lcom/spd/xhsntg/DvrHelper;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/spd/xhsntg/DvrHelper;

    .line 28
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_dvr_ui_call_back:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$900(Lcom/spd/xhsntg/DvrHelper;II)V
    .locals 0
    .param p0, "x0"    # Lcom/spd/xhsntg/DvrHelper;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .line 28
    invoke-direct {p0, p1, p2}, Lcom/spd/xhsntg/DvrHelper;->checkListChanged(II)V

    return-void
.end method

.method private bindService(Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;)V
    .locals 4
    .param p1, "c_callback"    # Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;

    .line 109
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bindService: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_flag:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_request_flag:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/spd/xhsntg/DvrHelper;->m_dvr_ui_call_back:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_dvr_ui_call_back:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 112
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    const-string v1, "bindService: ==0=="

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    iget-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_flag:Z

    if-nez v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    const-string v1, "bindService: ==1=="

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    iget-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_request_flag:Z

    if-nez v0, :cond_1

    .line 118
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    const-string v1, "bindService: ==2=="

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_request_flag:Z

    .line 120
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.spd.service.dvrservice"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 121
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "com.spd.dvr"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 122
    iget-object v2, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    const-string v3, "bindService: "

    invoke-static {v2, v3}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    iget-object v2, p0, Lcom/spd/xhsntg/DvrHelper;->m_context:Landroid/content/Context;

    iget-object v3, p0, Lcom/spd/xhsntg/DvrHelper;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v2, v1, v3, v0}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 124
    .end local v1    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 128
    :cond_0
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_call_back_handler:Landroid/os/Handler;

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 130
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 131
    .local v0, "c_msg":Landroid/os/Message;
    iput v1, v0, Landroid/os/Message;->what:I

    .line 132
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 133
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_call_back_handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 137
    .end local v0    # "c_msg":Landroid/os/Message;
    :cond_1
    :goto_0
    return-void
.end method

.method private checkListChanged(II)V
    .locals 3
    .param p1, "type"    # I
    .param p2, "count"    # I

    .line 291
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    const-string v1, "checkListChanged: "

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    invoke-direct {p0, p1}, Lcom/spd/xhsntg/DvrHelper;->getDvrListRegister(I)Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;

    move-result-object v0

    .line 293
    .local v0, "c_list_register":Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;
    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->access$1000(Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 294
    invoke-static {v0, p2}, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->access$1102(Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;I)I

    .line 295
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_dvr_ui_call_back:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;

    .line 297
    .local v2, "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    invoke-interface {v2, p1, p2}, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;->onFileInfoChanged(II)V

    .line 298
    .end local v2    # "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    goto :goto_0

    .line 299
    :cond_0
    return-void
.end method

.method public static get()Lcom/spd/xhsntg/DvrHelper;
    .locals 1

    .line 39
    sget-object v0, Lcom/spd/xhsntg/DvrHelper;->m_helper:Lcom/spd/xhsntg/DvrHelper;

    if-nez v0, :cond_0

    .line 41
    new-instance v0, Lcom/spd/xhsntg/DvrHelper;

    invoke-direct {v0}, Lcom/spd/xhsntg/DvrHelper;-><init>()V

    sput-object v0, Lcom/spd/xhsntg/DvrHelper;->m_helper:Lcom/spd/xhsntg/DvrHelper;

    .line 44
    :cond_0
    sget-object v0, Lcom/spd/xhsntg/DvrHelper;->m_helper:Lcom/spd/xhsntg/DvrHelper;

    return-object v0
.end method

.method private getDemoFileInfo(II)Lcom/spd/dvr/entity/aidl/FileInfo;
    .locals 3
    .param p1, "listType"    # I
    .param p2, "c_position"    # I

    .line 369
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_demo_file_info:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 371
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_demo_file_info:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/spd/dvr/entity/aidl/FileInfo;

    .local v0, "c_result":Lcom/spd/dvr/entity/aidl/FileInfo;
    goto :goto_0

    .line 375
    .end local v0    # "c_result":Lcom/spd/dvr/entity/aidl/FileInfo;
    :cond_0
    new-instance v0, Lcom/spd/dvr/entity/aidl/FileInfo;

    invoke-direct {v0}, Lcom/spd/dvr/entity/aidl/FileInfo;-><init>()V

    .line 376
    .restart local v0    # "c_result":Lcom/spd/dvr/entity/aidl/FileInfo;
    rem-int/lit8 v1, p2, 0x2

    invoke-virtual {v0, v1}, Lcom/spd/dvr/entity/aidl/FileInfo;->setLock(I)V

    .line 377
    and-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Lcom/spd/dvr/entity/aidl/FileInfo;->setType(I)V

    .line 378
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DemoFile"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/spd/dvr/entity/aidl/FileInfo;->setFileName(Ljava/lang/String;)V

    .line 379
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_demo_file_info:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    :goto_0
    return-object v0
.end method

.method private getDvrListRegister(I)Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;
    .locals 3
    .param p1, "listType"    # I

    .line 354
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_list_register_map:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 356
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_list_register_map:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;

    .local v0, "c_result":Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;
    goto :goto_0

    .line 360
    .end local v0    # "c_result":Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;
    :cond_0
    new-instance v0, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;-><init>(Lcom/spd/xhsntg/DvrHelper;ILcom/spd/xhsntg/DvrHelper$1;)V

    .line 361
    .restart local v0    # "c_result":Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_list_register_map:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    :goto_0
    return-object v0
.end method

.method private unbindService()V
    .locals 2

    .line 140
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    const-string v1, "unbindService:"

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    iget-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_flag:Z

    if-eqz v0, :cond_1

    .line 143
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    if-eqz v0, :cond_0

    .line 147
    :try_start_0
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_name:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/spd/dvr/aidl/IDVRService;->unRegisterDVRCallback(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    goto :goto_0

    .line 148
    :catch_0
    move-exception v0

    .line 149
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 151
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_0
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_context:Landroid/content/Context;

    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 152
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    .line 154
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_flag:Z

    .line 155
    iput-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_request_flag:Z

    .line 157
    :cond_1
    return-void
.end method


# virtual methods
.method public dvrControlCmd(III)V
    .locals 3
    .param p1, "cmd"    # I
    .param p2, "arg0"    # I
    .param p3, "arg1"    # I

    .line 448
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    const-string v1, "dvrControlCmd: =0="

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 449
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    if-eqz v0, :cond_0

    .line 452
    :try_start_0
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dvrControlCmd: =1="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 453
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    invoke-interface {v0, p1, p2, p3}, Lcom/spd/dvr/aidl/IDVRService;->dvrControlCmd(III)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 456
    goto :goto_0

    .line 454
    :catch_0
    move-exception v0

    .line 455
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 458
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_0
    :goto_0
    return-void
.end method

.method public enterSource(Ljava/lang/String;II)Z
    .locals 3
    .param p1, "c_app_name"    # Ljava/lang/String;
    .param p2, "c_device_id"    # I
    .param p3, "list_type"    # I

    .line 92
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "enterSource: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_flag:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    iget-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_flag:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    if-eqz v0, :cond_0

    .line 96
    :try_start_0
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    const-string v1, "enterSource: real"

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    invoke-interface {v0, p1}, Lcom/spd/dvr/aidl/IDVRService;->enterSource(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    goto :goto_0

    .line 98
    :catch_0
    move-exception v0

    .line 99
    .local v0, "e":Landroid/os/RemoteException;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_flag:Z

    .line 100
    iput-boolean v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_request_flag:Z

    .line 101
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 104
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_bind_flag:Z

    return v0
.end method

.method public getDvtState(I)I
    .locals 2
    .param p1, "msg"    # I

    .line 487
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    const-string v1, "getDvtState: "

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    const/4 v0, -0x1

    .line 489
    .local v0, "c_result":I
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    if-eqz v1, :cond_0

    .line 492
    :try_start_0
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    invoke-interface {v1, p1}, Lcom/spd/dvr/aidl/IDVRService;->getDvrState(I)I

    move-result v1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    .line 495
    goto :goto_0

    .line 493
    :catch_0
    move-exception v1

    .line 494
    .local v1, "e":Landroid/os/RemoteException;
    invoke-virtual {v1}, Landroid/os/RemoteException;->printStackTrace()V

    .line 497
    .end local v1    # "e":Landroid/os/RemoteException;
    :cond_0
    :goto_0
    return v0
.end method

.method public getFileInfos(II)Lcom/spd/dvr/entity/aidl/FileInfo;
    .locals 11
    .param p1, "listType"    # I
    .param p2, "c_index"    # I

    .line 386
    const/4 v0, 0x0

    .line 387
    .local v0, "c_result":Lcom/spd/dvr/entity/aidl/FileInfo;
    iget-boolean v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_demo_mode:Z

    if-eqz v1, :cond_0

    .line 389
    invoke-direct {p0, p1, p2}, Lcom/spd/xhsntg/DvrHelper;->getDemoFileInfo(II)Lcom/spd/dvr/entity/aidl/FileInfo;

    move-result-object v0

    goto/16 :goto_3

    .line 393
    :cond_0
    invoke-direct {p0, p1}, Lcom/spd/xhsntg/DvrHelper;->getDvrListRegister(I)Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;

    move-result-object v1

    .line 394
    .local v1, "c_list_register":Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;
    if-ltz p2, :cond_5

    invoke-static {v1}, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->access$1100(Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;)I

    move-result v2

    if-ge p2, v2, :cond_5

    .line 395
    invoke-static {v1}, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->access$1000(Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;)Ljava/util/HashMap;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 396
    invoke-static {v1}, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->access$1000(Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;)Ljava/util/HashMap;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcom/spd/dvr/entity/aidl/FileInfo;

    goto/16 :goto_3

    .line 398
    :cond_1
    const/4 v2, 0x5

    .line 399
    .local v2, "c_check_side_count":I
    add-int/lit8 v3, p2, -0x1

    .line 400
    .local v3, "c_min_position":I
    :goto_0
    if-ltz v3, :cond_2

    sub-int v4, p2, v3

    if-gt v4, v2, :cond_2

    invoke-static {v1}, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->access$1000(Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;)Ljava/util/HashMap;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 402
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 404
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 405
    add-int/lit8 v4, p2, 0x1

    .line 406
    .local v4, "c_max_position":I
    :goto_1
    invoke-static {v1}, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->access$1100(Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;)I

    move-result v5

    if-ge v4, v5, :cond_3

    sub-int v5, v4, p2

    if-gt v5, v2, :cond_3

    invoke-static {v1}, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->access$1000(Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;)Ljava/util/HashMap;

    move-result-object v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 408
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 410
    :cond_3
    add-int/lit8 v4, v4, -0x1

    .line 411
    sub-int v5, v4, v3

    add-int/lit8 v5, v5, 0x1

    .line 413
    .local v5, "c_check_count":I
    :try_start_0
    iget-object v6, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    invoke-interface {v6, p1, v3, v5}, Lcom/spd/dvr/aidl/IDVRService;->getFileInfos(III)Ljava/util/List;

    move-result-object v6

    .line 415
    .local v6, "c_music_list":Ljava/util/List;, "Ljava/util/List<Lcom/spd/dvr/entity/aidl/FileInfo;>;"
    if-eqz v6, :cond_4

    .line 417
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v8

    if-ge v7, v8, :cond_4

    .line 419
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/spd/dvr/entity/aidl/FileInfo;

    .line 420
    .local v8, "c_child_music":Lcom/spd/dvr/entity/aidl/FileInfo;
    invoke-static {v1}, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->access$1000(Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;)Ljava/util/HashMap;

    move-result-object v9

    add-int v10, v3, v7

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v10, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    .end local v8    # "c_child_music":Lcom/spd/dvr/entity/aidl/FileInfo;
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 423
    .end local v7    # "i":I
    :cond_4
    invoke-static {v1}, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->access$1000(Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;)Ljava/util/HashMap;

    move-result-object v7

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/spd/dvr/entity/aidl/FileInfo;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v7

    .line 426
    .end local v6    # "c_music_list":Ljava/util/List;, "Ljava/util/List<Lcom/spd/dvr/entity/aidl/FileInfo;>;"
    goto :goto_3

    .line 424
    :catch_0
    move-exception v6

    .line 425
    .local v6, "e":Landroid/os/RemoteException;
    invoke-virtual {v6}, Landroid/os/RemoteException;->printStackTrace()V

    .line 431
    .end local v1    # "c_list_register":Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;
    .end local v2    # "c_check_side_count":I
    .end local v3    # "c_min_position":I
    .end local v4    # "c_max_position":I
    .end local v5    # "c_check_count":I
    .end local v6    # "e":Landroid/os/RemoteException;
    :cond_5
    :goto_3
    return-object v0
.end method

.method public getSettingInfo()Lcom/spd/dvr/entity/aidl/SettingInfo;
    .locals 2

    .line 501
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    const-string v1, "getSettingInfo: "

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 502
    const/4 v0, 0x0

    .line 503
    .local v0, "c_result":Lcom/spd/dvr/entity/aidl/SettingInfo;
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    if-eqz v1, :cond_0

    .line 506
    :try_start_0
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    invoke-interface {v1}, Lcom/spd/dvr/aidl/IDVRService;->getSettingInfo()Lcom/spd/dvr/entity/aidl/SettingInfo;

    move-result-object v1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 509
    goto :goto_0

    .line 507
    :catch_0
    move-exception v1

    .line 508
    .local v1, "e":Landroid/os/RemoteException;
    invoke-virtual {v1}, Landroid/os/RemoteException;->printStackTrace()V

    .line 511
    .end local v1    # "e":Landroid/os/RemoteException;
    :cond_0
    :goto_0
    return-object v0
.end method

.method public initDvrHelper(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 49
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    const-string v1, "initDvrHelper: "

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    iget-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_temp_service_init_flag:Z

    if-nez v0, :cond_0

    .line 52
    iput-object p1, p0, Lcom/spd/xhsntg/DvrHelper;->m_context:Landroid/content/Context;

    .line 53
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_temp_service_init_flag:Z

    .line 54
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.spd.service.dvrservice"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 55
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.spd.dvr"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 56
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 59
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method public operationFileList(I[II)V
    .locals 7
    .param p1, "type"    # I
    .param p2, "indexs"    # [I
    .param p3, "c_arg"    # I

    .line 527
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "operationFileList: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    const/4 v0, 0x0

    if-eqz p2, :cond_0

    .line 530
    array-length v1, p2

    move v2, v0

    :goto_0
    if-ge v2, v1, :cond_0

    aget v3, p2, v2

    .line 532
    .local v3, "c_test":I
    iget-object v4, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "operationFileList: =0= "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 530
    .end local v3    # "c_test":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 536
    :cond_0
    iget-boolean v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_demo_mode:Z

    if-eqz v1, :cond_5

    .line 538
    array-length v1, p2

    move v2, v0

    :goto_1
    if-ge v2, v1, :cond_4

    aget v3, p2, v2

    .line 540
    .local v3, "c_i":I
    iget-object v4, p0, Lcom/spd/xhsntg/DvrHelper;->m_demo_file_info:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/spd/dvr/entity/aidl/FileInfo;

    .line 541
    .local v4, "c_file_info":Lcom/spd/dvr/entity/aidl/FileInfo;
    if-nez p3, :cond_1

    .end local v3    # "c_i":I
    .end local v4    # "c_file_info":Lcom/spd/dvr/entity/aidl/FileInfo;
    goto :goto_2

    .line 545
    .restart local v3    # "c_i":I
    .restart local v4    # "c_file_info":Lcom/spd/dvr/entity/aidl/FileInfo;
    :cond_1
    const/4 v5, 0x1

    if-ne p3, v5, :cond_2

    .line 547
    invoke-virtual {v4, v5}, Lcom/spd/dvr/entity/aidl/FileInfo;->setLock(I)V

    goto :goto_2

    .line 549
    :cond_2
    const/4 v5, 0x2

    if-ne p3, v5, :cond_3

    .line 551
    invoke-virtual {v4, v0}, Lcom/spd/dvr/entity/aidl/FileInfo;->setLock(I)V

    .line 538
    .end local v3    # "c_i":I
    .end local v4    # "c_file_info":Lcom/spd/dvr/entity/aidl/FileInfo;
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 554
    :cond_4
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_dvr_ui_call_back:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;

    .line 556
    .local v1, "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    const/16 v2, 0xa

    invoke-interface {v1, p1, v2}, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;->onFileInfoChanged(II)V

    .line 557
    .end local v1    # "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    goto :goto_3

    .line 561
    :cond_5
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    if-eqz v0, :cond_6

    .line 564
    :try_start_0
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    invoke-interface {v0, p1, p2, p3}, Lcom/spd/dvr/aidl/IDVRService;->operationFileList(I[II)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 567
    goto :goto_4

    .line 565
    :catch_0
    move-exception v0

    .line 566
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 570
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_6
    :goto_4
    return-void
.end method

.method public refreshFileInfo(I)V
    .locals 3
    .param p1, "type"    # I

    .line 303
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "refreshFileInfo: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    iget-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_demo_mode:Z

    if-eqz v0, :cond_0

    .line 306
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_dvr_ui_call_back:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;

    .line 308
    .local v1, "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    const/16 v2, 0xa

    invoke-interface {v1, p1, v2}, Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;->onFileInfoChanged(II)V

    .line 309
    .end local v1    # "c_call_back":Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
    goto :goto_0

    .line 313
    :cond_0
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    if-eqz v0, :cond_1

    .line 315
    invoke-direct {p0, p1}, Lcom/spd/xhsntg/DvrHelper;->getDvrListRegister(I)Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;

    move-result-object v0

    .line 316
    .local v0, "c_list_register":Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;
    invoke-static {v0}, Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;->access$1200(Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;)V

    .line 320
    .end local v0    # "c_list_register":Lcom/spd/xhsntg/DvrHelper$DvrListCallBackRegister;
    :cond_1
    return-void
.end method

.method public regsiterCallBack(Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;)Z
    .locals 3
    .param p1, "c_callback"    # Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;

    .line 63
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "regsiterCallBack: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " call_back.size"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/spd/xhsntg/DvrHelper;->m_dvr_ui_call_back:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    const/4 v0, 0x0

    .line 65
    .local v0, "c_result":Z
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_dvr_ui_call_back:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    if-gez v1, :cond_0

    .line 67
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_dvr_ui_call_back:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 68
    const/4 v0, 0x1

    .line 70
    :cond_0
    invoke-direct {p0, p1}, Lcom/spd/xhsntg/DvrHelper;->bindService(Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;)V

    .line 71
    return v0
.end method

.method public seekVideo(I)V
    .locals 3
    .param p1, "c_time"    # I

    .line 436
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    if-eqz v0, :cond_0

    .line 439
    :try_start_0
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    const/16 v1, 0x3f2

    const/4 v2, 0x0

    invoke-interface {v0, v1, p1, v2}, Lcom/spd/dvr/aidl/IDVRService;->dvrControlCmd(III)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 442
    goto :goto_0

    .line 440
    :catch_0
    move-exception v0

    .line 441
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 444
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_0
    :goto_0
    return-void
.end method

.method public setPlaybackSurface(Landroid/view/Surface;)V
    .locals 2
    .param p1, "surface"    # Landroid/view/Surface;

    .line 474
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    const-string v1, "setPlaybackSurface: "

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    iget-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_demo_mode:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    if-eqz v0, :cond_0

    .line 478
    :try_start_0
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    const-string v1, "Helper setPlaybackSurface ==0=="

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 479
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    invoke-interface {v0, p1}, Lcom/spd/dvr/aidl/IDVRService;->setPlaybackSurface(Landroid/view/Surface;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 482
    goto :goto_0

    .line 480
    :catch_0
    move-exception v0

    .line 481
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 484
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_0
    :goto_0
    return-void
.end method

.method public setSettingInfo(Lcom/spd/dvr/entity/aidl/SettingInfo;)V
    .locals 2
    .param p1, "c_settings"    # Lcom/spd/dvr/entity/aidl/SettingInfo;

    .line 515
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    const-string v1, "setSettingInfo: "

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 516
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    if-eqz v0, :cond_0

    .line 519
    :try_start_0
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    invoke-interface {v0, p1}, Lcom/spd/dvr/aidl/IDVRService;->setSettingInfo(Lcom/spd/dvr/entity/aidl/SettingInfo;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 522
    goto :goto_0

    .line 520
    :catch_0
    move-exception v0

    .line 521
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 524
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_0
    :goto_0
    return-void
.end method

.method public startPreviewByChannel(ILandroid/view/Surface;)V
    .locals 3
    .param p1, "channel"    # I
    .param p2, "surface"    # Landroid/view/Surface;

    .line 461
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startPreviewByChannel: =0="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 462
    iget-boolean v0, p0, Lcom/spd/xhsntg/DvrHelper;->m_demo_mode:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    if-eqz v0, :cond_0

    .line 465
    :try_start_0
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startPreviewByChannel: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->mDvrService:Lcom/spd/dvr/aidl/IDVRService;

    invoke-interface {v0, p1, p2}, Lcom/spd/dvr/aidl/IDVRService;->startPreviewByChannel(ILandroid/view/Surface;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 469
    goto :goto_0

    .line 467
    :catch_0
    move-exception v0

    .line 468
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 471
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_0
    :goto_0
    return-void
.end method

.method public unregsiterCallBack(Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;)Z
    .locals 3
    .param p1, "c_callback"    # Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;

    .line 76
    iget-object v0, p0, Lcom/spd/xhsntg/DvrHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unregsiterCallBack: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " call_back.size"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/spd/xhsntg/DvrHelper;->m_dvr_ui_call_back:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    const/4 v0, 0x0

    .line 78
    .local v0, "c_result":Z
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_dvr_ui_call_back:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    if-ltz v1, :cond_0

    .line 80
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_dvr_ui_call_back:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 81
    const/4 v0, 0x1

    .line 83
    :cond_0
    iget-object v1, p0, Lcom/spd/xhsntg/DvrHelper;->m_dvr_ui_call_back:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 85
    invoke-direct {p0}, Lcom/spd/xhsntg/DvrHelper;->unbindService()V

    .line 87
    :cond_1
    return v0
.end method
