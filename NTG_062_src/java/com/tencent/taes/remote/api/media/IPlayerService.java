package com.tencent.taes.remote.api.media;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.tencent.taes.remote.api.media.bean.MediaBean;
import com.tencent.taes.remote.api.media.listener.IAudioFocusListener;
import com.tencent.taes.remote.api.media.listener.IPlayListListener;
import com.tencent.taes.remote.api.media.listener.IPlayModeListener;
import com.tencent.taes.remote.api.media.listener.IPlayerListener;
import com.tencent.taes.remote.api.media.listener.ISearchListener;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface IPlayerService extends IInterface {
    void addAudioFocusListener(IAudioFocusListener iAudioFocusListener) throws RemoteException;

    void addPlayListListener(IPlayListListener iPlayListListener) throws RemoteException;

    void addPlayModeListener(IPlayModeListener iPlayModeListener) throws RemoteException;

    void addSearchListener(ISearchListener iSearchListener) throws RemoteException;

    void decreaseVolume() throws RemoteException;

    void destroy() throws RemoteException;

    int getAudioFocus() throws RemoteException;

    long getCurrentPosition() throws RemoteException;

    long getDuration() throws RemoteException;

    int getFirst() throws RemoteException;

    int getNextWhenComplete(int i) throws RemoteException;

    int getPlayIndex() throws RemoteException;

    List<MediaBean> getPlayList() throws RemoteException;

    List<MediaBean> getPlayListBatch(int i) throws RemoteException;

    int getPlayListSize() throws RemoteException;

    int getPlayMode() throws RemoteException;

    long getUploadPosition() throws RemoteException;

    boolean hasAudioFocus() throws RemoteException;

    void init(Bundle bundle) throws RemoteException;

    void initTTSPlayer() throws RemoteException;

    boolean isBuffering() throws RemoteException;

    boolean isPlaying() throws RemoteException;

    boolean isSeekable() throws RemoteException;

    boolean isSupportShuffleMode() throws RemoteException;

    void likeItem(String str, int i, boolean z) throws RemoteException;

    int next(int i) throws RemoteException;

    void pause(boolean z) throws RemoteException;

    void play(boolean z) throws RemoteException;

    int pre(int i) throws RemoteException;

    void removePlayListener(IPlayListListener iPlayListListener) throws RemoteException;

    void removePlayModeListener(IPlayModeListener iPlayModeListener) throws RemoteException;

    void removeSearchListener(ISearchListener iSearchListener) throws RemoteException;

    void resumeVolume() throws RemoteException;

    void seekTo(long j) throws RemoteException;

    void setDeviceId(String str) throws RemoteException;

    void setPlayIndex(String str, int i) throws RemoteException;

    void setPlayList(String str, List<MediaBean> list) throws RemoteException;

    void setPlayListBatch(String str, List<MediaBean> list, int i, int i2) throws RemoteException;

    void setPlayListener(IPlayerListener iPlayerListener) throws RemoteException;

    void setPlayMode(String str, int i) throws RemoteException;

    void setRecommendMode(String str, int i) throws RemoteException;

    void stop() throws RemoteException;

    void switchPlayMode(String str) throws RemoteException;

    void updateListItem(String str, int i, MediaBean mediaBean) throws RemoteException;

    public static abstract class Stub extends Binder implements IPlayerService {
        private static final String DESCRIPTOR = "com.tencent.taes.remote.api.media.IPlayerService";
        static final int TRANSACTION_addAudioFocusListener = 44;
        static final int TRANSACTION_addPlayListListener = 20;
        static final int TRANSACTION_addPlayModeListener = 31;
        static final int TRANSACTION_addSearchListener = 33;
        static final int TRANSACTION_decreaseVolume = 13;
        static final int TRANSACTION_destroy = 5;
        static final int TRANSACTION_getAudioFocus = 38;
        static final int TRANSACTION_getCurrentPosition = 9;
        static final int TRANSACTION_getDuration = 7;
        static final int TRANSACTION_getFirst = 24;
        static final int TRANSACTION_getNextWhenComplete = 27;
        static final int TRANSACTION_getPlayIndex = 23;
        static final int TRANSACTION_getPlayList = 17;
        static final int TRANSACTION_getPlayListBatch = 18;
        static final int TRANSACTION_getPlayListSize = 19;
        static final int TRANSACTION_getPlayMode = 35;
        static final int TRANSACTION_getUploadPosition = 8;
        static final int TRANSACTION_hasAudioFocus = 6;
        static final int TRANSACTION_init = 1;
        static final int TRANSACTION_initTTSPlayer = 36;
        static final int TRANSACTION_isBuffering = 39;
        static final int TRANSACTION_isPlaying = 11;
        static final int TRANSACTION_isSeekable = 40;
        static final int TRANSACTION_isSupportShuffleMode = 41;
        static final int TRANSACTION_likeItem = 43;
        static final int TRANSACTION_next = 26;
        static final int TRANSACTION_pause = 3;
        static final int TRANSACTION_play = 2;
        static final int TRANSACTION_pre = 25;
        static final int TRANSACTION_removePlayListener = 21;
        static final int TRANSACTION_removePlayModeListener = 32;
        static final int TRANSACTION_removeSearchListener = 34;
        static final int TRANSACTION_resumeVolume = 12;
        static final int TRANSACTION_seekTo = 10;
        static final int TRANSACTION_setDeviceId = 37;
        static final int TRANSACTION_setPlayIndex = 22;
        static final int TRANSACTION_setPlayList = 15;
        static final int TRANSACTION_setPlayListBatch = 16;
        static final int TRANSACTION_setPlayListener = 14;
        static final int TRANSACTION_setPlayMode = 29;
        static final int TRANSACTION_setRecommendMode = 28;
        static final int TRANSACTION_stop = 4;
        static final int TRANSACTION_switchPlayMode = 30;
        static final int TRANSACTION_updateListItem = 42;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IPlayerService asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IPlayerService)) {
                return (IPlayerService) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i == 1598968902) {
                parcel2.writeString(DESCRIPTOR);
                return true;
            }
            switch (i) {
                case 1:
                    parcel.enforceInterface(DESCRIPTOR);
                    init(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                    parcel2.writeNoException();
                    return true;
                case 2:
                    parcel.enforceInterface(DESCRIPTOR);
                    play(parcel.readInt() != 0);
                    parcel2.writeNoException();
                    return true;
                case 3:
                    parcel.enforceInterface(DESCRIPTOR);
                    pause(parcel.readInt() != 0);
                    parcel2.writeNoException();
                    return true;
                case 4:
                    parcel.enforceInterface(DESCRIPTOR);
                    stop();
                    parcel2.writeNoException();
                    return true;
                case 5:
                    parcel.enforceInterface(DESCRIPTOR);
                    destroy();
                    parcel2.writeNoException();
                    return true;
                case 6:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zHasAudioFocus = hasAudioFocus();
                    parcel2.writeNoException();
                    parcel2.writeInt(zHasAudioFocus ? 1 : 0);
                    return true;
                case 7:
                    parcel.enforceInterface(DESCRIPTOR);
                    long duration = getDuration();
                    parcel2.writeNoException();
                    parcel2.writeLong(duration);
                    return true;
                case 8:
                    parcel.enforceInterface(DESCRIPTOR);
                    long uploadPosition = getUploadPosition();
                    parcel2.writeNoException();
                    parcel2.writeLong(uploadPosition);
                    return true;
                case 9:
                    parcel.enforceInterface(DESCRIPTOR);
                    long currentPosition = getCurrentPosition();
                    parcel2.writeNoException();
                    parcel2.writeLong(currentPosition);
                    return true;
                case 10:
                    parcel.enforceInterface(DESCRIPTOR);
                    seekTo(parcel.readLong());
                    parcel2.writeNoException();
                    return true;
                case 11:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zIsPlaying = isPlaying();
                    parcel2.writeNoException();
                    parcel2.writeInt(zIsPlaying ? 1 : 0);
                    return true;
                case 12:
                    parcel.enforceInterface(DESCRIPTOR);
                    resumeVolume();
                    parcel2.writeNoException();
                    return true;
                case 13:
                    parcel.enforceInterface(DESCRIPTOR);
                    decreaseVolume();
                    parcel2.writeNoException();
                    return true;
                case 14:
                    parcel.enforceInterface(DESCRIPTOR);
                    setPlayListener(IPlayerListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 15:
                    parcel.enforceInterface(DESCRIPTOR);
                    setPlayList(parcel.readString(), parcel.createTypedArrayList(MediaBean.CREATOR));
                    parcel2.writeNoException();
                    return true;
                case 16:
                    parcel.enforceInterface(DESCRIPTOR);
                    setPlayListBatch(parcel.readString(), parcel.createTypedArrayList(MediaBean.CREATOR), parcel.readInt(), parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 17:
                    parcel.enforceInterface(DESCRIPTOR);
                    List<MediaBean> playList = getPlayList();
                    parcel2.writeNoException();
                    parcel2.writeTypedList(playList);
                    return true;
                case 18:
                    parcel.enforceInterface(DESCRIPTOR);
                    List<MediaBean> playListBatch = getPlayListBatch(parcel.readInt());
                    parcel2.writeNoException();
                    parcel2.writeTypedList(playListBatch);
                    return true;
                case 19:
                    parcel.enforceInterface(DESCRIPTOR);
                    int playListSize = getPlayListSize();
                    parcel2.writeNoException();
                    parcel2.writeInt(playListSize);
                    return true;
                case 20:
                    parcel.enforceInterface(DESCRIPTOR);
                    addPlayListListener(IPlayListListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 21:
                    parcel.enforceInterface(DESCRIPTOR);
                    removePlayListener(IPlayListListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 22:
                    parcel.enforceInterface(DESCRIPTOR);
                    setPlayIndex(parcel.readString(), parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 23:
                    parcel.enforceInterface(DESCRIPTOR);
                    int playIndex = getPlayIndex();
                    parcel2.writeNoException();
                    parcel2.writeInt(playIndex);
                    return true;
                case 24:
                    parcel.enforceInterface(DESCRIPTOR);
                    int first = getFirst();
                    parcel2.writeNoException();
                    parcel2.writeInt(first);
                    return true;
                case 25:
                    parcel.enforceInterface(DESCRIPTOR);
                    int iPre = pre(parcel.readInt());
                    parcel2.writeNoException();
                    parcel2.writeInt(iPre);
                    return true;
                case 26:
                    parcel.enforceInterface(DESCRIPTOR);
                    int next = next(parcel.readInt());
                    parcel2.writeNoException();
                    parcel2.writeInt(next);
                    return true;
                case 27:
                    parcel.enforceInterface(DESCRIPTOR);
                    int nextWhenComplete = getNextWhenComplete(parcel.readInt());
                    parcel2.writeNoException();
                    parcel2.writeInt(nextWhenComplete);
                    return true;
                case 28:
                    parcel.enforceInterface(DESCRIPTOR);
                    setRecommendMode(parcel.readString(), parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 29:
                    parcel.enforceInterface(DESCRIPTOR);
                    setPlayMode(parcel.readString(), parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 30:
                    parcel.enforceInterface(DESCRIPTOR);
                    switchPlayMode(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 31:
                    parcel.enforceInterface(DESCRIPTOR);
                    addPlayModeListener(IPlayModeListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 32:
                    parcel.enforceInterface(DESCRIPTOR);
                    removePlayModeListener(IPlayModeListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 33:
                    parcel.enforceInterface(DESCRIPTOR);
                    addSearchListener(ISearchListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 34:
                    parcel.enforceInterface(DESCRIPTOR);
                    removeSearchListener(ISearchListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 35:
                    parcel.enforceInterface(DESCRIPTOR);
                    int playMode = getPlayMode();
                    parcel2.writeNoException();
                    parcel2.writeInt(playMode);
                    return true;
                case 36:
                    parcel.enforceInterface(DESCRIPTOR);
                    initTTSPlayer();
                    parcel2.writeNoException();
                    return true;
                case 37:
                    parcel.enforceInterface(DESCRIPTOR);
                    setDeviceId(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 38:
                    parcel.enforceInterface(DESCRIPTOR);
                    int audioFocus = getAudioFocus();
                    parcel2.writeNoException();
                    parcel2.writeInt(audioFocus);
                    return true;
                case 39:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zIsBuffering = isBuffering();
                    parcel2.writeNoException();
                    parcel2.writeInt(zIsBuffering ? 1 : 0);
                    return true;
                case 40:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zIsSeekable = isSeekable();
                    parcel2.writeNoException();
                    parcel2.writeInt(zIsSeekable ? 1 : 0);
                    return true;
                case 41:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zIsSupportShuffleMode = isSupportShuffleMode();
                    parcel2.writeNoException();
                    parcel2.writeInt(zIsSupportShuffleMode ? 1 : 0);
                    return true;
                case 42:
                    parcel.enforceInterface(DESCRIPTOR);
                    updateListItem(parcel.readString(), parcel.readInt(), parcel.readInt() != 0 ? MediaBean.CREATOR.createFromParcel(parcel) : null);
                    parcel2.writeNoException();
                    return true;
                case 43:
                    parcel.enforceInterface(DESCRIPTOR);
                    likeItem(parcel.readString(), parcel.readInt(), parcel.readInt() != 0);
                    parcel2.writeNoException();
                    return true;
                case 44:
                    parcel.enforceInterface(DESCRIPTOR);
                    addAudioFocusListener(IAudioFocusListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }

        private static class Proxy implements IPlayerService {
            private IBinder mRemote;

            Proxy(IBinder remote) {
                this.mRemote = remote;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void init(Bundle bundle) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (bundle != null) {
                        _data.writeInt(1);
                        bundle.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void play(boolean z) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    parcelObtain.writeInt(z ? 1 : 0);
                    this.mRemote.transact(2, parcelObtain, parcelObtain2, 0);
                    parcelObtain2.readException();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void pause(boolean z) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    parcelObtain.writeInt(z ? 1 : 0);
                    this.mRemote.transact(3, parcelObtain, parcelObtain2, 0);
                    parcelObtain2.readException();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void stop() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(4, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void destroy() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(5, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public boolean hasAudioFocus() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(6, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public long getDuration() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(7, _data, _reply, 0);
                    _reply.readException();
                    long _result = _reply.readLong();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public long getUploadPosition() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(8, _data, _reply, 0);
                    _reply.readException();
                    long _result = _reply.readLong();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public long getCurrentPosition() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(9, _data, _reply, 0);
                    _reply.readException();
                    long _result = _reply.readLong();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void seekTo(long position) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeLong(position);
                    this.mRemote.transact(10, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public boolean isPlaying() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(11, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void resumeVolume() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(12, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void decreaseVolume() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(13, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void setPlayListener(IPlayerListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(14, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void setPlayList(String pkgName, List<MediaBean> list) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkgName);
                    _data.writeTypedList(list);
                    this.mRemote.transact(15, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void setPlayListBatch(String pkgName, List<MediaBean> list, int page, int totalPage) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkgName);
                    _data.writeTypedList(list);
                    _data.writeInt(page);
                    _data.writeInt(totalPage);
                    this.mRemote.transact(16, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public List<MediaBean> getPlayList() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(17, _data, _reply, 0);
                    _reply.readException();
                    List<MediaBean> _result = _reply.createTypedArrayList(MediaBean.CREATOR);
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public List<MediaBean> getPlayListBatch(int page) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(page);
                    this.mRemote.transact(18, _data, _reply, 0);
                    _reply.readException();
                    List<MediaBean> _result = _reply.createTypedArrayList(MediaBean.CREATOR);
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public int getPlayListSize() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(19, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void addPlayListListener(IPlayListListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(20, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void removePlayListener(IPlayListListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(21, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void setPlayIndex(String pkgName, int index) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkgName);
                    _data.writeInt(index);
                    this.mRemote.transact(22, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public int getPlayIndex() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(23, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public int getFirst() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(24, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public int pre(int current) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(current);
                    this.mRemote.transact(25, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public int next(int current) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(current);
                    this.mRemote.transact(26, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public int getNextWhenComplete(int current) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(current);
                    this.mRemote.transact(27, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void setRecommendMode(String pkgName, int mode) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkgName);
                    _data.writeInt(mode);
                    this.mRemote.transact(28, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void setPlayMode(String pkgName, int mode) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkgName);
                    _data.writeInt(mode);
                    this.mRemote.transact(29, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void switchPlayMode(String pkgName) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkgName);
                    this.mRemote.transact(30, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void addPlayModeListener(IPlayModeListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(31, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void removePlayModeListener(IPlayModeListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(32, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void addSearchListener(ISearchListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(33, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void removeSearchListener(ISearchListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(34, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public int getPlayMode() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(35, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void initTTSPlayer() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(36, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void setDeviceId(String deviceId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(deviceId);
                    this.mRemote.transact(37, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public int getAudioFocus() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(38, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public boolean isBuffering() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(39, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public boolean isSeekable() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(40, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public boolean isSupportShuffleMode() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(41, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void updateListItem(String pkgName, int index, MediaBean bean) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkgName);
                    _data.writeInt(index);
                    if (bean != null) {
                        _data.writeInt(1);
                        bean.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(42, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void likeItem(String str, int i, boolean z) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    parcelObtain.writeString(str);
                    parcelObtain.writeInt(i);
                    parcelObtain.writeInt(z ? 1 : 0);
                    this.mRemote.transact(43, parcelObtain, parcelObtain2, 0);
                    parcelObtain2.readException();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.media.IPlayerService
            public void addAudioFocusListener(IAudioFocusListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(44, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
