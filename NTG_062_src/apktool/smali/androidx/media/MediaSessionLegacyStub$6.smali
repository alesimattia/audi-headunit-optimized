.class Landroidx/media/MediaSessionLegacyStub$6;
.super Ljava/lang/Object;
.source "MediaSessionLegacyStub.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSessionLegacyStub;->onCommand2Internal(Landroid/os/IBinder;Landroidx/media/SessionCommand2;ILandroidx/media/MediaSessionLegacyStub$Session2Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSessionLegacyStub;

.field final synthetic val$commandCode:I

.field final synthetic val$controller:Landroidx/media/MediaSession2$ControllerInfo;

.field final synthetic val$runnable:Landroidx/media/MediaSessionLegacyStub$Session2Runnable;

.field final synthetic val$sessionCommand:Landroidx/media/SessionCommand2;


# direct methods
.method constructor <init>(Landroidx/media/MediaSessionLegacyStub;Landroidx/media/SessionCommand2;Landroidx/media/MediaSession2$ControllerInfo;ILandroidx/media/MediaSessionLegacyStub$Session2Runnable;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSessionLegacyStub;

    .line 249
    iput-object p1, p0, Landroidx/media/MediaSessionLegacyStub$6;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iput-object p2, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$sessionCommand:Landroidx/media/SessionCommand2;

    iput-object p3, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iput p4, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$commandCode:I

    iput-object p5, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$runnable:Landroidx/media/MediaSessionLegacyStub$Session2Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 253
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$sessionCommand:Landroidx/media/SessionCommand2;

    if-eqz v0, :cond_1

    .line 254
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub$6;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iget-object v2, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$sessionCommand:Landroidx/media/SessionCommand2;

    invoke-static {v0, v1, v2}, Landroidx/media/MediaSessionLegacyStub;->access$000(Landroidx/media/MediaSessionLegacyStub;Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 255
    return-void

    .line 257
    :cond_0
    invoke-static {}, Landroidx/media/MediaSessionLegacyStub;->access$100()Landroid/util/SparseArray;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$sessionCommand:Landroidx/media/SessionCommand2;

    invoke-virtual {v1}, Landroidx/media/SessionCommand2;->getCommandCode()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/SessionCommand2;

    .local v0, "command":Landroidx/media/SessionCommand2;
    goto :goto_0

    .line 259
    .end local v0    # "command":Landroidx/media/SessionCommand2;
    :cond_1
    iget-object v0, p0, Landroidx/media/MediaSessionLegacyStub$6;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iget v2, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$commandCode:I

    invoke-static {v0, v1, v2}, Landroidx/media/MediaSessionLegacyStub;->access$200(Landroidx/media/MediaSessionLegacyStub;Landroidx/media/MediaSession2$ControllerInfo;I)Z

    move-result v0

    if-nez v0, :cond_2

    .line 260
    return-void

    .line 262
    :cond_2
    invoke-static {}, Landroidx/media/MediaSessionLegacyStub;->access$100()Landroid/util/SparseArray;

    move-result-object v0

    iget v1, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$commandCode:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media/SessionCommand2;

    .line 264
    .restart local v0    # "command":Landroidx/media/SessionCommand2;
    :goto_0
    if-eqz v0, :cond_4

    .line 265
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$6;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v1, v1, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v1}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaSessionLegacyStub$6;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v2, v2, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    .line 266
    invoke-virtual {v2}, Landroidx/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v2

    iget-object v3, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    .line 265
    invoke-virtual {v1, v2, v3, v0}, Landroidx/media/MediaSession2$SessionCallback;->onCommandRequest(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/SessionCommand2;)Z

    move-result v1

    .line 267
    .local v1, "accepted":Z
    if-nez v1, :cond_4

    .line 269
    invoke-static {}, Landroidx/media/MediaSessionLegacyStub;->access$300()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 270
    const-string v2, "MS2StubImplBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Command ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, ") from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " was rejected by "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Landroidx/media/MediaSessionLegacyStub$6;->this$0:Landroidx/media/MediaSessionLegacyStub;

    iget-object v4, v4, Landroidx/media/MediaSessionLegacyStub;->mSession:Landroidx/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    :cond_3
    return-void

    .line 277
    .end local v1    # "accepted":Z
    :cond_4
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$runnable:Landroidx/media/MediaSessionLegacyStub$Session2Runnable;

    iget-object v2, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    invoke-interface {v1, v2}, Landroidx/media/MediaSessionLegacyStub$Session2Runnable;->run(Landroidx/media/MediaSession2$ControllerInfo;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 285
    goto :goto_1

    .line 278
    :catch_0
    move-exception v1

    .line 284
    .local v1, "e":Landroid/os/RemoteException;
    const-string v2, "MS2StubImplBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception in "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Landroidx/media/MediaSessionLegacyStub$6;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    invoke-virtual {v4}, Landroidx/media/MediaSession2$ControllerInfo;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 286
    .end local v1    # "e":Landroid/os/RemoteException;
    :goto_1
    return-void
.end method
