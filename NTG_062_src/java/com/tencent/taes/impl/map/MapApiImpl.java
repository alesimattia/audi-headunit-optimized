package com.tencent.taes.impl.map;

import android.util.Log;
import android.view.MotionEvent;
import android.view.Surface;
import com.tencent.taes.api.map.IMapApi;
import com.tencent.taes.framework.APIResult;
import com.tencent.taes.framework.BuildConfig;
import com.tencent.taes.framework.TAESFrameworkManager;
import com.tencent.taes.framework.listener.TAESCommonListener;
import com.tencent.taes.impl.base.AbstractApi;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.IServerConnectListener;
import com.tencent.taes.remote.api.map.IMapSurfaceApi;
import com.tencent.taes.remote.api.map.MapSurfaceListener;

/* JADX INFO: loaded from: classes.dex */
public class MapApiImpl extends AbstractApi implements IMapApi {
    private static final String TAG = "MapApiImp";
    private IMapSurfaceApi mMapSurfaceApi;

    public MapApiImpl() {
        TAESFrameworkManager.getInstance().registerCompLoadListener(ServerCompConstant.MAP, new TAESCommonListener() { // from class: com.tencent.taes.impl.map.MapApiImpl.1
            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onSuccess() {
                MapApiImpl.this.getMapSurfaceApi();
            }

            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onFail(int i, String s) {
                Log.e(MapApiImpl.TAG, "MapServiceloadFail：errorCode = " + i + ", msg = " + s);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public IMapSurfaceApi getMapSurfaceApi() {
        if (this.mMapSurfaceApi == null) {
            APIResult<IMapSurfaceApi> apiAPIResult = TAESFrameworkManager.getInstance().getApi(ServerCompConstant.MAP, IMapSurfaceApi.class, null);
            if (apiAPIResult.isSuccess()) {
                this.mMapSurfaceApi = apiAPIResult.data;
            } else {
                Log.d(TAG, "getApi Fail:" + apiAPIResult.codeDescription());
            }
        }
        return this.mMapSurfaceApi;
    }

    @Override // com.tencent.taes.impl.base.AbstractApi
    public void dispose() {
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean createSurface(Surface aSurface, int width, int height, int surfaceType, int fPs, MapSurfaceListener.OnMapContextListener listener) {
        if (getMapSurfaceApi() != null) {
            return getMapSurfaceApi().createSurface(aSurface, width, height, surfaceType, fPs, listener);
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean updateSurface(long surfaceId, Surface surface, int width, int height, MapSurfaceListener.OnMapContextListener listener) {
        if (getMapSurfaceApi() != null) {
            return getMapSurfaceApi().updateSurface(surfaceId, surface, width, height, listener);
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean removedSurface(long surfaceId) {
        if (getMapSurfaceApi() != null) {
            return getMapSurfaceApi().removedSurface(surfaceId);
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean onResume(long surfaceId) {
        if (getMapSurfaceApi() != null) {
            return getMapSurfaceApi().onResume(surfaceId);
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean onPause(long surfaceId) {
        if (getMapSurfaceApi() != null) {
            return getMapSurfaceApi().onPause(surfaceId);
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean onTouchEvent(long surfaceId, MotionEvent event) {
        if (getMapSurfaceApi() != null) {
            return getMapSurfaceApi().onTouchEvent(surfaceId, event);
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean isRunning(long surfaceId) {
        if (getMapSurfaceApi() != null) {
            return getMapSurfaceApi().isRunning(surfaceId);
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public boolean isValid() {
        if (getMapSurfaceApi() != null) {
            return getMapSurfaceApi().isValid();
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public int getMapMode(long surfaceId) {
        if (getMapSurfaceApi() != null) {
            return getMapSurfaceApi().getMapMode(surfaceId);
        }
        return -1;
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public void setCenterOffset(long surfaceId, int iDx, int iDy) {
        if (getMapSurfaceApi() != null) {
            getMapSurfaceApi().setCenterOffset(surfaceId, iDx, iDy);
        }
    }

    @Override // com.tencent.taes.remote.api.map.IMapSurfaceApi
    public void startMapMonitorTask(long l, int i, MapSurfaceListener.OnMapSurfaceMonitorListener onMapSurfaceMonitorListener) {
        if (getMapSurfaceApi() != null) {
            getMapSurfaceApi().startMapMonitorTask(l, i, onMapSurfaceMonitorListener);
        }
    }

    @Override // com.tencent.taes.remote.api.IRegitsterConnectStateApi
    public void registerConnectListener(IServerConnectListener iServerConnectListener) {
        if (getMapSurfaceApi() != null) {
            getMapSurfaceApi().registerConnectListener(iServerConnectListener);
        }
    }

    @Override // com.tencent.taes.remote.api.IRegitsterConnectStateApi
    public void unregisterConnectListener(IServerConnectListener iServerConnectListener) {
        if (getMapSurfaceApi() != null) {
            getMapSurfaceApi().unregisterConnectListener(iServerConnectListener);
        }
    }

    @Override // com.tencent.taes.api.base.BaseApi
    public String getApiVersion() {
        return BuildConfig.VERSION_NAME;
    }
}
