.class Landroidx/media/MediaController2ImplBase$5;
.super Ljava/lang/Object;
.source "MediaController2ImplBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaController2ImplBase;->connectToService()V
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

    .line 912
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase$5;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 915
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$5;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaController2ImplBase;->access$500(Landroidx/media/MediaController2ImplBase;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 916
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$5;->this$0:Landroidx/media/MediaController2ImplBase;

    new-instance v2, Landroid/support/v4/media/MediaBrowserCompat;

    iget-object v3, p0, Landroidx/media/MediaController2ImplBase$5;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v3}, Landroidx/media/MediaController2ImplBase;->access$700(Landroidx/media/MediaController2ImplBase;)Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Landroidx/media/MediaController2ImplBase$5;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v4}, Landroidx/media/MediaController2ImplBase;->access$800(Landroidx/media/MediaController2ImplBase;)Landroidx/media/SessionToken2;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/media/SessionToken2;->getComponentName()Landroid/content/ComponentName;

    move-result-object v4

    new-instance v5, Landroidx/media/MediaController2ImplBase$ConnectionCallback;

    iget-object v6, p0, Landroidx/media/MediaController2ImplBase$5;->this$0:Landroidx/media/MediaController2ImplBase;

    const/4 v7, 0x0

    invoke-direct {v5, v6, v7}, Landroidx/media/MediaController2ImplBase$ConnectionCallback;-><init>(Landroidx/media/MediaController2ImplBase;Landroidx/media/MediaController2ImplBase$1;)V

    sget-object v6, Landroidx/media/MediaController2ImplBase;->sDefaultRootExtras:Landroid/os/Bundle;

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/support/v4/media/MediaBrowserCompat;-><init>(Landroid/content/Context;Landroid/content/ComponentName;Landroid/support/v4/media/MediaBrowserCompat$ConnectionCallback;Landroid/os/Bundle;)V

    invoke-static {v1, v2}, Landroidx/media/MediaController2ImplBase;->access$602(Landroidx/media/MediaController2ImplBase;Landroid/support/v4/media/MediaBrowserCompat;)Landroid/support/v4/media/MediaBrowserCompat;

    .line 918
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$5;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$600(Landroidx/media/MediaController2ImplBase;)Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/media/MediaBrowserCompat;->connect()V

    .line 919
    monitor-exit v0

    .line 920
    return-void

    .line 919
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
