package com.tencent.taes.remote.api.operate;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.tencent.taes.remote.api.operate.bean.SceneBannerInfo;
import com.tencent.taes.remote.api.operate.bean.SceneStatusBannerInfo;
import com.tencent.taes.remote.api.operate.bean.SceneWeakPushInfo;
import com.tencent.taes.remote.api.operate.listener.ISceneBannerInfoListener;
import com.tencent.taes.remote.api.operate.listener.ISceneWeakPushInfoListener;
import com.tencent.taes.remote.api.operate.listener.IStatusBannerInfoListener;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface IOperateService extends IInterface {
    List<SceneBannerInfo> getSceneBannerInfos() throws RemoteException;

    List<SceneWeakPushInfo> getSceneWeakPushInfos() throws RemoteException;

    List<SceneStatusBannerInfo> getStatusBannerInfos() throws RemoteException;

    void registerSceneBannerInfoListener(ISceneBannerInfoListener iSceneBannerInfoListener) throws RemoteException;

    void registerSceneWeakPushInfoListener(ISceneWeakPushInfoListener iSceneWeakPushInfoListener) throws RemoteException;

    void registerStatusBannerInfoListener(IStatusBannerInfoListener iStatusBannerInfoListener) throws RemoteException;

    boolean showSceneBannerDetail(String str, boolean z) throws RemoteException;

    void unregisterSceneBannerInfoListener(ISceneBannerInfoListener iSceneBannerInfoListener) throws RemoteException;

    void unregisterSceneWeakPushInfoListener(ISceneWeakPushInfoListener iSceneWeakPushInfoListener) throws RemoteException;

    void unregisterStatusBannerInfoListener(IStatusBannerInfoListener iStatusBannerInfoListener) throws RemoteException;

    public static abstract class Stub extends Binder implements IOperateService {
        private static final String DESCRIPTOR = "com.tencent.taes.remote.api.operate.IOperateService";
        static final int TRANSACTION_getSceneBannerInfos = 1;
        static final int TRANSACTION_getSceneWeakPushInfos = 8;
        static final int TRANSACTION_getStatusBannerInfos = 5;
        static final int TRANSACTION_registerSceneBannerInfoListener = 2;
        static final int TRANSACTION_registerSceneWeakPushInfoListener = 9;
        static final int TRANSACTION_registerStatusBannerInfoListener = 6;
        static final int TRANSACTION_showSceneBannerDetail = 4;
        static final int TRANSACTION_unregisterSceneBannerInfoListener = 3;
        static final int TRANSACTION_unregisterSceneWeakPushInfoListener = 10;
        static final int TRANSACTION_unregisterStatusBannerInfoListener = 7;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IOperateService asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IOperateService)) {
                return (IOperateService) iin;
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
                    List<SceneBannerInfo> sceneBannerInfos = getSceneBannerInfos();
                    parcel2.writeNoException();
                    parcel2.writeTypedList(sceneBannerInfos);
                    return true;
                case 2:
                    parcel.enforceInterface(DESCRIPTOR);
                    registerSceneBannerInfoListener(ISceneBannerInfoListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 3:
                    parcel.enforceInterface(DESCRIPTOR);
                    unregisterSceneBannerInfoListener(ISceneBannerInfoListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 4:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zShowSceneBannerDetail = showSceneBannerDetail(parcel.readString(), parcel.readInt() != 0);
                    parcel2.writeNoException();
                    parcel2.writeInt(zShowSceneBannerDetail ? 1 : 0);
                    return true;
                case 5:
                    parcel.enforceInterface(DESCRIPTOR);
                    List<SceneStatusBannerInfo> statusBannerInfos = getStatusBannerInfos();
                    parcel2.writeNoException();
                    parcel2.writeTypedList(statusBannerInfos);
                    return true;
                case 6:
                    parcel.enforceInterface(DESCRIPTOR);
                    registerStatusBannerInfoListener(IStatusBannerInfoListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 7:
                    parcel.enforceInterface(DESCRIPTOR);
                    unregisterStatusBannerInfoListener(IStatusBannerInfoListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 8:
                    parcel.enforceInterface(DESCRIPTOR);
                    List<SceneWeakPushInfo> sceneWeakPushInfos = getSceneWeakPushInfos();
                    parcel2.writeNoException();
                    parcel2.writeTypedList(sceneWeakPushInfos);
                    return true;
                case 9:
                    parcel.enforceInterface(DESCRIPTOR);
                    registerSceneWeakPushInfoListener(ISceneWeakPushInfoListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 10:
                    parcel.enforceInterface(DESCRIPTOR);
                    unregisterSceneWeakPushInfoListener(ISceneWeakPushInfoListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }

        private static class Proxy implements IOperateService {
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

            @Override // com.tencent.taes.remote.api.operate.IOperateService
            public List<SceneBannerInfo> getSceneBannerInfos() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                    List<SceneBannerInfo> _result = _reply.createTypedArrayList(SceneBannerInfo.CREATOR);
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.operate.IOperateService
            public void registerSceneBannerInfoListener(ISceneBannerInfoListener listener) throws RemoteException {
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

            @Override // com.tencent.taes.remote.api.operate.IOperateService
            public void unregisterSceneBannerInfoListener(ISceneBannerInfoListener listener) throws RemoteException {
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

            @Override // com.tencent.taes.remote.api.operate.IOperateService
            public boolean showSceneBannerDetail(String str, boolean z) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    parcelObtain.writeString(str);
                    parcelObtain.writeInt(z ? 1 : 0);
                    this.mRemote.transact(4, parcelObtain, parcelObtain2, 0);
                    parcelObtain2.readException();
                    return parcelObtain2.readInt() != 0;
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.operate.IOperateService
            public List<SceneStatusBannerInfo> getStatusBannerInfos() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(5, _data, _reply, 0);
                    _reply.readException();
                    List<SceneStatusBannerInfo> _result = _reply.createTypedArrayList(SceneStatusBannerInfo.CREATOR);
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.operate.IOperateService
            public void registerStatusBannerInfoListener(IStatusBannerInfoListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(6, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.operate.IOperateService
            public void unregisterStatusBannerInfoListener(IStatusBannerInfoListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(7, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.operate.IOperateService
            public List<SceneWeakPushInfo> getSceneWeakPushInfos() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(8, _data, _reply, 0);
                    _reply.readException();
                    List<SceneWeakPushInfo> _result = _reply.createTypedArrayList(SceneWeakPushInfo.CREATOR);
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.operate.IOperateService
            public void registerSceneWeakPushInfoListener(ISceneWeakPushInfoListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(9, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.operate.IOperateService
            public void unregisterSceneWeakPushInfoListener(ISceneWeakPushInfoListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(10, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
