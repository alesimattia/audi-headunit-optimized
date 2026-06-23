.class Landroidx/media/MediaLibraryService2$MyBrowserService$3;
.super Ljava/lang/Object;
.source "MediaLibraryService2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaLibraryService2$MyBrowserService;->onSearch(Ljava/lang/String;Landroid/os/Bundle;Landroidx/media/MediaBrowserServiceCompat$Result;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

.field final synthetic val$controller:Landroidx/media/MediaSession2$ControllerInfo;

.field final synthetic val$extras:Landroid/os/Bundle;

.field final synthetic val$query:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroidx/media/MediaLibraryService2$MyBrowserService;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaLibraryService2$MyBrowserService;

    .line 586
    iput-object p1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$3;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iput-object p2, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$3;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iput-object p3, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$3;->val$query:Ljava/lang/String;

    iput-object p4, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$3;->val$extras:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 589
    iget-object v0, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$3;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iget-object v0, v0, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    invoke-static {v0}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;->getCallback()Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$3;->this$1:Landroidx/media/MediaLibraryService2$MyBrowserService;

    iget-object v1, v1, Landroidx/media/MediaLibraryService2$MyBrowserService;->this$0:Landroidx/media/MediaLibraryService2;

    .line 590
    invoke-static {v1}, Landroidx/media/MediaLibraryService2;->access$100(Landroidx/media/MediaLibraryService2;)Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$3;->val$controller:Landroidx/media/MediaSession2$ControllerInfo;

    iget-object v3, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$3;->val$query:Ljava/lang/String;

    iget-object v4, p0, Landroidx/media/MediaLibraryService2$MyBrowserService$3;->val$extras:Landroid/os/Bundle;

    .line 589
    invoke-virtual {v0, v1, v2, v3, v4}, Landroidx/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;->onSearch(Landroidx/media/MediaLibraryService2$MediaLibrarySession;Landroidx/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 591
    return-void
.end method
