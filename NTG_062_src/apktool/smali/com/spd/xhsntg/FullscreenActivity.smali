.class public Lcom/spd/xhsntg/FullscreenActivity;
.super Landroid/app/Activity;
.source "FullscreenActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;
.implements Lcom/spd/xhsntg/CarInfoManager$Callback;
.implements Lcom/spd/xhsntg/ReverseBroadcast$Callback;
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/spd/xhsntg/FullscreenActivity$H;
    }
.end annotation


# static fields
.field private static final HANDLE_LONG_CLICK:I = 0x3e8

.field private static final OFFSET_X:I = 0x50

.field private static final OFFSET_Y:I = 0x50

.field private static final TAG:Ljava/lang/String; = "FullscreenActivity"


# instance fields
.field private mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

.field private mDownX:I

.field private mDownY:I

.field private mHandler:Landroid/os/Handler;

.field private mHasMediaSource:I

.field private mIsAudioFocus:Z

.field private mMediaSource:I

.field private mOnPageChangeListener:Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

.field private mReverseReceiver:Landroid/content/BroadcastReceiver;

.field private mSharedPreferences:Landroid/content/SharedPreferences;

.field private mSpdManager:Lcom/spd/system/service/SpdManager;

.field private mSurfaceHeight:I

.field private mSurfaceWidth:I

.field private m_preview_layout_para:Landroid/widget/LinearLayout$LayoutParams;

.field private m_preview_surface_view:Lcom/spd/xhsntg/DvrPreviewSurfaceView;

.field private m_resume_flag:Z

.field private m_service_connect_flag:Z

.field private m_show_preview_mode:I

.field private m_view_page_adapter:Lcom/spd/view/MyViewPageAdapter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 42
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 109
    const/4 v0, 0x0

    iput v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_show_preview_mode:I

    .line 125
    iput v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSurfaceWidth:I

    .line 126
    iput v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSurfaceHeight:I

    .line 227
    iput-boolean v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_resume_flag:Z

    .line 308
    iput-boolean v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_service_connect_flag:Z

    .line 423
    new-instance v0, Lcom/spd/xhsntg/FullscreenActivity$1;

    invoke-direct {v0, p0}, Lcom/spd/xhsntg/FullscreenActivity$1;-><init>(Lcom/spd/xhsntg/FullscreenActivity;)V

    iput-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mOnPageChangeListener:Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

    .line 440
    new-instance v0, Lcom/spd/xhsntg/FullscreenActivity$2;

    invoke-direct {v0, p0}, Lcom/spd/xhsntg/FullscreenActivity$2;-><init>(Lcom/spd/xhsntg/FullscreenActivity;)V

    iput-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mReverseReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/spd/xhsntg/FullscreenActivity;)Landroid/content/SharedPreferences;
    .locals 1
    .param p0, "x0"    # Lcom/spd/xhsntg/FullscreenActivity;

    .line 42
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->getPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method private canRequestAudioFocus()Z
    .locals 3

    .line 377
    const-string v0, "FullscreenActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "canRequestAudioFocus:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/spd/xhsntg/FullscreenActivity;->mMediaSource:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 378
    iget v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mMediaSource:I

    const/4 v1, 0x7

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private checkPreviewMode()V
    .locals 4

    .line 212
    invoke-virtual {p0}, Lcom/spd/xhsntg/FullscreenActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "SETTING_NTG_FULL_SCREEN"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 213
    .local v0, "fullScreen":I
    const-string v1, "FullscreenActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkPreviewMode:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_show_preview_mode:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ",fullScreen:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    iget v1, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_show_preview_mode:I

    const/4 v2, -0x1

    const/4 v3, 0x1

    if-ne v1, v3, :cond_0

    .line 215
    iget-object v1, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_layout_para:Landroid/widget/LinearLayout$LayoutParams;

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 216
    iget-object v1, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_layout_para:Landroid/widget/LinearLayout$LayoutParams;

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 217
    iget-object v1, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_surface_view:Lcom/spd/xhsntg/DvrPreviewSurfaceView;

    invoke-virtual {v1}, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->requestLayout()V

    goto :goto_0

    .line 219
    :cond_0
    iget v1, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_show_preview_mode:I

    if-nez v1, :cond_1

    .line 220
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->getPreviewViewWidth()I

    move-result v1

    .line 221
    .local v1, "width":I
    iget-object v3, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_layout_para:Landroid/widget/LinearLayout$LayoutParams;

    iput v1, v3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 222
    iget-object v3, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_layout_para:Landroid/widget/LinearLayout$LayoutParams;

    iput v2, v3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 223
    iget-object v2, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_surface_view:Lcom/spd/xhsntg/DvrPreviewSurfaceView;

    invoke-virtual {v2}, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->requestLayout()V

    .line 226
    .end local v1    # "width":I
    :cond_1
    :goto_0
    return-void
