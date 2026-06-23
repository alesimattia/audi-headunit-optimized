package com.tencent.taes.remote.api.infodispatcher;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.tencent.taes.remote.api.infodispatcher.listener.IInfoDispatchListener;

/* JADX INFO: loaded from: classes.dex */
public interface IInfoDispatchService extends IInterface {
    void registerInfoDispatchListener(IInfoDispatchListener iInfoDispatchListener) throws RemoteException;

    void sendMessage(String str, String str2) throws RemoteException;

    void unregisterInfoDispatchListener(IInfoDispatchListener iInfoDispatchListener) throws RemoteException;

    public static abstract class Stub extends Binder implements IInfoDispatchService {
        private static final String DESCRIPTOR = "com.tencent.taes.remote.api.infodispatcher.IInfoDispatchService";
        static final int TRANSACTION_registerInfoDispatchListener = 2;
        static final int TRANSACTION_sendMessage = 1;
        static final int TRANSACTION_unregisterInfoDispatchListener = 3;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IInfoDispatchService asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IInfoDispatchService)) {
                return (IInfoDispatchService) iin;
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
                    sendMessage(_arg0, _arg1);
                    reply.writeNoException();
                    return true;
                case 2:
                    data.enforceInterface(DESCRIPTOR);
                    IInfoDispatchListener _arg02 = IInfoDispatchListener.Stub.asInterface(data.readStrongBinder());
                    registerInfoDispatchListener(_arg02);
                    reply.writeNoException();
                    return true;
                case 3:
                    data.enforceInterface(DESCRIPTOR);
                    IInfoDispatchListener _arg03 = IInfoDispatchListener.Stub.asInterface(data.readStrongBinder());
                    unregisterInfoDispatchListener(_arg03);
                    reply.writeNoException();
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }

        private static class Proxy implements IInfoDispatchService {
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

            @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchService
            public void sendMessage(String appid, String jsonStr) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(appid);
                    _data.writeString(jsonStr);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchService
            public void registerInfoDispatchListener(IInfoDispatchListener listener) throws RemoteException {
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

            @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchService
            public void unregisterInfoDispatchListener(IInfoDispatchListener listener) throws RemoteException {
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
