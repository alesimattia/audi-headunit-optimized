package com.tencent.taes.remote.api.search.listener;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.tencent.taes.remote.api.search.bean.PoiSearchResult;

/* JADX INFO: loaded from: classes.dex */
public interface IPoiSearchListener extends IInterface {
    void onResult(String str, PoiSearchResult poiSearchResult) throws RemoteException;

    public static abstract class Stub extends Binder implements IPoiSearchListener {
        private static final String DESCRIPTOR = "com.tencent.taes.remote.api.search.listener.IPoiSearchListener";
        static final int TRANSACTION_onResult = 1;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IPoiSearchListener asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IPoiSearchListener)) {
                return (IPoiSearchListener) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            PoiSearchResult _arg1;
            if (code != 1) {
                if (code == 1598968902) {
                    reply.writeString(DESCRIPTOR);
                    return true;
                }
                return super.onTransact(code, data, reply, flags);
            }
            data.enforceInterface(DESCRIPTOR);
            String _arg0 = data.readString();
            if (data.readInt() != 0) {
                _arg1 = PoiSearchResult.CREATOR.createFromParcel(data);
            } else {
                _arg1 = null;
            }
            onResult(_arg0, _arg1);
            reply.writeNoException();
            return true;
        }

        private static class Proxy implements IPoiSearchListener {
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

            @Override // com.tencent.taes.remote.api.search.listener.IPoiSearchListener
            public void onResult(String taskId, PoiSearchResult result) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(taskId);
                    if (result != null) {
                        _data.writeInt(1);
                        result.writeToParcel(_data, 0);
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
