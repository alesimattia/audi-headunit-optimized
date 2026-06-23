.class public Lcom/spd/carinfo/CarInfo$Base;
.super Ljava/lang/Object;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Base"
.end annotation


# static fields
.field public static final STEP:I = 0x2710


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 539
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(IILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "what"    # I
    .param p1, "arg"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(IITT;)TT;"
        }
    .end annotation

    .line 625
    .local p2, "def":Ljava/lang/Object;, "TT;"
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/spd/carinfo/CarInfo;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static get(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "what"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(ITT;)TT;"
        }
    .end annotation

    .line 621
    .local p1, "def":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/spd/carinfo/CarInfo$Base;->get(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static getId(I)I
    .locals 1
    .param p0, "what"    # I

    .line 543
    div-int/lit16 v0, p0, 0x2710

    return v0
.end method

.method public static getName(I)Ljava/lang/String;
    .locals 2
    .param p0, "what"    # I

    .line 547
    const/4 v0, 0x0

    .line 548
    .local v0, "type":Ljava/lang/String;
    div-int/lit16 v1, p0, 0x2710

    .line 549
    .local v1, "typeInt":I
    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 605
    :pswitch_0
    sget-object v0, Lcom/spd/carinfo/CarInfo$Other;->CLASS_NAME:Ljava/lang/String;

    goto :goto_0

    .line 602
    :pswitch_1
    sget-object v0, Lcom/spd/carinfo/CarInfo$CarPhone;->CLASS_NAME:Ljava/lang/String;

    .line 603
    goto :goto_0

    .line 599
    :pswitch_2
    sget-object v0, Lcom/spd/carinfo/CarInfo$Vehicles;->CLASS_NAME:Ljava/lang/String;

    .line 600
    goto :goto_0

    .line 596
    :pswitch_3
    sget-object v0, Lcom/spd/carinfo/CarInfo$Battery;->CLASS_NAME:Ljava/lang/String;

    .line 597
    goto :goto_0

    .line 593
    :pswitch_4
    sget-object v0, Lcom/spd/carinfo/CarInfo$Wipers;->CLASS_NAME:Ljava/lang/String;

    .line 594
    goto :goto_0

    .line 590
    :pswitch_5
    sget-object v0, Lcom/spd/carinfo/CarInfo$ReverseAndAVM;->CLASS_NAME:Ljava/lang/String;

    .line 591
    goto :goto_0

    .line 587
    :pswitch_6
    sget-object v0, Lcom/spd/carinfo/CarInfo$DrivingAndOperating;->CLASS_NAME:Ljava/lang/String;

    .line 588
    goto :goto_0

    .line 584
    :pswitch_7
    sget-object v0, Lcom/spd/carinfo/CarInfo$DriverAssistance;->CLASS_NAME:Ljava/lang/String;

    .line 585
    goto :goto_0

    .line 581
    :pswitch_8
    sget-object v0, Lcom/spd/carinfo/CarInfo$Lighting;->CLASS_NAME:Ljava/lang/String;

    .line 582
    goto :goto_0

    .line 578
    :pswitch_9
    sget-object v0, Lcom/spd/carinfo/CarInfo$Instruments;->CLASS_NAME:Ljava/lang/String;

    .line 579
    goto :goto_0

    .line 575
    :pswitch_a
    sget-object v0, Lcom/spd/carinfo/CarInfo$SteeringWheel;->CLASS_NAME:Ljava/lang/String;

    .line 576
    goto :goto_0

    .line 572
    :pswitch_b
    sget-object v0, Lcom/spd/carinfo/CarInfo$Mirrors;->CLASS_NAME:Ljava/lang/String;

    .line 573
    goto :goto_0

    .line 569
    :pswitch_c
    sget-object v0, Lcom/spd/carinfo/CarInfo$WheelsAndTires;->CLASS_NAME:Ljava/lang/String;

    .line 570
    goto :goto_0

    .line 566
    :pswitch_d
    sget-object v0, Lcom/spd/carinfo/CarInfo$Windows;->CLASS_NAME:Ljava/lang/String;

    .line 567
    goto :goto_0

    .line 563
    :pswitch_e
    sget-object v0, Lcom/spd/carinfo/CarInfo$Doors;->CLASS_NAME:Ljava/lang/String;

    .line 564
    goto :goto_0

    .line 560
    :pswitch_f
    sget-object v0, Lcom/spd/carinfo/CarInfo$Seats;->CLASS_NAME:Ljava/lang/String;

    .line 561
    goto :goto_0

    .line 557
    :pswitch_10
    sget-object v0, Lcom/spd/carinfo/CarInfo$AirCondition;->CLASS_NAME:Ljava/lang/String;

    .line 558
    goto :goto_0

    .line 554
    :pswitch_11
    sget-object v0, Lcom/spd/carinfo/CarInfo$Keys;->CLASS_NAME:Ljava/lang/String;

    .line 555
    goto :goto_0

    .line 551
    :pswitch_12
    sget-object v0, Lcom/spd/carinfo/CarInfo$General;->CLASS_NAME:Ljava/lang/String;

    .line 552
    nop

    .line 609
    :goto_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static set(ILjava/lang/Object;)I
    .locals 1
    .param p0, "what"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(ITT;)I"
        }
    .end annotation

    .line 613
    .local p1, "arg0":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/spd/carinfo/CarInfo$Base;->set(ILjava/lang/Object;I)I

    move-result v0

    return v0
.end method

.method public static set(ILjava/lang/Object;I)I
    .locals 1
    .param p0, "what"    # I
    .param p2, "arg1"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(ITT;I)I"
        }
    .end annotation

    .line 617
    .local p1, "arg0":Ljava/lang/Object;, "TT;"
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/spd/carinfo/CarInfo;->set(ILjava/lang/Object;I)I

    move-result v0

    return v0
.end method
