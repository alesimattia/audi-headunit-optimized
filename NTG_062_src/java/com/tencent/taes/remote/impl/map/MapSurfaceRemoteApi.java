package com.tencent.taes.remote.impl.map;

import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import android.util.Pair;
import android.view.MotionEvent;
import android.view.Surface;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.map.IMapSurfaceApi;
import com.tencent.taes.remote.api.map.IMapSurfaceListener;
import com.tencent.taes.remote.api.map.IMapSurfaceMonitorListener;
import com.tencent.taes.remote.api.map.IMapSurfaceService;
import com.tencent.taes.remote.api.map.MapSurfaceListener;
import com.tencent.taes.remote.impl.BaseRemoteApi;

/* JADX INFO: loaded from: classes.dex */
public class MapSurfaceRemoteApi extends BaseRemoteApi implements IMapSurfaceApi {
    private static final String TAG = "MapSurfaceRemoteApi";
    private IMapSurfaceService mMapSurfaceService;

    private MapSurfaceRemoteApi(IBinder binder, IBinder smsbinder) {
        super(binder, smsbinder);
        this.mMapSurfaceService = IMapSurfaceService.Stub.asInterface(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public Pair<String, String> subscribeModuleBinder() {
        return new Pair<>(ServerCompConstant.MAP, IMapSurfaceService.Stub.class.getName());
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderConnect(IBinder binder) {
        this.mMapSurfaceService = IMapSurfaceService.Stub.asInterface(binder);
        super.binderConnect(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderDisConnect() {
        super.binderDisConnect();
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean createSurface(Surface aSurface, int width, int height, int surfaceType, int fPs, final MapSurfaceListener.OnMapContextListener listener) {
        if (this.mMapSurfaceService != null) {
            try {
                return this.mMapSurfaceService.createSurface(aSurface, width, height, surfaceType, fPs, new IMapSurfaceListener.Stub() { // from class: com.tencent.taes.remote.impl.map.MapSurfaceRemoteApi.1
                    @Override // com.tencent.taes.remote.api.map.IMapSurfaceListener
                    public void onResult(long surfaceId, boolean result) throws RemoteException {
                        Log.e(MapSurfaceRemoteApi.TAG, "createSurface:surfaceId=" + surfaceId + "   result=" + result);
                        if (listener != null) {
                            listener.onResult(surfaceId, result);
                        }
                    }
                });
            } catch (RemoteException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean updateSurface(long surfaceId, Surface surface, int width, int height, final MapSurfaceListener.OnMapContextListener listener) {
        if (this.mMapSurfaceService != null) {
            try {
                return this.mMapSurfaceService.updateSurface(surfaceId, surface, width, height, new IMapSurfaceListener.Stub() { // from class: com.tencent.taes.remote.impl.map.MapSurfaceRemoteApi.2
                    @Override // com.tencent.taes.remote.api.map.IMapSurfaceListener
                    public void onResult(long surfaceId2, boolean result) throws RemoteException {
                        Log.e(MapSurfaceRemoteApi.TAG, "updateSurface:surfaceId=" + surfaceId2 + "   result=" + result);
                        if (listener != null) {
                            listener.onResult(surfaceId2, result);
                        }
                    }
                });
            } catch (RemoteException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean removedSurface(long surfaceId) {
        if (this.mMapSurfaceService != null) {
            try {
                return this.mMapSurfaceService.removedSurface(surfaceId);
            } catch (RemoteException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean onResume(long surfaceId) {
        if (this.mMapSurfaceService != null) {
            try {
                return this.mMapSurfaceService.onResume(surfaceId);
            } catch (RemoteException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean onPause(long surfaceId) {
        if (this.mMapSurfaceService != null) {
            try {
                return this.mMapSurfaceService.onPause(surfaceId);
            } catch (RemoteException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean onTouchEvent(long surfaceId, MotionEvent event) {
        if (this.mMapSurfaceService != null) {
            try {
                return this.mMapSurfaceService.onTouchEvent(surfaceId, event);
            } catch (RemoteException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean isRunning(long surfaceId) {
        if (this.mMapSurfaceService != null) {
            try {
                return this.mMapSurfaceService.isRunning(surfaceId);
            } catch (RemoteException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean isValid() {
        if (this.mMapSurfaceService != null) {
            try {
                return this.mMapSurfaceService.isValid();
            } catch (RemoteException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public int getMapMode(long surfaceId) {
        if (this.mMapSurfaceService != null) {
            try {
                return this.mMapSurfaceService.getMapMode(surfaceId);
            } catch (RemoteException e) {
                e.printStackTrace();
                return -1;
            }
        }
        return -1;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public void setCenterOffset(long surfaceId, int iDx, int iDy) {
        if (this.mMapSurfaceService != null) {
            try {
                this.mMapSurfaceService.setCenterOffset(surfaceId, iDx, iDy);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public void startMapMonitorTask(long surfaceId, int taskType, final MapSurfaceListener.OnMapSurfaceMonitorListener listener) {
        if (this.mMapSurfaceService != null) {
            try {
                this.mMapSurfaceService.startMapMonitorTask(surfaceId, taskType, new IMapSurfaceMonitorListener.Stub() { // from class: com.tencent.taes.remote.impl.map.MapSurfaceRemoteApi.3
                    @Override // com.tencent.taes.remote.api.map.IMapSurfaceMonitorListener
                    public void onTaskFinish(int taskType2, long param) throws RemoteException {
                        listener.onTaskFinish(taskType2, param);
                    }
                });
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }
}
