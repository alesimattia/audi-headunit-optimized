package com.tencent.taes.remote.api.map;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* JADX INFO: loaded from: classes.dex */
public interface IMapSurfaceMonitorListener extends IInterface {
    void onTaskFinish(int i, long j) throws RemoteException;

    public static abstract class Stub extends Binder implements IMapSurfaceMonitorListener {
        private static final String DESCRIPTOR = "com.tencent.taes.remote.api.map.IMapSurfaceMonitorListener";
        static final int TRANSACTION_onTaskFinish = 1;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IMapSurfaceMonitorListener asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IMapSurfaceMonitorListener)) {
                return (IMapSurfaceMonitorListener) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code != 1) {
                if (code == 1598968902) {
                    reply.writeString(DESCRIPTOR);
                    return true;
                }
                return super.onTransact(code, data, reply, flags);
            }
            data.enforceInterface(DESCRIPTOR);
            int _arg0 = data.readInt();
            long _arg1 = data.readLong();
            onTaskFinish(_arg0, _arg1);
            reply.writeNoException();
            return true;
        }

        private static class Proxy implements IMapSurfaceMonitorListener {
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

            @Override // com.tencent.taes.remote.api.map.IMapSurfaceMonitorListener
            public void onTaskFinish(int taskType, long param) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(taskType);
                    _data.writeLong(param);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
