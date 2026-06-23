package androidx.media;

import android.app.PendingIntent;
import android.content.Intent;
import android.os.BadParcelableException;
import android.os.Bundle;
import android.os.IBinder;
import android.support.v4.media.MediaBrowserCompat;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.media.MediaBrowserServiceCompat;
import androidx.media.MediaLibrarySessionImplBase;
import androidx.media.MediaSession2;
import androidx.media.MediaSessionManager;
import java.util.List;
import java.util.concurrent.Executor;

/* JADX INFO: loaded from: classes.dex */
public abstract class MediaLibraryService2 extends MediaSessionService2 {
    public static final String SERVICE_INTERFACE = "android.media.MediaLibraryService2";

    @Override // androidx.media.MediaSessionService2
    @NonNull
    public abstract MediaLibrarySession onCreateSession(String str);

    public static final class MediaLibrarySession extends MediaSession2 {

        public static class MediaLibrarySessionCallback extends MediaSession2.SessionCallback {
            @Nullable
            public LibraryRoot onGetLibraryRoot(@NonNull MediaLibrarySession session, @NonNull MediaSession2.ControllerInfo controllerInfo, @Nullable Bundle extras) {
                return null;
            }

            @Nullable
            public MediaItem2 onGetItem(@NonNull MediaLibrarySession session, @NonNull MediaSession2.ControllerInfo controllerInfo, @NonNull String mediaId) {
                return null;
            }

            @Nullable
            public List<MediaItem2> onGetChildren(@NonNull MediaLibrarySession session, @NonNull MediaSession2.ControllerInfo controller, @NonNull String parentId, int page, int pageSize, @Nullable Bundle extras) {
                return null;
            }

            public void onSubscribe(@NonNull MediaLibrarySession session, @NonNull MediaSession2.ControllerInfo controller, @NonNull String parentId, @Nullable Bundle extras) {
            }

            public void onUnsubscribe(@NonNull MediaLibrarySession session, @NonNull MediaSession2.ControllerInfo controller, @NonNull String parentId) {
            }

            public void onSearch(@NonNull MediaLibrarySession session, @NonNull MediaSession2.ControllerInfo controllerInfo, @NonNull String query, @Nullable Bundle extras) {
            }

            @Nullable
            public List<MediaItem2> onGetSearchResult(@NonNull MediaLibrarySession session, @NonNull MediaSession2.ControllerInfo controllerInfo, @NonNull String query, int page, int pageSize, @Nullable Bundle extras) {
                return null;
            }
        }

        public static final class Builder extends MediaSession2.BuilderBase<MediaLibrarySession, Builder, MediaLibrarySessionCallback> {
            private MediaLibrarySessionImplBase.Builder mImpl;

            public Builder(@NonNull MediaLibraryService2 service, @NonNull Executor callbackExecutor, @NonNull MediaLibrarySessionCallback callback) {
                super(service);
                this.mImpl = new MediaLibrarySessionImplBase.Builder(service);
                setImpl(this.mImpl);
                setSessionCallback(callbackExecutor, callback);
            }

            @Override // androidx.media.MediaSession2.BuilderBase
            @NonNull
            public Builder setPlayer(@NonNull BaseMediaPlayer player) {
                return (Builder) super.setPlayer(player);
            }

            @Override // androidx.media.MediaSession2.BuilderBase
            @NonNull
            public Builder setPlaylistAgent(@NonNull MediaPlaylistAgent playlistAgent) {
                return (Builder) super.setPlaylistAgent(playlistAgent);
            }

            @Override // androidx.media.MediaSession2.BuilderBase
            @NonNull
            public Builder setVolumeProvider(@Nullable VolumeProviderCompat volumeProvider) {
                return (Builder) super.setVolumeProvider(volumeProvider);
            }

            @Override // androidx.media.MediaSession2.BuilderBase
            @NonNull
            public Builder setSessionActivity(@Nullable PendingIntent pi) {
                return (Builder) super.setSessionActivity(pi);
            }

            @Override // androidx.media.MediaSession2.BuilderBase
            @NonNull
            public Builder setId(@NonNull String id) {
                return (Builder) super.setId(id);
            }

            @Override // androidx.media.MediaSession2.BuilderBase
            @NonNull
            public MediaLibrarySession build() {
                return (MediaLibrarySession) super.build();
            }
        }

        MediaLibrarySession(MediaSession2.SupportLibraryImpl impl) {
            super(impl);
        }