.end method

.method private checkPreviewShow()V
    .locals 3

    .line 301
    const-string v0, "FullscreenActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "checkPreviewShow m_resume_flag:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_resume_flag:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ",m_service_connect_flag:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_service_connect_flag:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ",this:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    iget-boolean v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_resume_flag:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_service_connect_flag:Z

    if-eqz v0, :cond_0

    .line 304
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_surface_view:Lcom/spd/xhsntg/DvrPreviewSurfaceView;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->setDvrChannel(II)V

    .line 306
    :cond_0
    return-void
.end method

.method private getPreferences()Landroid/content/SharedPreferences;
    .locals 2

    .line 416
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSharedPreferences:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    .line 417
    const-string v0, "save"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/spd/xhsntg/FullscreenActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSharedPreferences:Landroid/content/SharedPreferences;

    .line 420
    :cond_0
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSharedPreferences:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method private getPreviewViewWidth()I
    .locals 7

    .line 192
    const/16 v0, 0x500

    .line 193
    .local v0, "width":I
    invoke-virtual {p0}, Lcom/spd/xhsntg/FullscreenActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 194
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 195
    .local v2, "w":I
    iget v3, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 196
    .local v3, "h":I
    const/16 v4, 0x1e0

    const/16 v5, 0x500

    if-ne v2, v5, :cond_0

    if-ne v3, v4, :cond_0

    .line 197
    const/16 v0, 0x320

    goto :goto_0

    .line 198
    :cond_0
    const/16 v5, 0x780

    const/16 v6, 0x2d0

    if-ne v2, v5, :cond_1

    if-ne v3, v6, :cond_1

    .line 199
    const/16 v0, 0x500

    goto :goto_0

    .line 200
    :cond_1
    const/16 v5, 0x320

    if-ne v2, v5, :cond_2

    if-ne v3, v4, :cond_2

    .line 201
    const/4 v0, -0x1

    .line 202
    const v4, 0x7f050038

    invoke-virtual {p0, v4}, Lcom/spd/xhsntg/FullscreenActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 203
    :cond_2
    const/16 v4, 0x400

    if-ne v2, v4, :cond_3

    const/16 v4, 0x258

    if-ne v3, v4, :cond_3

    .line 204
    const/16 v0, 0x400

    goto :goto_0

    .line 205
    :cond_3
    const/16 v4, 0x640

    if-ne v2, v4, :cond_4

    if-ne v3, v6, :cond_4

    .line 206
    const/16 v0, 0x4b0

    .line 208
    :cond_4
    :goto_0
    return v0
.end method

.method private getReverseState(Landroid/content/Intent;)I
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;

    .line 250
    const/4 v0, 0x0

    .line 251
    .local v0, "reverse":I
    if-eqz p1, :cond_0

    .line 252
    const-string v1, "reverse"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 254
    :cond_0
    const-string v1, "FullscreenActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getReverseState:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    return v0
.end method

.method private getSpdManager()Lcom/spd/system/service/SpdManager;
    .locals 2

    .line 266
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSpdManager:Lcom/spd/system/service/SpdManager;

    if-nez v0, :cond_0

    .line 267
    new-instance v0, Lcom/spd/system/service/SpdManager;

    invoke-virtual {p0}, Lcom/spd/xhsntg/FullscreenActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/spd/system/service/SpdManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSpdManager:Lcom/spd/system/service/SpdManager;

    .line 269
    :cond_0
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSpdManager:Lcom/spd/system/service/SpdManager;

    return-object v0
