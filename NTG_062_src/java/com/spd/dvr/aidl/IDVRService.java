package com.spd.dvr.aidl;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.view.Surface;
import com.spd.dvr.aidl.ICarModelPayCallback;
import com.spd.dvr.aidl.IDVRServiceCallback;
import com.spd.dvr.aidl.IDVRServiceFilePathCallback;
import com.spd.dvr.aidl.IReverseInfoCallback;
import com.spd.dvr.entity.aidl.FileInfo;
import com.spd.dvr.entity.aidl.ReverseAVMInfo;
import com.spd.dvr.entity.aidl.SettingInfo;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface IDVRService extends IInterface {
    void dvrControlCmd(int i, int i2, int i3) throws RemoteException;

    void enterSource(String str) throws RemoteException;

    void exitSource(String str) throws RemoteException;

    int getAvmConfigParam(String str, int i) throws RemoteException;

    int getCameraDeviceParam(int i, int i2, int i3) throws RemoteException;

    int getCarModelPayStatus(int i) throws RemoteException;

    int getDvrState(int i) throws RemoteException;

    List<FileInfo> getFileInfos(int i, int i2, int i3) throws RemoteException;

    ReverseAVMInfo getReverseInfo() throws RemoteException;

    SettingInfo getSettingInfo() throws RemoteException;

    void operationFileList(int i, int[] iArr, int i2) throws RemoteException;

    void refreshFileInfo(int i) throws RemoteException;

    void regCarModelPayCallback(String str, ICarModelPayCallback iCarModelPayCallback) throws RemoteException;

    void registerDVRServiceCallback(String str, IDVRServiceCallback iDVRServiceCallback) throws RemoteException;

    void registerDVRServiceRecordFilePathCallback(String str, IDVRServiceFilePathCallback iDVRServiceFilePathCallback) throws RemoteException;

    void registerReverseInfoCallback(String str, IReverseInfoCallback iReverseInfoCallback) throws RemoteException;

    void sendCarModelPayCommand(int i, int i2, int i3) throws RemoteException;

    void sendData(int i, Bundle bundle, int i2) throws RemoteException;

    void sendSettingCommand(int i, int i2, int i3) throws RemoteException;

    void setAvmConfigParam(String str, int i) throws RemoteException;

    void setCameraDeviceParam(int i, int i2, int i3, int i4) throws RemoteException;

    void setDvrFileName(String str) throws RemoteException;

    void setPlaybackSurface(Surface surface) throws RemoteException;

    void setSettingInfo(SettingInfo settingInfo) throws RemoteException;

    void startPreviewByChannel(int i, Surface surface) throws RemoteException;

    void unRegisterDVRCallback(String str) throws RemoteException;

    void unRegisterDVRFilePathCallback(String str) throws RemoteException;

    void unregisterReverseInfoCallback(String str) throws RemoteException;

    public static abstract class Stub extends Binder implements IDVRService {
        private static final String DESCRIPTOR = "com.spd.dvr.aidl.IDVRService";
        static final int TRANSACTION_dvrControlCmd = 5;
        static final int TRANSACTION_enterSource = 3;
        static final int TRANSACTION_exitSource = 4;
        static final int TRANSACTION_getAvmConfigParam = 15;
        static final int TRANSACTION_getCameraDeviceParam = 17;
        static final int TRANSACTION_getCarModelPayStatus = 24;
        static final int TRANSACTION_getDvrState = 6;
        static final int TRANSACTION_getFileInfos = 8;
        static final int TRANSACTION_getReverseInfo = 22;
        static final int TRANSACTION_getSettingInfo = 12;
        static final int TRANSACTION_operationFileList = 9;
        static final int TRANSACTION_refreshFileInfo = 7;
        static final int TRANSACTION_regCarModelPayCallback = 23;
        static final int TRANSACTION_registerDVRServiceCallback = 1;
        static final int TRANSACTION_registerDVRServiceRecordFilePathCallback = 27;
        static final int TRANSACTION_registerReverseInfoCallback = 20;
        static final int TRANSACTION_sendCarModelPayCommand = 25;
        static final int TRANSACTION_sendData = 19;
        static final int TRANSACTION_sendSettingCommand = 18;
        static final int TRANSACTION_setAvmConfigParam = 14;
        static final int TRANSACTION_setCameraDeviceParam = 16;
        static final int TRANSACTION_setDvrFileName = 26;
        static final int TRANSACTION_setPlaybackSurface = 11;
        static final int TRANSACTION_setSettingInfo = 13;
        static final int TRANSACTION_startPreviewByChannel = 10;
        static final int TRANSACTION_unRegisterDVRCallback = 2;
        static final int TRANSACTION_unRegisterDVRFilePathCallback = 28;
        static final int TRANSACTION_unregisterReverseInfoCallback = 21;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IDVRService asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IDVRService)) {
                return (IDVRService) iin;
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
                    registerDVRServiceCallback(parcel.readString(), IDVRServiceCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 2:
                    parcel.enforceInterface(DESCRIPTOR);
                    unRegisterDVRCallback(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 3:
                    parcel.enforceInterface(DESCRIPTOR);
                    enterSource(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 4:
                    parcel.enforceInterface(DESCRIPTOR);
                    exitSource(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 5:
                    parcel.enforceInterface(DESCRIPTOR);
                    dvrControlCmd(parcel.readInt(), parcel.readInt(), parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 6:
                    parcel.enforceInterface(DESCRIPTOR);
                    int dvrState = getDvrState(parcel.readInt());
                    parcel2.writeNoException();
                    parcel2.writeInt(dvrState);
                    return true;
                case 7:
                    parcel.enforceInterface(DESCRIPTOR);
                    refreshFileInfo(parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 8:
                    parcel.enforceInterface(DESCRIPTOR);
                    List<FileInfo> fileInfos = getFileInfos(parcel.readInt(), parcel.readInt(), parcel.readInt());
                    parcel2.writeNoException();
                    parcel2.writeTypedList(fileInfos);
                    return true;
                case 9:
                    parcel.enforceInterface(DESCRIPTOR);
                    operationFileList(parcel.readInt(), parcel.createIntArray(), parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 10:
                    parcel.enforceInterface(DESCRIPTOR);
                    startPreviewByChannel(parcel.readInt(), parcel.readInt() != 0 ? (Surface) Surface.CREATOR.createFromParcel(parcel) : null);
                    parcel2.writeNoException();
                    return true;
                case 11:
                    parcel.enforceInterface(DESCRIPTOR);
                    setPlaybackSurface(parcel.readInt() != 0 ? (Surface) Surface.CREATOR.createFromParcel(parcel) : null);
                    parcel2.writeNoException();
                    return true;
                case 12:
                    parcel.enforceInterface(DESCRIPTOR);
                    SettingInfo settingInfo = getSettingInfo();
                    parcel2.writeNoException();
                    if (settingInfo != null) {
                        parcel2.writeInt(1);
                        settingInfo.writeToParcel(parcel2, 1);
                    } else {
                        parcel2.writeInt(0);
                    }
                    return true;
                case 13:
                    parcel.enforceInterface(DESCRIPTOR);
                    setSettingInfo(parcel.readInt() != 0 ? SettingInfo.CREATOR.createFromParcel(parcel) : null);
                    parcel2.writeNoException();
                    return true;
                case 14:
                    parcel.enforceInterface(DESCRIPTOR);
                    setAvmConfigParam(parcel.readString(), parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 15:
                    parcel.enforceInterface(DESCRIPTOR);
                    int avmConfigParam = getAvmConfigParam(parcel.readString(), parcel.readInt());
                    parcel2.writeNoException();
                    parcel2.writeInt(avmConfigParam);
                    return true;
                case 16:
                    parcel.enforceInterface(DESCRIPTOR);
                    setCameraDeviceParam(parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 17:
                    parcel.enforceInterface(DESCRIPTOR);
                    int cameraDeviceParam = getCameraDeviceParam(parcel.readInt(), parcel.readInt(), parcel.readInt());
                    parcel2.writeNoException();
                    parcel2.writeInt(cameraDeviceParam);
                    return true;
                case 18:
                    parcel.enforceInterface(DESCRIPTOR);
                    sendSettingCommand(parcel.readInt(), parcel.readInt(), parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 19:
                    parcel.enforceInterface(DESCRIPTOR);
                    sendData(parcel.readInt(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null, parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 20:
                    parcel.enforceInterface(DESCRIPTOR);
                    registerReverseInfoCallback(parcel.readString(), IReverseInfoCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 21:
                    parcel.enforceInterface(DESCRIPTOR);
                    unregisterReverseInfoCallback(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 22:
                    parcel.enforceInterface(DESCRIPTOR);
                    ReverseAVMInfo reverseInfo = getReverseInfo();
                    parcel2.writeNoException();
                    if (reverseInfo != null) {
                        parcel2.writeInt(1);
                        reverseInfo.writeToParcel(parcel2, 1);
                    } else {
                        parcel2.writeInt(0);
                    }
                    return true;
                case 23:
                    parcel.enforceInterface(DESCRIPTOR);
                    regCarModelPayCallback(parcel.readString(), ICarModelPayCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 24:
                    parcel.enforceInterface(DESCRIPTOR);
                    int carModelPayStatus = getCarModelPayStatus(parcel.readInt());
                    parcel2.writeNoException();
                    parcel2.writeInt(carModelPayStatus);
                    return true;
                case 25:
                    parcel.enforceInterface(DESCRIPTOR);
                    sendCarModelPayCommand(parcel.readInt(), parcel.readInt(), parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 26:
                    parcel.enforceInterface(DESCRIPTOR);
                    setDvrFileName(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 27:
                    parcel.enforceInterface(DESCRIPTOR);
                    registerDVRServiceRecordFilePathCallback(parcel.readString(), IDVRServiceFilePathCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 28:
                    parcel.enforceInterface(DESCRIPTOR);
                    unRegisterDVRFilePathCallback(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }

        private static class Proxy implements IDVRService {
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

            @Override // com.spd.dvr.aidl.IDVRService
            public void registerDVRServiceCallback(String pkName, IDVRServiceCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkName);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void unRegisterDVRCallback(String pkName) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkName);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void enterSource(String pkName) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkName);
                    this.mRemote.transact(3, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void exitSource(String pkName) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkName);
                    this.mRemote.transact(4, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void dvrControlCmd(int cmd, int arg0, int arg1) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(cmd);
                    _data.writeInt(arg0);
                    _data.writeInt(arg1);
                    this.mRemote.transact(5, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public int getDvrState(int msg) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(msg);
                    this.mRemote.transact(6, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void refreshFileInfo(int type) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(type);
                    this.mRemote.transact(7, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public List<FileInfo> getFileInfos(int type, int start, int count) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(type);
                    _data.writeInt(start);
                    _data.writeInt(count);
                    this.mRemote.transact(8, _data, _reply, 0);
                    _reply.readException();
                    List<FileInfo> _result = _reply.createTypedArrayList(FileInfo.CREATOR);
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void operationFileList(int type, int[] indexs, int operation) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(type);
                    _data.writeIntArray(indexs);
                    _data.writeInt(operation);
                    this.mRemote.transact(9, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void startPreviewByChannel(int channel, Surface surface) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(channel);
                    if (surface != null) {
                        _data.writeInt(1);
                        surface.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(10, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void setPlaybackSurface(Surface surface) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (surface != null) {
                        _data.writeInt(1);
                        surface.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(11, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public SettingInfo getSettingInfo() throws RemoteException {
                SettingInfo _result;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(12, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        _result = SettingInfo.CREATOR.createFromParcel(_reply);
                    } else {
                        _result = null;
                    }
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void setSettingInfo(SettingInfo info) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (info != null) {
                        _data.writeInt(1);
                        info.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(13, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void setAvmConfigParam(String key, int value) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(key);
                    _data.writeInt(value);
                    this.mRemote.transact(14, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public int getAvmConfigParam(String key, int defaultValue) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(key);
                    _data.writeInt(defaultValue);
                    this.mRemote.transact(15, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void setCameraDeviceParam(int csi, int channel, int type, int value) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(csi);
                    _data.writeInt(channel);
                    _data.writeInt(type);
                    _data.writeInt(value);
                    this.mRemote.transact(16, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public int getCameraDeviceParam(int csi, int channel, int type) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(csi);
                    _data.writeInt(channel);
                    _data.writeInt(type);
                    this.mRemote.transact(17, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void sendSettingCommand(int msg, int arg0, int arg1) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(msg);
                    _data.writeInt(arg0);
                    _data.writeInt(arg1);
                    this.mRemote.transact(18, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void sendData(int msg, Bundle bundle, int args) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(msg);
                    if (bundle != null) {
                        _data.writeInt(1);
                        bundle.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeInt(args);
                    this.mRemote.transact(19, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void registerReverseInfoCallback(String pkName, IReverseInfoCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkName);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(20, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void unregisterReverseInfoCallback(String pkName) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkName);
                    this.mRemote.transact(21, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public ReverseAVMInfo getReverseInfo() throws RemoteException {
                ReverseAVMInfo _result;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(22, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        _result = ReverseAVMInfo.CREATOR.createFromParcel(_reply);
                    } else {
                        _result = null;
                    }
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void regCarModelPayCallback(String key, ICarModelPayCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(key);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(23, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public int getCarModelPayStatus(int msg) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(msg);
                    this.mRemote.transact(24, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void sendCarModelPayCommand(int msg, int arg0, int arg1) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(msg);
                    _data.writeInt(arg0);
                    _data.writeInt(arg1);
                    this.mRemote.transact(25, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void setDvrFileName(String fileName) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(fileName);
                    this.mRemote.transact(26, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void registerDVRServiceRecordFilePathCallback(String pkName, IDVRServiceFilePathCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkName);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(27, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.spd.dvr.aidl.IDVRService
            public void unRegisterDVRFilePathCallback(String pkName) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkName);
                    this.mRemote.transact(28, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
