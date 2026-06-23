package com.tencent.taes.remote.api.location.listener;

import com.tencent.taes.remote.api.location.bean.LocationBean;

/* JADX INFO: loaded from: classes.dex */
public interface GeoLocationListener {
    void onGpsStatusChange(boolean z, boolean z2);

    void onLocationChange(LocationBean locationBean);
}
