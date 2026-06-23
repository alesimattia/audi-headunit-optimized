package androidx.media;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.Service;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.support.v4.media.MediaBrowserCompat;
import androidx.annotation.CallSuper;
import androidx.annotation.GuardedBy;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.media.MediaBrowserServiceCompat;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public abstract class MediaSessionService2 extends Service {
    public static final String SERVICE_META_DATA = "android.media.session";

    @GuardedBy("mLock")
    private boolean mIsRunningForeground;

    @GuardedBy("mLock")
    private NotificationManager mNotificationManager;

    @GuardedBy("mLock")
    private MediaSession2 mSession;

    @GuardedBy("mLock")
    private Intent mStartSelfIntent;
    public static final String SERVICE_INTERFACE = "android.media.MediaSessionService2";
    static final MediaBrowserServiceCompat.BrowserRoot sDefaultBrowserRoot = new MediaBrowserServiceCompat.BrowserRoot(SERVICE_INTERFACE, null);
    private final Object mLock = new Object();
    private final MediaBrowserServiceCompat mBrowserServiceCompat = createBrowserServiceCompat();

    @NonNull
    public abstract MediaSession2 onCreateSession(String str);

    MediaBrowserServiceCompat createBrowserServiceCompat() {
        return new MyBrowserService();
    }

    @Override // android.app.Service
    @CallSuper
    public void onCreate() {
        super.onCreate();
        this.mBrowserServiceCompat.attachToBaseContext(this);
        this.mBrowserServiceCompat.onCreate();
        SessionToken2 token = new SessionToken2(this, new ComponentName(getPackageName(), getClass().getName()));
        if (token.getType() != getSessionType()) {
            throw new RuntimeException("Expected session type " + getSessionType() + " but was " + token.getType());
        }
        MediaSession2 session = onCreateSession(token.getId());
        synchronized (this.mLock) {
            this.mNotificationManager = (NotificationManager) getSystemService("notification");
            this.mStartSelfIntent = new Intent(this, getClass());
            this.mSession = session;
            if (this.mSession == null || !token.getId().equals(this.mSession.getToken().getId())) {
                throw new RuntimeException("Expected session with id " + token.getId() + ", but got " + this.mSession);
            }
            this.mBrowserServiceCompat.setSessionToken(this.mSession.getToken().getSessionCompatToken());
        }
    }

    int getSessionType() {
        return 1;
    }

    @Nullable
    public MediaNotification onUpdateNotification() {
        return null;
    }

    @Nullable
    public final MediaSession2 getSession() {
        MediaSession2 mediaSession2;
        synchronized (this.mLock) {
            mediaSession2 = this.mSession;
        }
        return mediaSession2;
    }

    @Override // android.app.Service
    @Nullable
    @CallSuper
    public IBinder onBind(Intent intent) {
        if (SERVICE_INTERFACE.equals(intent.getAction()) || MediaBrowserServiceCompat.SERVICE_INTERFACE.equals(intent.getAction())) {
            Intent browserServiceIntent = new Intent(intent);
            browserServiceIntent.setAction(SERVICE_INTERFACE);
            return this.mBrowserServiceCompat.onBind(intent);
        }
        return null;
    }

    MediaBrowserServiceCompat getServiceCompat() {
        return this.mBrowserServiceCompat;
    }

    public static class MediaNotification {
        private final Notification mNotification;
        private final int mNotificationId;

        public MediaNotification(int notificationId, @NonNull Notification notification) {
            if (notification == null) {
                throw new IllegalArgumentException("notification shouldn't be null");
            }
            this.mNotificationId = notificationId;
            this.mNotification = notification;
        }

        public int getNotificationId() {
            return this.mNotificationId;
        }

        @NonNull
        public Notification getNotification() {
            return this.mNotification;
        }
    }

    private static class MyBrowserService extends MediaBrowserServiceCompat {
        private MyBrowserService() {
        }

        @Override // androidx.media.MediaBrowserServiceCompat
        public MediaBrowserServiceCompat.BrowserRoot onGetRoot(String clientPackageName, int clientUid, Bundle rootHints) {
            return MediaSessionService2.sDefaultBrowserRoot;
        }

        @Override // androidx.media.MediaBrowserServiceCompat
        public void onLoadChildren(String parentId, MediaBrowserServiceCompat.Result<List<MediaBrowserCompat.MediaItem>> result) {
        }
    }
}
