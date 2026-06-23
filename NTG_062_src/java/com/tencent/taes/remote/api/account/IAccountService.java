package com.tencent.taes.remote.api.account;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.tencent.taes.remote.api.account.bean.TxAccount;
import com.tencent.taes.remote.api.account.bean.WeCarAccount;
import com.tencent.taes.remote.api.account.bean.WeCarContract;
import com.tencent.taes.remote.api.account.listener.IAccountEventListener;
import com.tencent.taes.remote.api.account.listener.IAccountListener;
import com.tencent.taes.remote.api.account.listener.IMossCallBack;
import com.tencent.taes.remote.api.account.listener.ITAIUserInfo;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public interface IAccountService extends IInterface {
    void AppletAuth(String str, IMossCallBack iMossCallBack) throws RemoteException;

    void appletLogin(String str, IMossCallBack iMossCallBack) throws RemoteException;

    void checkAppletSession(String str, IMossCallBack iMossCallBack) throws RemoteException;

    WeCarContract checkContract(int i) throws RemoteException;

    String getAccountDebugInfo() throws RemoteException;

    void getAppletUserInfo(String str, IMossCallBack iMossCallBack) throws RemoteException;

    void getAuthStatus(String str, IMossCallBack iMossCallBack) throws RemoteException;

    void getBaseCarInfo(String str, IMossCallBack iMossCallBack) throws RemoteException;

    long getNonce() throws RemoteException;

    void getPhoneNumber(String str, IMossCallBack iMossCallBack) throws RemoteException;

    void getTaiAccountInfo(int i, Map map, String str, ITAIUserInfo iTAIUserInfo) throws RemoteException;

    void getWeCarAccount(IAccountListener iAccountListener) throws RemoteException;

    WeCarAccount getWeCarAccountSync() throws RemoteException;

    boolean isTAIAuthOk() throws RemoteException;

    void logoutTaiAccount(int i, Map map, String str, String str2, String str3, ITAIUserInfo iTAIUserInfo) throws RemoteException;

    void registerClient(String str, Map map, IAccountEventListener iAccountEventListener) throws RemoteException;

    boolean removeTXAccount(TxAccount txAccount) throws RemoteException;

    boolean removeWeCarAccount() throws RemoteException;

    void updateSessionKey(String str, long j) throws RemoteException;

    public static abstract class Stub extends Binder implements IAccountService {
        private static final String DESCRIPTOR = "com.tencent.taes.remote.api.account.IAccountService";
        static final int TRANSACTION_AppletAuth = 13;
        static final int TRANSACTION_appletLogin = 9;
        static final int TRANSACTION_checkAppletSession = 10;
        static final int TRANSACTION_checkContract = 18;
        static final int TRANSACTION_getAccountDebugInfo = 19;
        static final int TRANSACTION_getAppletUserInfo = 12;
        static final int TRANSACTION_getAuthStatus = 14;
        static final int TRANSACTION_getBaseCarInfo = 15;
        static final int TRANSACTION_getNonce = 6;
        static final int TRANSACTION_getPhoneNumber = 11;
        static final int TRANSACTION_getTaiAccountInfo = 16;
        static final int TRANSACTION_getWeCarAccount = 3;
        static final int TRANSACTION_getWeCarAccountSync = 2;
        static final int TRANSACTION_isTAIAuthOk = 8;
        static final int TRANSACTION_logoutTaiAccount = 17;
        static final int TRANSACTION_registerClient = 1;
        static final int TRANSACTION_removeTXAccount = 4;
        static final int TRANSACTION_removeWeCarAccount = 7;
        static final int TRANSACTION_updateSessionKey = 5;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IAccountService asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IAccountService)) {
                return (IAccountService) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            TxAccount txAccountCreateFromParcel;
            if (i == 1598968902) {
                parcel2.writeString(DESCRIPTOR);
                return true;
            }
            switch (i) {
                case 1:
                    parcel.enforceInterface(DESCRIPTOR);
                    registerClient(parcel.readString(), parcel.readHashMap(getClass().getClassLoader()), IAccountEventListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 2:
                    parcel.enforceInterface(DESCRIPTOR);
                    WeCarAccount weCarAccountSync = getWeCarAccountSync();
                    parcel2.writeNoException();
                    if (weCarAccountSync != null) {
                        parcel2.writeInt(1);
                        weCarAccountSync.writeToParcel(parcel2, 1);
                    } else {
                        parcel2.writeInt(0);
                    }
                    return true;
                case 3:
                    parcel.enforceInterface(DESCRIPTOR);
                    getWeCarAccount(IAccountListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 4:
                    parcel.enforceInterface(DESCRIPTOR);
                    if (parcel.readInt() != 0) {
                        txAccountCreateFromParcel = TxAccount.CREATOR.createFromParcel(parcel);
                    } else {
                        txAccountCreateFromParcel = null;
                    }
                    boolean zRemoveTXAccount = removeTXAccount(txAccountCreateFromParcel);
                    parcel2.writeNoException();
                    parcel2.writeInt(zRemoveTXAccount ? 1 : 0);
                    return true;
                case 5:
                    parcel.enforceInterface(DESCRIPTOR);
                    updateSessionKey(parcel.readString(), parcel.readLong());
                    parcel2.writeNoException();
                    return true;
                case 6:
                    parcel.enforceInterface(DESCRIPTOR);
                    long nonce = getNonce();
                    parcel2.writeNoException();
                    parcel2.writeLong(nonce);
                    return true;
                case 7:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zRemoveWeCarAccount = removeWeCarAccount();
                    parcel2.writeNoException();
                    parcel2.writeInt(zRemoveWeCarAccount ? 1 : 0);
                    return true;
                case 8:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zIsTAIAuthOk = isTAIAuthOk();
                    parcel2.writeNoException();
                    parcel2.writeInt(zIsTAIAuthOk ? 1 : 0);
                    return true;
                case 9:
                    parcel.enforceInterface(DESCRIPTOR);
                    appletLogin(parcel.readString(), IMossCallBack.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 10:
                    parcel.enforceInterface(DESCRIPTOR);
                    checkAppletSession(parcel.readString(), IMossCallBack.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 11:
                    parcel.enforceInterface(DESCRIPTOR);
                    getPhoneNumber(parcel.readString(), IMossCallBack.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 12:
                    parcel.enforceInterface(DESCRIPTOR);
                    getAppletUserInfo(parcel.readString(), IMossCallBack.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 13:
                    parcel.enforceInterface(DESCRIPTOR);
                    AppletAuth(parcel.readString(), IMossCallBack.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 14:
                    parcel.enforceInterface(DESCRIPTOR);
                    getAuthStatus(parcel.readString(), IMossCallBack.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 15:
                    parcel.enforceInterface(DESCRIPTOR);
                    getBaseCarInfo(parcel.readString(), IMossCallBack.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 16:
                    parcel.enforceInterface(DESCRIPTOR);
                    getTaiAccountInfo(parcel.readInt(), parcel.readHashMap(getClass().getClassLoader()), parcel.readString(), ITAIUserInfo.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 17:
                    parcel.enforceInterface(DESCRIPTOR);
                    logoutTaiAccount(parcel.readInt(), parcel.readHashMap(getClass().getClassLoader()), parcel.readString(), parcel.readString(), parcel.readString(), ITAIUserInfo.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 18:
                    parcel.enforceInterface(DESCRIPTOR);
                    WeCarContract weCarContractCheckContract = checkContract(parcel.readInt());
                    parcel2.writeNoException();
                    if (weCarContractCheckContract != null) {
                        parcel2.writeInt(1);
                        weCarContractCheckContract.writeToParcel(parcel2, 1);
                    } else {
                        parcel2.writeInt(0);
                    }
                    return true;
                case 19:
                    parcel.enforceInterface(DESCRIPTOR);
                    String accountDebugInfo = getAccountDebugInfo();
                    parcel2.writeNoException();
                    parcel2.writeString(accountDebugInfo);
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }

        private static class Proxy implements IAccountService {
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

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public void registerClient(String clientId, Map appInfo, IAccountEventListener AccountEventListener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(clientId);
                    _data.writeMap(appInfo);
                    _data.writeStrongBinder(AccountEventListener != null ? AccountEventListener.asBinder() : null);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public WeCarAccount getWeCarAccountSync() throws RemoteException {
                WeCarAccount _result;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        _result = WeCarAccount.CREATOR.createFromParcel(_reply);
                    } else {
                        _result = null;
                    }
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public void getWeCarAccount(IAccountListener listener) throws RemoteException {
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

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public boolean removeTXAccount(TxAccount account) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (account != null) {
                        _data.writeInt(1);
                        account.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(4, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public void updateSessionKey(String sKey, long nonce) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(sKey);
                    _data.writeLong(nonce);
                    this.mRemote.transact(5, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public long getNonce() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(6, _data, _reply, 0);
                    _reply.readException();
                    long _result = _reply.readLong();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public boolean removeWeCarAccount() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(7, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public boolean isTAIAuthOk() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(8, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public void appletLogin(String request, IMossCallBack iMossCallBack) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(request);
                    _data.writeStrongBinder(iMossCallBack != null ? iMossCallBack.asBinder() : null);
                    this.mRemote.transact(9, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public void checkAppletSession(String request, IMossCallBack iMossCallBack) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(request);
                    _data.writeStrongBinder(iMossCallBack != null ? iMossCallBack.asBinder() : null);
                    this.mRemote.transact(10, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public void getPhoneNumber(String request, IMossCallBack iMossCallBack) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(request);
                    _data.writeStrongBinder(iMossCallBack != null ? iMossCallBack.asBinder() : null);
                    this.mRemote.transact(11, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public void getAppletUserInfo(String request, IMossCallBack iMossCallBack) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(request);
                    _data.writeStrongBinder(iMossCallBack != null ? iMossCallBack.asBinder() : null);
                    this.mRemote.transact(12, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public void AppletAuth(String request, IMossCallBack iMossCallBack) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(request);
                    _data.writeStrongBinder(iMossCallBack != null ? iMossCallBack.asBinder() : null);
                    this.mRemote.transact(13, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public void getAuthStatus(String result, IMossCallBack iMossCallBack) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(result);
                    _data.writeStrongBinder(iMossCallBack != null ? iMossCallBack.asBinder() : null);
                    this.mRemote.transact(14, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public void getBaseCarInfo(String result, IMossCallBack iMossCallBack) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(result);
                    _data.writeStrongBinder(iMossCallBack != null ? iMossCallBack.asBinder() : null);
                    this.mRemote.transact(15, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public void getTaiAccountInfo(int requestType, Map ext, String packageName, ITAIUserInfo iTAIUserInfo) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(requestType);
                    _data.writeMap(ext);
                    _data.writeString(packageName);
                    _data.writeStrongBinder(iTAIUserInfo != null ? iTAIUserInfo.asBinder() : null);
                    this.mRemote.transact(16, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public void logoutTaiAccount(int requestType, Map ext, String packageName, String wecarid, String userid, ITAIUserInfo iTAIUserInfo) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(requestType);
                    _data.writeMap(ext);
                    _data.writeString(packageName);
                    _data.writeString(wecarid);
                    _data.writeString(userid);
                    _data.writeStrongBinder(iTAIUserInfo != null ? iTAIUserInfo.asBinder() : null);
                    this.mRemote.transact(17, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public WeCarContract checkContract(int serviceType) throws RemoteException {
                WeCarContract _result;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(serviceType);
                    this.mRemote.transact(18, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        _result = WeCarContract.CREATOR.createFromParcel(_reply);
                    } else {
                        _result = null;
                    }
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.account.IAccountService
            public String getAccountDebugInfo() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(19, _data, _reply, 0);
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
