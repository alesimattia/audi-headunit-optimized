.class Landroidx/media/MediaSession2Stub$3;
.super Ljava/lang/Object;
.source "MediaSession2Stub.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2Stub;->onCommand2Internal(Landroid/os/IBinder;Landroidx/media/SessionCommand2;ILandroidx/media/MediaSession2Stub$Session2Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2Stub;

.field final synthetic val$commandCode:I

.field final synthetic val$controller:Landroidx/media/MediaSession2$ControllerInfo;

.field final synthetic val$runnable:Landroidx/media/MediaSession2Stub$Session2Runnable;

.field final synthetic val$sessionCommand:Landroidx/media/SessionCommand2;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2Stub;Landroidx/media/SessionCommand2;Landroidx/media/MediaSession2$ControllerInfo;ILandroidx/media/MediaSession2Stub$Session2Runnable;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2Stub;

    .line 463
    iput-object p1, p0, Landroidx/media/MediaSession2Stub$3;->this$0:Landroidx/media/MediaSession2Stub;

    iput-object p2, p0, Landroidx/media/MediaSession2Stub$3;->val$sessionCommand:Landroidx/media/SessionCommand2;

    iput-object p3, p0, Landroidx/media/MediaSession2Stub$3;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iput p4, p0, Landroidx/media/MediaSession2Stub$3;->val$commandCode:I

    iput-object p5, p0, Landroidx/media/MediaSession2Stub$3;->val$runnable:Landroidx/media/MediaSession2Stub$Session2Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 467
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$3;->val$sessionCommand:Landroidx/media/SessionCommand2;

    if-eqz v0, :cond_1

    .line 468
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$3;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v1, p0, Landroidx/media/MediaSession2Stub$3;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iget-object v2, p0, Landroidx/media/MediaSession2Stub$3;->val$sessionCommand:Landroidx/media/SessionCommand2;

    invoke-static {v0, v1, v2}, Landroidx/media/MediaSession2Stub;->access$000(Landroidx/media/MediaSession2Stub;Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 469
    return-void

    .line 471
    :cond_0
    invoke-static {}, Landroidx/media/MediaSession2Stub;->access$100()Landroid/util/SparseArray;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaSession2Stub$3;->val$sessionCommand:Landroidx/media/SessionCommand2;

    invoke-virtual {v1}, Landroidx/media/SessionCommand2;->getCommandCode()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/SessionCommand2;

    .local v0, "command":Landroidx/media/SessionCommand2;
    goto :goto_0

    .line 473
    .end local v0    # "command":Landroidx/media/SessionCommand2;
    :cond_1
    iget-object v0, p0, Landroidx/media/MediaSession2Stub$3;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v1, p0, Landroidx/media/MediaSession2Stub$3;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iget v2, p0, Landroidx/media/MediaSession2Stub$3;->val$commandCode:I

    invoke-static {v0, v1, v2}, Landroidx/media/MediaSession2Stub;->access$200(Landroidx/media/MediaSession2Stub;Landroidx/media/MediaSession2$ControllerInfo;I)Z

    move-result v0

    if-nez v0, :cond_2

    .line 474
    return-void

    .line 476
    :cond_2
    invoke-static {}, Landroidx/media/MediaSession2Stub;->access$100()Landroid/util/SparseArray;

    move-result-object v0

    iget v1, p0, Landroidx/media/MediaSession2Stub$3;->val$commandCode:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/SessionCommand2;

    .line 478
    .restart local v0    # "command":Landroidx/media/SessionCommand2;
    :goto_0
    if-eqz v0, :cond_4

    .line 479
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$3;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v1, v1, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaSession2Stub$3;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v2, v2, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 480
    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaSession2Stub$3;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    .line 479
    invoke-virtual {v1, v2, v3, v0}, Landroidx/media/MediaSession2$SessionCallback;->onCommandRequest(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;)Z

    move-result v1

    .line 481
    .local v1, "accepted":Z
    if-nez v1, :cond_4

    .line 483
    invoke-static {}, Landroidx/media/MediaSession2Stub;->access$300()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 484
    const-string v2, "MS2StubImplBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Command ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, ") from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Landroidx/media/MediaSession2Stub$3;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " was rejected by "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Landroidx/media/MediaSession2Stub$3;->this$0:Landroidx/media/MediaSession2Stub;

    iget-object v4, v4, Landroidx/media/MediaSession2Stub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 487
    :cond_3
    return-void

    .line 491
    .end local v1    # "accepted":Z
    :cond_4
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSession2Stub$3;->val$runnable:Landroidx/media/MediaSession2Stub$Session2Runnable;

    iget-object v2, p0, Landroidx/media/MediaSession2Stub$3;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    invoke-interface {v1, v2}, Landroidx/media/MediaSession2Stub$Session2Runnable;->run(Landroidx/media/MediaSession2$ControllerInfo;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 499
    goto :goto_1

    .line 492
    :catch_0
    move-exception v1

    .line 498
    .local v1, "e":Landroid/os/RemoteException;
    const-string v2, "MS2StubImplBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception in "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Landroidx/media/MediaSession2Stub$3;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    invoke-virtual {v4}, Landroidx/media/MediaSession2$ControllerInfo;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 500
    .end local v1    # "e":Landroid/os/RemoteException;
    :goto_1
    return-void
.end method
