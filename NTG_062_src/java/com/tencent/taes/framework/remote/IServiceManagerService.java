package com.tencent.taes.framework.remote;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.tencent.taes.framework.auth.IClientVerifyResult;
import com.tencent.taes.framework.listener.LoadListener;
import com.tencent.taes.framework.parser.ComponentConfigInfo;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface IServiceManagerService extends IInterface {
    Bundle callExtMethod(Bundle bundle) throws RemoteException;

    void dispatchEventToAllService(int i, Bundle bundle) throws RemoteException;

    List<ComponentConfigInfo> getConfigComponents() throws RemoteException;

    IBinder getIBinder(String str, String str2, Bundle bundle) throws RemoteException;

    Bundle getRemoteBinder(String str, String str2, Bundle bundle) throws RemoteException;

    String getRemoteVersion() throws RemoteException;

    String getServerHostPkgName(String str) throws RemoteException;

    void loadServiceComponent(ComponentConfigInfo componentConfigInfo, LoadListener loadListener) throws RemoteException;

    void unloadServiceComponent(ComponentConfigInfo componentConfigInfo) throws RemoteException;

    void verifyAppId(String str, String str2, String str3, String str4, IClientVerifyResult iClientVerifyResult) throws RemoteException;

    public static abstract class Stub extends Binder implements IServiceManagerService {
        private static final String DESCRIPTOR = "com.tencent.taes.framework.remote.IServiceManagerService";
        static final int TRANSACTION_callExtMethod = 6;
        static final int TRANSACTION_dispatchEventToAllService = 5;
        static final int TRANSACTION_getConfigComponents = 2;
        static final int TRANSACTION_getIBinder = 4;
        static final int TRANSACTION_getRemoteBinder = 7;
        static final int TRANSACTION_getRemoteVersion = 3;
        static final int TRANSACTION_getServerHostPkgName = 10;
        static final int TRANSACTION_loadServiceComponent = 1;
        static final int TRANSACTION_unloadServiceComponent = 8;
        static final int TRANSACTION_verifyAppId = 9;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IServiceManagerService asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IServiceManagerService)) {
                return (IServiceManagerService) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i == 1598968902) {
                parcel2.writeString(DESCRIPTOR);
                return true;
            }
            switch (i) {
                case 1:
                    parcel.enforceInterface(DESCRIPTOR);
                    loadServiceComponent(parcel.readInt() != 0 ? ComponentConfigInfo.CREATOR.createFromParcel(parcel) : null, LoadListener.Stub.asInterface(parcel.readStrongBinder()));
                    return true;
                case 2:
                    parcel.enforceInterface(DESCRIPTOR);
                    List<ComponentConfigInfo> configComponents = getConfigComponents();
                    parcel2.writeNoException();
                    parcel2.writeTypedList(configComponents);
                    return true;
                case 3:
                    parcel.enforceInterface(DESCRIPTOR);
                    String remoteVersion = getRemoteVersion();
                    parcel2.writeNoException();
                    parcel2.writeString(remoteVersion);
                    return true;
                case 4:
                    parcel.enforceInterface(DESCRIPTOR);
                    IBinder iBinder = getIBinder(parcel.readString(), parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                    parcel2.writeNoException();
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 5:
                    parcel.enforceInterface(DESCRIPTOR);
                    dispatchEventToAllService(parcel.readInt(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                    parcel2.writeNoException();
                    return true;
                case 6:
                    parcel.enforceInterface(DESCRIPTOR);
                    Bundle bundleCallExtMethod = callExtMethod(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                    parcel2.writeNoException();
                    if (bundleCallExtMethod != null) {
                        parcel2.writeInt(1);
                        bundleCallExtMethod.writeToParcel(parcel2, 1);
                    } else {
                        parcel2.writeInt(0);
                    }
                    return true;
                case 7:
                    parcel.enforceInterface(DESCRIPTOR);
                    Bundle remoteBinder = getRemoteBinder(parcel.readString(), parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                    parcel2.writeNoException();
                    if (remoteBinder != null) {
                        parcel2.writeInt(1);
                        remoteBinder.writeToParcel(parcel2, 1);
                    } else {
                        parcel2.writeInt(0);
                    }
                    return true;
                case 8:
                    parcel.enforceInterface(DESCRIPTOR);
                    unloadServiceComponent(parcel.readInt() != 0 ? ComponentConfigInfo.CREATOR.createFromParcel(parcel) : null);
                    parcel2.writeNoException();
                    return true;
                case 9:
                    parcel.enforceInterface(DESCRIPTOR);
                    verifyAppId(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), IClientVerifyResult.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 10:
                    parcel.enforceInterface(DESCRIPTOR);
                    String serverHostPkgName = getServerHostPkgName(parcel.readString());
                    parcel2.writeNoException();
                    parcel2.writeString(serverHostPkgName);
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }

        private static class Proxy implements IServiceManagerService {
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

            @Override // com.tencent.taes.framework.remote.IServiceManagerService
            public void loadServiceComponent(ComponentConfigInfo config, LoadListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (config != null) {
                        _data.writeInt(1);
                        config.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(1, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.framework.remote.IServiceManagerService
            public List<ComponentConfigInfo> getConfigComponents() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                    List<ComponentConfigInfo> _result = _reply.createTypedArrayList(ComponentConfigInfo.CREATOR);
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.framework.remote.IServiceManagerService
            public String getRemoteVersion() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(3, _data, _reply, 0);
                    _reply.readException();
                    String _result = _reply.readString();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.framework.remote.IServiceManagerService
            public IBinder getIBinder(String moduleName, String binderName, Bundle args) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(moduleName);
                    _data.writeString(binderName);
                    if (args != null) {
                        _data.writeInt(1);
                        args.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(4, _data, _reply, 0);
                    _reply.readException();
                    IBinder _result = _reply.readStrongBinder();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.framework.remote.IServiceManagerService
            public void dispatchEventToAllService(int eventId, Bundle bundle) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(eventId);
                    if (bundle != null) {
                        _data.writeInt(1);
                        bundle.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(5, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.framework.remote.IServiceManagerService
            public Bundle callExtMethod(Bundle bundle) throws RemoteException {
                Bundle _result;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (bundle != null) {
                        _data.writeInt(1);
                        bundle.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(6, _data, _reply, 0);
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

            @Override // com.tencent.taes.framework.remote.IServiceManagerService
            public Bundle getRemoteBinder(String moduleName, String binderName, Bundle args) throws RemoteException {
                Bundle _result;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(moduleName);
                    _data.writeString(binderName);
                    if (args != null) {
                        _data.writeInt(1);
                        args.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(7, _data, _reply, 0);
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

            @Override // com.tencent.taes.framework.remote.IServiceManagerService
            public void unloadServiceComponent(ComponentConfigInfo config) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (config != null) {
                        _data.writeInt(1);
                        config.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(8, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.framework.remote.IServiceManagerService
            public void verifyAppId(String appId, String pkgName, String keyStoreSign, String alias, IClientVerifyResult verifyCallbac) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(appId);
                    _data.writeString(pkgName);
                    _data.writeString(keyStoreSign);
                    _data.writeString(alias);
                    _data.writeStrongBinder(verifyCallbac != null ? verifyCallbac.asBinder() : null);
                    this.mRemote.transact(9, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.framework.remote.IServiceManagerService
            public String getServerHostPkgName(String moduleName) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(moduleName);
                    this.mRemote.transact(10, _data, _reply, 0);
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
