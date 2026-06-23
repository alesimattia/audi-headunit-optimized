package androidx.media;

import android.annotation.TargetApi;
import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.os.ResultReceiver;
import android.support.v4.media.session.MediaSessionCompat;
import android.support.v4.media.session.PlaybackStateCompat;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RestrictTo;
import androidx.media.MediaController2;
import androidx.media.MediaInterface2;
import androidx.media.MediaSession2ImplBase;
import androidx.media.MediaSessionManager;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;
import java.util.concurrent.Executor;

/* JADX INFO: loaded from: classes.dex */
@TargetApi(19)
public class MediaSession2 extends MediaInterface2.SessionPlayer implements AutoCloseable {
    public static final int ERROR_CODE_ACTION_ABORTED = 10;
    public static final int ERROR_CODE_APP_ERROR = 1;
    public static final int ERROR_CODE_AUTHENTICATION_EXPIRED = 3;
    public static final int ERROR_CODE_CONCURRENT_STREAM_LIMIT = 5;
    public static final int ERROR_CODE_CONTENT_ALREADY_PLAYING = 8;
    public static final int ERROR_CODE_END_OF_QUEUE = 11;
    public static final int ERROR_CODE_NOT_AVAILABLE_IN_REGION = 7;
    public static final int ERROR_CODE_NOT_SUPPORTED = 2;
    public static final int ERROR_CODE_PARENTAL_CONTROL_RESTRICTED = 6;
    public static final int ERROR_CODE_PREMIUM_ACCOUNT_REQUIRED = 4;
    public static final int ERROR_CODE_SETUP_REQUIRED = 12;
    public static final int ERROR_CODE_SKIP_LIMIT_REACHED = 9;
    public static final int ERROR_CODE_UNKNOWN_ERROR = 0;
    static final String TAG = "MediaSession2";
    private final SupportLibraryImpl mImpl;

    @Retention(RetentionPolicy.SOURCE)
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public @interface ErrorCode {
    }

    public interface OnDataSourceMissingHelper {
        @Nullable
        DataSourceDesc onDataSourceMissing(@NonNull MediaSession2 mediaSession2, @NonNull MediaItem2 mediaItem2);
    }

    MediaSession2(SupportLibraryImpl impl) {
        this.mImpl = impl;
    }

    SupportLibraryImpl getImpl() {
        return this.mImpl;
    }

    public void updatePlayer(@NonNull BaseMediaPlayer player, @Nullable MediaPlaylistAgent playlistAgent, @Nullable VolumeProviderCompat volumeProvider) {
        this.mImpl.updatePlayer(player, playlistAgent, volumeProvider);
    }

    @Override // java.lang.AutoCloseable
    public void close() {
        try {
            this.mImpl.close();
        } catch (Exception e) {
        }
    }

    @NonNull
    public BaseMediaPlayer getPlayer() {
        return this.mImpl.getPlayer();
    }

    @NonNull
    public MediaPlaylistAgent getPlaylistAgent() {
        return this.mImpl.getPlaylistAgent();
    }

    @Nullable
    public VolumeProviderCompat getVolumeProvider() {
        return this.mImpl.getVolumeProvider();
    }

    @NonNull
    public SessionToken2 getToken() {
        return this.mImpl.getToken();
    }

    @NonNull
    Context getContext() {
        return this.mImpl.getContext();
    }

    @NonNull
    Executor getCallbackExecutor() {
        return this.mImpl.getCallbackExecutor();
    }

    @NonNull
    SessionCallback getCallback() {
        return this.mImpl.getCallback();
    }

    @NonNull
    AudioFocusHandler getAudioFocusHandler() {
        return this.mImpl.getAudioFocusHandler();
    }

    @NonNull
    public List<ControllerInfo> getConnectedControllers() {
        return this.mImpl.getConnectedControllers();
    }

    public void setCustomLayout(@NonNull ControllerInfo controller, @NonNull List<CommandButton> layout) {
        this.mImpl.setCustomLayout(controller, layout);
    }

    public void setAllowedCommands(@NonNull ControllerInfo controller, @NonNull SessionCommandGroup2 commands) {
        this.mImpl.setAllowedCommands(controller, commands);
    }

