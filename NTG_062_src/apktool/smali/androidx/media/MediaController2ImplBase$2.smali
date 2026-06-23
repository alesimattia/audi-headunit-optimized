.class Landroidx/media/MediaController2ImplBase$2;
.super Ljava/lang/Object;
.source "MediaController2ImplBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaController2ImplBase;->close()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaController2ImplBase;


# direct methods
.method constructor <init>(Landroidx/media/MediaController2ImplBase;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/media/MediaController2ImplBase;

    .line 272
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase$2;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 275
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$2;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaController2ImplBase;->access$100(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2$ControllerCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$2;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$000(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/media/MediaController2$ControllerCallback;->onDisconnected(Landroidx/media/MediaController2;)V

    .line 276
    return-void
.end method
