package androidx.media;

import android.annotation.TargetApi;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcelable;
import android.os.RemoteException;
import android.os.ResultReceiver;
import android.support.v4.media.session.IMediaControllerCallback;
import android.support.v4.media.session.MediaSessionCompat;
import android.util.Log;
import android.util.SparseArray;
import androidx.annotation.GuardedBy;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.collection.ArrayMap;
import androidx.core.app.BundleCompat;
import androidx.media.MediaController2;
import androidx.media.MediaSession2;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
@TargetApi(19)
class MediaSession2Stub extends MediaSessionCompat.Callback {
    final Context mContext;
    final MediaSession2.SupportLibraryImpl mSession;
    private static final String TAG = "MS2StubImplBase";
    private static final boolean DEBUG = Log.isLoggable(TAG, 3);
    private static final SparseArray<SessionCommand2> sCommandsForOnCommandRequest = new SparseArray<>();
    private final Object mLock = new Object();

    @GuardedBy("mLock")
    private final ArrayMap<IBinder, MediaSession2.ControllerInfo> mControllers = new ArrayMap<>();

    @GuardedBy("mLock")
    private final Set<IBinder> mConnectingControllers = new HashSet();

    @GuardedBy("mLock")
    private final ArrayMap<MediaSession2.ControllerInfo, SessionCommandGroup2> mAllowedCommandGroupMap = new ArrayMap<>();

    @FunctionalInterface
    private interface Session2Runnable {
        void run(MediaSession2.ControllerInfo controllerInfo) throws RemoteException;
    }

    static {
        SessionCommandGroup2 group = new SessionCommandGroup2();
        group.addAllPlaybackCommands();
        group.addAllPlaylistCommands();
        group.addAllVolumeCommands();
        Set<SessionCommand2> commands = group.getCommands();
        for (SessionCommand2 command : commands) {
            sCommandsForOnCommandRequest.append(command.getCommandCode(), command);
        }
    }

    MediaSession2Stub(MediaSession2.SupportLibraryImpl session) {
        this.mSession = session;
        this.mContext = this.mSession.getContext();
    }