    public void sendCustomCommand(@NonNull SessionCommand2 command, @Nullable Bundle args) {
        this.mImpl.sendCustomCommand(command, args);
    }

    public void sendCustomCommand(@NonNull ControllerInfo controller, @NonNull SessionCommand2 command, @Nullable Bundle args, @Nullable ResultReceiver receiver) {
        this.mImpl.sendCustomCommand(controller, command, args, receiver);
    }

    @Override // androidx.media.MediaInterface2.SessionPlaybackControl
    public void play() {
        this.mImpl.play();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaybackControl
    public void pause() {
        this.mImpl.pause();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaybackControl
    public void reset() {
        this.mImpl.reset();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaybackControl
    public void prepare() {
        this.mImpl.prepare();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaybackControl
    public void seekTo(long pos) {
        this.mImpl.seekTo(pos);
    }

    @Override // androidx.media.MediaInterface2.SessionPlayer
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void skipForward() {
        this.mImpl.skipForward();
    }

    @Override // androidx.media.MediaInterface2.SessionPlayer
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void skipBackward() {
        this.mImpl.skipBackward();
    }

    @Override // androidx.media.MediaInterface2.SessionPlayer
    public void notifyError(int errorCode, @Nullable Bundle extras) {
        this.mImpl.notifyError(errorCode, extras);
    }

    public void notifyRoutesInfoChanged(@NonNull ControllerInfo controller, @Nullable List<Bundle> routes) {
        this.mImpl.notifyRoutesInfoChanged(controller, routes);
    }

    @Override // androidx.media.MediaInterface2.SessionPlaybackControl
    public int getPlayerState() {
        return this.mImpl.getPlayerState();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaybackControl
    public long getCurrentPosition() {
        return this.mImpl.getCurrentPosition();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaybackControl
    public long getDuration() {
        return this.mImpl.getDuration();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaybackControl
    public long getBufferedPosition() {
        return this.mImpl.getBufferedPosition();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaybackControl
    public int getBufferingState() {
        return this.mImpl.getBufferingState();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaybackControl
    public float getPlaybackSpeed() {
        return this.mImpl.getPlaybackSpeed();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaybackControl
    public void setPlaybackSpeed(float speed) {
        this.mImpl.setPlaybackSpeed(speed);
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public void setOnDataSourceMissingHelper(@NonNull OnDataSourceMissingHelper helper) {
        this.mImpl.setOnDataSourceMissingHelper(helper);
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public void clearOnDataSourceMissingHelper() {
        this.mImpl.clearOnDataSourceMissingHelper();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public List<MediaItem2> getPlaylist() {
        return this.mImpl.getPlaylist();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public void setPlaylist(@NonNull List<MediaItem2> list, @Nullable MediaMetadata2 metadata) {
        this.mImpl.setPlaylist(list, metadata);
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public void skipToPlaylistItem(@NonNull MediaItem2 item) {
        this.mImpl.skipToPlaylistItem(item);
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public void skipToPreviousItem() {
        this.mImpl.skipToPreviousItem();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public void skipToNextItem() {
        this.mImpl.skipToNextItem();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public MediaMetadata2 getPlaylistMetadata() {
        return this.mImpl.getPlaylistMetadata();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public void addPlaylistItem(int index, @NonNull MediaItem2 item) {
        this.mImpl.addPlaylistItem(index, item);
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public void removePlaylistItem(@NonNull MediaItem2 item) {
        this.mImpl.removePlaylistItem(item);
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public void replacePlaylistItem(int index, @NonNull MediaItem2 item) {
        this.mImpl.replacePlaylistItem(index, item);
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public MediaItem2 getCurrentMediaItem() {
        return this.mImpl.getCurrentMediaItem();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public void updatePlaylistMetadata(@Nullable MediaMetadata2 metadata) {
        this.mImpl.updatePlaylistMetadata(metadata);
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public int getRepeatMode() {
        return this.mImpl.getRepeatMode();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public void setRepeatMode(int repeatMode) {
        this.mImpl.setRepeatMode(repeatMode);
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public int getShuffleMode() {
        return this.mImpl.getShuffleMode();
    }

    @Override // androidx.media.MediaInterface2.SessionPlaylistControl
    public void setShuffleMode(int shuffleMode) {
        this.mImpl.setShuffleMode(shuffleMode);
    }

    public static abstract class SessionCallback {
        @Nullable
        public SessionCommandGroup2 onConnect(@NonNull MediaSession2 session, @NonNull ControllerInfo controller) {
            SessionCommandGroup2 commands = new SessionCommandGroup2();
            commands.addAllPredefinedCommands();
            return commands;
        }

        public void onDisconnected(@NonNull MediaSession2 session, @NonNull ControllerInfo controller) {
        }

        public boolean onCommandRequest(@NonNull MediaSession2 session, @NonNull ControllerInfo controller, @NonNull SessionCommand2 command) {
            return true;
        }

        public void onSetRating(@NonNull MediaSession2 session, @NonNull ControllerInfo controller, @NonNull String mediaId, @NonNull Rating2 rating) {
        }

        public void onCustomCommand(@NonNull MediaSession2 session, @NonNull ControllerInfo controller, @NonNull SessionCommand2 customCommand, @Nullable Bundle args, @Nullable ResultReceiver cb) {
        }

        public void onPlayFromMediaId(@NonNull MediaSession2 session, @NonNull ControllerInfo controller, @NonNull String mediaId, @Nullable Bundle extras) {
        }

        public void onPlayFromSearch(@NonNull MediaSession2 session, @NonNull ControllerInfo controller, @NonNull String query, @Nullable Bundle extras) {
        }

        public void onPlayFromUri(@NonNull MediaSession2 session, @NonNull ControllerInfo controller, @NonNull Uri uri, @Nullable Bundle extras) {
        }

        public void onPrepareFromMediaId(@NonNull MediaSession2 session, @NonNull ControllerInfo controller, @NonNull String mediaId, @Nullable Bundle extras) {
        }

        public void onPrepareFromSearch(@NonNull MediaSession2 session, @NonNull ControllerInfo controller, @NonNull String query, @Nullable Bundle extras) {
        }

        public void onPrepareFromUri(@NonNull MediaSession2 session, @NonNull ControllerInfo controller, @NonNull Uri uri, @Nullable Bundle extras) {
        }

        public void onFastForward(@NonNull MediaSession2 session, ControllerInfo controller) {
        }

        public void onRewind(@NonNull MediaSession2 session, ControllerInfo controller) {
        }

        public void onSubscribeRoutesInfo(@NonNull MediaSession2 session, @NonNull ControllerInfo controller) {
        }

        public void onUnsubscribeRoutesInfo(@NonNull MediaSession2 session, @NonNull ControllerInfo controller) {
        }

        public void onSelectRoute(@NonNull MediaSession2 session, @NonNull ControllerInfo controller, @NonNull Bundle route) {
        }

        public void onCurrentMediaItemChanged(@NonNull MediaSession2 session, @NonNull BaseMediaPlayer player, @Nullable MediaItem2 item) {
        }

        public void onMediaPrepared(@NonNull MediaSession2 session, @NonNull BaseMediaPlayer player, @NonNull MediaItem2 item) {
        }

        public void onPlayerStateChanged(@NonNull MediaSession2 session, @NonNull BaseMediaPlayer player, int state) {
        }

        public void onBufferingStateChanged(@NonNull MediaSession2 session, @NonNull BaseMediaPlayer player, @NonNull MediaItem2 item, int state) {
        }

        public void onPlaybackSpeedChanged(@NonNull MediaSession2 session, @NonNull BaseMediaPlayer player, float speed) {
        }

        public void onSeekCompleted(@NonNull MediaSession2 session, @NonNull BaseMediaPlayer player, long position) {
        }

        public void onPlaylistChanged(@NonNull MediaSession2 session, @NonNull MediaPlaylistAgent playlistAgent, @NonNull List<MediaItem2> list, @Nullable MediaMetadata2 metadata) {
        }

        public void onPlaylistMetadataChanged(@NonNull MediaSession2 session, @NonNull MediaPlaylistAgent playlistAgent, @Nullable MediaMetadata2 metadata) {
        }

        public void onShuffleModeChanged(@NonNull MediaSession2 session, @NonNull MediaPlaylistAgent playlistAgent, int shuffleMode) {
        }

        public void onRepeatModeChanged(@NonNull MediaSession2 session, @NonNull MediaPlaylistAgent playlistAgent, int repeatMode) {
        }
    }

    public static final class Builder extends BuilderBase<MediaSession2, Builder, SessionCallback> {
        private MediaSession2ImplBase.Builder mImpl;

        public Builder(Context context) {
            super(context);
            this.mImpl = new MediaSession2ImplBase.Builder(context);
            setImpl(this.mImpl);
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
        public Builder setSessionCallback(@NonNull Executor executor, @NonNull SessionCallback callback) {
            return (Builder) super.setSessionCallback(executor, callback);
        }

        @Override // androidx.media.MediaSession2.BuilderBase
        @NonNull
        public MediaSession2 build() {
            return super.build();
        }
    }

    public static final class ControllerInfo {
        private final ControllerCb mControllerCb;
        private final boolean mIsTrusted = false;
        private final String mPackageName;
        private final int mUid;

        @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
        ControllerInfo(@NonNull String packageName, int pid, int uid, @NonNull ControllerCb cb) {
            this.mUid = uid;
            this.mPackageName = packageName;
            this.mControllerCb = cb;
        }

        @NonNull
        public String getPackageName() {
            return this.mPackageName;
        }

        public int getUid() {
            return this.mUid;
        }

        @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
        public boolean isTrusted() {
            return this.mIsTrusted;
        }

        public int hashCode() {
            return this.mControllerCb.hashCode();
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof ControllerInfo)) {
                return false;
            }
            ControllerInfo other = (ControllerInfo) obj;
            return this.mControllerCb.equals(other.mControllerCb);
        }

        public String toString() {
            return "ControllerInfo {pkg=" + this.mPackageName + ", uid=" + this.mUid + "})";
        }

        @NonNull
        IBinder getId() {
            return this.mControllerCb.getId();
        }

        @NonNull
        ControllerCb getControllerCb() {
            return this.mControllerCb;
        }
    }

    public static final class CommandButton {
        private static final String KEY_COMMAND = "android.media.media_session2.command_button.command";
        private static final String KEY_DISPLAY_NAME = "android.media.media_session2.command_button.display_name";
        private static final String KEY_ENABLED = "android.media.media_session2.command_button.enabled";
        private static final String KEY_EXTRAS = "android.media.media_session2.command_button.extras";
        private static final String KEY_ICON_RES_ID = "android.media.media_session2.command_button.icon_res_id";
        private SessionCommand2 mCommand;
        private String mDisplayName;
        private boolean mEnabled;
        private Bundle mExtras;
        private int mIconResId;

        private CommandButton(@Nullable SessionCommand2 command, int iconResId, @Nullable String displayName, Bundle extras, boolean enabled) {
            this.mCommand = command;
            this.mIconResId = iconResId;
            this.mDisplayName = displayName;
            this.mExtras = extras;
            this.mEnabled = enabled;
        }

        @Nullable
        public SessionCommand2 getCommand() {
            return this.mCommand;
        }

        public int getIconResId() {
            return this.mIconResId;
        }

        @Nullable
        public String getDisplayName() {
            return this.mDisplayName;
        }

        @Nullable
        public Bundle getExtras() {
            return this.mExtras;
        }

        public boolean isEnabled() {
            return this.mEnabled;
        }

        @NonNull
        @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
        public Bundle toBundle() {
            Bundle bundle = new Bundle();
            bundle.putBundle(KEY_COMMAND, this.mCommand.toBundle());
            bundle.putInt(KEY_ICON_RES_ID, this.mIconResId);
            bundle.putString(KEY_DISPLAY_NAME, this.mDisplayName);
            bundle.putBundle(KEY_EXTRAS, this.mExtras);
            bundle.putBoolean(KEY_ENABLED, this.mEnabled);
            return bundle;
        }

        @Nullable
        @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
        public static CommandButton fromBundle(Bundle bundle) {
            if (bundle == null) {
                return null;
            }
            Builder builder = new Builder();
            builder.setCommand(SessionCommand2.fromBundle(bundle.getBundle(KEY_COMMAND)));
            builder.setIconResId(bundle.getInt(KEY_ICON_RES_ID, 0));
            builder.setDisplayName(bundle.getString(KEY_DISPLAY_NAME));
            builder.setExtras(bundle.getBundle(KEY_EXTRAS));
            builder.setEnabled(bundle.getBoolean(KEY_ENABLED));
            try {
                return builder.build();
            } catch (IllegalStateException e) {
                return null;
            }
        }

        public static final class Builder {
            private SessionCommand2 mCommand;
            private String mDisplayName;
            private boolean mEnabled;
            private Bundle mExtras;
            private int mIconResId;

            @NonNull
            public Builder setCommand(@Nullable SessionCommand2 command) {
                this.mCommand = command;
                return this;
            }

            @NonNull
            public Builder setIconResId(int resId) {
                this.mIconResId = resId;
                return this;
            }

            @NonNull
            public Builder setDisplayName(@Nullable String displayName) {
                this.mDisplayName = displayName;
                return this;
            }

            @NonNull
            public Builder setEnabled(boolean enabled) {
                this.mEnabled = enabled;
                return this;
            }

            @NonNull
            public Builder setExtras(@Nullable Bundle extras) {
                this.mExtras = extras;
                return this;
            }

            @NonNull
            public CommandButton build() {
                return new CommandButton(this.mCommand, this.mIconResId, this.mDisplayName, this.mExtras, this.mEnabled);
            }
        }
    }

    static abstract class ControllerCb {
        @NonNull
        abstract IBinder getId();

        abstract void onAllowedCommandsChanged(@NonNull SessionCommandGroup2 sessionCommandGroup2) throws RemoteException;

        abstract void onBufferingStateChanged(@NonNull MediaItem2 mediaItem2, int i) throws RemoteException;

        abstract void onChildrenChanged(@NonNull String str, int i, @Nullable Bundle bundle) throws RemoteException;

        abstract void onCurrentMediaItemChanged(@Nullable MediaItem2 mediaItem2) throws RemoteException;

        abstract void onCustomCommand(@NonNull SessionCommand2 sessionCommand2, @Nullable Bundle bundle, @Nullable ResultReceiver resultReceiver) throws RemoteException;

        abstract void onCustomLayoutChanged(@NonNull List<CommandButton> list) throws RemoteException;

        abstract void onError(int i, @Nullable Bundle bundle) throws RemoteException;

        abstract void onPlaybackInfoChanged(@NonNull MediaController2.PlaybackInfo playbackInfo) throws RemoteException;

        abstract void onPlaybackSpeedChanged(float f) throws RemoteException;

        abstract void onPlayerStateChanged(int i) throws RemoteException;

        abstract void onPlaylistChanged(@NonNull List<MediaItem2> list, @Nullable MediaMetadata2 mediaMetadata2) throws RemoteException;

        abstract void onPlaylistMetadataChanged(@Nullable MediaMetadata2 mediaMetadata2) throws RemoteException;

        abstract void onRepeatModeChanged(int i) throws RemoteException;

        abstract void onRoutesInfoChanged(@Nullable List<Bundle> list) throws RemoteException;

        abstract void onSearchResultChanged(@NonNull String str, int i, @Nullable Bundle bundle) throws RemoteException;

        abstract void onSeekCompleted(long j) throws RemoteException;

        abstract void onShuffleModeChanged(int i) throws RemoteException;

        ControllerCb() {
        }

        public int hashCode() {
            return getId().hashCode();
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof ControllerCb)) {
                return false;
            }
            ControllerCb other = (ControllerCb) obj;
            return getId().equals(other.getId());
        }
    }

    static abstract class SupportLibraryImpl extends MediaInterface2.SessionPlayer implements AutoCloseable {
        abstract MediaSession2 createInstance();

        abstract AudioFocusHandler getAudioFocusHandler();

        abstract SessionCallback getCallback();

        abstract Executor getCallbackExecutor();

        @NonNull
        abstract List<ControllerInfo> getConnectedControllers();

        abstract Context getContext();

        abstract MediaSession2 getInstance();

        abstract MediaController2.PlaybackInfo getPlaybackInfo();

        abstract PlaybackStateCompat getPlaybackStateCompat();

        @NonNull
        abstract BaseMediaPlayer getPlayer();

        @NonNull
        abstract MediaPlaylistAgent getPlaylistAgent();

        abstract MediaSessionCompat getSessionCompat();

        @NonNull
        abstract SessionToken2 getToken();

        @Nullable
        abstract VolumeProviderCompat getVolumeProvider();

        abstract boolean isClosed();

        abstract void notifyChildrenChanged(@NonNull ControllerInfo controllerInfo, @NonNull String str, int i, @Nullable Bundle bundle, @NonNull List<MediaSessionManager.RemoteUserInfo> list);

        abstract void notifyRoutesInfoChanged(@NonNull ControllerInfo controllerInfo, @Nullable List<Bundle> list);

        abstract void notifySearchResultChanged(@NonNull ControllerInfo controllerInfo, @NonNull String str, int i, @Nullable Bundle bundle);

        abstract void sendCustomCommand(@NonNull ControllerInfo controllerInfo, @NonNull SessionCommand2 sessionCommand2, @Nullable Bundle bundle, @Nullable ResultReceiver resultReceiver);

        abstract void sendCustomCommand(@NonNull SessionCommand2 sessionCommand2, @Nullable Bundle bundle);

        abstract void setAllowedCommands(@NonNull ControllerInfo controllerInfo, @NonNull SessionCommandGroup2 sessionCommandGroup2);

        abstract void setCustomLayout(@NonNull ControllerInfo controllerInfo, @NonNull List<CommandButton> list);

        abstract void updatePlayer(@NonNull BaseMediaPlayer baseMediaPlayer, @Nullable MediaPlaylistAgent mediaPlaylistAgent, @Nullable VolumeProviderCompat volumeProviderCompat);

        SupportLibraryImpl() {
        }
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    static abstract class BuilderBase<T extends MediaSession2, U extends BuilderBase<T, U, C>, C extends SessionCallback> {
        MediaSession2ImplBase.BuilderBase<T, C> mBaseImpl;
        C mCallback;
        Executor mCallbackExecutor;
        final Context mContext;
        String mId;
        BaseMediaPlayer mPlayer;
        MediaPlaylistAgent mPlaylistAgent;
        PendingIntent mSessionActivity;
        VolumeProviderCompat mVolumeProvider;

        BuilderBase(Context context) {
            if (context == null) {
                throw new IllegalArgumentException("context shouldn't be null");
            }
            this.mContext = context;
        }

        @NonNull
        U setPlayer(@NonNull BaseMediaPlayer player) {
            if (player == null) {
                throw new IllegalArgumentException("player shouldn't be null");
            }
            this.mBaseImpl.setPlayer(player);
            return this;
        }

        U setPlaylistAgent(@NonNull MediaPlaylistAgent playlistAgent) {
            if (playlistAgent == null) {
                throw new IllegalArgumentException("playlistAgent shouldn't be null");
            }
            this.mBaseImpl.setPlaylistAgent(playlistAgent);
            return this;
        }

        @NonNull
        U setVolumeProvider(@Nullable VolumeProviderCompat volumeProvider) {
            this.mBaseImpl.setVolumeProvider(volumeProvider);
            return this;
        }

        @NonNull
        U setSessionActivity(@Nullable PendingIntent pi) {
            this.mBaseImpl.setSessionActivity(pi);
            return this;
        }

        @NonNull
        U setId(@NonNull String id) {
            if (id == null) {
                throw new IllegalArgumentException("id shouldn't be null");
            }
            this.mBaseImpl.setId(id);
            return this;
        }

        @NonNull
        U setSessionCallback(@NonNull Executor executor, @NonNull C callback) {
            if (executor == null) {
                throw new IllegalArgumentException("executor shouldn't be null");
            }
            if (callback == null) {
                throw new IllegalArgumentException("callback shouldn't be null");
            }
            this.mBaseImpl.setSessionCallback(executor, callback);
            return this;
        }

        @NonNull
        T build() {
            return (T) this.mBaseImpl.build();
        }

        void setImpl(MediaSession2ImplBase.BuilderBase<T, C> impl) {
            this.mBaseImpl = impl;
        }
    }
}