.end method

.method private releaseAudioFocus()V
    .locals 3

    .line 393
    const-string v0, "FullscreenActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "releaseAudioFocus:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/spd/xhsntg/FullscreenActivity;->mIsAudioFocus:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 394
    iget-boolean v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mIsAudioFocus:Z

    if-nez v0, :cond_0

    .line 395
    return-void

    .line 397
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mIsAudioFocus:Z

    .line 398
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->getSpdManager()Lcom/spd/system/service/SpdManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/spd/xhsntg/FullscreenActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Lcom/spd/system/service/SpdManager;->releaseAudioFocus(Ljava/lang/String;I)V

    .line 399
    return-void
.end method

.method private requestAudioFocus()V
    .locals 4

    .line 382
    const-string v0, "FullscreenActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "requestAudioFocus:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/spd/xhsntg/FullscreenActivity;->mIsAudioFocus:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    iget-boolean v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mIsAudioFocus:Z

    if-eqz v0, :cond_0

    .line 384
    return-void

    .line 386
    :cond_0
    invoke-static {}, Lcom/spd/xhsntg/ReverseBroadcast;->isReverse()I

    move-result v0

    if-nez v0, :cond_1

    .line 387
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mIsAudioFocus:Z

    .line 388
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->getSpdManager()Lcom/spd/system/service/SpdManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/spd/xhsntg/FullscreenActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    const/16 v3, 0x10

    invoke-virtual {v0, v1, v2, v3}, Lcom/spd/system/service/SpdManager;->requestAudioFocus(Ljava/lang/String;II)V

    .line 390
    :cond_1
    return-void
.end method

.method private setAudioMode()V
    .locals 3

    .line 402
    const-string v0, "FullscreenActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setAudioMode m_resume_flag:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_resume_flag:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ",mCarInfoManager:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/spd/xhsntg/FullscreenActivity;->mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 403
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

    if-nez v0, :cond_0

    .line 404
    return-void

    .line 406
    :cond_0
    iget-boolean v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_resume_flag:Z

    if-eqz v0, :cond_1

    .line 407
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/spd/xhsntg/CarInfoManager;->setAudioMode(I)V

    goto :goto_0

    .line 409
    :cond_1
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/spd/xhsntg/CarInfoManager;->setAudioMode(I)V

    .line 411
    :goto_0
    return-void
.end method

.method private startHome()V
    .locals 3

    .line 184
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 185
    .local v0, "mHomeIntent":Landroid/content/Intent;
    const-string v1, "android.intent.category.HOME"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 186
    const/high16 v1, 0x10200000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 188
    invoke-virtual {p0, v0}, Lcom/spd/xhsntg/FullscreenActivity;->startActivity(Landroid/content/Intent;)V

    .line 189
    return-void
.end method

.method private supportDebugLvds()Z
    .locals 3

    .line 180
    invoke-virtual {p0}, Lcom/spd/xhsntg/FullscreenActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "SETTING_DEVELOPER_MODE"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1
.end method

