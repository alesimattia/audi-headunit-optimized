.class Lcom/spd/xhsntg/FullscreenActivity$1;
.super Ljava/lang/Object;
.source "FullscreenActivity.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/xhsntg/FullscreenActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/spd/xhsntg/FullscreenActivity;


# direct methods
.method constructor <init>(Lcom/spd/xhsntg/FullscreenActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/spd/xhsntg/FullscreenActivity;

    .line 423
    iput-object p1, p0, Lcom/spd/xhsntg/FullscreenActivity$1;->this$0:Lcom/spd/xhsntg/FullscreenActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "state"    # I

    .line 437
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .line 427
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2
    .param p1, "position"    # I

    # all'apertura della pagina debug (indice 2, shiftato dopo rimozione pagine porte+sensori) genera il dump one-shot dei parametri CarInfo
    const/4 v0, 0x2

    if-ne p1, v0, :cond_dump

    # Modifica Mattia Alesi (Voce 4): permesso storage ora richiesto all'avvio (vedi onCreate),
    # niente piu' richiesta pigra qui (S2b superata)
    invoke-static {}, Lcom/spd/xhsntg/DebugLog;->dumpAll()V

    :cond_dump
    # pagina Sistema (indice 3, shiftato): avvia il refresh periodico entrando, fermalo uscendo
    const/4 v0, 0x3

    if-ne p1, v0, :cond_sys_off

    invoke-static {}, Lcom/spd/xhsntg/SystemView;->start()V

    goto :goto_sys

    :cond_sys_off
    invoke-static {}, Lcom/spd/xhsntg/SystemView;->stop()V

    :goto_sys
    .line 431
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity$1;->this$0:Lcom/spd/xhsntg/FullscreenActivity;

    invoke-static {v0}, Lcom/spd/xhsntg/FullscreenActivity;->access$000(Lcom/spd/xhsntg/FullscreenActivity;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "page"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 432
    return-void
.end method
