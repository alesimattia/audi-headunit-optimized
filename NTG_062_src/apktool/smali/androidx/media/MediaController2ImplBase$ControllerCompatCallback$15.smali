.class Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$15;
.super Ljava/lang/Object;
.source "MediaController2ImplBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->onSessionEvent(Ljava/lang/String;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

.field final synthetic val$bufferingState:I

.field final synthetic val$item:Landroidx/media/MediaItem2;


# direct methods
.method constructor <init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Landroidx/media/MediaItem2;I)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    .line 1252
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$15;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iput-object p2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$15;->val$item:Landroidx/media/MediaItem2;

    iput p3, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$15;->val$bufferingState:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1255
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$15;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v0, v0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaController2ImplBase;->access$100(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2$ControllerCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$15;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v1, v1, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$000(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$15;->val$item:Landroidx/media/MediaItem2;

    iget v3, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$15;->val$bufferingState:I

    invoke-virtual {v0, v1, v2, v3}, Landroidx/media/MediaController2$ControllerCallback;->onBufferingStateChanged(Landroidx/media/MediaController2;Landroidx/media/MediaItem2;I)V

    .line 1256
    return-void
.end method
