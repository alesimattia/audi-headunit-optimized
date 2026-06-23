.class public Lcom/spd/xhsntg/FullscreenActivity$H;
.super Landroid/os/Handler;
.source "FullscreenActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/xhsntg/FullscreenActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "H"
.end annotation


# instance fields
.field private mActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/spd/xhsntg/FullscreenActivity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/spd/xhsntg/FullscreenActivity;Landroid/os/Looper;)V
    .locals 1
    .param p1, "activity"    # Lcom/spd/xhsntg/FullscreenActivity;
    .param p2, "looper"    # Landroid/os/Looper;

    .line 462
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 463
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity$H;->mActivity:Ljava/lang/ref/WeakReference;

    .line 464
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .line 468
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 469
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3e8

    if-ne v1, v0, :cond_0

    .line 470
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity$H;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/spd/xhsntg/FullscreenActivity;

    .line 471
    .local v0, "activity":Lcom/spd/xhsntg/FullscreenActivity;
    if-eqz v0, :cond_0

    .line 472
    const v1, 0x7f05003f

    invoke-virtual {v0, v1}, Lcom/spd/xhsntg/FullscreenActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 475
    .end local v0    # "activity":Lcom/spd/xhsntg/FullscreenActivity;
    :cond_0
    return-void
.end method
