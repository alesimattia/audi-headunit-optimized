.class Landroidx/media/MediaController2ImplBase$ConnectionCallback;
.super Landroid/support/v4/media/MediaBrowserCompat$ConnectionCallback;
.source "MediaController2ImplBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaController2ImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectionCallback"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/media/MediaController2ImplBase;


# direct methods
.method private constructor <init>(Landroidx/media/MediaController2ImplBase;)V
    .locals 0

    .line 962
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase$ConnectionCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-direct {p0}, Landroid/support/v4/media/MediaBrowserCompat$ConnectionCallback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroidx/media/MediaController2ImplBase;Landroidx/media/MediaController2ImplBase$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/media/MediaController2ImplBase;
    .param p2, "x1"    # Landroidx/media/MediaController2ImplBase$1;

    .line 962
    invoke-direct {p0, p1}, Landroidx/media/MediaController2ImplBase$ConnectionCallback;-><init>(Landroidx/media/MediaController2ImplBase;)V

    return-void
.end method


# virtual methods
.method public onConnected()V
    .locals 4

    .line 965
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ConnectionCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-virtual {v0}, Landroidx/media/MediaController2ImplBase;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    .line 966
    .local v0, "browser":Landroid/support/v4/media/MediaBrowserCompat;
    if-eqz v0, :cond_0

    .line 967
    iget-object v1, p0, Landroidx/media/MediaController2ImplBase$ConnectionCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-virtual {v0}, Landroid/support/v4/media/MediaBrowserCompat;->getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/media/MediaController2ImplBase;->access$1000(Landroidx/media/MediaController2ImplBase;Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    goto :goto_0

    .line 968
    :cond_0
    invoke-static {}, Landroidx/media/MediaController2ImplBase;->access$1100()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 969
    const-string v1, "MC2ImplBase"

    const-string v2, "Controller is closed prematually"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 971
    :cond_1
    :goto_0
    return-void
.end method

.method public onConnectionFailed()V
    .locals 1

    .line 980
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ConnectionCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-virtual {v0}, Landroidx/media/MediaController2ImplBase;->close()V

    .line 981
    return-void
.end method

.method public onConnectionSuspended()V
    .locals 1

    .line 975
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$ConnectionCallback;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-virtual {v0}, Landroidx/media/MediaController2ImplBase;->close()V

    .line 976
    return-void
.end method
