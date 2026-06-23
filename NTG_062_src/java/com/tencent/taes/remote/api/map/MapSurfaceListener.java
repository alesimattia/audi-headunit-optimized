package com.tencent.taes.remote.api.map;

/* JADX INFO: loaded from: classes.dex */
public abstract class MapSurfaceListener {

    public interface OnMapContextListener {
        void onResult(long j, boolean z);
    }

    public interface OnMapSurfaceMonitorListener {
        void onTaskFinish(int i, long j);
    }
}