.method private supportScreenTouch()Z
    .locals 1

    .line 176
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 113
    const-string v0, "FullscreenActivity"

    const-string v1, "onClick"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->supportScreenTouch()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    return-void

    .line 120
    :cond_0
    invoke-static {}, Lcom/spd/xhsntg/ReverseBroadcast;->isReverse()I

    move-result v0

    if-nez v0, :cond_1

    .line 121
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->startHome()V

    .line 123
    :cond_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 56
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    # richiesta permesso scrittura storage (per il log diagnostico in Download)
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/spd/xhsntg/FullscreenActivity;->requestPermissions([Ljava/lang/String;I)V

    .line 57
    const/high16 v0, 0x7f070000

    invoke-virtual {p0, v0}, Lcom/spd/xhsntg/FullscreenActivity;->setContentView(I)V

    .line 58
    new-instance v0, Lcom/spd/xhsntg/FullscreenActivity$H;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/spd/xhsntg/FullscreenActivity$H;-><init>(Lcom/spd/xhsntg/FullscreenActivity;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mHandler:Landroid/os/Handler;

    .line 59
    invoke-static {}, Lcom/spd/xhsntg/DvrHelper;->get()Lcom/spd/xhsntg/DvrHelper;

    move-result-object v0

    invoke-virtual {p0}, Lcom/spd/xhsntg/FullscreenActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/spd/xhsntg/DvrHelper;->initDvrHelper(Landroid/content/Context;)V

    .line 60
    new-instance v0, Lcom/spd/xhsntg/CarInfoManager;

    invoke-direct {v0}, Lcom/spd/xhsntg/CarInfoManager;-><init>()V

    iput-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

    .line 61
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

    invoke-virtual {v0, p0}, Lcom/spd/xhsntg/CarInfoManager;->init(Landroid/content/Context;)V

    .line 62
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

    invoke-virtual {v0, p0}, Lcom/spd/xhsntg/CarInfoManager;->setCallback(Lcom/spd/xhsntg/CarInfoManager$Callback;)V

    .line 69
    const v0, 0x7f050032

    invoke-virtual {p0, v0}, Lcom/spd/xhsntg/FullscreenActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;

    iput-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_surface_view:Lcom/spd/xhsntg/DvrPreviewSurfaceView;

    .line 70
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_surface_view:Lcom/spd/xhsntg/DvrPreviewSurfaceView;

    invoke-virtual {v0, p0}, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_surface_view:Lcom/spd/xhsntg/DvrPreviewSurfaceView;

    invoke-virtual {v0, p0}, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 72
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_surface_view:Lcom/spd/xhsntg/DvrPreviewSurfaceView;

    invoke-virtual {v0}, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 73
    .local v0, "c_old_para":Ljava/lang/Object;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v1, :cond_0

    .line 74
    move-object v1, v0

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    iput-object v1, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_layout_para:Landroid/widget/LinearLayout$LayoutParams;

    goto :goto_0

    .line 76
    :cond_0
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput-object v1, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_layout_para:Landroid/widget/LinearLayout$LayoutParams;

    .line 77
    iget-object v1, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_surface_view:Lcom/spd/xhsntg/DvrPreviewSurfaceView;

    iget-object v2, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_layout_para:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v1, v2}, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    :goto_0
    invoke-virtual {p0}, Lcom/spd/xhsntg/FullscreenActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 80
    .local v1, "cv":Landroid/content/ContentResolver;
    const-string v2, "SETTING_NTG_FULL_SCREEN"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_show_preview_mode:I

    .line 81
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->checkPreviewMode()V

    .line 82
    new-instance v2, Lcom/spd/view/MyViewPageAdapter;

    invoke-direct {v2, p0}, Lcom/spd/view/MyViewPageAdapter;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_view_page_adapter:Lcom/spd/view/MyViewPageAdapter;

    .line 83
    iget-object v2, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_view_page_adapter:Lcom/spd/view/MyViewPageAdapter;

    iget-object v4, p0, Lcom/spd/xhsntg/FullscreenActivity;->mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

    invoke-virtual {v2, v4}, Lcom/spd/view/MyViewPageAdapter;->setCarInfoManager(Lcom/spd/xhsntg/CarInfoManager;)V

    .line 84
    const v2, 0x7f050038

    invoke-virtual {p0, v2}, Lcom/spd/xhsntg/FullscreenActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/viewpager/widget/ViewPager;

    .line 85
    .local v2, "c_view_pager":Landroidx/viewpager/widget/ViewPager;
    iget-object v4, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_view_page_adapter:Lcom/spd/view/MyViewPageAdapter;

    invoke-virtual {v2, v4}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 86
    iget-object v4, p0, Lcom/spd/xhsntg/FullscreenActivity;->mOnPageChangeListener:Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

    invoke-virtual {v2, v4}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;)V

    .line 87
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->getPreferences()Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "page"

    invoke-interface {v4, v5, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 88
    .local v3, "page":I
    invoke-virtual {v2, v3}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 90
    invoke-static {p0}, Lcom/spd/xhsntg/ReverseBroadcast;->addCallback(Lcom/spd/xhsntg/ReverseBroadcast$Callback;)V

    .line 91
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 95
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 96
    const-string v0, "FullscreenActivity"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 99
    iput-object v1, p0, Lcom/spd/xhsntg/FullscreenActivity;->mHandler:Landroid/os/Handler;

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

    if-eqz v0, :cond_1

    .line 102
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

    invoke-virtual {v0, v1}, Lcom/spd/xhsntg/CarInfoManager;->setCallback(Lcom/spd/xhsntg/CarInfoManager$Callback;)V

    .line 103
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

    invoke-virtual {v0}, Lcom/spd/xhsntg/CarInfoManager;->unInit()V

    .line 104
    iput-object v1, p0, Lcom/spd/xhsntg/FullscreenActivity;->mCarInfoManager:Lcom/spd/xhsntg/CarInfoManager;

    .line 106
    :cond_1
    invoke-static {p0}, Lcom/spd/xhsntg/ReverseBroadcast;->removeCallback(Lcom/spd/xhsntg/ReverseBroadcast$Callback;)V

    .line 107
    return-void
.end method

.method public onDvrStateChanged(II)V
    .locals 0
    .param p1, "msg"    # I
    .param p2, "args"    # I

    .line 323
    return-void
.end method

.method public onFileInfoChanged(II)V
    .locals 0
    .param p1, "type"    # I
    .param p2, "count"    # I

    .line 328
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .line 260
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 261
    const-string v0, "FullscreenActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onNewIntent"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 274
    const-string v0, "FullscreenActivity"

    const-string v1, "onPause"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/spd/xhsntg/ReverseBroadcast;->setTopActivity(Z)V

    .line 276
    iput-boolean v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_resume_flag:Z

    .line 277
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->setAudioMode()V

    .line 278
    iget-object v1, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_surface_view:Lcom/spd/xhsntg/DvrPreviewSurfaceView;

    invoke-virtual {v1, v0, v0}, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->setDvrChannel(II)V

    .line 279
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 280
    return-void
.end method

.method protected onResume()V
    .locals 3

    .line 230
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 231
    const-string v0, "FullscreenActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onResume:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/spd/xhsntg/FullscreenActivity;->mHasMediaSource:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/spd/xhsntg/ReverseBroadcast;->setTopActivity(Z)V

    .line 233
    iput-boolean v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_resume_flag:Z

    .line 234
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->setAudioMode()V

    .line 235
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->checkPreviewShow()V

    .line 236
    iget v1, p0, Lcom/spd/xhsntg/FullscreenActivity;->mHasMediaSource:I

    if-ne v1, v0, :cond_0

    .line 237
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->canRequestAudioFocus()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 238
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->requestAudioFocus()V

    goto :goto_0

    .line 241
    :cond_0
    iget v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mMediaSource:I

    const/16 v1, 0x10

    if-eq v0, v1, :cond_1

    .line 242
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->requestAudioFocus()V

    .line 246
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->getSpdManager()Lcom/spd/system/service/SpdManager;

    move-result-object v0

    const-string v1, "com.spd.xhsntg|com.spd.ntg.ACTION"

    invoke-virtual {v0, v1}, Lcom/spd/system/service/SpdManager;->enterSource(Ljava/lang/String;)V

    .line 247
    return-void
.end method

.method public onReverseState(IZ)V
    .locals 3
    .param p1, "reverse"    # I
    .param p2, "needExit"    # Z

    .line 449
    const-string v0, "FullscreenActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onReverseState:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",needExit:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 450
    if-eqz p2, :cond_0

    .line 451
    invoke-virtual {p0}, Lcom/spd/xhsntg/FullscreenActivity;->finish()V

    .line 453
    :cond_0
    return-void
.end method

.method public onServiceConnected()V
    .locals 1

    .line 311
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_service_connect_flag:Z

    .line 312
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->checkPreviewShow()V

    .line 313
    return-void
.end method

.method public onServiceDisconnected()V
    .locals 1

    .line 317
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_service_connect_flag:Z

    .line 318
    return-void
.end method

.method protected onStart()V
    .locals 2

    .line 284
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 285
    const-string v0, "FullscreenActivity"

    const-string v1, "onStart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    invoke-static {}, Lcom/spd/xhsntg/DvrHelper;->get()Lcom/spd/xhsntg/DvrHelper;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/spd/xhsntg/DvrHelper;->regsiterCallBack(Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;)Z

    .line 287
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_view_page_adapter:Lcom/spd/view/MyViewPageAdapter;

    invoke-virtual {v0}, Lcom/spd/view/MyViewPageAdapter;->initManager()V

    .line 288
    return-void
.end method

.method protected onStop()V
    .locals 2

    .line 292
    const-string v0, "FullscreenActivity"

    const-string v1, "onStop"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_view_page_adapter:Lcom/spd/view/MyViewPageAdapter;

    invoke-virtual {v0}, Lcom/spd/view/MyViewPageAdapter;->uninitManager()V

    .line 294
    invoke-static {}, Lcom/spd/xhsntg/DvrHelper;->get()Lcom/spd/xhsntg/DvrHelper;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/spd/xhsntg/DvrHelper;->unregsiterCallBack(Lcom/spd/xhsntg/DvrHelper$DvrHelperCallBack;)Z

    .line 295
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_service_connect_flag:Z

    .line 296
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 297
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .line 133
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->supportScreenTouch()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    .line 134
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    .line 135
    .local v0, "x":I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    .line 136
    .local v2, "y":I
    iget v3, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSurfaceWidth:I

    if-eqz v3, :cond_0

    iget v3, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSurfaceHeight:I

    if-nez v3, :cond_1

    .line 137
    :cond_0
    iget-object v3, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_surface_view:Lcom/spd/xhsntg/DvrPreviewSurfaceView;

    invoke-virtual {v3}, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->getWidth()I

    move-result v3

    iput v3, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSurfaceWidth:I

    .line 138
    iget-object v3, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_preview_surface_view:Lcom/spd/xhsntg/DvrPreviewSurfaceView;

    invoke-virtual {v3}, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->getHeight()I

    move-result v3

    iput v3, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSurfaceHeight:I

    .line 140
    :cond_1
    iget v3, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSurfaceWidth:I

    if-eqz v3, :cond_3

    iget v3, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSurfaceHeight:I

    if-nez v3, :cond_2

    goto :goto_0

    .line 143
    :cond_2
    mul-int/lit16 v3, v0, 0x500

    iget v4, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSurfaceWidth:I

    div-int/2addr v3, v4

    .line 144
    .end local v0    # "x":I
    .local v3, "x":I
    mul-int/lit16 v0, v2, 0x1e0

    iget v4, p0, Lcom/spd/xhsntg/FullscreenActivity;->mSurfaceHeight:I

    div-int/2addr v0, v4

    .end local v2    # "y":I
    .end local v3    # "x":I
    goto :goto_1

    .line 141
    .restart local v0    # "x":I
    .restart local v2    # "y":I
    :cond_3
    :goto_0
    return v1

    .line 147
    .end local v0    # "x":I
    .end local v2    # "y":I
    :cond_4
    :goto_1
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->supportDebugLvds()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 148
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 150
    .local v0, "action":I
    const/16 v2, 0x3e8

    if-nez v0, :cond_5

    .line 151
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v3, v3

    iput v3, p0, Lcom/spd/xhsntg/FullscreenActivity;->mDownX:I

    .line 152
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v3, v3

    iput v3, p0, Lcom/spd/xhsntg/FullscreenActivity;->mDownY:I

    .line 153
    iget-object v3, p0, Lcom/spd/xhsntg/FullscreenActivity;->mHandler:Landroid/os/Handler;

    const-wide/16 v4, 0x1388

    invoke-virtual {v3, v2, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_3

    .line 154
    :cond_5
    const/4 v3, 0x1

    if-eq v0, v3, :cond_8

    const/4 v4, 0x3

    if-ne v0, v4, :cond_6

    goto :goto_2

    .line 160
    :cond_6
    const/4 v3, 0x2

    if-ne v0, v3, :cond_a

    .line 161
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v3, v3

    .line 162
    .restart local v3    # "x":I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v4, v4

    .line 163
    .local v4, "y":I
    iget v5, p0, Lcom/spd/xhsntg/FullscreenActivity;->mDownX:I

    sub-int v5, v3, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    .line 164
    .local v5, "dx":I
    iget v6, p0, Lcom/spd/xhsntg/FullscreenActivity;->mDownY:I

    sub-int v6, v4, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    .line 165
    .local v6, "dy":I
    const/16 v7, 0x50

    if-gt v5, v7, :cond_7

    if-le v6, v7, :cond_a

    .line 166
    :cond_7
    iget-object v7, p0, Lcom/spd/xhsntg/FullscreenActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v7, v2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 167
    iget-object v7, p0, Lcom/spd/xhsntg/FullscreenActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v7, v2}, Landroid/os/Handler;->removeMessages(I)V

    .end local v0    # "action":I
    .end local v3    # "x":I
    .end local v4    # "y":I
    .end local v5    # "dx":I
    .end local v6    # "dy":I
    goto :goto_3

    .line 155
    .restart local v0    # "action":I
    :cond_8
    :goto_2
    iget-object v4, p0, Lcom/spd/xhsntg/FullscreenActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v4, v2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 156
    iget-object v3, p0, Lcom/spd/xhsntg/FullscreenActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v2}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_3

    .line 158
    :cond_9
    return v3

    .line 172
    .end local v0    # "action":I
    :cond_a
    :goto_3
    return v1
