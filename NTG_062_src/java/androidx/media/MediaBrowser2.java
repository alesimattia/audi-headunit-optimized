package androidx.media;

import android.content.Context;
import android.os.BadParcelableException;
import android.os.Bundle;
import android.support.v4.media.MediaBrowserCompat;
import android.util.Log;
import androidx.annotation.GuardedBy;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RestrictTo;
import androidx.media.MediaController2;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.Executor;

/* JADX INFO: loaded from: classes.dex */
public class MediaBrowser2 extends MediaController2 {

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public static final String EXTRA_ITEM_COUNT = "android.media.browse.extra.ITEM_COUNT";

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public static final String MEDIA_BROWSER2_SUBSCRIBE = "androidx.media.MEDIA_BROWSER2_SUBSCRIBE";

    @GuardedBy("mLock")
    private final HashMap<Bundle, MediaBrowserCompat> mBrowserCompats;
    private final Object mLock;

    @GuardedBy("mLock")
    private final HashMap<String, List<SubscribeCallback>> mSubscribeCallbacks;
    static final String TAG = "MediaBrowser2";
    static final boolean DEBUG = Log.isLoggable(TAG, 3);

    public static class BrowserCallback extends MediaController2.ControllerCallback {
        public void onGetLibraryRootDone(@NonNull MediaBrowser2 browser, @Nullable Bundle rootHints, @Nullable String rootMediaId, @Nullable Bundle rootExtra) {
        }

        public void onChildrenChanged(@NonNull MediaBrowser2 browser, @NonNull String parentId, int itemCount, @Nullable Bundle extras) {
        }

        public void onGetChildrenDone(@NonNull MediaBrowser2 browser, @NonNull String parentId, int page, int pageSize, @Nullable List<MediaItem2> result, @Nullable Bundle extras) {
        }

        public void onGetItemDone(@NonNull MediaBrowser2 browser, @NonNull String mediaId, @Nullable MediaItem2 result) {
        }

        public void onSearchResultChanged(@NonNull MediaBrowser2 browser, @NonNull String query, int itemCount, @Nullable Bundle extras) {
        }

        public void onGetSearchResultDone(@NonNull MediaBrowser2 browser, @NonNull String query, int page, int pageSize, @Nullable List<MediaItem2> result, @Nullable Bundle extras) {
        }
    }

    public MediaBrowser2(@NonNull Context context, @NonNull SessionToken2 token, @NonNull Executor executor, @NonNull BrowserCallback callback) {
        super(context, token, executor, callback);
        this.mLock = new Object();
        this.mBrowserCompats = new HashMap<>();
        this.mSubscribeCallbacks = new HashMap<>();
    }

    @Override // androidx.media.MediaController2, java.lang.AutoCloseable
    public void close() {
        synchronized (this.mLock) {
            for (MediaBrowserCompat browser : this.mBrowserCompats.values()) {
                browser.disconnect();
            }
            this.mBrowserCompats.clear();
            super.close();
        }
    }

