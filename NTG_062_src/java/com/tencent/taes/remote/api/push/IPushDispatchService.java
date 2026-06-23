package com.tencent.taes.remote.api.push;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.tencent.taes.remote.api.push.IPushConnectionStateListener;
import com.tencent.taes.remote.api.push.IPushDispatchListener;

/* JADX INFO: loaded from: classes.dex */
public interface IPushDispatchService extends IInterface {
    void registerMockPushListener(IPushDispatchListener iPushDispatchListener) throws RemoteException;

    void registerPushConnectionStateListener(IPushConnectionStateListener iPushConnectionStateListener) throws RemoteException;

    void registerPushDispatchListener(String str, IPushDispatchListener iPushDispatchListener) throws RemoteException;

    public static abstract class Stub extends Binder implements IPushDispatchService {
        private static final String DESCRIPTOR = "com.tencent.taes.remote.api.push.IPushDispatchService";
        static final int TRANSACTION_registerMockPushListener = 2;
        static final int TRANSACTION_registerPushConnectionStateListener = 3;
        static final int TRANSACTION_registerPushDispatchListener = 1;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IPushDispatchService asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IPushDispatchService)) {
                return (IPushDispatchService) iin;
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
                    IPushDispatchListener _arg1 = IPushDispatchListener.Stub.asInterface(data.readStrongBinder());
                    registerPushDispatchListener(_arg0, _arg1);
                    reply.writeNoException();
                    return true;
                case 2:
                    data.enforceInterface(DESCRIPTOR);
                    IPushDispatchListener _arg02 = IPushDispatchListener.Stub.asInterface(data.readStrongBinder());
                    registerMockPushListener(_arg02);
                    reply.writeNoException();
                    return true;
                case 3:
                    data.enforceInterface(DESCRIPTOR);
                    IPushConnectionStateListener _arg03 = IPushConnectionStateListener.Stub.asInterface(data.readStrongBinder());
                    registerPushConnectionStateListener(_arg03);
                    reply.writeNoException();
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }

        private static class Proxy implements IPushDispatchService {
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

            @Override // com.tencent.taes.remote.api.push.IPushDispatchService
            public void registerPushDispatchListener(String pkgName, IPushDispatchListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkgName);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.push.IPushDispatchService
            public void registerMockPushListener(IPushDispatchListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.push.IPushDispatchService
            public void registerPushConnectionStateListener(IPushConnectionStateListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(3, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