    @Override // android.support.v4.media.session.MediaSessionCompat.Callback
    public void onCommand(String command, final Bundle extras, final ResultReceiver cb) {
        if (extras != null) {
            extras.setClassLoader(MediaSession2.class.getClassLoader());
        }
        byte b = -1;
        int iHashCode = command.hashCode();
        if (iHashCode != -1481662814) {
            if (iHashCode != -586721148) {
                if (iHashCode != -196882305) {
                    if (iHashCode == 536680227 && command.equals("androidx.media.controller.command.BY_COMMAND_CODE")) {
                        b = 2;
                    }
                } else if (command.equals("androidx.media.controller.command.BY_CUSTOM_COMMAND")) {
                    b = 3;
                }
            } else if (command.equals("androidx.media.controller.command.CONNECT")) {
                b = 0;
            }
        } else if (command.equals("androidx.media.controller.command.DISCONNECT")) {
            b = 1;
        }
        switch (b) {
            case 0:
                connect(extras, cb);
                break;
            case 1:
                disconnect(extras);
                break;
            case 2:
                final int commandCode = extras.getInt("androidx.media.argument.COMMAND_CODE");
                IMediaControllerCallback caller = IMediaControllerCallback.Stub.asInterface(BundleCompat.getBinder(extras, "androidx.media.argument.ICONTROLLER_CALLBACK"));
                if (caller != null) {
                    onCommand2(caller.asBinder(), commandCode, new Session2Runnable() { // from class: androidx.media.MediaSession2Stub.1
                        @Override // androidx.media.MediaSession2Stub.Session2Runnable
                        public void run(MediaSession2.ControllerInfo controller) {
                            int i = commandCode;
                            if (i != 19) {
                                switch (i) {
                                    case 1:
                                        MediaSession2Stub.this.mSession.play();
                                        break;
                                    case 2:
                                        MediaSession2Stub.this.mSession.pause();
                                        break;
                                    case 3:
                                        MediaSession2Stub.this.mSession.reset();
                                        break;
                                    case 4:
                                        MediaSession2Stub.this.mSession.skipToNextItem();
                                        break;
                                    case 5:
                                        MediaSession2Stub.this.mSession.skipToPreviousItem();
                                        break;
                                    case 6:
                                        MediaSession2Stub.this.mSession.prepare();
                                        break;
                                    case 7:
                                        MediaSession2Stub.this.mSession.getCallback().onFastForward(MediaSession2Stub.this.mSession.getInstance(), controller);
                                        break;
                                    case 8:
                                        MediaSession2Stub.this.mSession.getCallback().onRewind(MediaSession2Stub.this.mSession.getInstance(), controller);
                                        break;
                                    case 9:
                                        long seekPos = extras.getLong("androidx.media.argument.SEEK_POSITION");
                                        MediaSession2Stub.this.mSession.seekTo(seekPos);
                                        break;
                                    case 10:
                                        int value = extras.getInt("androidx.media.argument.VOLUME");
                                        int flags = extras.getInt("androidx.media.argument.VOLUME_FLAGS");
                                        VolumeProviderCompat vp = MediaSession2Stub.this.mSession.getVolumeProvider();
                                        if (vp == null) {
                                            MediaSessionCompat sessionCompat = MediaSession2Stub.this.mSession.getSessionCompat();
                                            if (sessionCompat != null) {
                                                sessionCompat.getController().setVolumeTo(value, flags);
                                            }
                                        } else {
                                            vp.onSetVolumeTo(value);
                                        }
                                        break;
                                    case 11:
                                        int direction = extras.getInt("androidx.media.argument.VOLUME_DIRECTION");
                                        int flags2 = extras.getInt("androidx.media.argument.VOLUME_FLAGS");
                                        VolumeProviderCompat vp2 = MediaSession2Stub.this.mSession.getVolumeProvider();
                                        if (vp2 == null) {
                                            MediaSessionCompat sessionCompat2 = MediaSession2Stub.this.mSession.getSessionCompat();
                                            if (sessionCompat2 != null) {
                                                sessionCompat2.getController().adjustVolume(direction, flags2);
                                            }
                                        } else {
                                            vp2.onAdjustVolume(direction);
                                        }
                                        break;
                                    case 12:
                                        MediaItem2 item = MediaItem2.fromBundle(extras.getBundle("androidx.media.argument.MEDIA_ITEM"));
                                        MediaSession2Stub.this.mSession.skipToPlaylistItem(item);
                                        break;
                                    case 13:
                                        int shuffleMode = extras.getInt("androidx.media.argument.SHUFFLE_MODE");
                                        MediaSession2Stub.this.mSession.setShuffleMode(shuffleMode);
                                        break;
                                    case 14:
                                        int repeatMode = extras.getInt("androidx.media.argument.REPEAT_MODE");
                                        MediaSession2Stub.this.mSession.setRepeatMode(repeatMode);
                                        break;
                                    case 15:
                                        int index = extras.getInt("androidx.media.argument.PLAYLIST_INDEX");
                                        MediaItem2 item2 = MediaItem2.fromBundle(extras.getBundle("androidx.media.argument.MEDIA_ITEM"));
                                        MediaSession2Stub.this.mSession.addPlaylistItem(index, item2);
                                        break;
                                    case 16:
                                        MediaItem2 item3 = MediaItem2.fromBundle(extras.getBundle("androidx.media.argument.MEDIA_ITEM"));
                                        MediaSession2Stub.this.mSession.removePlaylistItem(item3);
                                        break;
                                    case 17:
                                        int index2 = extras.getInt("androidx.media.argument.PLAYLIST_INDEX");
                                        MediaItem2 item4 = MediaItem2.fromBundle(extras.getBundle("androidx.media.argument.MEDIA_ITEM"));
                                        MediaSession2Stub.this.mSession.replacePlaylistItem(index2, item4);
                                        break;
                                    default:
                                        switch (i) {
                                            case 21:
                                                MediaMetadata2 metadata = MediaMetadata2.fromBundle(extras.getBundle("androidx.media.argument.PLAYLIST_METADATA"));
                                                MediaSession2Stub.this.mSession.updatePlaylistMetadata(metadata);
                                                break;
                                            case 22:
                                                String mediaId = extras.getString("androidx.media.argument.MEDIA_ID");
                                                Bundle extra = extras.getBundle("androidx.media.argument.EXTRAS");
                                                MediaSession2Stub.this.mSession.getCallback().onPlayFromMediaId(MediaSession2Stub.this.mSession.getInstance(), controller, mediaId, extra);
                                                break;
                                            case 23:
                                                Uri uri = (Uri) extras.getParcelable("androidx.media.argument.URI");
                                                Bundle extra2 = extras.getBundle("androidx.media.argument.EXTRAS");
                                                MediaSession2Stub.this.mSession.getCallback().onPlayFromUri(MediaSession2Stub.this.mSession.getInstance(), controller, uri, extra2);
                                                break;
                                            case 24:
                                                String query = extras.getString("androidx.media.argument.QUERY");
                                                Bundle extra3 = extras.getBundle("androidx.media.argument.EXTRAS");
                                                MediaSession2Stub.this.mSession.getCallback().onPlayFromSearch(MediaSession2Stub.this.mSession.getInstance(), controller, query, extra3);
                                                break;
                                            case 25:
                                                String mediaId2 = extras.getString("androidx.media.argument.MEDIA_ID");
                                                Bundle extra4 = extras.getBundle("androidx.media.argument.EXTRAS");
                                                MediaSession2Stub.this.mSession.getCallback().onPrepareFromMediaId(MediaSession2Stub.this.mSession.getInstance(), controller, mediaId2, extra4);
                                                break;
                                            case 26:
                                                Uri uri2 = (Uri) extras.getParcelable("androidx.media.argument.URI");
                                                Bundle extra5 = extras.getBundle("androidx.media.argument.EXTRAS");
                                                MediaSession2Stub.this.mSession.getCallback().onPrepareFromUri(MediaSession2Stub.this.mSession.getInstance(), controller, uri2, extra5);
                                                break;
                                            case 27:
                                                String query2 = extras.getString("androidx.media.argument.QUERY");
                                                Bundle extra6 = extras.getBundle("androidx.media.argument.EXTRAS");
                                                MediaSession2Stub.this.mSession.getCallback().onPrepareFromSearch(MediaSession2Stub.this.mSession.getInstance(), controller, query2, extra6);
                                                break;
                                            case 28:
                                                String mediaId3 = extras.getString("androidx.media.argument.MEDIA_ID");
                                                Rating2 rating = Rating2.fromBundle(extras.getBundle("androidx.media.argument.RATING"));
                                                MediaSession2Stub.this.mSession.getCallback().onSetRating(MediaSession2Stub.this.mSession.getInstance(), controller, mediaId3, rating);
                                                break;
                                            default:
                                                switch (i) {
                                                    case 36:
                                                        MediaSession2Stub.this.mSession.getCallback().onSubscribeRoutesInfo(MediaSession2Stub.this.mSession.getInstance(), controller);
                                                        break;
                                                    case 37:
                                                        MediaSession2Stub.this.mSession.getCallback().onUnsubscribeRoutesInfo(MediaSession2Stub.this.mSession.getInstance(), controller);
                                                        break;
                                                    case 38:
                                                        Bundle route = extras.getBundle("androidx.media.argument.ROUTE_BUNDLE");
                                                        MediaSession2Stub.this.mSession.getCallback().onSelectRoute(MediaSession2Stub.this.mSession.getInstance(), controller, route);
                                                        break;
                                                    case 39:
                                                        float speed = extras.getFloat("androidx.media.argument.PLAYBACK_SPEED");
                                                        MediaSession2Stub.this.mSession.setPlaybackSpeed(speed);
                                                        break;
                                                }
                                                break;
                                        }
                                        break;
                                }
                            }
                            List<MediaItem2> list = MediaUtils2.fromMediaItem2ParcelableArray(extras.getParcelableArray("androidx.media.argument.PLAYLIST"));
                            MediaMetadata2 metadata2 = MediaMetadata2.fromBundle(extras.getBundle("androidx.media.argument.PLAYLIST_METADATA"));
                            MediaSession2Stub.this.mSession.setPlaylist(list, metadata2);
                        }
                    });
                    break;
                }
                break;
            case 3:
                final SessionCommand2 customCommand = SessionCommand2.fromBundle(extras.getBundle("androidx.media.argument.CUSTOM_COMMAND"));
                IMediaControllerCallback caller2 = IMediaControllerCallback.Stub.asInterface(BundleCompat.getBinder(extras, "androidx.media.argument.ICONTROLLER_CALLBACK"));
                if (caller2 != null && customCommand != null) {
                    final Bundle args = extras.getBundle("androidx.media.argument.ARGUMENTS");
                    onCommand2(caller2.asBinder(), customCommand, new Session2Runnable() { // from class: androidx.media.MediaSession2Stub.2
                        @Override // androidx.media.MediaSession2Stub.Session2Runnable
                        public void run(MediaSession2.ControllerInfo controller) throws RemoteException {
                            MediaSession2Stub.this.mSession.getCallback().onCustomCommand(MediaSession2Stub.this.mSession.getInstance(), controller, customCommand, args, cb);
                        }
                    });
                    break;
                }
                break;
        }
    }

