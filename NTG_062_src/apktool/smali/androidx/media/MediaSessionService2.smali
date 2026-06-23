.class public abstract Landroidx/media/MediaSessionService2;
.super Landroid/app/Service;
.source "MediaSessionService2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/MediaSessionService2$MyBrowserService;,
        Landroidx/media/MediaSessionService2$MediaNotification;
    }
.end annotation


# static fields
.field public static final SERVICE_INTERFACE:Ljava/lang/String; = "android.media.MediaSessionService2"

.field public static final SERVICE_META_DATA:Ljava/lang/String; = "android.media.session"

.field static final sDefaultBrowserRoot:Landroidx/media/MediaBrowserServiceCompat$BrowserRoot;


# instance fields
.field private final mBrowserServiceCompat:Landroidx/media/MediaBrowserServiceCompat;

.field private mIsRunningForeground:Z
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field private mNotificationManager:Landroid/app/NotificationManager;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mSession:Landroidx/media/MediaSession2;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mStartSelfIntent:Landroid/content/Intent;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 129
    new-instance v0, Landroidx/media/MediaBrowserServiceCompat$BrowserRoot;

    const-string v1, "android.media.MediaSessionService2"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroidx/media/MediaBrowserServiceCompat$BrowserRoot;-><init>(Ljava/lang/String;Landroid/os/Bundle;)V

    sput-object v0, Landroidx/media/MediaSessionService2;->sDefaultBrowserRoot:Landroidx/media/MediaBrowserServiceCompat$BrowserRoot;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 144
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 133
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/media/MediaSessionService2;->mLock:Ljava/lang/Object;

    .line 145
    invoke-virtual {p0}, Landroidx/media/MediaSessionService2;->createBrowserServiceCompat()Landroidx/media/MediaBrowserServiceCompat;

    move-result-object v0

    iput-object v0, p0, Landroidx/media/MediaSessionService2;->mBrowserServiceCompat:Landroidx/media/MediaBrowserServiceCompat;

    .line 146
    return-void
.end method


# virtual methods
.method createBrowserServiceCompat()Landroidx/media/MediaBrowserServiceCompat;
    .locals 2

    .line 149
    new-instance v0, Landroidx/media/MediaSessionService2$MyBrowserService;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/media/MediaSessionService2$MyBrowserService;-><init>(Landroidx/media/MediaSessionService2$1;)V

    return-object v0
.end method

.method getServiceCompat()Landroidx/media/MediaBrowserServiceCompat;
    .locals 1

    .line 259
    iget-object v0, p0, Landroidx/media/MediaSessionService2;->mBrowserServiceCompat:Landroidx/media/MediaBrowserServiceCompat;

    return-object v0
.end method

.method public final getSession()Landroidx/media/MediaSession2;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 227
    iget-object v0, p0, Landroidx/media/MediaSessionService2;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 228
    :try_start_0
    iget-object v1, p0, Landroidx/media/MediaSessionService2;->mSession:Landroidx/media/MediaSession2;

    monitor-exit v0

    return-object v1

    .line 229
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method getSessionType()I
    .locals 1

    .line 184
    const/4 v0, 0x1

    return v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 248
    const-string v0, "android.media.MediaSessionService2"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "android.media.browse.MediaBrowserService"

    .line 249
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 255
    :cond_0
    const/4 v0, 0x0

    return-object v0

    .line 251
    :cond_1
    :goto_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 252
    .local v0, "browserServiceIntent":Landroid/content/Intent;
    const-string v1, "android.media.MediaSessionService2"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 253
    iget-object v1, p0, Landroidx/media/MediaSessionService2;->mBrowserServiceCompat:Landroidx/media/MediaBrowserServiceCompat;

    invoke-virtual {v1, p1}, Landroidx/media/MediaBrowserServiceCompat;->onBind(Landroid/content/Intent;)Landroid/os/IBinder;

    move-result-object v1

    return-object v1
.end method

