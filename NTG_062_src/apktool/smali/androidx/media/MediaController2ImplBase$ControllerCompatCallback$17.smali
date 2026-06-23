.class Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$17;
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

.field final synthetic val$itemCount:I

.field final synthetic val$query:Ljava/lang/String;

.field final synthetic val$searchExtras:Landroid/os/Bundle;


# direct methods
.method constructor <init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    .line 1296
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$17;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iput-object p2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$17;->val$query:Ljava/lang/String;

    iput p3, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$17;->val$itemCount:I

    iput-object p4, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$17;->val$searchExtras:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1299
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$17;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v0, v0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaController2ImplBase;->access$100(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2$ControllerCallback;

    move-result-object v0

    check-cast v0, Landroidx/media/MediaBrowser2$BrowserCallback;

    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$17;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v1, v1, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    .line 1300
    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$000(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2;

    move-result-object v1

    check-cast v1, Landroidx/media/MediaBrowser2;

    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$17;->val$query:Ljava/lang/String;

    iget v3, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$17;->val$itemCount:I

    iget-object v4, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$17;->val$searchExtras:Landroid/os/Bundle;

    .line 1299
    invoke-virtual {v0, v1, v2, v3, v4}, Landroidx/media/MediaBrowser2$BrowserCallback;->onSearchResultChanged(Landroidx/media/MediaBrowser2;Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 1301
    return-void
.end method