    List<MediaSession2.ControllerInfo> getConnectedControllers() {
        ArrayList<MediaSession2.ControllerInfo> controllers = new ArrayList<>();
        synchronized (this.mLock) {
            for (int i = 0; i < this.mControllers.size(); i++) {
                controllers.add(this.mControllers.valueAt(i));
            }
        }
        return controllers;
    }

    void setAllowedCommands(MediaSession2.ControllerInfo controller, SessionCommandGroup2 commands) {
        synchronized (this.mLock) {
            this.mAllowedCommandGroupMap.put(controller, commands);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isAllowedCommand(MediaSession2.ControllerInfo controller, SessionCommand2 command) {
        SessionCommandGroup2 allowedCommands;
        synchronized (this.mLock) {
            allowedCommands = this.mAllowedCommandGroupMap.get(controller);
        }
        return allowedCommands != null && allowedCommands.hasCommand(command);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isAllowedCommand(MediaSession2.ControllerInfo controller, int commandCode) {
        SessionCommandGroup2 allowedCommands;
        synchronized (this.mLock) {
            allowedCommands = this.mAllowedCommandGroupMap.get(controller);
        }
        return allowedCommands != null && allowedCommands.hasCommand(commandCode);
    }

    private void onCommand2(@NonNull IBinder caller, int commandCode, @NonNull Session2Runnable runnable) {
        onCommand2Internal(caller, null, commandCode, runnable);
    }

    private void onCommand2(@NonNull IBinder caller, @NonNull SessionCommand2 sessionCommand, @NonNull Session2Runnable runnable) {
        onCommand2Internal(caller, sessionCommand, 0, runnable);
    }

    private void onCommand2Internal(@NonNull IBinder caller, @Nullable final SessionCommand2 sessionCommand, final int commandCode, @NonNull final Session2Runnable runnable) {
        final MediaSession2.ControllerInfo controller;
        synchronized (this.mLock) {
            controller = this.mControllers.get(caller);
        }
        if (this.mSession == null || controller == null) {
            return;
        }
        this.mSession.getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaSession2Stub.3
            @Override // java.lang.Runnable
            public void run() {
                SessionCommand2 command;
                if (sessionCommand != null) {
                    if (MediaSession2Stub.this.isAllowedCommand(controller, sessionCommand)) {
                        command = (SessionCommand2) MediaSession2Stub.sCommandsForOnCommandRequest.get(sessionCommand.getCommandCode());
                    } else {
                        return;
                    }
                } else if (MediaSession2Stub.this.isAllowedCommand(controller, commandCode)) {
                    command = (SessionCommand2) MediaSession2Stub.sCommandsForOnCommandRequest.get(commandCode);
                } else {
                    return;
                }
                if (command != null) {
                    boolean accepted = MediaSession2Stub.this.mSession.getCallback().onCommandRequest(MediaSession2Stub.this.mSession.getInstance(), controller, command);
                    if (!accepted) {
                        if (MediaSession2Stub.DEBUG) {
                            Log.d(MediaSession2Stub.TAG, "Command (" + command + ") from " + controller + " was rejected by " + MediaSession2Stub.this.mSession);
                            return;
                        }
                        return;
                    }
                }
                try {
                    runnable.run(controller);
                } catch (RemoteException e) {
                    Log.w(MediaSession2Stub.TAG, "Exception in " + controller.toString(), e);
                }
            }
        });
    }

    void removeControllerInfo(MediaSession2.ControllerInfo controller) {
        synchronized (this.mLock) {
            MediaSession2.ControllerInfo controller2 = this.mControllers.remove(controller.getId());
            if (DEBUG) {
                Log.d(TAG, "releasing " + controller2);
            }
        }
    }

    private MediaSession2.ControllerInfo createControllerInfo(Bundle extras) {
        IMediaControllerCallback callback = IMediaControllerCallback.Stub.asInterface(BundleCompat.getBinder(extras, "androidx.media.argument.ICONTROLLER_CALLBACK"));
        String packageName = extras.getString("androidx.media.argument.PACKAGE_NAME");
        int uid = extras.getInt("androidx.media.argument.UID");
        int pid = extras.getInt("androidx.media.argument.PID");
        return new MediaSession2.ControllerInfo(packageName, pid, uid, new Controller2Cb(callback));
    }

    private void connect(Bundle extras, final ResultReceiver cb) {
        final MediaSession2.ControllerInfo controllerInfo = createControllerInfo(extras);
        this.mSession.getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaSession2Stub.4
            @Override // java.lang.Runnable
            public void run() {
                SessionCommandGroup2 allowedCommands;
                List<MediaItem2> playlist;
                if (!MediaSession2Stub.this.mSession.isClosed()) {
                    synchronized (MediaSession2Stub.this.mLock) {
                        MediaSession2Stub.this.mConnectingControllers.add(controllerInfo.getId());
                    }
                    SessionCommandGroup2 allowedCommands2 = MediaSession2Stub.this.mSession.getCallback().onConnect(MediaSession2Stub.this.mSession.getInstance(), controllerInfo);
                    boolean accept = allowedCommands2 != null || controllerInfo.isTrusted();
                    MediaItem2 currentMediaItem = null;
                    if (accept) {
                        if (MediaSession2Stub.DEBUG) {
                            Log.d(MediaSession2Stub.TAG, "Accepting connection, controllerInfo=" + controllerInfo + " allowedCommands=" + allowedCommands2);
                        }
                        if (allowedCommands2 == null) {
                            allowedCommands = new SessionCommandGroup2();
                        } else {
                            allowedCommands = allowedCommands2;
                        }
                        synchronized (MediaSession2Stub.this.mLock) {
                            MediaSession2Stub.this.mConnectingControllers.remove(controllerInfo.getId());
                            MediaSession2Stub.this.mControllers.put(controllerInfo.getId(), controllerInfo);
                            MediaSession2Stub.this.mAllowedCommandGroupMap.put(controllerInfo, allowedCommands);
                        }
                        Bundle resultData = new Bundle();
                        resultData.putBundle("androidx.media.argument.ALLOWED_COMMANDS", allowedCommands.toBundle());
                        resultData.putInt("androidx.media.argument.PLAYER_STATE", MediaSession2Stub.this.mSession.getPlayerState());
                        resultData.putInt("androidx.media.argument.BUFFERING_STATE", MediaSession2Stub.this.mSession.getBufferingState());
                        resultData.putParcelable("androidx.media.argument.PLAYBACK_STATE_COMPAT", MediaSession2Stub.this.mSession.getPlaybackStateCompat());
                        resultData.putInt("androidx.media.argument.REPEAT_MODE", MediaSession2Stub.this.mSession.getRepeatMode());
                        resultData.putInt("androidx.media.argument.SHUFFLE_MODE", MediaSession2Stub.this.mSession.getShuffleMode());
                        if (!allowedCommands.hasCommand(18)) {
                            playlist = null;
                        } else {
                            playlist = MediaSession2Stub.this.mSession.getPlaylist();
                        }
                        if (playlist != null) {
                            resultData.putParcelableArray("androidx.media.argument.PLAYLIST", MediaUtils2.toMediaItem2ParcelableArray(playlist));
                        }
                        if (allowedCommands.hasCommand(20)) {
                            currentMediaItem = MediaSession2Stub.this.mSession.getCurrentMediaItem();
                        }
                        if (currentMediaItem != null) {
                            resultData.putBundle("androidx.media.argument.MEDIA_ITEM", currentMediaItem.toBundle());
                        }
                        resultData.putBundle("androidx.media.argument.PLAYBACK_INFO", MediaSession2Stub.this.mSession.getPlaybackInfo().toBundle());
                        MediaMetadata2 playlistMetadata = MediaSession2Stub.this.mSession.getPlaylistMetadata();
                        if (playlistMetadata != null) {
                            resultData.putBundle("androidx.media.argument.PLAYLIST_METADATA", playlistMetadata.toBundle());
                        }
                        if (!MediaSession2Stub.this.mSession.isClosed()) {
                            cb.send(0, resultData);
                            return;
                        }
                        return;
                    }
                    synchronized (MediaSession2Stub.this.mLock) {
                        MediaSession2Stub.this.mConnectingControllers.remove(controllerInfo.getId());
                    }
                    if (MediaSession2Stub.DEBUG) {
                        Log.d(MediaSession2Stub.TAG, "Rejecting connection, controllerInfo=" + controllerInfo);
                    }
                    cb.send(-1, null);
                }
            }
        });
    }

    private void disconnect(Bundle extras) {
        final MediaSession2.ControllerInfo controllerInfo = createControllerInfo(extras);
        this.mSession.getCallbackExecutor().execute(new Runnable() { // from class: androidx.media.MediaSession2Stub.5
            @Override // java.lang.Runnable
            public void run() {
                if (MediaSession2Stub.this.mSession.isClosed()) {
                    return;
                }
                MediaSession2Stub.this.mSession.getCallback().onDisconnected(MediaSession2Stub.this.mSession.getInstance(), controllerInfo);
            }
        });
    }

    final class Controller2Cb extends MediaSession2.ControllerCb {
        private final IMediaControllerCallback mIControllerCallback;

        Controller2Cb(@NonNull IMediaControllerCallback callback) {
            this.mIControllerCallback = callback;
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        @NonNull
        IBinder getId() {
            return this.mIControllerCallback.asBinder();
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onCustomLayoutChanged(List<MediaSession2.CommandButton> layout) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putParcelableArray("androidx.media.argument.COMMAND_BUTTONS", MediaUtils2.toCommandButtonParcelableArray(layout));
            this.mIControllerCallback.onEvent("androidx.media.session.event.SET_CUSTOM_LAYOUT", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onPlaybackInfoChanged(MediaController2.PlaybackInfo info) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putBundle("androidx.media.argument.PLAYBACK_INFO", info.toBundle());
            this.mIControllerCallback.onEvent("androidx.media.session.event.ON_PLAYBACK_INFO_CHANGED", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onAllowedCommandsChanged(SessionCommandGroup2 commands) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putBundle("androidx.media.argument.ALLOWED_COMMANDS", commands.toBundle());
            this.mIControllerCallback.onEvent("androidx.media.session.event.ON_ALLOWED_COMMANDS_CHANGED", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onCustomCommand(SessionCommand2 command, Bundle args, ResultReceiver receiver) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putBundle("androidx.media.argument.CUSTOM_COMMAND", command.toBundle());
            bundle.putBundle("androidx.media.argument.ARGUMENTS", args);
            bundle.putParcelable("androidx.media.argument.RESULT_RECEIVER", receiver);
            this.mIControllerCallback.onEvent("androidx.media.session.event.SEND_CUSTOM_COMMAND", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onPlayerStateChanged(int playerState) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putInt("androidx.media.argument.PLAYER_STATE", playerState);
            bundle.putParcelable("androidx.media.argument.PLAYBACK_STATE_COMPAT", MediaSession2Stub.this.mSession.getPlaybackStateCompat());
            this.mIControllerCallback.onEvent("androidx.media.session.event.ON_PLAYER_STATE_CHANGED", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onPlaybackSpeedChanged(float speed) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putParcelable("androidx.media.argument.PLAYBACK_STATE_COMPAT", MediaSession2Stub.this.mSession.getPlaybackStateCompat());
            this.mIControllerCallback.onEvent("androidx.media.session.event.ON_PLAYBACK_SPEED_CHANGED", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onBufferingStateChanged(MediaItem2 item, int state) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putBundle("androidx.media.argument.MEDIA_ITEM", item.toBundle());
            bundle.putInt("androidx.media.argument.BUFFERING_STATE", state);
            bundle.putParcelable("androidx.media.argument.PLAYBACK_STATE_COMPAT", MediaSession2Stub.this.mSession.getPlaybackStateCompat());
            this.mIControllerCallback.onEvent("androidx.media.session.event.ON_BUFFERING_STATE_CHANGED", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onSeekCompleted(long position) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putLong("androidx.media.argument.SEEK_POSITION", position);
            bundle.putParcelable("androidx.media.argument.PLAYBACK_STATE_COMPAT", MediaSession2Stub.this.mSession.getPlaybackStateCompat());
            this.mIControllerCallback.onEvent("androidx.media.session.event.ON_SEEK_COMPLETED", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onError(int errorCode, Bundle extras) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putInt("androidx.media.argument.ERROR_CODE", errorCode);
            bundle.putBundle("androidx.media.argument.EXTRAS", extras);
            this.mIControllerCallback.onEvent("androidx.media.session.event.ON_ERROR", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onCurrentMediaItemChanged(MediaItem2 item) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putBundle("androidx.media.argument.MEDIA_ITEM", item == null ? null : item.toBundle());
            this.mIControllerCallback.onEvent("androidx.media.session.event.ON_CURRENT_MEDIA_ITEM_CHANGED", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onPlaylistChanged(List<MediaItem2> playlist, MediaMetadata2 metadata) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putParcelableArray("androidx.media.argument.PLAYLIST", MediaUtils2.toMediaItem2ParcelableArray(playlist));
            bundle.putBundle("androidx.media.argument.PLAYLIST_METADATA", metadata == null ? null : metadata.toBundle());
            this.mIControllerCallback.onEvent("androidx.media.session.event.ON_PLAYLIST_CHANGED", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onPlaylistMetadataChanged(MediaMetadata2 metadata) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putBundle("androidx.media.argument.PLAYLIST_METADATA", metadata == null ? null : metadata.toBundle());
            this.mIControllerCallback.onEvent("androidx.media.session.event.ON_PLAYLIST_METADATA_CHANGED", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onShuffleModeChanged(int shuffleMode) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putInt("androidx.media.argument.SHUFFLE_MODE", shuffleMode);
            this.mIControllerCallback.onEvent("androidx.media.session.event.ON_SHUFFLE_MODE_CHANGED", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onRepeatModeChanged(int repeatMode) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putInt("androidx.media.argument.REPEAT_MODE", repeatMode);
            this.mIControllerCallback.onEvent("androidx.media.session.event.ON_REPEAT_MODE_CHANGED", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onRoutesInfoChanged(List<Bundle> routes) throws RemoteException {
            Bundle bundle = null;
            if (routes != null) {
                bundle = new Bundle();
                bundle.putParcelableArray("androidx.media.argument.ROUTE_BUNDLE", (Parcelable[]) routes.toArray(new Bundle[0]));
            }
            this.mIControllerCallback.onEvent("androidx.media.session.event.ON_ROUTES_INFO_CHANGED", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onChildrenChanged(String parentId, int itemCount, Bundle extras) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putString("androidx.media.argument.MEDIA_ID", parentId);
            bundle.putInt("androidx.media.argument.ITEM_COUNT", itemCount);
            bundle.putBundle("androidx.media.argument.EXTRAS", extras);
            this.mIControllerCallback.onEvent("androidx.media.session.event.ON_CHILDREN_CHANGED", bundle);
        }

        @Override // androidx.media.MediaSession2.ControllerCb
        void onSearchResultChanged(String query, int itemCount, Bundle extras) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putString("androidx.media.argument.QUERY", query);
            bundle.putInt("androidx.media.argument.ITEM_COUNT", itemCount);
            bundle.putBundle("androidx.media.argument.EXTRAS", extras);
            this.mIControllerCallback.onEvent("androidx.media.session.event.ON_SEARCH_RESULT_CHANGED", bundle);
        }
    }
}
