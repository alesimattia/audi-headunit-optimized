.class Lcom/spd/view/LvdsTestView$4;
.super Ljava/lang/Object;
.source "LvdsTestView.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/spd/view/LvdsTestView;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/spd/view/LvdsTestView;


# direct methods
.method constructor <init>(Lcom/spd/view/LvdsTestView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/spd/view/LvdsTestView;

    .line 160
    iput-object p1, p0, Lcom/spd/view/LvdsTestView$4;->this$0:Lcom/spd/view/LvdsTestView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 4
    .param p1, "s"    # Landroid/text/Editable;

    .line 172
    const-string v0, "LvdsTestView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "afterTextChanged cont:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 175
    .local v0, "i":I
    const/16 v1, -0x64

    if-ge v0, v1, :cond_0

    .line 176
    iget-object v2, p0, Lcom/spd/view/LvdsTestView$4;->this$0:Lcom/spd/view/LvdsTestView;

    iget-object v3, p0, Lcom/spd/view/LvdsTestView$4;->this$0:Lcom/spd/view/LvdsTestView;

    invoke-static {v3}, Lcom/spd/view/LvdsTestView;->access$700(Lcom/spd/view/LvdsTestView;)Landroid/widget/EditText;

    move-result-object v3

    invoke-static {v2, v3, v1}, Lcom/spd/view/LvdsTestView;->access$100(Lcom/spd/view/LvdsTestView;Landroid/widget/EditText;I)V

    .line 177
    const/16 v0, -0x64

    goto :goto_0

    .line 178
    :cond_0
    const/16 v1, 0x64

    if-le v0, v1, :cond_1

    .line 179
    const/16 v0, 0x64

    .line 180
    iget-object v2, p0, Lcom/spd/view/LvdsTestView$4;->this$0:Lcom/spd/view/LvdsTestView;

    iget-object v3, p0, Lcom/spd/view/LvdsTestView$4;->this$0:Lcom/spd/view/LvdsTestView;

    invoke-static {v3}, Lcom/spd/view/LvdsTestView;->access$700(Lcom/spd/view/LvdsTestView;)Landroid/widget/EditText;

    move-result-object v3

    invoke-static {v2, v3, v1}, Lcom/spd/view/LvdsTestView;->access$100(Lcom/spd/view/LvdsTestView;Landroid/widget/EditText;I)V

    .line 182
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/spd/view/LvdsTestView$4;->this$0:Lcom/spd/view/LvdsTestView;

    invoke-static {v1, v0}, Lcom/spd/view/LvdsTestView;->access$800(Lcom/spd/view/LvdsTestView;I)V

    .line 183
    iget-object v1, p0, Lcom/spd/view/LvdsTestView$4;->this$0:Lcom/spd/view/LvdsTestView;

    invoke-static {v1}, Lcom/spd/view/LvdsTestView;->access$700(Lcom/spd/view/LvdsTestView;)Landroid/widget/EditText;

    move-result-object v1

    iget-object v2, p0, Lcom/spd/view/LvdsTestView$4;->this$0:Lcom/spd/view/LvdsTestView;

    invoke-static {v2}, Lcom/spd/view/LvdsTestView;->access$700(Lcom/spd/view/LvdsTestView;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 187
    .end local v0    # "i":I
    goto :goto_1

    .line 184
    :catch_0
    move-exception v0

    .line 185
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 186
    iget-object v1, p0, Lcom/spd/view/LvdsTestView$4;->this$0:Lcom/spd/view/LvdsTestView;

    iget-object v2, p0, Lcom/spd/view/LvdsTestView$4;->this$0:Lcom/spd/view/LvdsTestView;

    invoke-static {v2}, Lcom/spd/view/LvdsTestView;->access$700(Lcom/spd/view/LvdsTestView;)Landroid/widget/EditText;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/spd/view/LvdsTestView;->access$100(Lcom/spd/view/LvdsTestView;Landroid/widget/EditText;I)V

    .line 188
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :goto_1
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .line 164
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .line 168
    return-void
.end method
