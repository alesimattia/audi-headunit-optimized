package com.tencent.taes.remote.api.location;

import com.tencent.taes.remote.api.IRegitsterConnectStateApi;
import com.tencent.taes.remote.api.location.bean.LatLng;
import com.tencent.taes.remote.api.location.bean.LocationBean;
import com.tencent.taes.remote.api.location.bean.LocationDistrict;
import com.tencent.taes.remote.api.location.listener.GeoDistrictChangedListener;
import com.tencent.taes.remote.api.location.listener.GeoLocationListener;
import com.tencent.taes.remote.api.location.listener.GeoLocationSatellitesListener;

/* JADX INFO: loaded from: classes.dex */
public interface ILocationApi extends IRegitsterConnectStateApi {
    LocationBean getCurLocation();

    int getGpsSignalLevel();

    long getGpsTime();

    LocationDistrict getLastValidDistrict();

    LatLng getLastValidLocation();

    String getLocationSDKVersion();

    int getSatellitesNum();

    boolean hasSensor();

    boolean hasWecarId();

    boolean isGpsAvailable();

    boolean isSimulateLocation();

    boolean isSupportIns();

    void registerDistrictChangedListener(GeoDistrictChangedListener geoDistrictChangedListener);

    void registerLocationInfoListener(GeoLocationListener geoLocationListener);

    void registerSatellitesChangedListener(GeoLocationSatellitesListener geoLocationSatellitesListener);

    void restartWithWeCarId(String str);

    void setIsUseCarSpeed(boolean z);

    void startLocation(int i);

    void startSimulateLocation(String str);

    void stopSimulateLocation();

    void unregisterDistrictChangedListener(GeoDistrictChangedListener geoDistrictChangedListener);

    void unregisterLocationInfoListener(GeoLocationListener geoLocationListener);

    void unregisterSatellitesChangedListener(GeoLocationSatellitesListener geoLocationSatellitesListener);
}
