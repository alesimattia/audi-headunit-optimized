package com.tencent.taes.remote.api.tts;

import android.media.AudioAttributes;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.tencent.taes.remote.api.tts.listener.IPlayingCallback;
import com.tencent.taes.remote.api.tts.listener.IQrCodeCallback;
import com.tencent.taes.remote.api.tts.listener.ISpeakerCallback;
import com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback;
import com.tencent.taes.remote.api.tts.listener.ITtsResponseCallback;
import com.tencent.taes.remote.api.tts.listener.ITtsSpeakerCallback;

/* JADX INFO: loaded from: classes.dex */
public interface ITtsService extends IInterface {
    void addPlayingListener(IPlayingCallback iPlayingCallback) throws RemoteException;

    void addSpeakerListener(ISpeakerCallback iSpeakerCallback) throws RemoteException;

    void addTtsSpeakerListener(ITtsSpeakerCallback iTtsSpeakerCallback) throws RemoteException;

    void getAppendTtsSpeakerList(String str, String str2, ITtsResponseCallback iTtsResponseCallback) throws RemoteException;

    String[] getAvailableTtsSpeaker() throws RemoteException;

    String getCustomSpeaker() throws RemoteException;

    void getQrCodeUrl(String str, String str2, IQrCodeCallback iQrCodeCallback) throws RemoteException;

    int getSpeaker() throws RemoteException;

    boolean getTtsRecordPcmValue() throws RemoteException;

    String getTtsSpeaker() throws RemoteException;

    String getVersion() throws RemoteException;

    void initTts(int i) throws RemoteException;

    boolean isInited() throws RemoteException;

    boolean isOfficialTtsSpeaker() throws RemoteException;

    String playTts(String str, int i, int i2, ITtsPlayCallback iTtsPlayCallback, boolean z) throws RemoteException;

    String playTtsByAudioAttribute(String str, int i, ITtsPlayCallback iTtsPlayCallback, AudioAttributes audioAttributes) throws RemoteException;

    void registerTtsSpeakerNotification(ITtsResponseCallback iTtsResponseCallback) throws RemoteException;

    int setAppendTtsSpeakerPath(String str) throws RemoteException;

    void setCustomSpeaker(String str) throws RemoteException;

    void setOfficialSpeaker() throws RemoteException;

    void setSpeaker(int i) throws RemoteException;

    void setTtsRecordPcm(boolean z) throws RemoteException;

    void setTtsSpeaker(String str) throws RemoteException;

    void stopPlay(String str) throws RemoteException;

    void unRegisterTtsSpeakerNotification() throws RemoteException;

