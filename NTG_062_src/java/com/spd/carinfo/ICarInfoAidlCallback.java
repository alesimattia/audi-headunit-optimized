package com.spd.carinfo;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* JADX INFO: loaded from: classes.dex */
public interface ICarInfoAidlCallback extends IInterface {
    void onCarInfoBundleChanged(int i, Bundle bundle, int i2) throws RemoteException;

    void onCarInfoFloatChanged(int i, float f, int i2) throws RemoteException;

    void onCarInfoIntChanged(int i, int i2, int i3) throws RemoteException;

    void onCarInfoStringChanged(int i, String str, int i2) throws RemoteException;

    public static abstract class Stub extends Binder implements ICarInfoAidlCallback {
        private static final String DESCRIPTOR = "com.spd.carinfo.ICarInfoAidlCallback";
        static final int TRANSACTION_onCarInfoBundleChanged = 4;
        static final int TRANSACTION_onCarInfoFloatChanged = 2;
        static final int TRANSACTION_onCarInfoIntChanged = 1;
        static final int TRANSACTION_onCarInfoStringChanged = 3;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static ICarInfoAidlCallback asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof ICarInfoAidlCallback)) {
                return (ICarInfoAidlCallback) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            Bundle _arg1;
            if (code == 1598968902) {
                reply.writeString(DESCRIPTOR);
                return true;
            }
            switch (code) {
                case 1:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg0 = data.readInt();
                    int _arg12 = data.readInt();
                    int _arg2 = data.readInt();
                    onCarInfoIntChanged(_arg0, _arg12, _arg2);
                    reply.writeNoException();
                    return true;
                case 2:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg02 = data.readInt();
                    float _arg13 = data.readFloat();
                    int _arg22 = data.readInt();
                    onCarInfoFloatChanged(_arg02, _arg13, _arg22);
                    reply.writeNoException();
                    return true;
                case 3:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg03 = data.readInt();
                    String _arg14 = data.readString();
                    int _arg23 = data.readInt();
                    onCarInfoStringChanged(_arg03, _arg14, _arg23);
                    reply.writeNoException();
                    return true;
                case 4:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg04 = data.readInt();
                    if (data.readInt() != 0) {
                        _arg1 = (Bundle) Bundle.CREATOR.createFromParcel(data);
                    } else {
                        _arg1 = null;
                    }
                    int _arg24 = data.readInt();
                    onCarInfoBundleChanged(_arg04, _arg1, _arg24);
                    reply.writeNoException();
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }

        private static class Proxy implements ICarInfoAidlCallback {
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

            @Override // com.spd.carinfo.ICarInfoAidlCallback
            public void onCarInfoIntChanged(int what, int arg0, int arg1) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(what);
                    _data.writeInt(arg0);
                    _data.writeInt(arg1);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.carinfo.ICarInfoAidlCallback
            public void onCarInfoFloatChanged(int what, float arg0, int arg1) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(what);
                    _data.writeFloat(arg0);
                    _data.writeInt(arg1);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.carinfo.ICarInfoAidlCallback
            public void onCarInfoStringChanged(int what, String arg0, int arg1) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(what);
                    _data.writeString(arg0);
                    _data.writeInt(arg1);
                    this.mRemote.transact(3, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.carinfo.ICarInfoAidlCallback
            public void onCarInfoBundleChanged(int what, Bundle arg0, int arg1) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(what);
                    if (arg0 != null) {
                        _data.writeInt(1);
                        arg0.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeInt(arg1);
                    this.mRemote.transact(4, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
