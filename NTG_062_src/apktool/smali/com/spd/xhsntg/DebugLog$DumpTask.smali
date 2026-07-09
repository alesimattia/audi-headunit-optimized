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


# Worker del monitor CarInfo. mMode=0 -> loop continuo in background (reflection + letture
# PULL su CarInfo, migliaia di chiamate binder: NON sul main thread) finche' DebugLog.sRunning;
# ad ogni giro fa upsert in DebugLog.sMap e riscrive il file. mMode=1 -> applica il testo
# prodotto alla TextView (rimesso sul main thread via View.post).

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

    # --- mMode==0: monitor CONTINUO in background ---
    :goto_dump
    const/4 v1, 0x1

    sput-boolean v1, Lcom/spd/xhsntg/DebugLog;->sBusy:Z

    invoke-static {}, Lcom/spd/carinfo/CarInfo;->instance()Lcom/spd/carinfo/CarInfo;

    move-result-object v0

    # v0 = CarInfo, persistente per tutta la durata del monitor

    :goto_loop
    sget-boolean v1, Lcom/spd/xhsntg/DebugLog;->sRunning:Z

    if-eqz v1, :goto_stop

    # === una passata completa: probe fa upsert in DebugLog.sMap per ogni what+arg ===
    invoke-static {}, Lcom/spd/xhsntg/DebugLog$DumpTask;->names()[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    :goto_outer
    if-ge v4, v3, :goto_outer_end

    # aget fuori dal try: v14 (cn) resta inizializzato anche all'handler catch_class
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

    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v14

    # popola la mappa what->nome per onPush (dedup PUSH+PULL); v12 libero qui
    sget-object v12, Lcom/spd/xhsntg/DebugLog;->sNames:Ljava/util/concurrent/ConcurrentHashMap;

    if-eqz v12, :cond_nonames

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v12, v11, v14}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_nonames
    # v11 (Field, ormai inutile dopo getName) riusato come contatore arg 0..5 -> DebugLog.sArg
    const/4 v11, 0x0

    :goto_arg
    const/4 v12, 0x6

    if-ge v11, v12, :goto_inner_next

    sput v11, Lcom/spd/xhsntg/DebugLog;->sArg:I

    # un singolo what malformato non deve abortire la passata
    :try_start_probe
    invoke-static {v0, v14, v13}, Lcom/spd/xhsntg/DebugLog;->probe(Lcom/spd/carinfo/CarInfo;Ljava/lang/String;I)V
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

    :goto_outer_next
    add-int/lit8 v4, v4, 0x1

    goto :goto_outer

    :goto_outer_end
    # === fine passata: riscrive il file dalla mappa aggiornata + aggiorna UI ===
    invoke-virtual {v0}, Lcom/spd/carinfo/CarInfo;->isConnected()Z

    move-result v1

    invoke-static {v1}, Lcom/spd/xhsntg/DebugLog;->snapshot(Z)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/spd/xhsntg/DebugLog;->writeFileOverwrite(Ljava/lang/String;)V

    # rimanda l'aggiornamento UI sul main thread
    sget-object v2, Lcom/spd/xhsntg/DebugLog;->sText:Landroid/widget/TextView;

    if-eqz v2, :goto_sleep

    new-instance v5, Lcom/spd/xhsntg/DebugLog$DumpTask;

    const/4 v6, 0x1

    invoke-direct {v5, v6, v1}, Lcom/spd/xhsntg/DebugLog$DumpTask;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    :goto_sleep
    # pausa ~3s tra una passata e l'altra
    const-wide/16 v5, 0xbb8

    :try_start_sleep
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_sleep
    .catch Ljava/lang/InterruptedException; {:try_start_sleep .. :try_end_sleep} :catch_sleep

    goto :goto_aftersleep

    :catch_sleep
    move-exception v5

    :goto_aftersleep
    goto :goto_loop

    :goto_stop
    # uscita: segnala che nessun thread monitor e' piu' vivo
    const/4 v1, 0x0

    sput-boolean v1, Lcom/spd/xhsntg/DebugLog;->sBusy:Z

    return-void
.end method