    public static abstract class Stub extends Binder implements ITtsService {
        private static final String DESCRIPTOR = "com.tencent.taes.remote.api.tts.ITtsService";
        static final int TRANSACTION_addPlayingListener = 9;
        static final int TRANSACTION_addSpeakerListener = 8;
        static final int TRANSACTION_addTtsSpeakerListener = 12;
        static final int TRANSACTION_getAppendTtsSpeakerList = 18;
        static final int TRANSACTION_getAvailableTtsSpeaker = 15;
        static final int TRANSACTION_getCustomSpeaker = 25;
        static final int TRANSACTION_getQrCodeUrl = 17;
        static final int TRANSACTION_getSpeaker = 7;
        static final int TRANSACTION_getTtsRecordPcmValue = 22;
        static final int TRANSACTION_getTtsSpeaker = 11;
        static final int TRANSACTION_getVersion = 16;
        static final int TRANSACTION_initTts = 1;
        static final int TRANSACTION_isInited = 2;
        static final int TRANSACTION_isOfficialTtsSpeaker = 14;
        static final int TRANSACTION_playTts = 3;
        static final int TRANSACTION_playTtsByAudioAttribute = 4;
        static final int TRANSACTION_registerTtsSpeakerNotification = 19;
        static final int TRANSACTION_setAppendTtsSpeakerPath = 13;
        static final int TRANSACTION_setCustomSpeaker = 24;
        static final int TRANSACTION_setOfficialSpeaker = 23;
        static final int TRANSACTION_setSpeaker = 6;
        static final int TRANSACTION_setTtsRecordPcm = 21;
        static final int TRANSACTION_setTtsSpeaker = 10;
        static final int TRANSACTION_stopPlay = 5;
        static final int TRANSACTION_unRegisterTtsSpeakerNotification = 20;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static ITtsService asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof ITtsService)) {
                return (ITtsService) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            AudioAttributes audioAttributes;
            if (i == 1598968902) {
                parcel2.writeString(DESCRIPTOR);
                return true;
            }
            switch (i) {
                case 1:
                    parcel.enforceInterface(DESCRIPTOR);
                    initTts(parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 2:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zIsInited = isInited();
                    parcel2.writeNoException();
                    parcel2.writeInt(zIsInited ? 1 : 0);
                    return true;
                case 3:
                    parcel.enforceInterface(DESCRIPTOR);
                    String strPlayTts = playTts(parcel.readString(), parcel.readInt(), parcel.readInt(), ITtsPlayCallback.Stub.asInterface(parcel.readStrongBinder()), parcel.readInt() != 0);
                    parcel2.writeNoException();
                    parcel2.writeString(strPlayTts);
                    return true;
                case 4:
                    parcel.enforceInterface(DESCRIPTOR);
                    String string = parcel.readString();
                    int i3 = parcel.readInt();
                    ITtsPlayCallback iTtsPlayCallbackAsInterface = ITtsPlayCallback.Stub.asInterface(parcel.readStrongBinder());
                    if (parcel.readInt() != 0) {
                        audioAttributes = (AudioAttributes) AudioAttributes.CREATOR.createFromParcel(parcel);
                    } else {
                        audioAttributes = null;
                    }
                    String strPlayTtsByAudioAttribute = playTtsByAudioAttribute(string, i3, iTtsPlayCallbackAsInterface, audioAttributes);
                    parcel2.writeNoException();
                    parcel2.writeString(strPlayTtsByAudioAttribute);
                    return true;
                case 5:
                    parcel.enforceInterface(DESCRIPTOR);
                    stopPlay(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 6:
                    parcel.enforceInterface(DESCRIPTOR);
                    setSpeaker(parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 7:
                    parcel.enforceInterface(DESCRIPTOR);
                    int speaker = getSpeaker();
                    parcel2.writeNoException();
                    parcel2.writeInt(speaker);
                    return true;
                case 8:
                    parcel.enforceInterface(DESCRIPTOR);
                    addSpeakerListener(ISpeakerCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 9:
                    parcel.enforceInterface(DESCRIPTOR);
                    addPlayingListener(IPlayingCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 10:
                    parcel.enforceInterface(DESCRIPTOR);
                    setTtsSpeaker(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 11:
                    parcel.enforceInterface(DESCRIPTOR);
                    String ttsSpeaker = getTtsSpeaker();
                    parcel2.writeNoException();
                    parcel2.writeString(ttsSpeaker);
                    return true;
                case 12:
                    parcel.enforceInterface(DESCRIPTOR);
                    addTtsSpeakerListener(ITtsSpeakerCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 13:
                    parcel.enforceInterface(DESCRIPTOR);
                    int appendTtsSpeakerPath = setAppendTtsSpeakerPath(parcel.readString());
                    parcel2.writeNoException();
                    parcel2.writeInt(appendTtsSpeakerPath);
                    return true;
                case 14:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zIsOfficialTtsSpeaker = isOfficialTtsSpeaker();
                    parcel2.writeNoException();
                    parcel2.writeInt(zIsOfficialTtsSpeaker ? 1 : 0);
                    return true;
                case 15:
                    parcel.enforceInterface(DESCRIPTOR);
                    String[] availableTtsSpeaker = getAvailableTtsSpeaker();
                    parcel2.writeNoException();
                    parcel2.writeStringArray(availableTtsSpeaker);
                    return true;
                case 16:
                    parcel.enforceInterface(DESCRIPTOR);
                    String version = getVersion();
                    parcel2.writeNoException();
                    parcel2.writeString(version);
                    return true;
                case 17:
                    parcel.enforceInterface(DESCRIPTOR);
                    getQrCodeUrl(parcel.readString(), parcel.readString(), IQrCodeCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 18:
                    parcel.enforceInterface(DESCRIPTOR);
                    getAppendTtsSpeakerList(parcel.readString(), parcel.readString(), ITtsResponseCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 19:
                    parcel.enforceInterface(DESCRIPTOR);
                    registerTtsSpeakerNotification(ITtsResponseCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 20:
                    parcel.enforceInterface(DESCRIPTOR);
                    unRegisterTtsSpeakerNotification();
                    parcel2.writeNoException();
                    return true;
                case 21:
                    parcel.enforceInterface(DESCRIPTOR);
                    setTtsRecordPcm(parcel.readInt() != 0);
                    parcel2.writeNoException();
                    return true;
                case 22:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean ttsRecordPcmValue = getTtsRecordPcmValue();
                    parcel2.writeNoException();
                    parcel2.writeInt(ttsRecordPcmValue ? 1 : 0);
                    return true;
                case 23:
                    parcel.enforceInterface(DESCRIPTOR);
                    setOfficialSpeaker();
                    parcel2.writeNoException();
                    return true;
                case 24:
                    parcel.enforceInterface(DESCRIPTOR);
                    setCustomSpeaker(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 25:
                    parcel.enforceInterface(DESCRIPTOR);
                    String customSpeaker = getCustomSpeaker();
                    parcel2.writeNoException();
                    parcel2.writeString(customSpeaker);
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }

        private static class Proxy implements ITtsService {
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

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public void initTts(int playerType) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(playerType);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public boolean isInited() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public String playTts(String str, int i, int i2, ITtsPlayCallback iTtsPlayCallback, boolean z) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    parcelObtain.writeString(str);
                    parcelObtain.writeInt(i);
                    parcelObtain.writeInt(i2);
                    parcelObtain.writeStrongBinder(iTtsPlayCallback != null ? iTtsPlayCallback.asBinder() : null);
                    parcelObtain.writeInt(z ? 1 : 0);
                    this.mRemote.transact(3, parcelObtain, parcelObtain2, 0);
                    parcelObtain2.readException();
                    return parcelObtain2.readString();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public String playTtsByAudioAttribute(String text, int speedLevel, ITtsPlayCallback listener, AudioAttributes audioAttributes) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(text);
                    _data.writeInt(speedLevel);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    if (audioAttributes != null) {
                        _data.writeInt(1);
                        audioAttributes.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(4, _data, _reply, 0);
                    _reply.readException();
                    String _result = _reply.readString();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public void stopPlay(String msgId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(msgId);
                    this.mRemote.transact(5, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public void setSpeaker(int speaker) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(speaker);
                    this.mRemote.transact(6, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public int getSpeaker() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(7, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public void addSpeakerListener(ISpeakerCallback listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(8, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public void addPlayingListener(IPlayingCallback listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(9, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public void setTtsSpeaker(String speaker) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(speaker);
                    this.mRemote.transact(10, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public String getTtsSpeaker() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(11, _data, _reply, 0);
                    _reply.readException();
                    String _result = _reply.readString();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public void addTtsSpeakerListener(ITtsSpeakerCallback listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(12, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public int setAppendTtsSpeakerPath(String path) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(path);
                    this.mRemote.transact(13, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public boolean isOfficialTtsSpeaker() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(14, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public String[] getAvailableTtsSpeaker() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(15, _data, _reply, 0);
                    _reply.readException();
                    String[] _result = _reply.createStringArray();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public String getVersion() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(16, _data, _reply, 0);
                    _reply.readException();
                    String _result = _reply.readString();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public void getQrCodeUrl(String userId, String weCarId, IQrCodeCallback listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(userId);
                    _data.writeString(weCarId);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(17, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public void getAppendTtsSpeakerList(String userId, String weCarId, ITtsResponseCallback listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(userId);
                    _data.writeString(weCarId);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(18, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public void registerTtsSpeakerNotification(ITtsResponseCallback listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(19, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public void unRegisterTtsSpeakerNotification() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(20, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public void setTtsRecordPcm(boolean z) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    parcelObtain.writeInt(z ? 1 : 0);
                    this.mRemote.transact(21, parcelObtain, parcelObtain2, 0);
                    parcelObtain2.readException();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public boolean getTtsRecordPcmValue() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(22, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public void setOfficialSpeaker() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(23, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public void setCustomSpeaker(String customSpeaker) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(customSpeaker);
                    this.mRemote.transact(24, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.ITtsService
            public String getCustomSpeaker() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(25, _data, _reply, 0);
                    _reply.readException();
                    String _result = _reply.readString();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
