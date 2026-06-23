package androidx.media;

import android.annotation.TargetApi;
import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Process;
import android.os.RemoteException;
import android.os.ResultReceiver;
import android.os.SystemClock;
import android.support.v4.media.MediaBrowserCompat;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.session.MediaControllerCompat;
import android.support.v4.media.session.MediaSessionCompat;
import android.support.v4.media.session.PlaybackStateCompat;
import android.util.Log;
import androidx.annotation.GuardedBy;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.core.app.BundleCompat;
import androidx.media.MediaBrowser2;
import androidx.media.MediaController2;
import androidx.media.MediaSession2;
import java.util.List;
import java.util.concurrent.Executor;

/* JADX INFO: loaded from: classes.dex */
@TargetApi(16)
class MediaController2ImplBase implements MediaController2.SupportLibraryImpl {

    @GuardedBy("mLock")
    private SessionCommandGroup2 mAllowedCommands;

    @GuardedBy("mLock")
    private MediaBrowserCompat mBrowserCompat;

    @GuardedBy("mLock")
    private int mBufferingState;
    private final MediaController2.ControllerCallback mCallback;
    private final Executor mCallbackExecutor;

    @GuardedBy("mLock")
    private volatile boolean mConnected;
    private final Context mContext;

    @GuardedBy("mLock")
    private MediaControllerCompat mControllerCompat;

    @GuardedBy("mLock")
    private ControllerCompatCallback mControllerCompatCallback;

    @GuardedBy("mLock")
    private MediaItem2 mCurrentMediaItem;
    private final IBinder.DeathRecipient mDeathRecipient;
    private final Handler mHandler;
    private final HandlerThread mHandlerThread;
    private MediaController2 mInstance;

    @GuardedBy("mLock")
    private boolean mIsReleased;
    private final Object mLock = new Object();

    @GuardedBy("mLock")
    private MediaMetadataCompat mMediaMetadataCompat;

    @GuardedBy("mLock")
    private MediaController2.PlaybackInfo mPlaybackInfo;

    @GuardedBy("mLock")
    private PlaybackStateCompat mPlaybackStateCompat;

    @GuardedBy("mLock")
    private int mPlayerState;

    @GuardedBy("mLock")
    private List<MediaItem2> mPlaylist;

    @GuardedBy("mLock")
    private MediaMetadata2 mPlaylistMetadata;

    @GuardedBy("mLock")
    private int mRepeatMode;

    @GuardedBy("mLock")
    private int mShuffleMode;
    private final SessionToken2 mToken;
    private static final String TAG = "MC2ImplBase";
    private static final boolean DEBUG = Log.isLoggable(TAG, 3);
    static final Bundle sDefaultRootExtras = new Bundle();

    static {
        sDefaultRootExtras.putBoolean("androidx.media.root_default_root", true);
    }