    public void getLibraryRoot(@Nullable final Bundle extras) {
        final MediaBrowserCompat browser = getBrowserCompat(extras);
        if (browser != null) {
            getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaBrowser2.1
                @Override // java.lang.Runnable
                public void run() {
                    MediaBrowser2.this.getCallback().onGetLibraryRootDone(MediaBrowser2.this, extras, browser.getRoot(), browser.getExtras());
                }
            });
        } else {
            getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaBrowser2.2
                @Override // java.lang.Runnable
                public void run() {
                    MediaBrowserCompat newBrowser = new MediaBrowserCompat(MediaBrowser2.this.getContext(), MediaBrowser2.this.getSessionToken().getComponentName(), MediaBrowser2.this.new GetLibraryRootCallback(extras), extras);
                    synchronized (MediaBrowser2.this.mLock) {
                        MediaBrowser2.this.mBrowserCompats.put(extras, newBrowser);
                    }
                    newBrowser.connect();
                }
            });
        }
    }

    public void subscribe(@NonNull String parentId, @Nullable Bundle extras) {
        if (parentId == null) {
            throw new IllegalArgumentException("parentId shouldn't be null");
        }
        MediaBrowserCompat browser = getBrowserCompat();
        if (browser == null) {
            return;
        }
        SubscribeCallback callback = new SubscribeCallback();
        synchronized (this.mLock) {
            List<SubscribeCallback> list = this.mSubscribeCallbacks.get(parentId);
            if (list == null) {
                list = new ArrayList();
                this.mSubscribeCallbacks.put(parentId, list);
            }
            list.add(callback);
        }
        Bundle options = new Bundle();
        options.putBundle("androidx.media.argument.EXTRAS", extras);
        options.putBoolean(MEDIA_BROWSER2_SUBSCRIBE, true);
        browser.subscribe(parentId, options, callback);
    }

    public void unsubscribe(@NonNull String parentId) {
        if (parentId == null) {
            throw new IllegalArgumentException("parentId shouldn't be null");
        }
        MediaBrowserCompat browser = getBrowserCompat();
        if (browser == null) {
            return;
        }
        synchronized (this.mLock) {
            List<SubscribeCallback> list = this.mSubscribeCallbacks.get(parentId);
            if (list == null) {
                return;
            }
            for (int i = 0; i < list.size(); i++) {
                browser.unsubscribe(parentId, list.get(i));
            }
        }
    }

    public void getChildren(@NonNull String parentId, int page, int pageSize, @Nullable Bundle extras) {
        if (parentId == null) {
            throw new IllegalArgumentException("parentId shouldn't be null");
        }
        if (page < 1 || pageSize < 1) {
            throw new IllegalArgumentException("Neither page nor pageSize should be less than 1");
        }
        MediaBrowserCompat browser = getBrowserCompat();
        if (browser == null) {
            return;
        }
        Bundle options = MediaUtils2.createBundle(extras);
        options.putInt(MediaBrowserCompat.EXTRA_PAGE, page);
        options.putInt(MediaBrowserCompat.EXTRA_PAGE_SIZE, pageSize);
        browser.subscribe(parentId, options, new GetChildrenCallback(parentId, page, pageSize));
    }

    public void getItem(@NonNull final String mediaId) {
        MediaBrowserCompat browser = getBrowserCompat();
        if (browser == null) {
            return;
        }
        browser.getItem(mediaId, new MediaBrowserCompat.ItemCallback() { // from class: androidx.media.MediaBrowser2.3
            @Override // android.support.v4.media.MediaBrowserCompat.ItemCallback
            public void onItemLoaded(final MediaBrowserCompat.MediaItem item) {
                MediaBrowser2.this.getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaBrowser2.3.1
                    @Override // java.lang.Runnable
                    public void run() {
                        MediaBrowser2.this.getCallback().onGetItemDone(MediaBrowser2.this, mediaId, MediaUtils2.createMediaItem2(item));
                    }
                });
            }

            @Override // android.support.v4.media.MediaBrowserCompat.ItemCallback
            public void onError(String itemId) {
                MediaBrowser2.this.getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaBrowser2.3.2
                    @Override // java.lang.Runnable
                    public void run() {
                        MediaBrowser2.this.getCallback().onGetItemDone(MediaBrowser2.this, mediaId, null);
                    }
                });
            }
        });
    }

    public void search(@NonNull String query, @Nullable Bundle extras) {
        MediaBrowserCompat browser = getBrowserCompat();
        if (browser == null) {
            return;
        }
        browser.search(query, extras, new MediaBrowserCompat.SearchCallback() { // from class: androidx.media.MediaBrowser2.4
            @Override // android.support.v4.media.MediaBrowserCompat.SearchCallback
            public void onSearchResult(final String query2, final Bundle extras2, final List<MediaBrowserCompat.MediaItem> items) {
                MediaBrowser2.this.getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaBrowser2.4.1
                    @Override // java.lang.Runnable
                    public void run() {
                        MediaBrowser2.this.getCallback().onSearchResultChanged(MediaBrowser2.this, query2, items.size(), extras2);
                    }
                });
            }

            @Override // android.support.v4.media.MediaBrowserCompat.SearchCallback
            public void onError(String query2, Bundle extras2) {
            }
        });
    }

    public void getSearchResult(@NonNull String query, final int page, final int pageSize, @Nullable final Bundle extras) {
        MediaBrowserCompat browser = getBrowserCompat();
        if (browser == null) {
            return;
        }
        Bundle options = MediaUtils2.createBundle(extras);
        options.putInt("androidx.media.argument.PAGE", page);
        options.putInt("androidx.media.argument.PAGE_SIZE", pageSize);
        browser.search(query, options, new MediaBrowserCompat.SearchCallback() { // from class: androidx.media.MediaBrowser2.5
            @Override // android.support.v4.media.MediaBrowserCompat.SearchCallback
            public void onSearchResult(final String query2, Bundle extrasSent, final List<MediaBrowserCompat.MediaItem> items) {
                MediaBrowser2.this.getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaBrowser2.5.1
                    @Override // java.lang.Runnable
                    public void run() {
                        List<MediaItem2> item2List = MediaUtils2.toMediaItem2List(items);
                        MediaBrowser2.this.getCallback().onGetSearchResultDone(MediaBrowser2.this, query2, page, pageSize, item2List, extras);
                    }
                });
            }

            @Override // android.support.v4.media.MediaBrowserCompat.SearchCallback
            public void onError(final String query2, Bundle extrasSent) {
                MediaBrowser2.this.getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaBrowser2.5.2
                    @Override // java.lang.Runnable
                    public void run() {
                        MediaBrowser2.this.getCallback().onGetSearchResultDone(MediaBrowser2.this, query2, page, pageSize, null, extras);
                    }
                });
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.media.MediaController2
    public BrowserCallback getCallback() {
        return (BrowserCallback) super.getCallback();
    }

    private MediaBrowserCompat getBrowserCompat(Bundle extras) {
        MediaBrowserCompat mediaBrowserCompat;
        synchronized (this.mLock) {
            mediaBrowserCompat = this.mBrowserCompats.get(extras);
        }
        return mediaBrowserCompat;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Bundle getExtrasWithoutPagination(Bundle extras) {
        if (extras == null) {
            return null;
        }
        extras.setClassLoader(getContext().getClassLoader());
        try {
            extras.remove(MediaBrowserCompat.EXTRA_PAGE);
            extras.remove(MediaBrowserCompat.EXTRA_PAGE_SIZE);
        } catch (BadParcelableException e) {
        }
        return extras;
    }

    private class GetLibraryRootCallback extends MediaBrowserCompat.ConnectionCallback {
        private final Bundle mExtras;

        GetLibraryRootCallback(Bundle extras) {
            this.mExtras = extras;
        }

        @Override // android.support.v4.media.MediaBrowserCompat.ConnectionCallback
        public void onConnected() {
            MediaBrowser2.this.getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaBrowser2.GetLibraryRootCallback.1
                @Override // java.lang.Runnable
                public void run() {
                    MediaBrowserCompat browser;
                    synchronized (MediaBrowser2.this.mLock) {
                        browser = (MediaBrowserCompat) MediaBrowser2.this.mBrowserCompats.get(GetLibraryRootCallback.this.mExtras);
                    }
                    if (browser == null) {
                        return;
                    }
                    MediaBrowser2.this.getCallback().onGetLibraryRootDone(MediaBrowser2.this, GetLibraryRootCallback.this.mExtras, browser.getRoot(), browser.getExtras());
                }
            });
        }

        @Override // android.support.v4.media.MediaBrowserCompat.ConnectionCallback
        public void onConnectionSuspended() {
            MediaBrowser2.this.close();
        }

        @Override // android.support.v4.media.MediaBrowserCompat.ConnectionCallback
        public void onConnectionFailed() {
            MediaBrowser2.this.close();
        }
    }

    private class SubscribeCallback extends MediaBrowserCompat.SubscriptionCallback {
        private SubscribeCallback() {
        }

        @Override // android.support.v4.media.MediaBrowserCompat.SubscriptionCallback
        public void onError(String parentId) {
            onChildrenLoaded(parentId, null, null);
        }

        @Override // android.support.v4.media.MediaBrowserCompat.SubscriptionCallback
        public void onError(String parentId, Bundle options) {
            onChildrenLoaded(parentId, null, options);
        }

        @Override // android.support.v4.media.MediaBrowserCompat.SubscriptionCallback
        public void onChildrenLoaded(String parentId, List<MediaBrowserCompat.MediaItem> children) {
            onChildrenLoaded(parentId, children, null);
        }

        @Override // android.support.v4.media.MediaBrowserCompat.SubscriptionCallback
        public void onChildrenLoaded(final String parentId, List<MediaBrowserCompat.MediaItem> children, Bundle options) {
            final int itemCount;
            if (options != null && options.containsKey(MediaBrowser2.EXTRA_ITEM_COUNT)) {
                itemCount = options.getInt(MediaBrowser2.EXTRA_ITEM_COUNT);
            } else if (children != null) {
                itemCount = children.size();
            } else {
                return;
            }
            final Bundle notifyChildrenChangedOptions = MediaBrowser2.this.getBrowserCompat().getNotifyChildrenChangedOptions();
            MediaBrowser2.this.getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaBrowser2.SubscribeCallback.1
                @Override // java.lang.Runnable
                public void run() {
                    MediaBrowser2.this.getCallback().onChildrenChanged(MediaBrowser2.this, parentId, itemCount, notifyChildrenChangedOptions);
                }
            });
        }
    }

    private class GetChildrenCallback extends MediaBrowserCompat.SubscriptionCallback {
        private final int mPage;
        private final int mPageSize;
        private final String mParentId;

        GetChildrenCallback(String parentId, int page, int pageSize) {
            this.mParentId = parentId;
            this.mPage = page;
            this.mPageSize = pageSize;
        }

        @Override // android.support.v4.media.MediaBrowserCompat.SubscriptionCallback
        public void onError(String parentId) {
            onChildrenLoaded(parentId, null, null);
        }

        @Override // android.support.v4.media.MediaBrowserCompat.SubscriptionCallback
        public void onError(String parentId, Bundle options) {
            onChildrenLoaded(parentId, null, options);
        }

        @Override // android.support.v4.media.MediaBrowserCompat.SubscriptionCallback
        public void onChildrenLoaded(String parentId, List<MediaBrowserCompat.MediaItem> children) {
            onChildrenLoaded(parentId, children, null);
        }

        @Override // android.support.v4.media.MediaBrowserCompat.SubscriptionCallback
        public void onChildrenLoaded(final String parentId, List<MediaBrowserCompat.MediaItem> children, Bundle options) {
            final List<MediaItem2> items;
            if (children == null) {
                items = null;
            } else {
                items = new ArrayList<>();
                for (int i = 0; i < children.size(); i++) {
                    items.add(MediaUtils2.createMediaItem2(children.get(i)));
                }
            }
            final Bundle extras = MediaBrowser2.this.getExtrasWithoutPagination(options);
            MediaBrowser2.this.getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaBrowser2.GetChildrenCallback.1
                @Override // java.lang.Runnable
                public void run() {
                    MediaBrowserCompat browser = MediaBrowser2.this.getBrowserCompat();
                    if (browser != null) {
                        MediaBrowser2.this.getCallback().onGetChildrenDone(MediaBrowser2.this, parentId, GetChildrenCallback.this.mPage, GetChildrenCallback.this.mPageSize, items, extras);
                        browser.unsubscribe(GetChildrenCallback.this.mParentId, GetChildrenCallback.this);
                    }
                }
            });
        }
    }
}
