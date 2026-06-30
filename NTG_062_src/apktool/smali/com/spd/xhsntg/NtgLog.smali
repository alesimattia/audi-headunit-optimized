.class public final Lcom/spd/xhsntg/NtgLog;
.super Ljava/lang/Object;
.source "NtgLog.java"

# Logger su file Download/NTG_062_log.log (mirror dei Log dell'app, distinto dal logger can-box).
# Scrittura su thread di background (HandlerThread). Tutti i metodi pubblici in try/catch(Throwable):
# NtgLog NON puo' mai far crashare l'app. Vedi blueprint java/com/spd/xhsntg/NtgLog.java.
# @since 30/06/26 Mattia Alesi


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/spd/xhsntg/NtgLog$1;
    }
.end annotation


# static fields
.field static sCtx:Landroid/content/Context;

.field static volatile sHandler:Landroid/os/Handler;

.field static volatile sInit:Z

.field static sPending:Ljava/util/ArrayList;

.field static sWriter:Ljava/io/BufferedWriter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/spd/xhsntg/NtgLog;->sPending:Ljava/util/ArrayList;

    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    const/4 v0, 0x3

    const-string v1, "D"

    invoke-static {v0, v1, p0, p1}, Lcom/spd/xhsntg/NtgLog;->log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    const/4 v0, 0x6

    const-string v1, "E"

    invoke-static {v0, v1, p0, p1}, Lcom/spd/xhsntg/NtgLog;->log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static handle(Landroid/os/Message;)V
    .locals 8
    .param p0, "msg"    # Landroid/os/Message;

    :try_start_0
    iget-object v0, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [Ljava/lang/String;

    # apre il file se non gia' aperto (e il permesso e' disponibile)
    sget-object v1, Lcom/spd/xhsntg/NtgLog;->sWriter:Ljava/io/BufferedWriter;

    if-nez v1, :cond_have_writer

    invoke-static {}, Lcom/spd/xhsntg/NtgLog;->openIfPossible()V

    :cond_have_writer
    # line = null
    const/4 v1, 0x0

    if-eqz v0, :cond_line_done

    const/4 v2, 0x0

    aget-object v2, v0, v2

    if-eqz v2, :cond_line_done

    # ts = DateFormat.format("HH:mm:ss", System.currentTimeMillis())
    const-string v2, "HH:mm:ss"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v2

    # line = ts + " " + e[0] + "/" + e[1] + ": " + e[2] + "\n"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    aget-object v4, v0, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x1

    aget-object v4, v0, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x2

    aget-object v4, v0, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_line_done
    sget-object v2, Lcom/spd/xhsntg/NtgLog;->sWriter:Ljava/io/BufferedWriter;

    if-eqz v2, :cond_buffer

    # svuota i pending accumulati prima dell'apertura
    sget-object v3, Lcom/spd/xhsntg/NtgLog;->sPending:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_pending_done

    const/4 v3, 0x0

    :goto_pending
    sget-object v4, Lcom/spd/xhsntg/NtgLog;->sPending:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_pending_clear

    sget-object v4, Lcom/spd/xhsntg/NtgLog;->sPending:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_pending

    :cond_pending_clear
    sget-object v3, Lcom/spd/xhsntg/NtgLog;->sPending:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    :cond_pending_done
    if-eqz v1, :cond_no_line

    invoke-virtual {v2, v1}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    :cond_no_line
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->flush()V

    goto :cond_end

    :cond_buffer
    if-eqz v1, :cond_end

    # bufferizza in memoria finche' il file non e' apribile (cap MAX_PENDING)
    sget-object v2, Lcom/spd/xhsntg/NtgLog;->sPending:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v3, 0x7d0

    if-lt v2, v3, :cond_add

    sget-object v2, Lcom/spd/xhsntg/NtgLog;->sPending:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_add
    sget-object v2, Lcom/spd/xhsntg/NtgLog;->sPending:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_end
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    const/4 v0, 0x4

    const-string v1, "I"

    invoke-static {v0, v1, p0, p1}, Lcom/spd/xhsntg/NtgLog;->log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    sget-boolean v0, Lcom/spd/xhsntg/NtgLog;->sInit:Z

    if-eqz v0, :cond_go

    return-void

    :cond_go
    const/4 v0, 0x1

    sput-boolean v0, Lcom/spd/xhsntg/NtgLog;->sInit:Z

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/spd/xhsntg/NtgLog;->sCtx:Landroid/content/Context;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "NtgLog"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    new-instance v2, Lcom/spd/xhsntg/NtgLog$1;

    invoke-direct {v2, v1}, Lcom/spd/xhsntg/NtgLog$1;-><init>(Landroid/os/Looper;)V

    sput-object v2, Lcom/spd/xhsntg/NtgLog;->sHandler:Landroid/os/Handler;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    sput-object v0, Lcom/spd/xhsntg/NtgLog;->sHandler:Landroid/os/Handler;

    return-void
.end method

.method public static flush()V
    .locals 3

    :try_start_0
    sget-object v0, Lcom/spd/xhsntg/NtgLog;->sHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    return-void
.end method

.method private static log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 4
    .param p0, "prio"    # I
    .param p1, "lvl"    # Ljava/lang/String;
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "msg"    # Ljava/lang/String;

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0, p2, p3}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    :try_start_1
    sget-object v1, Lcom/spd/xhsntg/NtgLog;->sHandler:Landroid/os/Handler;

    if-eqz v1, :cond_0

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    const/4 v3, 0x2

    aput-object p3, v2, v3

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    :cond_0
    return v0

    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    return v0
.end method

.method private static openIfPossible()V
    .locals 5

    :try_start_0
    sget-object v0, Lcom/spd/xhsntg/NtgLog;->sCtx:Landroid/content/Context;

    if-nez v0, :cond_have_ctx

    return-void

    :cond_have_ctx
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {v0, v1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_granted

    return-void

    :cond_granted
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_dir_ok

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_dir_ok

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_dir_ok
    new-instance v1, Ljava/io/File;

    const-string v2, "NTG_062_log.log"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v2, Ljava/io/BufferedWriter;

    new-instance v3, Ljava/io/FileWriter;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-direct {v2, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    sput-object v2, Lcom/spd/xhsntg/NtgLog;->sWriter:Ljava/io/BufferedWriter;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    sput-object v0, Lcom/spd/xhsntg/NtgLog;->sWriter:Ljava/io/BufferedWriter;

    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    const/4 v0, 0x2

    const-string v1, "V"

    invoke-static {v0, v1, p0, p1}, Lcom/spd/xhsntg/NtgLog;->log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    const/4 v0, 0x5

    const-string v1, "W"

    invoke-static {v0, v1, p0, p1}, Lcom/spd/xhsntg/NtgLog;->log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method
