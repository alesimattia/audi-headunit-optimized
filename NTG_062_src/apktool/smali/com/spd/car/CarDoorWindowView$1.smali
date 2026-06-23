.class Lcom/spd/car/CarDoorWindowView$1;
.super Landroid/database/ContentObserver;
.source "CarDoorWindowView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/car/CarDoorWindowView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/spd/car/CarDoorWindowView;


# direct methods
.method constructor <init>(Lcom/spd/car/CarDoorWindowView;Landroid/os/Handler;)V
    .locals 0
    .param p1, "this$0"    # Lcom/spd/car/CarDoorWindowView;
    .param p2, "x0"    # Landroid/os/Handler;

    .line 219
    iput-object p1, p0, Lcom/spd/car/CarDoorWindowView$1;->this$0:Lcom/spd/car/CarDoorWindowView;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1
    .param p1, "selfChange"    # Z

    .line 222
    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 223
    iget-object v0, p0, Lcom/spd/car/CarDoorWindowView$1;->this$0:Lcom/spd/car/CarDoorWindowView;

    invoke-static {v0}, Lcom/spd/car/CarDoorWindowView;->access$000(Lcom/spd/car/CarDoorWindowView;)V

    .line 224
    return-void
.end method
