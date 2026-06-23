.class Landroidx/media/MediaController2ImplBase$4$1;
.super Ljava/lang/Object;
.source "MediaController2ImplBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaController2ImplBase$4;->onReceiveResult(ILandroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaController2ImplBase$4;


# direct methods
.method constructor <init>(Landroidx/media/MediaController2ImplBase$4;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaController2ImplBase$4;

    .line 897
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase$4$1;->this$1:Landroidx/media/MediaController2ImplBase$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 900
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$4$1;->this$1:Landroidx/media/MediaController2ImplBase$4;

    iget-object v0, v0, Landroidx/media/MediaController2ImplBase$4;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaController2ImplBase;->access$100(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2$ControllerCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$4$1;->this$1:Landroidx/media/MediaController2ImplBase$4;

    iget-object v1, v1, Landroidx/media/MediaController2ImplBase$4;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$000(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/media/MediaController2$ControllerCallback;->onDisconnected(Landroidx/media/MediaController2;)V

    .line 901
    return-void
.end method
