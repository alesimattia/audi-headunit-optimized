.class public Lcom/spd/xhsntg/ReverseBroadcast;
.super Landroid/content/BroadcastReceiver;
.source "ReverseBroadcast.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/spd/xhsntg/ReverseBroadcast$Callback;
    }
.end annotation


# static fields
.field public static final ACTION_REVERSE_START:Ljava/lang/String; = "com.spd.action.ntg.reverse.START"

.field public static final ACTION_REVERSE_STOP:Ljava/lang/String; = "com.spd.action.ntg.reverse.STOP"

.field public static final KEY_REVERSE:Ljava/lang/String; = "reverse"

.field private static final TAG:Ljava/lang/String; = "ReverseBroadcast"

.field private static mCallback:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/spd/xhsntg/ReverseBroadcast$Callback;",
            ">;"
        }
    .end annotation
.end field

.field private static sIsExitActivity:Z

.field private static sIsTopActivity:Z

.field private static sReverse:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static addCallback(Lcom/spd/xhsntg/ReverseBroadcast$Callback;)V
    .locals 1
    .param p0, "cb"    # Lcom/spd/xhsntg/ReverseBroadcast$Callback;

    .line 79
    sget-object v0, Lcom/spd/xhsntg/ReverseBroadcast;->mCallback:Ljava/util/List;

    if-nez v0, :cond_0

    .line 80
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/spd/xhsntg/ReverseBroadcast;->mCallback:Ljava/util/List;

    .line 82
    :cond_0
    sget-object v0, Lcom/spd/xhsntg/ReverseBroadcast;->mCallback:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 83
    sget-object v0, Lcom/spd/xhsntg/ReverseBroadcast;->mCallback:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    :cond_1
    return-void
.end method

.method public static isReverse()I
    .locals 1

    .line 63
    sget v0, Lcom/spd/xhsntg/ReverseBroadcast;->sReverse:I

    return v0
.end method

.method public static needExitActivity()V
    .locals 1

    .line 71
    sget-boolean v0, Lcom/spd/xhsntg/ReverseBroadcast;->sIsTopActivity:Z

    if-eqz v0, :cond_0

    .line 72
    const/4 v0, 0x0

    sput-boolean v0, Lcom/spd/xhsntg/ReverseBroadcast;->sIsExitActivity:Z

    goto :goto_0

    .line 74
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/spd/xhsntg/ReverseBroadcast;->sIsExitActivity:Z

    .line 76
    :goto_0
    return-void
.end method

.method public static removeCallback(Lcom/spd/xhsntg/ReverseBroadcast$Callback;)V
    .locals 1
    .param p0, "cb"    # Lcom/spd/xhsntg/ReverseBroadcast$Callback;

    .line 88
    sget-object v0, Lcom/spd/xhsntg/ReverseBroadcast;->mCallback:Ljava/util/List;

    if-nez v0, :cond_0

    .line 89
    return-void

    .line 91
    :cond_0
    sget-object v0, Lcom/spd/xhsntg/ReverseBroadcast;->mCallback:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 92
    return-void
.end method

.method public static setTopActivity(Z)V
    .locals 0
    .param p0, "isTop"    # Z

    .line 67
    sput-boolean p0, Lcom/spd/xhsntg/ReverseBroadcast;->sIsTopActivity:Z

    .line 68
    return-void
.end method

.method private startNTG(Landroid/content/Context;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reverse"    # I

    .line 39
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/spd/xhsntg/FullscreenActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 40
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    const-string v1, "reverse"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 42
    const/high16 v1, 0x10080000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 43
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 44
    return-void
.end method

.method private updateReverseState(IZ)V
    .locals 2
    .param p1, "reverse"    # I
    .param p2, "needExit"    # Z

    .line 47
    sput p1, Lcom/spd/xhsntg/ReverseBroadcast;->sReverse:I

    .line 48
    sget-object v0, Lcom/spd/xhsntg/ReverseBroadcast;->mCallback:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 49
    sget-object v0, Lcom/spd/xhsntg/ReverseBroadcast;->mCallback:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/spd/xhsntg/ReverseBroadcast$Callback;

    .line 50
    .local v1, "cb":Lcom/spd/xhsntg/ReverseBroadcast$Callback;
    if-eqz v1, :cond_0

    .line 51
    invoke-interface {v1, p1, p2}, Lcom/spd/xhsntg/ReverseBroadcast$Callback;->onReverseState(IZ)V

    .line 53
    .end local v1    # "cb":Lcom/spd/xhsntg/ReverseBroadcast$Callback;
    :cond_0
    goto :goto_0

    .line 55
    :cond_1
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 25
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 26
    .local v0, "action":Ljava/lang/String;
    const-string v1, "ReverseBroadcast"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onReceive:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    const-string v1, "com.spd.action.ntg.reverse.START"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 28
    sget v1, Lcom/spd/xhsntg/ReverseBroadcast;->sReverse:I

    const/4 v3, 0x1

    if-eq v1, v3, :cond_1

    .line 29
    invoke-direct {p0, v3, v2}, Lcom/spd/xhsntg/ReverseBroadcast;->updateReverseState(IZ)V

    .line 30
    invoke-static {}, Lcom/spd/xhsntg/ReverseBroadcast;->needExitActivity()V

    .line 31
    invoke-direct {p0, p1, v3}, Lcom/spd/xhsntg/ReverseBroadcast;->startNTG(Landroid/content/Context;I)V

    goto :goto_0

    .line 33
    :cond_0
    const-string v1, "com.spd.action.ntg.reverse.STOP"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 34
    sget-boolean v1, Lcom/spd/xhsntg/ReverseBroadcast;->sIsExitActivity:Z

    invoke-direct {p0, v2, v1}, Lcom/spd/xhsntg/ReverseBroadcast;->updateReverseState(IZ)V

    .line 36
    :cond_1
    :goto_0
    return-void
.end method
