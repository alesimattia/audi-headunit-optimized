package com.tencent.taes.remote.api.location.listener;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.tencent.taes.remote.api.location.bean.LocationDistrict;

/* JADX INFO: loaded from: classes.dex */
public interface IDistrictChangedListener extends IInterface {
    void onDistrictChanged(LocationDistrict locationDistrict) throws RemoteException;

    public static abstract class Stub extends Binder implements IDistrictChangedListener {
        private static final String DESCRIPTOR = "com.tencent.taes.remote.api.location.listener.IDistrictChangedListener";
        static final int TRANSACTION_onDistrictChanged = 1;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IDistrictChangedListener asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IDistrictChangedListener)) {
                return (IDistrictChangedListener) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            LocationDistrict _arg0;
            if (code != 1) {
                if (code == 1598968902) {
                    reply.writeString(DESCRIPTOR);
                    return true;
                }
                return super.onTransact(code, data, reply, flags);
            }
            data.enforceInterface(DESCRIPTOR);
            if (data.readInt() != 0) {
                _arg0 = LocationDistrict.CREATOR.createFromParcel(data);
            } else {
                _arg0 = null;
            }
            onDistrictChanged(_arg0);
            reply.writeNoException();
            return true;
        }

        private static class Proxy implements IDistrictChangedListener {
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

            @Override // com.tencent.taes.remote.api.location.listener.IDistrictChangedListener
            public void onDistrictChanged(LocationDistrict district) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (district != null) {
                        _data.writeInt(1);
                        district.writeToParcel(_data, 0);
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
        }
    }
}
