package com.tencent.taes.remote.api.operate.listener;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.tencent.taes.remote.api.operate.bean.SceneStatusBannerInfo;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface IStatusBannerInfoListener extends IInterface {
    void onSceneBannerInfo(List<SceneStatusBannerInfo> list) throws RemoteException;

    public static abstract class Stub extends Binder implements IStatusBannerInfoListener {
        private static final String DESCRIPTOR = "com.tencent.taes.remote.api.operate.listener.IStatusBannerInfoListener";
        static final int TRANSACTION_onSceneBannerInfo = 1;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IStatusBannerInfoListener asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IStatusBannerInfoListener)) {
                return (IStatusBannerInfoListener) iin;
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
            List<SceneStatusBannerInfo> _arg0 = data.createTypedArrayList(SceneStatusBannerInfo.CREATOR);
            onSceneBannerInfo(_arg0);
            reply.writeNoException();
            return true;
        }

        private static class Proxy implements IStatusBannerInfoListener {
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

            @Override // com.tencent.taes.remote.api.operate.listener.IStatusBannerInfoListener
            public void onSceneBannerInfo(List<SceneStatusBannerInfo> info) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeTypedList(info);
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
