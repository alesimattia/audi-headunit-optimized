package com.tencent.taes.remote.api.tts.listener;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* JADX INFO: loaded from: classes.dex */
public interface ITtsPlayCallback extends IInterface {
    void onError(int i, String str, String str2, String str3) throws RemoteException;

    void onPlayBegin(String str, String str2) throws RemoteException;

    void onPlayCompleted(String str, String str2) throws RemoteException;

    void onPlayInterrupted(String str, String str2) throws RemoteException;

    void onProgressReturn(int i, int i2, String str, String str2) throws RemoteException;

    public static abstract class Stub extends Binder implements ITtsPlayCallback {
        private static final String DESCRIPTOR = "com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback";
        static final int TRANSACTION_onError = 4;
        static final int TRANSACTION_onPlayBegin = 1;
        static final int TRANSACTION_onPlayCompleted = 2;
        static final int TRANSACTION_onPlayInterrupted = 3;
        static final int TRANSACTION_onProgressReturn = 5;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static ITtsPlayCallback asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof ITtsPlayCallback)) {
                return (ITtsPlayCallback) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code == 1598968902) {
                reply.writeString(DESCRIPTOR);
                return true;
            }
            switch (code) {
                case 1:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg0 = data.readString();
                    String _arg1 = data.readString();
                    onPlayBegin(_arg0, _arg1);
                    reply.writeNoException();
                    return true;
                case 2:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg02 = data.readString();
                    String _arg12 = data.readString();
                    onPlayCompleted(_arg02, _arg12);
                    reply.writeNoException();
                    return true;
                case 3:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg03 = data.readString();
                    String _arg13 = data.readString();
                    onPlayInterrupted(_arg03, _arg13);
                    reply.writeNoException();
                    return true;
                case 4:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg04 = data.readInt();
                    String _arg14 = data.readString();
                    String _arg2 = data.readString();
                    String _arg3 = data.readString();
                    onError(_arg04, _arg14, _arg2, _arg3);
                    reply.writeNoException();
                    return true;
                case 5:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg05 = data.readInt();
                    int _arg15 = data.readInt();
                    String _arg22 = data.readString();
                    String _arg32 = data.readString();
                    onProgressReturn(_arg05, _arg15, _arg22, _arg32);
                    reply.writeNoException();
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }

        private static class Proxy implements ITtsPlayCallback {
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

            @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
            public void onPlayBegin(String sMsgId, String sText) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(sMsgId);
                    _data.writeString(sText);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
            public void onPlayCompleted(String sMsgId, String sText) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(sMsgId);
                    _data.writeString(sText);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
            public void onPlayInterrupted(String sMsgId, String sText) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(sMsgId);
                    _data.writeString(sText);
                    this.mRemote.transact(3, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
            public void onError(int errorCode, String msg, String sMsgId, String sText) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(errorCode);
                    _data.writeString(msg);
                    _data.writeString(sMsgId);
                    _data.writeString(sText);
                    this.mRemote.transact(4, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
            public void onProgressReturn(int textindex, int textlen, String sMsgId, String sText) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(textindex);
                    _data.writeInt(textlen);
                    _data.writeString(sMsgId);
                    _data.writeString(sText);
                    this.mRemote.transact(5, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
