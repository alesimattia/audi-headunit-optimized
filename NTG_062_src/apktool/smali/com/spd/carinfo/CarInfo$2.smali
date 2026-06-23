.class Lcom/spd/carinfo/CarInfo$2;
.super Lcom/spd/carinfo/ICarInfoAidlCallback$Stub;
.source "CarInfo.java"


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

    .line 312
    iput-object p1, p0, Lcom/spd/carinfo/CarInfo$2;->this$0:Lcom/spd/carinfo/CarInfo;

    invoke-direct {p0}, Lcom/spd/carinfo/ICarInfoAidlCallback$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public onCarInfoBundleChanged(ILandroid/os/Bundle;I)V
    .locals 4
    .param p1, "what"    # I
    .param p2, "arg0"    # Landroid/os/Bundle;
    .param p3, "arg1"    # I

    .line 342
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 343
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "what"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 344
    const-string v1, "arg0"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 345
    const-string v1, "arg1"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 346
    iget-object v1, p0, Lcom/spd/carinfo/CarInfo$2;->this$0:Lcom/spd/carinfo/CarInfo;

    const/4 v2, 0x0

    const/16 v3, 0x68

    invoke-static {v1, v3, v2, v2, v0}, Lcom/spd/carinfo/CarInfo;->access$400(Lcom/spd/carinfo/CarInfo;IIILjava/lang/Object;)V

    .line 347
    return-void
.end method

.method public onCarInfoFloatChanged(IFI)V
    .locals 4
    .param p1, "what"    # I
    .param p2, "arg0"    # F
    .param p3, "arg1"    # I

    .line 324
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 325
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "what"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 326
    const-string v1, "arg0"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 327
    const-string v1, "arg1"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 328
    iget-object v1, p0, Lcom/spd/carinfo/CarInfo$2;->this$0:Lcom/spd/carinfo/CarInfo;

    const/4 v2, 0x0

    const/16 v3, 0x66

    invoke-static {v1, v3, v2, v2, v0}, Lcom/spd/carinfo/CarInfo;->access$400(Lcom/spd/carinfo/CarInfo;IIILjava/lang/Object;)V

    .line 329
    return-void
.end method

.method public onCarInfoIntChanged(III)V
    .locals 4
    .param p1, "what"    # I
    .param p2, "arg0"    # I
    .param p3, "arg1"    # I

    .line 315
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 316
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "what"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 317
    const-string v1, "arg0"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 318
    const-string v1, "arg1"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 319
    iget-object v1, p0, Lcom/spd/carinfo/CarInfo$2;->this$0:Lcom/spd/carinfo/CarInfo;

    const/4 v2, 0x0

    const/16 v3, 0x65

    invoke-static {v1, v3, v2, v2, v0}, Lcom/spd/carinfo/CarInfo;->access$400(Lcom/spd/carinfo/CarInfo;IIILjava/lang/Object;)V

    .line 320
    return-void
.end method

.method public onCarInfoStringChanged(ILjava/lang/String;I)V
    .locals 4
    .param p1, "what"    # I
    .param p2, "arg0"    # Ljava/lang/String;
    .param p3, "arg1"    # I

    .line 333
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 334
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "what"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 335
    const-string v1, "arg0"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    const-string v1, "arg1"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 337
    iget-object v1, p0, Lcom/spd/carinfo/CarInfo$2;->this$0:Lcom/spd/carinfo/CarInfo;

    const/4 v2, 0x0

    const/16 v3, 0x67

    invoke-static {v1, v3, v2, v2, v0}, Lcom/spd/carinfo/CarInfo;->access$400(Lcom/spd/carinfo/CarInfo;IIILjava/lang/Object;)V

    .line 338
    return-void
.end method
