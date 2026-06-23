.class Landroidx/media/MediaLibrarySessionImplBase;
.super Landroidx/media/MediaSession2ImplBase;
.source "MediaLibrarySessionImplBase.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/MediaLibrarySessionImplBase$Builder;
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat;Ljava/lang/String;Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaPlaylistAgent;Landroidx/media/VolumeProviderCompat;Landroid/app/PendingIntent;Ljava/util/concurrent/Executor;Landroidx/media/MediaSession2$SessionCallback;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "sessionCompat"    # Landroid/support/v4/media/session/MediaSessionCompat;
    .param p3, "id"    # Ljava/lang/String;
    .param p4, "player"    # Landroidx/media/BaseMediaPlayer;
    .param p5, "playlistAgent"    # Landroidx/media/MediaPlaylistAgent;
    .param p6, "volumeProvider"    # Landroidx/media/VolumeProviderCompat;
    .param p7, "sessionActivity"    # Landroid/app/PendingIntent;
    .param p8, "callbackExecutor"    # Ljava/util/concurrent/Executor;
    .param p9, "callback"    # Landroidx/media/MediaSession2$SessionCallback;

    .line 38
    invoke-direct/range {p0 .. p9}, Landroidx/media/MediaSession2ImplBase;-><init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat;Ljava/lang/String;Landroidx/media/BaseMediaPlayer;Landroidx/media/MediaPlaylistAgent;Landroidx/media/VolumeProviderCompat;Landroid/app/PendingIntent;Ljava/util/concurrent/Executor;Landroidx/media/MediaSession2$SessionCallback;)V

    .line 40
    return-void
.end method


# virtual methods
.method createInstance()Landroidx/media/MediaSession2;
    .locals 1

    .line 44
    new-instance v0, Landroidx/media/MediaLibraryService2$MediaLibrarySession;

    invoke-direct {v0, p0}, Landroidx/media/MediaLibraryService2$MediaLibrarySession;-><init>(Landroidx/media/MediaSession2$SupportLibraryImpl;)V

    return-object v0
.end method
