.class public Lcom/spd/xhsntg/DebugLog;
.super Ljava/lang/Object;
.source "DebugLog.java"


# static fields
.field private static sBuf:Ljava/lang/StringBuilder;

.field private static sFile:Ljava/io/File;

.field private static sScroll:Landroid/widget/ScrollView;

.field private static sText:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sput-object v0, Lcom/spd/xhsntg/DebugLog;->sBuf:Ljava/lang/StringBuilder;

    return-void
.end method

.method public static add(ILjava/lang/Object;I)V
    .locals 4
    .param p0, "what"    # I
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "unit"    # I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "what="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " val="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " unit="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .local v0, "line":Ljava/lang/String;
    sget-object v1, Lcom/spd/xhsntg/DebugLog;->sBuf:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/spd/xhsntg/DebugLog;->sBuf:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    const v2, 0x4e20

    if-le v1, v2, :cond_0

    sget-object v1, Lcom/spd/xhsntg/DebugLog;->sBuf:Ljava/lang/StringBuilder;

    sget-object v2, Lcom/spd/xhsntg/DebugLog;->sBuf:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    const v3, 0x3a98

    sub-int/2addr v2, v3

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    :cond_0
    invoke-static {v0}, Lcom/spd/xhsntg/DebugLog;->writeFile(Ljava/lang/String;)V

    sget-object v1, Lcom/spd/xhsntg/DebugLog;->sText:Landroid/widget/TextView;

    if-eqz v1, :cond_1

    sget-object v2, Lcom/spd/xhsntg/DebugLog;->sBuf:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget-object v1, Lcom/spd/xhsntg/DebugLog;->sScroll:Landroid/widget/ScrollView;

    if-eqz v1, :cond_1

    const/16 v2, 0x82

    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->fullScroll(I)Z

    :cond_1
    return-void
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v2, 0x10

    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    sget-object v2, Lcom/spd/xhsntg/DebugLog;->sBuf:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    sput-object v1, Lcom/spd/xhsntg/DebugLog;->sText:Landroid/widget/TextView;

    sput-object v0, Lcom/spd/xhsntg/DebugLog;->sScroll:Landroid/widget/ScrollView;

    return-object v0
.end method

.method private static writeFile(Ljava/lang/String;)V
    .locals 4
    .param p0, "line"    # Ljava/lang/String;

    :try_start_0
    sget-object v0, Lcom/spd/xhsntg/DebugLog;->sFile:Ljava/io/File;

    if-nez v0, :cond_1

    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_0
    new-instance v1, Ljava/io/File;

    const-string v2, "ntg_carinfo_log.txt"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v1, Lcom/spd/xhsntg/DebugLog;->sFile:Ljava/io/File;

    :cond_1
    new-instance v0, Ljava/io/FileWriter;

    sget-object v1, Lcom/spd/xhsntg/DebugLog;->sFile:Ljava/io/File;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-virtual {v0, p0}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method
