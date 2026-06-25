.class Lcom/spd/xhsntg/DebugLog$DumpTask;
.super Ljava/lang/Object;
.source "DebugLog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/xhsntg/DebugLog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DumpTask"
.end annotation


# Worker del dump CarInfo. mMode=0 -> esegue il dump in background (reflection + letture
# PULL su CarInfo, migliaia di chiamate binder: NON sul main thread). mMode=1 -> applica
# il testo prodotto alla TextView (rimesso sul main thread via View.post).

# instance fields
.field mMode:I

.field mText:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "mode"    # I
    .param p2, "text"    # Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/spd/xhsntg/DebugLog$DumpTask;->mMode:I

    iput-object p2, p0, Lcom/spd/xhsntg/DebugLog$DumpTask;->mText:Ljava/lang/String;

    return-void
.end method

# Elenco dei nomi-classe da scandire via reflection (CarInfo + classi annidate con costanti).
.method private static names()[Ljava/lang/String;
    .locals 3

    const/16 v0, 0x15

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "com.spd.carinfo.CarInfo"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "com.spd.carinfo.CarInfo$Instruments"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "com.spd.carinfo.CarInfo$DriverAssistance"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "com.spd.carinfo.CarInfo$ReverseAndAVM"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "com.spd.carinfo.CarInfo$AirCondition"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "com.spd.carinfo.CarInfo$Lighting"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "com.spd.carinfo.CarInfo$Battery"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "com.spd.carinfo.CarInfo$Doors"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "com.spd.carinfo.CarInfo$General"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "com.spd.carinfo.CarInfo$CarPhone"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "com.spd.carinfo.CarInfo$Seats"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "com.spd.carinfo.CarInfo$WheelsAndTires"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "com.spd.carinfo.CarInfo$Windows"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "com.spd.carinfo.CarInfo$Wipers"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "com.spd.carinfo.CarInfo$Vehicles"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "com.spd.carinfo.CarInfo$Mirrors"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "com.spd.carinfo.CarInfo$Other"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "com.spd.carinfo.CarInfo$SteeringWheel"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "com.spd.carinfo.CarInfo$Keys"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "com.spd.carinfo.CarInfo$DrivingAndOperating"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "com.spd.carinfo.CarInfo$Base"

    aput-object v2, v0, v1

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 15

    iget v0, p0, Lcom/spd/xhsntg/DebugLog$DumpTask;->mMode:I

    if-eqz v0, :goto_dump

    # --- mMode==1: aggiorna la TextView (sul main thread) ---
    sget-object v0, Lcom/spd/xhsntg/DebugLog;->sText:Landroid/widget/TextView;

    if-eqz v0, :goto_ret

    iget-object v1, p0, Lcom/spd/xhsntg/DebugLog$DumpTask;->mText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget-object v0, Lcom/spd/xhsntg/DebugLog;->sScroll:Landroid/widget/ScrollView;

    if-eqz v0, :goto_ret

    const/16 v1, 0x82

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->fullScroll(I)Z

    :goto_ret
    return-void

    # --- mMode==0: dump in background ---
    :goto_dump
    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/spd/carinfo/CarInfo;->isConnected()Z

    move-result v4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "=== NTG_062 CarInfo PULL dump (one-shot) ===\nconnected="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, "\ncriterio: tengo ogni coppia what+arg con almeno un valore PRESENTE (!= sentinella), inclusi gli zeri reali. arg scandito 0..5 (sedili/ruote/porte/zone/finestrini/camere). righe con arg=0 = valore globale.\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/spd/xhsntg/DebugLog$DumpTask;->names()[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    :goto_outer
    if-ge v4, v3, :goto_outer_end

    # aget fuori dal try: garantisce v14 (cn) inizializzato anche all'handler catch_class
    aget-object v14, v2, v4

    :try_start_0
    invoke-static {v14}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v8
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_class

    array-length v9, v8

    const/4 v10, 0x0

    :goto_inner
    if-ge v10, v9, :goto_inner_end

    aget-object v11, v8, v10

    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v12

    if-ne v12, v7, :goto_inner_next

    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v12

    invoke-static {v12}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v12

    if-eqz v12, :goto_inner_next

    :try_start_1
    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v13
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_field

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v14

    # P3: scansione indicizzata arg=0..5 (cattura sedili/ruote/porte/zone/finestrini/camere AVM).
    # v11 (Field, ormai inutilizzato dopo getName) riusato come contatore arg; arg -> DebugLog.sArg.
    const/4 v11, 0x0

    :goto_arg
    const/4 v12, 0x6

    if-ge v11, v12, :goto_inner_next

    sput v11, Lcom/spd/xhsntg/DebugLog;->sArg:I

    # P2: un singolo what malformato (es. ClassCastException) non deve abortire l'intero dump.
    :try_start_probe
    invoke-static {v1, v0, v14, v13}, Lcom/spd/xhsntg/DebugLog;->probe(Ljava/lang/StringBuilder;Lcom/spd/carinfo/CarInfo;Ljava/lang/String;I)I

    move-result v12

    add-int/2addr v6, v12
    :try_end_probe
    .catch Ljava/lang/Throwable; {:try_start_probe .. :try_end_probe} :catch_probe

    :goto_arg_cont
    add-int/lit8 v11, v11, 0x1

    goto :goto_arg

    :catch_probe
    move-exception v12

    goto :goto_arg_cont

    :goto_inner_next
    add-int/lit8 v10, v10, 0x1

    goto :goto_inner

    :catch_field
    move-exception v12

    goto :goto_inner_next

    :goto_inner_end
    goto :goto_outer_next

    :catch_class
    move-exception v12

    const-string v13, "ERR "

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, "\n"

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_outer_next
    add-int/lit8 v4, v4, 0x1

    goto :goto_outer

    :goto_outer_end
    const-string v2, "\nwhat scansionati="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " righe tenute (what+arg)="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/spd/xhsntg/DebugLog;->writeFileOverwrite(Ljava/lang/String;)V

    # rimanda l'aggiornamento UI sul main thread
    sget-object v1, Lcom/spd/xhsntg/DebugLog;->sText:Landroid/widget/TextView;

    if-eqz v1, :goto_flag

    new-instance v2, Lcom/spd/xhsntg/DebugLog$DumpTask;

    const/4 v3, 0x1

    invoke-direct {v2, v3, v0}, Lcom/spd/xhsntg/DebugLog$DumpTask;-><init>(ILjava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    :goto_flag
    const/4 v0, 0x0

    sput-boolean v0, Lcom/spd/xhsntg/DebugLog;->sRunning:Z

    return-void
.end method
