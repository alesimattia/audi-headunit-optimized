.class public Lcom/spd/xhsntg/DvrPreviewSurfaceView;
.super Landroid/view/SurfaceView;
.source "DvrPreviewSurfaceView.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# static fields
.field public static final MODE_FOR_CLOSE:I = 0x0

.field public static final MODE_FOR_PLAY_BACK:I = 0x2

.field public static final MODE_FOR_RECORD:I = 0x1


# instance fields
.field private TAG:Ljava/lang/String;

.field public m_dvr_channel:I

.field public m_dvr_video_mode:I

.field private m_surface_holder:Landroid/view/SurfaceHolder;

.field private m_view_show_flag:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 21
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    const-string v0, "DVR_PLAYBACK"

    iput-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->TAG:Ljava/lang/String;

    .line 17
    const/4 v0, -0x1

    iput v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_channel:I

    .line 18
    iput v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_video_mode:I

    .line 103
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_view_show_flag:Z

    .line 22
    invoke-virtual {p0}, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v2

    invoke-interface {v2, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 23
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    sget-object v3, Lcom/spd/xhsntg/R$styleable;->DvrPreview:[I

    invoke-virtual {v2, p2, v3, v1, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 25
    .local v2, "array":Landroid/content/res/TypedArray;
    invoke-virtual {v2, v1, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_channel:I

    .line 26
    const/4 v0, 0x1

    invoke-virtual {v2, v0, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_video_mode:I

    .line 27
    iget-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " DvrPreviewSurfaceView m_dvr_channel:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_channel:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "\uff0cm_dvr_video_mode:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_video_mode:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    return-void
.end method

.method private checkDvrChannel(Z)V
    .locals 4
    .param p1, "c_check"    # Z

    .line 105
    iget-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " checkDvrChannel m_dvr_video_mode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_video_mode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",m_view_show_flag:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_view_show_flag:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ",c_check:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ",m_dvr_channel:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_channel:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",m_surface_holder:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_surface_holder:Landroid/view/SurfaceHolder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    iget v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_video_mode:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-ne v0, v3, :cond_2

    .line 109
    if-eqz p1, :cond_1

    .line 111
    iget-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_surface_holder:Landroid/view/SurfaceHolder;

    if-eqz v0, :cond_4

    .line 113
    iget-boolean v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_view_show_flag:Z

    if-nez v0, :cond_0

    .line 115
    const-string v0, "DVR_PLAYBACK"

    const-string v1, "checkDvrChannel  setPlaybackSurface ==0=="

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    invoke-static {}, Lcom/spd/xhsntg/DvrHelper;->get()Lcom/spd/xhsntg/DvrHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_surface_holder:Landroid/view/SurfaceHolder;

    invoke-interface {v1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/spd/xhsntg/DvrHelper;->setPlaybackSurface(Landroid/view/Surface;)V

    .line 117
    iput-boolean v2, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_view_show_flag:Z

    .line 119
    :cond_0
    const-string v0, "DVR_PLAYBACK"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkDvrChannel  DVR_PLAYSTATE_CMD ==1== "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_channel:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    invoke-static {}, Lcom/spd/xhsntg/DvrHelper;->get()Lcom/spd/xhsntg/DvrHelper;

    move-result-object v0

    const/16 v1, 0x3ec

    iget v3, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_channel:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/spd/xhsntg/DvrHelper;->dvrControlCmd(III)V

    goto/16 :goto_0

    .line 126
    :cond_1
    iget-boolean v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_view_show_flag:Z

    if-eqz v0, :cond_4

    .line 128
    iput-boolean v1, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_view_show_flag:Z

    .line 130
    invoke-static {}, Lcom/spd/xhsntg/DvrHelper;->get()Lcom/spd/xhsntg/DvrHelper;

    move-result-object v0

    const/16 v2, 0x3ef

    iget v3, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_channel:I

    invoke-virtual {v0, v2, v1, v3}, Lcom/spd/xhsntg/DvrHelper;->dvrControlCmd(III)V

    goto :goto_0

    .line 134
    :cond_2
    iget v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_video_mode:I

    if-ne v0, v2, :cond_4

    .line 136
    if-eqz p1, :cond_3

    .line 138
    iget-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_surface_holder:Landroid/view/SurfaceHolder;

    if-eqz v0, :cond_4

    .line 140
    iget-boolean v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_view_show_flag:Z

    if-nez v0, :cond_4

    .line 142
    iget-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkDvrChannel startPreviewByChannel: ==1=="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_surface_holder:Landroid/view/SurfaceHolder;

    invoke-interface {v3}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    invoke-static {}, Lcom/spd/xhsntg/DvrHelper;->get()Lcom/spd/xhsntg/DvrHelper;

    move-result-object v0

    iget v1, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_channel:I

    iget-object v3, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_surface_holder:Landroid/view/SurfaceHolder;

    invoke-interface {v3}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/spd/xhsntg/DvrHelper;->startPreviewByChannel(ILandroid/view/Surface;)V

    .line 144
    iput-boolean v2, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_view_show_flag:Z

    goto :goto_0

    .line 150
    :cond_3
    iget-boolean v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_view_show_flag:Z

    if-eqz v0, :cond_4

    .line 152
    iput-boolean v1, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_view_show_flag:Z

    .line 153
    iget-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkDvrChannel dvrControlCmd: DVR_PREVIEW_CMD m_dvr_channel:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_channel:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    invoke-static {}, Lcom/spd/xhsntg/DvrHelper;->get()Lcom/spd/xhsntg/DvrHelper;

    move-result-object v0

    const/16 v2, 0x3e9

    iget v3, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_channel:I

    invoke-virtual {v0, v2, v1, v3}, Lcom/spd/xhsntg/DvrHelper;->dvrControlCmd(III)V

    .line 158
    :cond_4
    :goto_0
    return-void
.end method


# virtual methods
.method public setDvrChannel(II)V
    .locals 5
    .param p1, "c_video_mode"    # I
    .param p2, "c_channel"    # I

    .line 35
    iget-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setDvrChannel c_video_mode:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",c_channel:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    iget v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_video_mode:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_channel:I

    if-eq v0, p2, :cond_3

    .line 38
    :cond_0
    iget v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_video_mode:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_1

    .line 40
    iget v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_video_mode:I

    if-eq v0, p1, :cond_2

    .line 42
    iget-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_surface_holder:Landroid/view/SurfaceHolder;

    if-eqz v0, :cond_2

    .line 44
    iget-boolean v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_view_show_flag:Z

    if-eqz v0, :cond_2

    .line 46
    iput-boolean v3, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_view_show_flag:Z

    .line 47
    iget-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->TAG:Ljava/lang/String;

    const-string v1, "setDvrChannel: dvrControlCmd ==0=="

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    invoke-static {}, Lcom/spd/xhsntg/DvrHelper;->get()Lcom/spd/xhsntg/DvrHelper;

    move-result-object v0

    const/16 v1, 0x3ef

    iget v4, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_channel:I

    invoke-virtual {v0, v1, v3, v4}, Lcom/spd/xhsntg/DvrHelper;->dvrControlCmd(III)V

    goto :goto_0

    .line 53
    :cond_1
    iget v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_video_mode:I

    if-ne v0, v2, :cond_2

    .line 55
    iget-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_surface_holder:Landroid/view/SurfaceHolder;

    if-eqz v0, :cond_2

    .line 57
    iget-boolean v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_view_show_flag:Z

    if-eqz v0, :cond_2

    .line 59
    iput-boolean v3, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_view_show_flag:Z

    .line 60
    iget-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->TAG:Ljava/lang/String;

    const-string v1, "setDvrChannel: dvrControlCmd ==1=="

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    invoke-static {}, Lcom/spd/xhsntg/DvrHelper;->get()Lcom/spd/xhsntg/DvrHelper;

    move-result-object v0

    const/16 v1, 0x3e9

    iget v4, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_channel:I

    invoke-virtual {v0, v1, v3, v4}, Lcom/spd/xhsntg/DvrHelper;->dvrControlCmd(III)V

    .line 65
    :cond_2
    :goto_0
    iput p1, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_video_mode:I

    .line 66
    iput p2, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_channel:I

    .line 67
    iget v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_dvr_video_mode:I

    if-lez v0, :cond_3

    .line 69
    invoke-direct {p0, v2}, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->checkDvrChannel(Z)V

    .line 73
    :cond_3
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 3
    .param p1, "surfaceHolder"    # Landroid/view/SurfaceHolder;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .line 91
    iget-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " surfaceChanged:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    iput-object p1, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_surface_holder:Landroid/view/SurfaceHolder;

    .line 93
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->checkDvrChannel(Z)V

    .line 94
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "surfaceHolder"    # Landroid/view/SurfaceHolder;

    .line 86
    iget-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->TAG:Ljava/lang/String;

    const-string v1, "surfaceCreated:"

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 3
    .param p1, "surfaceHolder"    # Landroid/view/SurfaceHolder;

    .line 98
    iget-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " surfaceDestroyed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/spd/xhsntg/NtgLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->m_surface_holder:Landroid/view/SurfaceHolder;

    .line 100
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/spd/xhsntg/DvrPreviewSurfaceView;->checkDvrChannel(Z)V

    .line 102
    return-void
.end method