.end method

.method public onUpdateConnected(Z)V
    .locals 0
    .param p1, "connected"    # Z

    .line 332
    if-eqz p1, :cond_0

    .line 333
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->setAudioMode()V

    .line 335
    :cond_0
    return-void
.end method

.method public onUpdateDoors(ZZZZZZ)V
    .locals 7
    .param p1, "hood"    # Z
    .param p2, "trunk"    # Z
    .param p3, "frontLeft"    # Z
    .param p4, "frontRight"    # Z
    .param p5, "rearLeft"    # Z
    .param p6, "rearRight"    # Z

    .line 339
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_view_page_adapter:Lcom/spd/view/MyViewPageAdapter;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/spd/view/MyViewPageAdapter;->updateDoors(ZZZZZZ)V

    .line 340
    return-void
.end method

.method public onUpdateMediaSource(II)V
    .locals 3
    .param p1, "source"    # I
    .param p2, "hasSource"    # I

    .line 359
    const-string v0, "FullscreenActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onUpdateMediaSource:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",hasSource:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    iput p1, p0, Lcom/spd/xhsntg/FullscreenActivity;->mMediaSource:I

    .line 362
    iput p2, p0, Lcom/spd/xhsntg/FullscreenActivity;->mHasMediaSource:I

    .line 363
    iget v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mHasMediaSource:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 364
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->canRequestAudioFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 365
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->requestAudioFocus()V

    goto :goto_0

    .line 367
    :cond_0
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->releaseAudioFocus()V

    goto :goto_0

    .line 370
    :cond_1
    iget-boolean v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_resume_flag:Z

    if-nez v0, :cond_2

    iget v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->mMediaSource:I

    const/16 v1, 0x10

    if-eq v0, v1, :cond_2

    .line 371
    invoke-direct {p0}, Lcom/spd/xhsntg/FullscreenActivity;->releaseAudioFocus()V

    .line 374
    :cond_2
    :goto_0
    return-void
.end method

.method public onUpdateSpeed(FI)V
    .locals 1
    .param p1, "speed"    # F
    .param p2, "unit"    # I

    .line 349
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_view_page_adapter:Lcom/spd/view/MyViewPageAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/spd/view/MyViewPageAdapter;->updateSpeed(FI)V

    .line 350
    return-void
.end method

.method public onUpdateTotalMileage(II)V
    .locals 1
    .param p1, "mileage"    # I
    .param p2, "unit"    # I

    .line 354
    iget-object v0, p0, Lcom/spd/xhsntg/FullscreenActivity;->m_view_page_adapter:Lcom/spd/view/MyViewPageAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/spd/view/MyViewPageAdapter;->updateMileage(II)V

    .line 355
    return-void
.end method

.method public updateCarModel(I)V
    .locals 0
    .param p1, "o"    # I

    .line 345
    return-void
.end method