        public void notifyChildrenChanged(@NonNull MediaSession2.ControllerInfo controller, @NonNull String parentId, int itemCount, @Nullable Bundle extras) {
            List<MediaSessionManager.RemoteUserInfo> subscribingBrowsers = getServiceCompat().getSubscribingBrowsers(parentId);
            getImpl().notifyChildrenChanged(controller, parentId, itemCount, extras, subscribingBrowsers);
        }

        public void notifyChildrenChanged(@NonNull String parentId, int itemCount, @Nullable Bundle extras) {
            if (extras == null) {
                getServiceCompat().notifyChildrenChanged(parentId);
            } else {
                getServiceCompat().notifyChildrenChanged(parentId, extras);
            }
        }

        public void notifySearchResultChanged(@NonNull MediaSession2.ControllerInfo controller, @NonNull String query, int itemCount, @Nullable Bundle extras) {
            getImpl().notifySearchResultChanged(controller, query, itemCount, extras);
        }

        private MediaLibraryService2 getService() {
            return (MediaLibraryService2) getContext();
        }

        private MediaBrowserServiceCompat getServiceCompat() {
            return getService().getServiceCompat();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // androidx.media.MediaSession2
        public MediaLibrarySessionCallback getCallback() {
            return (MediaLibrarySessionCallback) super.getCallback();
        }
    }

    @Override // androidx.media.MediaSessionService2
    MediaBrowserServiceCompat createBrowserServiceCompat() {
        return new MyBrowserService();
    }

    @Override // androidx.media.MediaSessionService2
    int getSessionType() {
        return 2;
    }

    @Override // androidx.media.MediaSessionService2, android.app.Service
    public void onCreate() {
        super.onCreate();
        MediaSession2 session = getSession();
        if (!(session instanceof MediaLibrarySession)) {
            throw new RuntimeException("Expected MediaLibrarySession, but returned MediaSession2");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public MediaLibrarySession getLibrarySession() {
        return (MediaLibrarySession) getSession();
    }

    @Override // androidx.media.MediaSessionService2, android.app.Service
    public IBinder onBind(Intent intent) {
        return super.onBind(intent);
    }

    public static final class LibraryRoot {
        public static final String EXTRA_OFFLINE = "android.media.extra.OFFLINE";
        public static final String EXTRA_RECENT = "android.media.extra.RECENT";
        public static final String EXTRA_SUGGESTED = "android.media.extra.SUGGESTED";
        private final Bundle mExtras;
        private final String mRootId;

        public LibraryRoot(@NonNull String rootId, @Nullable Bundle extras) {
            if (rootId == null) {
                throw new IllegalArgumentException("rootId shouldn't be null");
            }
            this.mRootId = rootId;
            this.mExtras = extras;
        }

        public String getRootId() {
            return this.mRootId;
        }

        public Bundle getExtras() {
            return this.mExtras;
        }
    }

    private class MyBrowserService extends MediaBrowserServiceCompat {
        private MyBrowserService() {
        }

        @Override // androidx.media.MediaBrowserServiceCompat
        public MediaBrowserServiceCompat.BrowserRoot onGetRoot(String clientPackageName, int clientUid, Bundle extras) {
            if (MediaUtils2.isDefaultLibraryRootHint(extras)) {
                return MediaSessionService2.sDefaultBrowserRoot;
            }
            MediaSession2.ControllerInfo controller = getController();
            MediaLibrarySession session = MediaLibraryService2.this.getLibrarySession();
            LibraryRoot libraryRoot = session.getCallback().onGetLibraryRoot(session, controller, extras);
            if (libraryRoot == null) {
                return null;
            }
            return new MediaBrowserServiceCompat.BrowserRoot(libraryRoot.getRootId(), libraryRoot.getExtras());
        }

        @Override // androidx.media.MediaBrowserServiceCompat
        public void onLoadChildren(String parentId, MediaBrowserServiceCompat.Result<List<MediaBrowserCompat.MediaItem>> result) {
            onLoadChildren(parentId, result, null);
        }

        @Override // androidx.media.MediaBrowserServiceCompat
        public void onLoadChildren(final String parentId, final MediaBrowserServiceCompat.Result<List<MediaBrowserCompat.MediaItem>> result, final Bundle options) {
            result.detach();
            final MediaSession2.ControllerInfo controller = getController();
            MediaLibraryService2.this.getLibrarySession().getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaLibraryService2.MyBrowserService.1
                @Override // java.lang.Runnable
                public void run() {
                    if (options != null) {
                        options.setClassLoader(MediaLibraryService2.this.getClassLoader());
                        try {
                            int page = options.getInt(MediaBrowserCompat.EXTRA_PAGE);
                            int pageSize = options.getInt(MediaBrowserCompat.EXTRA_PAGE_SIZE);
                            if (page > 0 && pageSize > 0) {
                                List<MediaItem2> children = MediaLibraryService2.this.getLibrarySession().getCallback().onGetChildren(MediaLibraryService2.this.getLibrarySession(), controller, parentId, page, pageSize, options);
                                result.sendResult(MediaUtils2.fromMediaItem2List(children));
                                return;
                            } else if (options.containsKey(MediaBrowser2.MEDIA_BROWSER2_SUBSCRIBE)) {
                                options.remove(MediaBrowser2.MEDIA_BROWSER2_SUBSCRIBE);
                                MediaLibraryService2.this.getLibrarySession().getCallback().onSubscribe(MediaLibraryService2.this.getLibrarySession(), controller, parentId, options.getBundle("androidx.media.argument.EXTRAS"));
                                return;
                            }
                        } catch (BadParcelableException e) {
                        }
                    }
                    List<MediaItem2> children2 = MediaLibraryService2.this.getLibrarySession().getCallback().onGetChildren(MediaLibraryService2.this.getLibrarySession(), controller, parentId, 1, Integer.MAX_VALUE, null);
                    result.sendResult(MediaUtils2.fromMediaItem2List(children2));
                }
            });
        }

        @Override // androidx.media.MediaBrowserServiceCompat
        public void onLoadItem(final String itemId, final MediaBrowserServiceCompat.Result<MediaBrowserCompat.MediaItem> result) {
            result.detach();
            final MediaSession2.ControllerInfo controller = getController();
            MediaLibraryService2.this.getLibrarySession().getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaLibraryService2.MyBrowserService.2
                @Override // java.lang.Runnable
                public void run() {
                    MediaItem2 item = MediaLibraryService2.this.getLibrarySession().getCallback().onGetItem(MediaLibraryService2.this.getLibrarySession(), controller, itemId);
                    if (item == null) {
                        result.sendResult(null);
                    } else {
                        result.sendResult(MediaUtils2.createMediaItem(item));
                    }
                }
            });
        }

