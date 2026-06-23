.class Lcom/spd/carinfo/CarInfo$1;
.super Ljava/lang/Object;
.source "CarInfo.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/spd/carinfo/CarInfo;


# direct methods
.method constructor <init>(Lcom/spd/carinfo/CarInfo;)V
    .locals 0
    .param p1, "this$0"    # Lcom/spd/carinfo/CarInfo;

    .line 286
    iput-object p1, p0, Lcom/spd/carinfo/CarInfo$1;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 5
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .line 289
    const-string v0, "CarInfo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onServiceConnected:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo$1;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-static {p2}, Lcom/spd/carinfo/ICarInfoAidlInterface$Stub;->asInterface(Landroid/os/IBinder;)Lcom/spd/carinfo/ICarInfoAidlInterface;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/carinfo/CarInfo;->access$002(Lcom/spd/carinfo/CarInfo;Lcom/spd/carinfo/ICarInfoAidlInterface;)Lcom/spd/carinfo/ICarInfoAidlInterface;

    .line 293
    :try_start_0
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo$1;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-static {v0}, Lcom/spd/carinfo/CarInfo;->access$000(Lcom/spd/carinfo/CarInfo;)Lcom/spd/carinfo/ICarInfoAidlInterface;

    move-result-object v0

    iget-object v1, p0, Lcom/spd/carinfo/CarInfo$1;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-static {v1}, Lcom/spd/carinfo/CarInfo;->access$100(Lcom/spd/carinfo/CarInfo;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/spd/carinfo/CarInfo$1;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-static {v2}, Lcom/spd/carinfo/CarInfo;->access$200(Lcom/spd/carinfo/CarInfo;)[Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/spd/carinfo/CarInfo$1;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-static {v3}, Lcom/spd/carinfo/CarInfo;->access$300(Lcom/spd/carinfo/CarInfo;)Lcom/spd/carinfo/ICarInfoAidlCallback;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Lcom/spd/carinfo/ICarInfoAidlInterface;->registerCallback(Ljava/lang/String;[Ljava/lang/String;Lcom/spd/carinfo/ICarInfoAidlCallback;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 296
    goto :goto_0

    .line 294
    :catch_0
    move-exception v0

    .line 295
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 298
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_0
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo$1;->this$0:Lcom/spd/carinfo/CarInfo;

    const/16 v1, 0x64

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Lcom/spd/carinfo/CarInfo;->access$400(Lcom/spd/carinfo/CarInfo;IIILjava/lang/Object;)V

    .line 299
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 4
    .param p1, "name"    # Landroid/content/ComponentName;

    .line 303
    const-string v0, "CarInfo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onServiceDisconnected:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo$1;->this$0:Lcom/spd/carinfo/CarInfo;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/16 v3, 0x64

    invoke-static {v0, v3, v2, v2, v1}, Lcom/spd/carinfo/CarInfo;->access$400(Lcom/spd/carinfo/CarInfo;IIILjava/lang/Object;)V

    .line 305
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo$1;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-static {v0, v1}, Lcom/spd/carinfo/CarInfo;->access$002(Lcom/spd/carinfo/CarInfo;Lcom/spd/carinfo/ICarInfoAidlInterface;)Lcom/spd/carinfo/ICarInfoAidlInterface;

    .line 306
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo$1;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-static {v0}, Lcom/spd/carinfo/CarInfo;->access$500(Lcom/spd/carinfo/CarInfo;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 307
    iget-object v0, p0, Lcom/spd/carinfo/CarInfo$1;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-static {v0}, Lcom/spd/carinfo/CarInfo;->access$600(Lcom/spd/carinfo/CarInfo;)V

    .line 309
    :cond_0
    return-void
.end method
