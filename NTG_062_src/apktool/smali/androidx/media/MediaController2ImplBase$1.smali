.class Landroidx/media/MediaController2ImplBase$1;
.super Ljava/lang/Object;
.source "MediaController2ImplBase.java"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/media/MediaController2ImplBase;-><init>(Landroid/content/Context;Landroidx/media/SessionToken2;Ljava/util/concurrent/Executor;Landroidx/media/MediaController2$ControllerCallback;)V
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

    .line 231
    iput-object p1, p0, Landroidx/media/MediaController2ImplBase$1;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public binderDied()V
    .locals 1

    .line 234
    iget-object v0, p0, Landroidx/media/MediaController2ImplBase$1;->this$0:Landroidx/media/MediaController2ImplBase;

    invoke-virtual {v0}, Landroidx/media/MediaController2ImplBase;->close()V

    .line 235
    return-void
.end method