        @Override // androidx.media.MediaBrowserServiceCompat
        public void onSearch(final String query, final Bundle extras, final MediaBrowserServiceCompat.Result<List<MediaBrowserCompat.MediaItem>> result) {
            result.detach();
            final MediaSession2.ControllerInfo controller = getController();
            extras.setClassLoader(MediaLibraryService2.this.getClassLoader());
            try {
                final int page = extras.getInt("androidx.media.argument.PAGE");
                final int pageSize = extras.getInt("androidx.media.argument.PAGE_SIZE");
                if (page <= 0 || pageSize <= 0) {
                    try {
                        MediaLibraryService2.this.getLibrarySession().getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaLibraryService2.MyBrowserService.3
                            @Override // java.lang.Runnable
                            public void run() {
                                MediaLibraryService2.this.getLibrarySession().getCallback().onSearch(MediaLibraryService2.this.getLibrarySession(), controller, query, extras);
                            }
                        });
                    } catch (BadParcelableException e) {
                    }
                } else {
                    MediaLibraryService2.this.getLibrarySession().getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaLibraryService2.MyBrowserService.4
                        @Override // java.lang.Runnable
                        public void run() {
                            List<MediaItem2> searchResult = MediaLibraryService2.this.getLibrarySession().getCallback().onGetSearchResult(MediaLibraryService2.this.getLibrarySession(), controller, query, page, pageSize, extras);
                            if (searchResult == null) {
                                result.sendResult(null);
                            } else {
                                result.sendResult(MediaUtils2.fromMediaItem2List(searchResult));
                            }
                        }
                    });
                }
            } catch (BadParcelableException e2) {
            }
        }

        @Override // androidx.media.MediaBrowserServiceCompat
        public void onCustomAction(String action, Bundle extras, MediaBrowserServiceCompat.Result<Bundle> result) {
        }

        private MediaSession2.ControllerInfo getController() {
            MediaLibrarySession session = MediaLibraryService2.this.getLibrarySession();
            List<MediaSession2.ControllerInfo> controllers = session.getConnectedControllers();
            MediaSessionManager.RemoteUserInfo info = getCurrentBrowserInfo();
            if (info == null) {
                return null;
            }
            for (int i = 0; i < controllers.size(); i++) {
                MediaSession2.ControllerInfo controller = controllers.get(i);
                if (controller.getPackageName().equals(info.getPackageName()) && controller.getUid() == info.getUid()) {
                    return controller;
                }
            }
            return null;
        }
    }
}