    MediaController2ImplBase(@NonNull Context context, @NonNull SessionToken2 token, @NonNull Executor executor, @NonNull MediaController2.ControllerCallback callback) throws Throwable {
        if (context == null) {
            throw new IllegalArgumentException("context shouldn't be null");
        }
        if (token == null) {
            throw new IllegalArgumentException("token shouldn't be null");
        }
        if (callback == null) {
            throw new IllegalArgumentException("callback shouldn't be null");
        }
        if (executor == null) {
            throw new IllegalArgumentException("executor shouldn't be null");
        }
        this.mContext = context;
        this.mHandlerThread = new HandlerThread("MediaController2_Thread");
        this.mHandlerThread.start();
        this.mHandler = new Handler(this.mHandlerThread.getLooper());
        this.mToken = token;
        this.mCallback = callback;
        this.mCallbackExecutor = executor;
        this.mDeathRecipient = new IBinder.DeathRecipient() { // from class: androidx.media.MediaController2ImplBase.1
            @Override // android.os.IBinder.DeathRecipient
            public void binderDied() {
                MediaController2ImplBase.this.close();
            }
        };
        initialize();
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void setInstance(MediaController2 controller) {
        this.mInstance = controller;
    }

    @Override // java.lang.AutoCloseable
    public void close() {
        boolean z = DEBUG;
        synchronized (this.mLock) {
            if (this.mIsReleased) {
                return;
            }
            this.mIsReleased = true;
            if (this.mControllerCompatCallback != null && this.mControllerCompatCallback.getIControllerCallback() != null) {
                cleanUpControllerCompatLocked(true);
            }
            if (this.mBrowserCompat != null) {
                this.mBrowserCompat.disconnect();
                this.mBrowserCompat = null;
            }
            this.mConnected = false;
            this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.2
                @Override // java.lang.Runnable
                public void run() {
                    MediaController2ImplBase.this.mCallback.onDisconnected(MediaController2ImplBase.this.mInstance);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cleanUpControllerCompatLocked(boolean sendDisconnectCommand) throws Throwable {
        this.mHandler.removeCallbacksAndMessages(null);
        if (Build.VERSION.SDK_INT >= 18) {
            this.mHandlerThread.quitSafely();
        } else {
            this.mHandlerThread.quit();
        }
        if (sendDisconnectCommand) {
            sendCommand("androidx.media.controller.command.DISCONNECT");
        }
        synchronized (this.mLock) {
            if (this.mControllerCompat != null) {
                this.mControllerCompat.unregisterCallback(this.mControllerCompatCallback);
                this.mControllerCompat = null;
            }
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    @NonNull
    public SessionToken2 getSessionToken() {
        return this.mToken;
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public boolean isConnected() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mConnected;
        }
        return z;
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void play() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
            } else {
                sendCommand(1);
            }
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void pause() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
            } else {
                sendCommand(2);
            }
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void reset() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
            } else {
                sendCommand(3);
            }
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void prepare() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
            } else {
                sendCommand(6);
            }
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void fastForward() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
            } else {
                sendCommand(7);
            }
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void rewind() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
            } else {
                sendCommand(8);
            }
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void seekTo(long pos) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle args = new Bundle();
            args.putLong("androidx.media.argument.SEEK_POSITION", pos);
            sendCommand(9, args);
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void skipForward() {
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void skipBackward() {
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void playFromMediaId(@NonNull String mediaId, @Nullable Bundle extras) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle args = new Bundle();
            args.putString("androidx.media.argument.MEDIA_ID", mediaId);
            args.putBundle("androidx.media.argument.EXTRAS", extras);
            sendCommand(22, args);
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void playFromSearch(@NonNull String query, @Nullable Bundle extras) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle args = new Bundle();
            args.putString("androidx.media.argument.QUERY", query);
            args.putBundle("androidx.media.argument.EXTRAS", extras);
            sendCommand(24, args);
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void playFromUri(@NonNull Uri uri, @Nullable Bundle extras) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle args = new Bundle();
            args.putParcelable("androidx.media.argument.URI", uri);
            args.putBundle("androidx.media.argument.EXTRAS", extras);
            sendCommand(23, args);
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void prepareFromMediaId(@NonNull String mediaId, @Nullable Bundle extras) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle args = new Bundle();
            args.putString("androidx.media.argument.MEDIA_ID", mediaId);
            args.putBundle("androidx.media.argument.EXTRAS", extras);
            sendCommand(25, args);
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void prepareFromSearch(@NonNull String query, @Nullable Bundle extras) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle args = new Bundle();
            args.putString("androidx.media.argument.QUERY", query);
            args.putBundle("androidx.media.argument.EXTRAS", extras);
            sendCommand(27, args);
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void prepareFromUri(@NonNull Uri uri, @Nullable Bundle extras) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle args = new Bundle();
            args.putParcelable("androidx.media.argument.URI", uri);
            args.putBundle("androidx.media.argument.EXTRAS", extras);
            sendCommand(26, args);
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void setVolumeTo(int value, int flags) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle args = new Bundle();
            args.putInt("androidx.media.argument.VOLUME", value);
            args.putInt("androidx.media.argument.VOLUME_FLAGS", flags);
            sendCommand(10, args);
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void adjustVolume(int direction, int flags) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle args = new Bundle();
            args.putInt("androidx.media.argument.VOLUME_DIRECTION", direction);
            args.putInt("androidx.media.argument.VOLUME_FLAGS", flags);
            sendCommand(11, args);
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    @Nullable
    public PendingIntent getSessionActivity() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return null;
            }
            return this.mControllerCompat.getSessionActivity();
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public int getPlayerState() {
        int i;
        synchronized (this.mLock) {
            i = this.mPlayerState;
        }
        return i;
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public long getDuration() {
        synchronized (this.mLock) {
            if (this.mMediaMetadataCompat != null && this.mMediaMetadataCompat.containsKey("android.media.metadata.DURATION")) {
                return this.mMediaMetadataCompat.getLong("android.media.metadata.DURATION");
            }
            return -1L;
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public long getCurrentPosition() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return -1L;
            }
            if (this.mPlaybackStateCompat == null) {
                return -1L;
            }
            long timeDiff = this.mInstance.mTimeDiff != null ? this.mInstance.mTimeDiff.longValue() : SystemClock.elapsedRealtime() - this.mPlaybackStateCompat.getLastPositionUpdateTime();
            long expectedPosition = this.mPlaybackStateCompat.getPosition() + ((long) (this.mPlaybackStateCompat.getPlaybackSpeed() * timeDiff));
            return Math.max(0L, expectedPosition);
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public float getPlaybackSpeed() {
        synchronized (this.mLock) {
            float playbackSpeed = 0.0f;
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return 0.0f;
            }
            if (this.mPlaybackStateCompat != null) {
                playbackSpeed = this.mPlaybackStateCompat.getPlaybackSpeed();
            }
            return playbackSpeed;
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void setPlaybackSpeed(float speed) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle args = new Bundle();
            args.putFloat("androidx.media.argument.PLAYBACK_SPEED", speed);
            sendCommand(39, args);
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public int getBufferingState() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return 0;
            }
            return this.mBufferingState;
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public long getBufferedPosition() {
        synchronized (this.mLock) {
            long bufferedPosition = -1;
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return -1L;
            }
            if (this.mPlaybackStateCompat != null) {
                bufferedPosition = this.mPlaybackStateCompat.getBufferedPosition();
            }
            return bufferedPosition;
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    @Nullable
    public MediaController2.PlaybackInfo getPlaybackInfo() {
        MediaController2.PlaybackInfo playbackInfo;
        synchronized (this.mLock) {
            playbackInfo = this.mPlaybackInfo;
        }
        return playbackInfo;
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void setRating(@NonNull String mediaId, @NonNull Rating2 rating) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle args = new Bundle();
            args.putString("androidx.media.argument.MEDIA_ID", mediaId);
            args.putBundle("androidx.media.argument.RATING", rating.toBundle());
            sendCommand(28, args);
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void sendCustomCommand(@NonNull SessionCommand2 command, @Nullable Bundle args, @Nullable ResultReceiver cb) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle bundle = new Bundle();
            bundle.putBundle("androidx.media.argument.CUSTOM_COMMAND", command.toBundle());
            bundle.putBundle("androidx.media.argument.ARGUMENTS", args);
            sendCommand("androidx.media.controller.command.BY_CUSTOM_COMMAND", bundle, cb);
        }
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    @Nullable
    public List<MediaItem2> getPlaylist() {
        List<MediaItem2> list;
        synchronized (this.mLock) {
            list = this.mPlaylist;
        }
        return list;
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void setPlaylist(@NonNull List<MediaItem2> list, @Nullable MediaMetadata2 metadata) throws Throwable {
        if (list == null) {
            throw new IllegalArgumentException("list shouldn't be null");
        }
        Bundle args = new Bundle();
        args.putParcelableArray("androidx.media.argument.PLAYLIST", MediaUtils2.toMediaItem2ParcelableArray(list));
        args.putBundle("androidx.media.argument.PLAYLIST_METADATA", metadata == null ? null : metadata.toBundle());
        sendCommand(19, args);
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void updatePlaylistMetadata(@Nullable MediaMetadata2 metadata) throws Throwable {
        Bundle args = new Bundle();
        args.putBundle("androidx.media.argument.PLAYLIST_METADATA", metadata == null ? null : metadata.toBundle());
        sendCommand(21, args);
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    @Nullable
    public MediaMetadata2 getPlaylistMetadata() {
        MediaMetadata2 mediaMetadata2;
        synchronized (this.mLock) {
            mediaMetadata2 = this.mPlaylistMetadata;
        }
        return mediaMetadata2;
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void addPlaylistItem(int index, @NonNull MediaItem2 item) throws Throwable {
        Bundle args = new Bundle();
        args.putInt("androidx.media.argument.PLAYLIST_INDEX", index);
        args.putBundle("androidx.media.argument.MEDIA_ITEM", item.toBundle());
        sendCommand(15, args);
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void removePlaylistItem(@NonNull MediaItem2 item) throws Throwable {
        Bundle args = new Bundle();
        args.putBundle("androidx.media.argument.MEDIA_ITEM", item.toBundle());
        sendCommand(16, args);
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void replacePlaylistItem(int index, @NonNull MediaItem2 item) throws Throwable {
        Bundle args = new Bundle();
        args.putInt("androidx.media.argument.PLAYLIST_INDEX", index);
        args.putBundle("androidx.media.argument.MEDIA_ITEM", item.toBundle());
        sendCommand(17, args);
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public MediaItem2 getCurrentMediaItem() {
        MediaItem2 mediaItem2;
        synchronized (this.mLock) {
            mediaItem2 = this.mCurrentMediaItem;
        }
        return mediaItem2;
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void skipToPreviousItem() throws Throwable {
        sendCommand(5);
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void skipToNextItem() throws Throwable {
        sendCommand(4);
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void skipToPlaylistItem(@NonNull MediaItem2 item) throws Throwable {
        Bundle args = new Bundle();
        args.putBundle("androidx.media.argument.MEDIA_ITEM", item.toBundle());
        sendCommand(12, args);
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public int getRepeatMode() {
        int i;
        synchronized (this.mLock) {
            i = this.mRepeatMode;
        }
        return i;
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void setRepeatMode(int repeatMode) throws Throwable {
        Bundle args = new Bundle();
        args.putInt("androidx.media.argument.REPEAT_MODE", repeatMode);
        sendCommand(14, args);
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public int getShuffleMode() {
        int i;
        synchronized (this.mLock) {
            i = this.mShuffleMode;
        }
        return i;
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void setShuffleMode(int shuffleMode) throws Throwable {
        Bundle args = new Bundle();
        args.putInt("androidx.media.argument.SHUFFLE_MODE", shuffleMode);
        sendCommand(13, args);
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void subscribeRoutesInfo() throws Throwable {
        sendCommand(36);
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void unsubscribeRoutesInfo() throws Throwable {
        sendCommand(37);
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    public void selectRoute(@NonNull Bundle route) throws Throwable {
        if (route == null) {
            throw new IllegalArgumentException("route shouldn't be null");
        }
        Bundle args = new Bundle();
        args.putBundle("androidx.media.argument.ROUTE_BUNDLE", route);
        sendCommand(38, args);
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    @NonNull
    public Context getContext() {
        return this.mContext;
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    @NonNull
    public MediaController2.ControllerCallback getCallback() {
        return this.mCallback;
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    @NonNull
    public Executor getCallbackExecutor() {
        return this.mCallbackExecutor;
    }

    @Override // androidx.media.MediaController2.SupportLibraryImpl
    @Nullable
    public MediaBrowserCompat getBrowserCompat() {
        MediaBrowserCompat mediaBrowserCompat;
        synchronized (this.mLock) {
            mediaBrowserCompat = this.mBrowserCompat;
        }
        return mediaBrowserCompat;
    }

    void onConnectedNotLocked(Bundle data) {
        data.setClassLoader(MediaSession2.class.getClassLoader());
        final SessionCommandGroup2 allowedCommands = SessionCommandGroup2.fromBundle(data.getBundle("androidx.media.argument.ALLOWED_COMMANDS"));
        int playerState = data.getInt("androidx.media.argument.PLAYER_STATE");
        int bufferingState = data.getInt("androidx.media.argument.BUFFERING_STATE");
        PlaybackStateCompat playbackStateCompat = (PlaybackStateCompat) data.getParcelable("androidx.media.argument.PLAYBACK_STATE_COMPAT");
        int repeatMode = data.getInt("androidx.media.argument.REPEAT_MODE");
        int shuffleMode = data.getInt("androidx.media.argument.SHUFFLE_MODE");
        List<MediaItem2> playlist = MediaUtils2.fromMediaItem2ParcelableArray(data.getParcelableArray("androidx.media.argument.PLAYLIST"));
        MediaItem2 currentMediaItem = MediaItem2.fromBundle(data.getBundle("androidx.media.argument.MEDIA_ITEM"));
        MediaController2.PlaybackInfo playbackInfo = MediaController2.PlaybackInfo.fromBundle(data.getBundle("androidx.media.argument.PLAYBACK_INFO"));
        MediaMetadata2 metadata = MediaMetadata2.fromBundle(data.getBundle("androidx.media.argument.PLAYLIST_METADATA"));
        if (DEBUG) {
            Log.d(TAG, "onConnectedNotLocked sessionCompatToken=" + this.mToken.getSessionCompatToken() + ", allowedCommands=" + allowedCommands);
        }
        try {
            synchronized (this.mLock) {
                if (this.mIsReleased) {
                    if (close) {
                        return;
                    } else {
                        return;
                    }
                }
                if (this.mConnected) {
                    Log.e(TAG, "Cannot be notified about the connection result many times. Probably a bug or malicious app.");
                    if (1 != 0) {
                        close();
                        return;
                    }
                    return;
                }
                this.mAllowedCommands = allowedCommands;
                this.mPlayerState = playerState;
                this.mBufferingState = bufferingState;
                this.mPlaybackStateCompat = playbackStateCompat;
                this.mRepeatMode = repeatMode;
                this.mShuffleMode = shuffleMode;
                this.mPlaylist = playlist;
                this.mCurrentMediaItem = currentMediaItem;
                this.mPlaylistMetadata = metadata;
                this.mConnected = true;
                this.mPlaybackInfo = playbackInfo;
                this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.3
                    @Override // java.lang.Runnable
                    public void run() {
                        MediaController2ImplBase.this.mCallback.onConnected(MediaController2ImplBase.this.mInstance, allowedCommands);
                    }
                });
                if (0 != 0) {
                    close();
                }
            }
        } finally {
            if (0 != 0) {
                close();
            }
        }
    }

    private void initialize() throws Throwable {
        if (this.mToken.getType() == 0) {
            synchronized (this.mLock) {
                this.mBrowserCompat = null;
            }
            connectToSession(this.mToken.getSessionCompatToken());
            return;
        }
        connectToService();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void connectToSession(MediaSessionCompat.Token sessionCompatToken) throws Throwable {
        MediaControllerCompat controllerCompat = null;
        try {
            controllerCompat = new MediaControllerCompat(this.mContext, sessionCompatToken);
        } catch (RemoteException e) {
            e.printStackTrace();
        }
        synchronized (this.mLock) {
            this.mControllerCompat = controllerCompat;
            this.mControllerCompatCallback = new ControllerCompatCallback();
            this.mControllerCompat.registerCallback(this.mControllerCompatCallback, this.mHandler);
        }
        if (controllerCompat.isSessionReady()) {
            sendCommand("androidx.media.controller.command.CONNECT", new ResultReceiver(this.mHandler) { // from class: androidx.media.MediaController2ImplBase.4
                @Override // android.os.ResultReceiver
                protected void onReceiveResult(int resultCode, Bundle resultData) {
                    if (MediaController2ImplBase.this.mHandlerThread.isAlive()) {
                        switch (resultCode) {
                            case -1:
                                MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.4.1
                                    @Override // java.lang.Runnable
                                    public void run() {
                                        MediaController2ImplBase.this.mCallback.onDisconnected(MediaController2ImplBase.this.mInstance);
                                    }
                                });
                                MediaController2ImplBase.this.close();
                                break;
                            case 0:
                                MediaController2ImplBase.this.onConnectedNotLocked(resultData);
                                break;
                        }
                    }
                }
            });
        }
    }

    private void connectToService() {
        this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.5
            @Override // java.lang.Runnable
            public void run() {
                synchronized (MediaController2ImplBase.this.mLock) {
                    MediaController2ImplBase.this.mBrowserCompat = new MediaBrowserCompat(MediaController2ImplBase.this.mContext, MediaController2ImplBase.this.mToken.getComponentName(), new ConnectionCallback(), MediaController2ImplBase.sDefaultRootExtras);
                    MediaController2ImplBase.this.mBrowserCompat.connect();
                }
            }
        });
    }

    private void sendCommand(int commandCode) throws Throwable {
        sendCommand(commandCode, (Bundle) null);
    }

    private void sendCommand(int commandCode, Bundle args) throws Throwable {
        if (args == null) {
            args = new Bundle();
        }
        args.putInt("androidx.media.argument.COMMAND_CODE", commandCode);
        sendCommand("androidx.media.controller.command.BY_COMMAND_CODE", args, null);
    }

    private void sendCommand(String command) throws Throwable {
        sendCommand(command, null, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendCommand(String command, ResultReceiver receiver) throws Throwable {
        sendCommand(command, null, receiver);
    }

    private void sendCommand(String command, Bundle args, ResultReceiver receiver) throws Throwable {
        if (args == null) {
            args = new Bundle();
        }
        synchronized (this.mLock) {
            ControllerCompatCallback callback = null;
            try {
                MediaControllerCompat controller = this.mControllerCompat;
                try {
                    callback = this.mControllerCompatCallback;
                    BundleCompat.putBinder(args, "androidx.media.argument.ICONTROLLER_CALLBACK", callback.getIControllerCallback().asBinder());
                    args.putString("androidx.media.argument.PACKAGE_NAME", this.mContext.getPackageName());
                    args.putInt("androidx.media.argument.UID", Process.myUid());
                    args.putInt("androidx.media.argument.PID", Process.myPid());
                    controller.sendCommand(command, args, receiver);
                } catch (Throwable th) {
                    th = th;
                    while (true) {
                        try {
                            throw th;
                        } catch (Throwable th2) {
                            th = th2;
                        }
                    }
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    private class ConnectionCallback extends MediaBrowserCompat.ConnectionCallback {
        private ConnectionCallback() {
        }

        @Override // android.support.v4.media.MediaBrowserCompat.ConnectionCallback
        public void onConnected() throws Throwable {
            MediaBrowserCompat browser = MediaController2ImplBase.this.getBrowserCompat();
            if (browser != null) {
                MediaController2ImplBase.this.connectToSession(browser.getSessionToken());
            } else if (MediaController2ImplBase.DEBUG) {
                Log.d(MediaController2ImplBase.TAG, "Controller is closed prematually", new IllegalStateException());
            }
        }

        @Override // android.support.v4.media.MediaBrowserCompat.ConnectionCallback
        public void onConnectionSuspended() {
            MediaController2ImplBase.this.close();
        }

        @Override // android.support.v4.media.MediaBrowserCompat.ConnectionCallback
        public void onConnectionFailed() {
            MediaController2ImplBase.this.close();
        }
    }

    private final class ControllerCompatCallback extends MediaControllerCompat.Callback {
        private ControllerCompatCallback() {
        }

        @Override // android.support.v4.media.session.MediaControllerCompat.Callback
        public void onSessionReady() throws Throwable {
            MediaController2ImplBase.this.sendCommand("androidx.media.controller.command.CONNECT", new ResultReceiver(MediaController2ImplBase.this.mHandler) { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.1
                @Override // android.os.ResultReceiver
                protected void onReceiveResult(int resultCode, Bundle resultData) {
                    if (MediaController2ImplBase.this.mHandlerThread.isAlive()) {
                        switch (resultCode) {
                            case -1:
                                synchronized (MediaController2ImplBase.this.mLock) {
                                    if (MediaController2ImplBase.this.mIsReleased) {
                                        MediaController2ImplBase.this.cleanUpControllerCompatLocked(false);
                                        return;
                                    } else {
                                        MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.1.1
                                            @Override // java.lang.Runnable
                                            public void run() {
                                                MediaController2ImplBase.this.mCallback.onDisconnected(MediaController2ImplBase.this.mInstance);
                                            }
                                        });
                                        MediaController2ImplBase.this.close();
                                        return;
                                    }
                                }
                            case 0:
                                synchronized (MediaController2ImplBase.this.mLock) {
                                    if (MediaController2ImplBase.this.mIsReleased) {
                                        MediaController2ImplBase.this.cleanUpControllerCompatLocked(true);
                                        return;
                                    } else {
                                        MediaController2ImplBase.this.onConnectedNotLocked(resultData);
                                        return;
                                    }
                                }
                            default:
                                return;
                        }
                    }
                }
            });
        }

        @Override // android.support.v4.media.session.MediaControllerCompat.Callback
        public void onSessionDestroyed() {
            MediaController2ImplBase.this.close();
        }

        @Override // android.support.v4.media.session.MediaControllerCompat.Callback
        public void onPlaybackStateChanged(PlaybackStateCompat state) {
            synchronized (MediaController2ImplBase.this.mLock) {
                MediaController2ImplBase.this.mPlaybackStateCompat = state;
            }
        }

        @Override // android.support.v4.media.session.MediaControllerCompat.Callback
        public void onMetadataChanged(MediaMetadataCompat metadata) {
            synchronized (MediaController2ImplBase.this.mLock) {
                MediaController2ImplBase.this.mMediaMetadataCompat = metadata;
            }
        }

        @Override // android.support.v4.media.session.MediaControllerCompat.Callback
        public void onSessionEvent(String event, Bundle extras) {
            if (extras != null) {
                extras.setClassLoader(MediaSession2.class.getClassLoader());
            }
            switch (event) {
                case "androidx.media.session.event.ON_ALLOWED_COMMANDS_CHANGED":
                    final SessionCommandGroup2 allowedCommands = SessionCommandGroup2.fromBundle(extras.getBundle("androidx.media.argument.ALLOWED_COMMANDS"));
                    synchronized (MediaController2ImplBase.this.mLock) {
                        MediaController2ImplBase.this.mAllowedCommands = allowedCommands;
                        break;
                    }
                    MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.2
                        @Override // java.lang.Runnable
                        public void run() {
                            MediaController2ImplBase.this.mCallback.onAllowedCommandsChanged(MediaController2ImplBase.this.mInstance, allowedCommands);
                        }
                    });
                    return;
                case "androidx.media.session.event.ON_PLAYER_STATE_CHANGED":
                    final int playerState = extras.getInt("androidx.media.argument.PLAYER_STATE");
                    PlaybackStateCompat state = (PlaybackStateCompat) extras.getParcelable("androidx.media.argument.PLAYBACK_STATE_COMPAT");
                    if (state != null) {
                        synchronized (MediaController2ImplBase.this.mLock) {
                            MediaController2ImplBase.this.mPlayerState = playerState;
                            MediaController2ImplBase.this.mPlaybackStateCompat = state;
                            break;
                        }
                        MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.3
                            @Override // java.lang.Runnable
                            public void run() {
                                MediaController2ImplBase.this.mCallback.onPlayerStateChanged(MediaController2ImplBase.this.mInstance, playerState);
                            }
                        });
                        return;
                    }
                    return;
                case "androidx.media.session.event.ON_CURRENT_MEDIA_ITEM_CHANGED":
                    final MediaItem2 item = MediaItem2.fromBundle(extras.getBundle("androidx.media.argument.MEDIA_ITEM"));
                    synchronized (MediaController2ImplBase.this.mLock) {
                        MediaController2ImplBase.this.mCurrentMediaItem = item;
                        break;
                    }
                    MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.4
                        @Override // java.lang.Runnable
                        public void run() {
                            MediaController2ImplBase.this.mCallback.onCurrentMediaItemChanged(MediaController2ImplBase.this.mInstance, item);
                        }
                    });
                    return;
                case "androidx.media.session.event.ON_ERROR":
                    final int errorCode = extras.getInt("androidx.media.argument.ERROR_CODE");
                    final Bundle errorExtras = extras.getBundle("androidx.media.argument.EXTRAS");
                    MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.5
                        @Override // java.lang.Runnable
                        public void run() {
                            MediaController2ImplBase.this.mCallback.onError(MediaController2ImplBase.this.mInstance, errorCode, errorExtras);
                        }
                    });
                    return;
                case "androidx.media.session.event.ON_ROUTES_INFO_CHANGED":
                    final List<Bundle> routes = MediaUtils2.toBundleList(extras.getParcelableArray("androidx.media.argument.ROUTE_BUNDLE"));
                    MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.6
                        @Override // java.lang.Runnable
                        public void run() {
                            MediaController2ImplBase.this.mCallback.onRoutesInfoChanged(MediaController2ImplBase.this.mInstance, routes);
                        }
                    });
                    return;
                case "androidx.media.session.event.ON_PLAYLIST_CHANGED":
                    final MediaMetadata2 playlistMetadata = MediaMetadata2.fromBundle(extras.getBundle("androidx.media.argument.PLAYLIST_METADATA"));
                    final List<MediaItem2> playlist = MediaUtils2.fromMediaItem2ParcelableArray(extras.getParcelableArray("androidx.media.argument.PLAYLIST"));
                    synchronized (MediaController2ImplBase.this.mLock) {
                        MediaController2ImplBase.this.mPlaylist = playlist;
                        MediaController2ImplBase.this.mPlaylistMetadata = playlistMetadata;
                        break;
                    }
                    MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.7
                        @Override // java.lang.Runnable
                        public void run() {
                            MediaController2ImplBase.this.mCallback.onPlaylistChanged(MediaController2ImplBase.this.mInstance, playlist, playlistMetadata);
                        }
                    });
                    return;
                case "androidx.media.session.event.ON_PLAYLIST_METADATA_CHANGED":
                    final MediaMetadata2 playlistMetadata2 = MediaMetadata2.fromBundle(extras.getBundle("androidx.media.argument.PLAYLIST_METADATA"));
                    synchronized (MediaController2ImplBase.this.mLock) {
                        MediaController2ImplBase.this.mPlaylistMetadata = playlistMetadata2;
                        break;
                    }
                    MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.8
                        @Override // java.lang.Runnable
                        public void run() {
                            MediaController2ImplBase.this.mCallback.onPlaylistMetadataChanged(MediaController2ImplBase.this.mInstance, playlistMetadata2);
                        }
                    });
                    return;
                case "androidx.media.session.event.ON_REPEAT_MODE_CHANGED":
                    final int repeatMode = extras.getInt("androidx.media.argument.REPEAT_MODE");
                    synchronized (MediaController2ImplBase.this.mLock) {
                        MediaController2ImplBase.this.mRepeatMode = repeatMode;
                        break;
                    }
                    MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.9
                        @Override // java.lang.Runnable
                        public void run() {
                            MediaController2ImplBase.this.mCallback.onRepeatModeChanged(MediaController2ImplBase.this.mInstance, repeatMode);
                        }
                    });
                    return;
                case "androidx.media.session.event.ON_SHUFFLE_MODE_CHANGED":
                    final int shuffleMode = extras.getInt("androidx.media.argument.SHUFFLE_MODE");
                    synchronized (MediaController2ImplBase.this.mLock) {
                        MediaController2ImplBase.this.mShuffleMode = shuffleMode;
                        break;
                    }
                    MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.10
                        @Override // java.lang.Runnable
                        public void run() {
                            MediaController2ImplBase.this.mCallback.onShuffleModeChanged(MediaController2ImplBase.this.mInstance, shuffleMode);
                        }
                    });
                    return;
                case "androidx.media.session.event.SEND_CUSTOM_COMMAND":
                    Bundle commandBundle = extras.getBundle("androidx.media.argument.CUSTOM_COMMAND");
                    if (commandBundle == null) {
                        return;
                    }
                    final SessionCommand2 command = SessionCommand2.fromBundle(commandBundle);
                    final Bundle args = extras.getBundle("androidx.media.argument.ARGUMENTS");
                    final ResultReceiver receiver = (ResultReceiver) extras.getParcelable("androidx.media.argument.RESULT_RECEIVER");
                    MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.11
                        @Override // java.lang.Runnable
                        public void run() {
                            MediaController2ImplBase.this.mCallback.onCustomCommand(MediaController2ImplBase.this.mInstance, command, args, receiver);
                        }
                    });
                    return;
                case "androidx.media.session.event.SET_CUSTOM_LAYOUT":
                    final List<MediaSession2.CommandButton> layout = MediaUtils2.fromCommandButtonParcelableArray(extras.getParcelableArray("androidx.media.argument.COMMAND_BUTTONS"));
                    if (layout != null) {
                        MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.12
                            @Override // java.lang.Runnable
                            public void run() {
                                MediaController2ImplBase.this.mCallback.onCustomLayoutChanged(MediaController2ImplBase.this.mInstance, layout);
                            }
                        });
                        return;
                    }
                    return;
                case "androidx.media.session.event.ON_PLAYBACK_INFO_CHANGED":
                    final MediaController2.PlaybackInfo info = MediaController2.PlaybackInfo.fromBundle(extras.getBundle("androidx.media.argument.PLAYBACK_INFO"));
                    if (info != null) {
                        synchronized (MediaController2ImplBase.this.mLock) {
                            MediaController2ImplBase.this.mPlaybackInfo = info;
                            break;
                        }
                        MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.13
                            @Override // java.lang.Runnable
                            public void run() {
                                MediaController2ImplBase.this.mCallback.onPlaybackInfoChanged(MediaController2ImplBase.this.mInstance, info);
                            }
                        });
                        return;
                    }
                    return;
                case "androidx.media.session.event.ON_PLAYBACK_SPEED_CHANGED":
                    final PlaybackStateCompat state2 = (PlaybackStateCompat) extras.getParcelable("androidx.media.argument.PLAYBACK_STATE_COMPAT");
                    if (state2 != null) {
                        synchronized (MediaController2ImplBase.this.mLock) {
                            MediaController2ImplBase.this.mPlaybackStateCompat = state2;
                            break;
                        }
                        MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.14
                            @Override // java.lang.Runnable
                            public void run() {
                                MediaController2ImplBase.this.mCallback.onPlaybackSpeedChanged(MediaController2ImplBase.this.mInstance, state2.getPlaybackSpeed());
                            }
                        });
                        return;
                    }
                    return;
                case "androidx.media.session.event.ON_BUFFERING_STATE_CHANGED":
                    final MediaItem2 item2 = MediaItem2.fromBundle(extras.getBundle("androidx.media.argument.MEDIA_ITEM"));
                    final int bufferingState = extras.getInt("androidx.media.argument.BUFFERING_STATE");
                    PlaybackStateCompat state3 = (PlaybackStateCompat) extras.getParcelable("androidx.media.argument.PLAYBACK_STATE_COMPAT");
                    if (item2 != null && state3 != null) {
                        synchronized (MediaController2ImplBase.this.mLock) {
                            MediaController2ImplBase.this.mBufferingState = bufferingState;
                            MediaController2ImplBase.this.mPlaybackStateCompat = state3;
                            break;
                        }
                        MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.15
                            @Override // java.lang.Runnable
                            public void run() {
                                MediaController2ImplBase.this.mCallback.onBufferingStateChanged(MediaController2ImplBase.this.mInstance, item2, bufferingState);
                            }
                        });
                        return;
                    }
                    return;
                case "androidx.media.session.event.ON_SEEK_COMPLETED":
                    final long position = extras.getLong("androidx.media.argument.SEEK_POSITION");
                    PlaybackStateCompat state4 = (PlaybackStateCompat) extras.getParcelable("androidx.media.argument.PLAYBACK_STATE_COMPAT");
                    if (state4 != null) {
                        synchronized (MediaController2ImplBase.this.mLock) {
                            MediaController2ImplBase.this.mPlaybackStateCompat = state4;
                            break;
                        }
                        MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.16
                            @Override // java.lang.Runnable
                            public void run() {
                                MediaController2ImplBase.this.mCallback.onSeekCompleted(MediaController2ImplBase.this.mInstance, position);
                            }
                        });
                        return;
                    }
                    return;
                case "androidx.media.session.event.ON_CHILDREN_CHANGED":
                    String parentId = extras.getString("androidx.media.argument.MEDIA_ID");
                    if (parentId == null || !(MediaController2ImplBase.this.mInstance instanceof MediaBrowser2)) {
                        return;
                    }
                    int itemCount = extras.getInt("androidx.media.argument.ITEM_COUNT", -1);
                    Bundle childrenExtras = extras.getBundle("androidx.media.argument.EXTRAS");
                    ((MediaBrowser2.BrowserCallback) MediaController2ImplBase.this.mCallback).onChildrenChanged((MediaBrowser2) MediaController2ImplBase.this.mInstance, parentId, itemCount, childrenExtras);
                    return;
                case "androidx.media.session.event.ON_SEARCH_RESULT_CHANGED":
                    final String query = extras.getString("androidx.media.argument.QUERY");
                    if (query == null || !(MediaController2ImplBase.this.mInstance instanceof MediaBrowser2)) {
                        return;
                    }
                    final int itemCount2 = extras.getInt("androidx.media.argument.ITEM_COUNT", -1);
                    final Bundle searchExtras = extras.getBundle("androidx.media.argument.EXTRAS");
                    MediaController2ImplBase.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.media.MediaController2ImplBase.ControllerCompatCallback.17
                        @Override // java.lang.Runnable
                        public void run() {
                            ((MediaBrowser2.BrowserCallback) MediaController2ImplBase.this.mCallback).onSearchResultChanged((MediaBrowser2) MediaController2ImplBase.this.mInstance, query, itemCount2, searchExtras);
                        }
                    });
                    return;
                default:
                    return;
            }
        }
    }
}
