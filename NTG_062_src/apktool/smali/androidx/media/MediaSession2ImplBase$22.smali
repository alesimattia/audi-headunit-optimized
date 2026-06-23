.class Landroidx/media/MediaSession2ImplBase$22;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaSession2ImplBase;->notifyToController(Landroidx/media/MediaSession2$ControllerInfo;Landroidx/media/MediaSession2ImplBase$NotifyRunnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaSession2ImplBase;

.field final synthetic val$controller:Landroidx/media/MediaSession2$ControllerInfo;


# direct methods
.method constructor <init>(Landroidx/media/MediaSession2ImplBase;Landroidx/media/MediaSession2$ControllerInfo;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaSession2ImplBase;

    .line 1143
    iput-object p1, p0, Landroidx/media/MediaSession2ImplBase$22;->this$0:Landroidx/media/MediaSession2ImplBase;

    iput-object p2, p0, Landroidx/media/MediaSession2ImplBase$22;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1146
    iget-object v0, p0, Landroidx/media/MediaSession2ImplBase$22;->this$0:Landroidx/media/MediaSession2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaSession2ImplBase;->access$200(Landroidx/media/MediaSession2ImplBase;)Landroidx/media/MediaSession2$SessionCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaSession2ImplBase$22;->this$0:Landroidx/media/MediaSession2ImplBase;

    invoke-virtual {v1}, Landroidx/media/MediaSession2ImplBase;->getInstance()Landroidx/media/MediaSession2;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaSession2ImplBase$22;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    invoke-virtual {v0, v1, v2}, Landroidx/media/MediaSession2$SessionCallback;->onDisconnected(Landroidx/media/MediaSession2;Landroidx/media/MediaSession2$ControllerInfo;)V

    .line 1147
    return-void
.end method
