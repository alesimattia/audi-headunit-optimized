package com.tencent.taes.remote.api.map;

import android.view.MotionEvent;
import android.view.Surface;
import com.tencent.taes.remote.api.IRegitsterConnectStateApi;
import com.tencent.taes.remote.api.map.MapSurfaceListener;

/* JADX INFO: loaded from: classes.dex */
public interface IMapSurfaceApi extends IRegitsterConnectStateApi {
    public static final int SURFACE_TYPE_CUSTOM = 3;
    public static final int SURFACE_TYPE_DASBOARD = 2;
    public static final int SURFACE_TYPE_WIDGET = 1;

    boolean createSurface(Surface surface, int i, int i2, int i3, int i4, MapSurfaceListener.OnMapContextListener onMapContextListener);

    int getMapMode(long j);

    boolean isRunning(long j);

    boolean isValid();

    boolean onPause(long j);

    boolean onResume(long j);

    boolean onTouchEvent(long j, MotionEvent motionEvent);

    boolean removedSurface(long j);

    void setCenterOffset(long j, int i, int i2);

    void startMapMonitorTask(long j, int i, MapSurfaceListener.OnMapSurfaceMonitorListener onMapSurfaceMonitorListener);

    boolean updateSurface(long j, Surface surface, int i, int i2, MapSurfaceListener.OnMapContextListener onMapContextListener);
}
