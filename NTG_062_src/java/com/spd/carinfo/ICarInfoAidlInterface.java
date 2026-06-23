package com.spd.carinfo;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.spd.carinfo.ICarInfoAidlCallback;

/* JADX INFO: loaded from: classes.dex */
public interface ICarInfoAidlInterface extends IInterface {
    void enterSource(String str) throws RemoteException;

    void exitSource(String str) throws RemoteException;

    Bundle getBundle(int i, int i2) throws RemoteException;

    float getFloat(int i, int i2) throws RemoteException;

    int getInt(int i, int i2) throws RemoteException;

    String getString(int i, int i2) throws RemoteException;

    void registerCallback(String str, String[] strArr, ICarInfoAidlCallback iCarInfoAidlCallback) throws RemoteException;

    void setBundle(int i, Bundle bundle, int i2) throws RemoteException;

    void setFloat(int i, float f, int i2) throws RemoteException;

    void setInt(int i, int i2, int i3) throws RemoteException;

    void setString(int i, String str, int i2) throws RemoteException;

    void unregisterCallback(String str, String[] strArr) throws RemoteException;

    public static abstract class Stub extends Binder implements ICarInfoAidlInterface {
        private static final String DESCRIPTOR = "com.spd.carinfo.ICarInfoAidlInterface";
        static final int TRANSACTION_enterSource = 3;
        static final int TRANSACTION_exitSource = 4;
        static final int TRANSACTION_getBundle = 12;
        static final int TRANSACTION_getFloat = 10;
        static final int TRANSACTION_getInt = 9;
        static final int TRANSACTION_getString = 11;
        static final int TRANSACTION_registerCallback = 1;
        static final int TRANSACTION_setBundle = 8;
        static final int TRANSACTION_setFloat = 6;
        static final int TRANSACTION_setInt = 5;
        static final int TRANSACTION_setString = 7;
        static final int TRANSACTION_unregisterCallback = 2;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static ICarInfoAidlInterface asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof ICarInfoAidlInterface)) {
                return (ICarInfoAidlInterface) iin;
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
                    String _arg0 = data.readString();
                    String[] _arg12 = data.createStringArray();
                    ICarInfoAidlCallback _arg2 = ICarInfoAidlCallback.Stub.asInterface(data.readStrongBinder());
                    registerCallback(_arg0, _arg12, _arg2);
                    reply.writeNoException();
                    return true;
                case 2:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg02 = data.readString();
                    String[] _arg13 = data.createStringArray();
                    unregisterCallback(_arg02, _arg13);
                    reply.writeNoException();
                    return true;
                case 3:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg03 = data.readString();
                    enterSource(_arg03);
                    reply.writeNoException();
                    return true;
                case 4:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg04 = data.readString();
                    exitSource(_arg04);
                    reply.writeNoException();
                    return true;
                case 5:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg05 = data.readInt();
                    int _arg14 = data.readInt();
                    int _arg22 = data.readInt();
                    setInt(_arg05, _arg14, _arg22);
                    reply.writeNoException();
                    return true;
                case 6:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg06 = data.readInt();
                    float _arg15 = data.readFloat();
                    int _arg23 = data.readInt();
                    setFloat(_arg06, _arg15, _arg23);
                    reply.writeNoException();
                    return true;
                case 7:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg07 = data.readInt();
                    String _arg16 = data.readString();
                    int _arg24 = data.readInt();
                    setString(_arg07, _arg16, _arg24);
                    reply.writeNoException();
                    return true;
                case 8:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg08 = data.readInt();
                    if (data.readInt() != 0) {
                        _arg1 = (Bundle) Bundle.CREATOR.createFromParcel(data);
                    } else {
                        _arg1 = null;
                    }
                    int _arg25 = data.readInt();
                    setBundle(_arg08, _arg1, _arg25);
                    reply.writeNoException();
                    return true;
                case 9:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg09 = data.readInt();
                    int _arg17 = data.readInt();
                    int _result = getInt(_arg09, _arg17);
                    reply.writeNoException();
                    reply.writeInt(_result);
                    return true;
                case 10:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg010 = data.readInt();
                    int _arg18 = data.readInt();
                    float _result2 = getFloat(_arg010, _arg18);
                    reply.writeNoException();
                    reply.writeFloat(_result2);
                    return true;
                case 11:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg011 = data.readInt();
                    int _arg19 = data.readInt();
                    String _result3 = getString(_arg011, _arg19);
                    reply.writeNoException();
                    reply.writeString(_result3);
                    return true;
                case 12:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg012 = data.readInt();
                    int _arg110 = data.readInt();
                    Bundle _result4 = getBundle(_arg012, _arg110);
                    reply.writeNoException();
                    if (_result4 != null) {
                        reply.writeInt(1);
                        _result4.writeToParcel(reply, 1);
                    } else {
                        reply.writeInt(0);
                    }
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }

        private static class Proxy implements ICarInfoAidlInterface {
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

            @Override // com.spd.carinfo.ICarInfoAidlInterface
            public void registerCallback(String packageName, String[] ids, ICarInfoAidlCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(packageName);
                    _data.writeStringArray(ids);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.carinfo.ICarInfoAidlInterface
            public void unregisterCallback(String packageName, String[] ids) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(packageName);
                    _data.writeStringArray(ids);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.carinfo.ICarInfoAidlInterface
            public void enterSource(String sourcePackageName) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(sourcePackageName);
                    this.mRemote.transact(3, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.carinfo.ICarInfoAidlInterface
            public void exitSource(String sourcePackageName) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(sourcePackageName);
                    this.mRemote.transact(4, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.carinfo.ICarInfoAidlInterface
            public void setInt(int what, int arg0, int arg1) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(what);
                    _data.writeInt(arg0);
                    _data.writeInt(arg1);
                    this.mRemote.transact(5, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.carinfo.ICarInfoAidlInterface
            public void setFloat(int what, float arg0, int arg1) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(what);
                    _data.writeFloat(arg0);
                    _data.writeInt(arg1);
                    this.mRemote.transact(6, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.carinfo.ICarInfoAidlInterface
            public void setString(int what, String arg0, int arg1) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(what);
                    _data.writeString(arg0);
                    _data.writeInt(arg1);
                    this.mRemote.transact(7, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.carinfo.ICarInfoAidlInterface
            public void setBundle(int what, Bundle arg0, int arg1) throws RemoteException {
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
                    this.mRemote.transact(8, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.carinfo.ICarInfoAidlInterface
            public int getInt(int what, int arg) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(what);
                    _data.writeInt(arg);
                    this.mRemote.transact(9, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.carinfo.ICarInfoAidlInterface
            public float getFloat(int what, int arg) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(what);
                    _data.writeInt(arg);
                    this.mRemote.transact(10, _data, _reply, 0);
                    _reply.readException();
                    float _result = _reply.readFloat();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.carinfo.ICarInfoAidlInterface
            public String getString(int what, int arg) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(what);
                    _data.writeInt(arg);
                    this.mRemote.transact(11, _data, _reply, 0);
                    _reply.readException();
                    String _result = _reply.readString();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.carinfo.ICarInfoAidlInterface
            public Bundle getBundle(int what, int arg) throws RemoteException {
                Bundle _result;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(what);
                    _data.writeInt(arg);
                    this.mRemote.transact(12, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        _result = (Bundle) Bundle.CREATOR.createFromParcel(_reply);
                    } else {
                        _result = null;
                    }
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
