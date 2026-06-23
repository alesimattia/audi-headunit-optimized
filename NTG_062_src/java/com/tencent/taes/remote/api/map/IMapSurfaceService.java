package com.tencent.taes.remote.api.map;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.view.MotionEvent;
import android.view.Surface;
import com.tencent.taes.remote.api.map.IMapSurfaceListener;
import com.tencent.taes.remote.api.map.IMapSurfaceMonitorListener;

/* JADX INFO: loaded from: classes.dex */
public interface IMapSurfaceService extends IInterface {
    boolean createSurface(Surface surface, int i, int i2, int i3, int i4, IMapSurfaceListener iMapSurfaceListener) throws RemoteException;

    int getMapMode(long j) throws RemoteException;

    boolean isRunning(long j) throws RemoteException;

    boolean isValid() throws RemoteException;

    boolean onPause(long j) throws RemoteException;

    boolean onResume(long j) throws RemoteException;

    boolean onTouchEvent(long j, MotionEvent motionEvent) throws RemoteException;

    boolean removedSurface(long j) throws RemoteException;

    void setCenterOffset(long j, int i, int i2) throws RemoteException;

    void startMapMonitorTask(long j, int i, IMapSurfaceMonitorListener iMapSurfaceMonitorListener) throws RemoteException;

    boolean updateSurface(long j, Surface surface, int i, int i2, IMapSurfaceListener iMapSurfaceListener) throws RemoteException;

    public static abstract class Stub extends Binder implements IMapSurfaceService {
        private static final String DESCRIPTOR = "com.tencent.taes.remote.api.map.IMapSurfaceService";
        static final int TRANSACTION_createSurface = 1;
        static final int TRANSACTION_getMapMode = 9;
        static final int TRANSACTION_isRunning = 7;
        static final int TRANSACTION_isValid = 8;
        static final int TRANSACTION_onPause = 5;
        static final int TRANSACTION_onResume = 4;
        static final int TRANSACTION_onTouchEvent = 6;
        static final int TRANSACTION_removedSurface = 3;
        static final int TRANSACTION_setCenterOffset = 10;
        static final int TRANSACTION_startMapMonitorTask = 11;
        static final int TRANSACTION_updateSurface = 2;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IMapSurfaceService asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IMapSurfaceService)) {
                return (IMapSurfaceService) iin;
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
                    boolean zCreateSurface = createSurface(parcel.readInt() != 0 ? (Surface) Surface.CREATOR.createFromParcel(parcel) : null, parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), IMapSurfaceListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    parcel2.writeInt(zCreateSurface ? 1 : 0);
                    return true;
                case 2:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zUpdateSurface = updateSurface(parcel.readLong(), parcel.readInt() != 0 ? (Surface) Surface.CREATOR.createFromParcel(parcel) : null, parcel.readInt(), parcel.readInt(), IMapSurfaceListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    parcel2.writeInt(zUpdateSurface ? 1 : 0);
                    return true;
                case 3:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zRemovedSurface = removedSurface(parcel.readLong());
                    parcel2.writeNoException();
                    parcel2.writeInt(zRemovedSurface ? 1 : 0);
                    return true;
                case 4:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zOnResume = onResume(parcel.readLong());
                    parcel2.writeNoException();
                    parcel2.writeInt(zOnResume ? 1 : 0);
                    return true;
                case 5:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zOnPause = onPause(parcel.readLong());
                    parcel2.writeNoException();
                    parcel2.writeInt(zOnPause ? 1 : 0);
                    return true;
                case 6:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zOnTouchEvent = onTouchEvent(parcel.readLong(), parcel.readInt() != 0 ? (MotionEvent) MotionEvent.CREATOR.createFromParcel(parcel) : null);
                    parcel2.writeNoException();
                    parcel2.writeInt(zOnTouchEvent ? 1 : 0);
                    return true;
                case 7:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zIsRunning = isRunning(parcel.readLong());
                    parcel2.writeNoException();
                    parcel2.writeInt(zIsRunning ? 1 : 0);
                    return true;
                case 8:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zIsValid = isValid();
                    parcel2.writeNoException();
                    parcel2.writeInt(zIsValid ? 1 : 0);
                    return true;
                case 9:
                    parcel.enforceInterface(DESCRIPTOR);
                    int mapMode = getMapMode(parcel.readLong());
                    parcel2.writeNoException();
                    parcel2.writeInt(mapMode);
                    return true;
                case 10:
                    parcel.enforceInterface(DESCRIPTOR);
                    setCenterOffset(parcel.readLong(), parcel.readInt(), parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 11:
                    parcel.enforceInterface(DESCRIPTOR);
                    startMapMonitorTask(parcel.readLong(), parcel.readInt(), IMapSurfaceMonitorListener.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }

        private static class Proxy implements IMapSurfaceService {
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

            @Override // com.tencent.taes.remote.api.map.IMapSurfaceService
            public boolean createSurface(Surface aSurface, int width, int height, int surfaceType, int fPs, IMapSurfaceListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (aSurface != null) {
                        _data.writeInt(1);
                        aSurface.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeInt(width);
                    _data.writeInt(height);
                    _data.writeInt(surfaceType);
                    _data.writeInt(fPs);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.map.IMapSurfaceService
            public boolean updateSurface(long surfaceId, Surface surface, int width, int height, IMapSurfaceListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeLong(surfaceId);
                    if (surface != null) {
                        _data.writeInt(1);
                        surface.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeInt(width);
                    _data.writeInt(height);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.map.IMapSurfaceService
            public boolean removedSurface(long surfaceId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeLong(surfaceId);
                    this.mRemote.transact(3, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.map.IMapSurfaceService
            public boolean onResume(long surfaceId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeLong(surfaceId);
                    this.mRemote.transact(4, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.map.IMapSurfaceService
            public boolean onPause(long surfaceId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeLong(surfaceId);
                    this.mRemote.transact(5, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.map.IMapSurfaceService
            public boolean onTouchEvent(long surfaceId, MotionEvent event) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeLong(surfaceId);
                    if (event != null) {
                        _data.writeInt(1);
                        event.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(6, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.map.IMapSurfaceService
            public boolean isRunning(long surfaceId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeLong(surfaceId);
                    this.mRemote.transact(7, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.map.IMapSurfaceService
            public boolean isValid() throws RemoteException {
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

            @Override // com.tencent.taes.remote.api.map.IMapSurfaceService
            public int getMapMode(long surfaceId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeLong(surfaceId);
                    this.mRemote.transact(9, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.map.IMapSurfaceService
            public void setCenterOffset(long surfaceId, int iDx, int iDy) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeLong(surfaceId);
                    _data.writeInt(iDx);
                    _data.writeInt(iDy);
                    this.mRemote.transact(10, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.taes.remote.api.map.IMapSurfaceService
            public void startMapMonitorTask(long surfaceId, int taskType, IMapSurfaceMonitorListener listener) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeLong(surfaceId);
                    _data.writeInt(taskType);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    this.mRemote.transact(11, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
