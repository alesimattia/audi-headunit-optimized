.class Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$14;
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

.field final synthetic val$state:Landroid/support/v4/media/session/PlaybackStateCompat;


# direct methods
.method constructor <init>(Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;Landroid/support/v4/media/session/PlaybackStateCompat;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    .line 1231
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$14;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iput-object p2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$14;->val$state:Landroid/support/v4/media/session/PlaybackStateCompat;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1234
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$14;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v0, v0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v0}, Landroidx/media/MediaController2ImplBase;->access$100(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2$ControllerCallback;

    move-result-object v0

    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$14;->this$1:Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;

    iget-object v1, v1, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-static {v1}, Landroidx/media/MediaController2ImplBase;->access$000(Landroidx/media/MediaController2ImplBase;)Landroidx/media/MediaController2;

    move-result-object v1

    iget-object v2, p0, Landroidx/media/MediaController2ImplBase$ControllerCompatCallback$14;->val$state:Landroid/support/v4/media/session/PlaybackStateCompat;

    invoke-virtual {v2}, Landroid/support/v4/media/session/PlaybackStateCompat;->getPlaybackSpeed()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroidx/media/MediaController2$ControllerCallback;->onPlaybackSpeedChanged(Landroidx/media/MediaController2;F)V

    .line 1235
    return-void
.end method