.method public onCreate()V
    .locals 6
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 161
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 162
    iget-object v0, p0, Landroidx/media/MediaSessionService2;->mBrowserServiceCompat:Landroidx/media/MediaBrowserServiceCompat;

    invoke-virtual {v0, p0}, Landroidx/media/MediaBrowserServiceCompat;->attachToBaseContext(Landroid/content/Context;)V

    .line 163
    iget-object v0, p0, Landroidx/media/MediaSessionService2;->mBrowserServiceCompat:Landroidx/media/MediaBrowserServiceCompat;

    invoke-virtual {v0}, Landroidx/media/MediaBrowserServiceCompat;->onCreate()V

    .line 164
    new-instance v0, Landroidx/media/SessionToken2;

    new-instance v1, Landroid/content/ComponentName;

    .line 165
    invoke-virtual {p0}, Landroidx/media/MediaSessionService2;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, p0, v1}, Landroidx/media/SessionToken2;-><init>(Landroid/content/Context;Landroid/content/ComponentName;)V

    .line 166
    .local v0, "token":Landroidx/media/SessionToken2;
    invoke-virtual {v0}, Landroidx/media/SessionToken2;->getType()I

    move-result v1

    invoke-virtual {p0}, Landroidx/media/MediaSessionService2;->getSessionType()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 170
    invoke-virtual {v0}, Landroidx/media/SessionToken2;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroidx/media/MediaSessionService2;->onCreateSession(Ljava/lang/String;)Landroidx/media/MediaSession2;

    move-result-object v1

    .line 171
    .local v1, "session":Landroidx/media/MediaSession2;
    iget-object v2, p0, Landroidx/media/MediaSessionService2;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 172
    :try_start_0
    const-string v3, "notification"

    invoke-virtual {p0, v3}, Landroidx/media/MediaSessionService2;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    iput-object v3, p0, Landroidx/media/MediaSessionService2;->mNotificationManager:Landroid/app/NotificationManager;

    .line 173
    new-instance v3, Landroid/content/Intent;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v3, p0, Landroidx/media/MediaSessionService2;->mStartSelfIntent:Landroid/content/Intent;

    .line 174
    iput-object v1, p0, Landroidx/media/MediaSessionService2;->mSession:Landroidx/media/MediaSession2;

    .line 175
    iget-object v3, p0, Landroidx/media/MediaSessionService2;->mSession:Landroidx/media/MediaSession2;

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Landroidx/media/SessionToken2;->getId()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Landroidx/media/MediaSessionService2;->mSession:Landroidx/media/MediaSession2;

    invoke-virtual {v4}, Landroidx/media/MediaSession2;->getToken()Landroidx/media/SessionToken2;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/media/SessionToken2;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 179
    iget-object v3, p0, Landroidx/media/MediaSessionService2;->mBrowserServiceCompat:Landroidx/media/MediaBrowserServiceCompat;

    iget-object v4, p0, Landroidx/media/MediaSessionService2;->mSession:Landroidx/media/MediaSession2;

    invoke-virtual {v4}, Landroidx/media/MediaSession2;->getToken()Landroidx/media/SessionToken2;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/media/SessionToken2;->getSessionCompatToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroidx/media/MediaBrowserServiceCompat;->setSessionToken(Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    .line 180
    monitor-exit v2

    .line 181
    return-void

    .line 176
    :cond_0
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expected session with id "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroidx/media/SessionToken2;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ", but got "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Landroidx/media/MediaSessionService2;->mSession:Landroidx/media/MediaSession2;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 180
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 167
    .end local v1    # "session":Landroidx/media/MediaSession2;
    :cond_1
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected session type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroidx/media/MediaSessionService2;->getSessionType()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    invoke-virtual {v0}, Landroidx/media/SessionToken2;->getType()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public abstract onCreateSession(Ljava/lang/String;)Landroidx/media/MediaSession2;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method public onUpdateNotification()Landroidx/media/MediaSessionService2$MediaNotification;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 215
    const/4 v0, 0x0

    return-object v0
.end method
