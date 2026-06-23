package com.tencent.taes.remote.impl.location;

import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import android.util.Pair;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.location.ILocationApi;
import com.tencent.taes.remote.api.location.ILocationService;
import com.tencent.taes.remote.api.location.bean.LatLng;
import com.tencent.taes.remote.api.location.bean.LocationBean;
import com.tencent.taes.remote.api.location.bean.LocationDistrict;
import com.tencent.taes.remote.api.location.listener.GeoDistrictChangedListener;
import com.tencent.taes.remote.api.location.listener.GeoLocationListener;
import com.tencent.taes.remote.api.location.listener.GeoLocationSatellitesListener;
import com.tencent.taes.remote.api.location.listener.IDistrictChangedListener;
import com.tencent.taes.remote.api.location.listener.ILocationListener;
import com.tencent.taes.remote.api.location.listener.ILocationSatellitesListener;
import com.tencent.taes.remote.impl.BaseRemoteApi;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: classes.dex */
public class LocationRemoteApi extends BaseRemoteApi implements ILocationApi {
    private static final String TAG = "LocationRemoteApi";
    private IDistrictChangedListener districtChangedListener;
    private ILocationListener locationListener;
    private CopyOnWriteArrayList<GeoDistrictChangedListener> mDistrictChangedListenerList;
    private CopyOnWriteArrayList<GeoLocationListener> mLocationListenerList;
    private ILocationService mLocationService;
    private CopyOnWriteArrayList<GeoLocationSatellitesListener> mSatellitesChangedListenerList;
    private ILocationSatellitesListener satellitesListener;

    private LocationRemoteApi(IBinder binder, IBinder smsbinder) {
        super(binder, smsbinder);
        this.mLocationListenerList = new CopyOnWriteArrayList<>();
        this.mDistrictChangedListenerList = new CopyOnWriteArrayList<>();
        this.mSatellitesChangedListenerList = new CopyOnWriteArrayList<>();
        this.locationListener = new ILocationListener.Stub() { // from class: com.tencent.taes.remote.impl.location.LocationRemoteApi.1
            @Override // com.tencent.taes.remote.api.location.listener.ILocationListener
            public void onLocationChange(LocationBean location) throws RemoteException {
                if (location == null) {
                    return;
                }
                int index = 0;
                while (index < LocationRemoteApi.this.mLocationListenerList.size()) {
                    try {
                        GeoLocationListener listener = (GeoLocationListener) LocationRemoteApi.this.mLocationListenerList.get(index);
                        if (listener != null) {
                            listener.onLocationChange(location);
                        }
                        index++;
                    } catch (Throwable e) {
                        e.printStackTrace();
                    }
                }
            }

            @Override // com.tencent.taes.remote.api.location.listener.ILocationListener
            public void onGpsStatusChange(boolean enabled, boolean available) throws RemoteException {
                for (GeoLocationListener listener : LocationRemoteApi.this.mLocationListenerList) {
                    if (listener != null) {
                        listener.onGpsStatusChange(enabled, available);
                    }
                }
            }
        };
        this.districtChangedListener = new IDistrictChangedListener.Stub() { // from class: com.tencent.taes.remote.impl.location.LocationRemoteApi.2
            @Override // com.tencent.taes.remote.api.location.listener.IDistrictChangedListener
            public void onDistrictChanged(LocationDistrict district) throws RemoteException {
                if (district == null) {
                    return;
                }
                int index = 0;
                while (index < LocationRemoteApi.this.mDistrictChangedListenerList.size()) {
                    try {
                        GeoDistrictChangedListener listener = (GeoDistrictChangedListener) LocationRemoteApi.this.mDistrictChangedListenerList.get(index);
                        listener.onDistrictChanged(district);
                        index++;
                    } catch (Throwable e) {
                        e.printStackTrace();
                    }
                }
            }
        };
        this.satellitesListener = new ILocationSatellitesListener.Stub() { // from class: com.tencent.taes.remote.impl.location.LocationRemoteApi.3
            @Override // com.tencent.taes.remote.api.location.listener.ILocationSatellitesListener
            public void onSatellitesChanged(int num) throws RemoteException {
                int index = 0;
                while (index < LocationRemoteApi.this.mSatellitesChangedListenerList.size()) {
                    try {
                        GeoLocationSatellitesListener listener = (GeoLocationSatellitesListener) LocationRemoteApi.this.mSatellitesChangedListenerList.get(index);
                        listener.onSatellitesChanged(num);
                        index++;
                    } catch (Throwable e) {
                        e.printStackTrace();
                    }
                }
            }
        };
        this.mLocationService = ILocationService.Stub.asInterface(binder);
        registerService();
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public Pair<String, String> subscribeModuleBinder() {
        return new Pair<>(ServerCompConstant.LOCATION, ILocationService.Stub.class.getName());
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderConnect(IBinder binder) {
        this.mLocationService = ILocationService.Stub.asInterface(binder);
        unregisterService();
        registerService();
        super.binderConnect(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderDisConnect() {
        super.binderDisConnect();
    }

    private void registerService() {
        try {
            if (this.mLocationService != null) {
                this.mLocationService.registerLocationInfoListener(this.locationListener);
            }
        } catch (RemoteException e) {
            Log.e(TAG, "registerRemoteLocationInfoListener exception caught", e);
            e.printStackTrace();
        }
        try {
            if (this.mLocationService != null) {
                this.mLocationService.registerDistrictChangedListener(this.districtChangedListener);
            }
        } catch (RemoteException e2) {
            Log.e(TAG, "registerRemoteDistrictInfoListener exception caught", e2);
            e2.printStackTrace();
        }
        try {
            if (this.mLocationService != null) {
                this.mLocationService.registerSatellitesChangedListener(this.satellitesListener);
            }
        } catch (RemoteException e3) {
            Log.e(TAG, "registerRemoteSatellitesChangedInfoListener exception caught", e3);
            e3.printStackTrace();
        }
    }

    private void unregisterService() {
        try {
            if (this.mLocationService != null) {
                this.mLocationService.unregisterLocationInfoListener(this.locationListener);
            }
        } catch (RemoteException e) {
            Log.e(TAG, "unregisterRemoteLocationInfoListener exception caught", e);
            e.printStackTrace();
        }
        try {
            if (this.mLocationService != null) {
                this.mLocationService.unregisterDistrictChangedListener(this.districtChangedListener);
            }
        } catch (RemoteException e2) {
            Log.e(TAG, "unregisterRemoteDistrictInfoListener exception caught", e2);
            e2.printStackTrace();
        }
        try {
            if (this.mLocationService != null) {
                this.mLocationService.unregisterSatellitesChangedListener(this.satellitesListener);
            }
        } catch (RemoteException e3) {
            Log.e(TAG, "unregisterRemoteSatellitesChangedInfoListener exception caught", e3);
            e3.printStackTrace();
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public void registerLocationInfoListener(GeoLocationListener listener) {
        if (this.mLocationService != null && listener != null && !this.mLocationListenerList.contains(listener)) {
            this.mLocationListenerList.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public void unregisterLocationInfoListener(GeoLocationListener listener) {
        if (listener == null) {
            return;
        }
        this.mLocationListenerList.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public void registerDistrictChangedListener(GeoDistrictChangedListener listener) {
        if (this.mLocationService != null && listener != null && !this.mDistrictChangedListenerList.contains(listener)) {
            this.mDistrictChangedListenerList.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public void unregisterDistrictChangedListener(GeoDistrictChangedListener listener) {
        if (listener == null) {
            return;
        }
        this.mDistrictChangedListenerList.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public void registerSatellitesChangedListener(GeoLocationSatellitesListener listener) {
        if (this.mLocationService != null && listener != null && !this.mSatellitesChangedListenerList.contains(listener)) {
            this.mSatellitesChangedListenerList.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public void unregisterSatellitesChangedListener(GeoLocationSatellitesListener listener) {
        if (listener == null) {
            return;
        }
        this.mSatellitesChangedListenerList.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public void startLocation(int type) {
        if (this.mLocationService != null) {
            try {
                this.mLocationService.startLocation(type);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public boolean isGpsAvailable() {
        if (this.mLocationService == null) {
            return false;
        }
        try {
            boolean gpsAvailable = this.mLocationService.isGpsAvailable();
            return gpsAvailable;
        } catch (RemoteException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public int getSatellitesNum() {
        if (this.mLocationService == null) {
            return 0;
        }
        try {
            int satellitesNum = this.mLocationService.getSatellitesNum();
            return satellitesNum;
        } catch (RemoteException e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public LocationDistrict getLastValidDistrict() {
        if (this.mLocationService == null) {
            return null;
        }
        try {
            LocationDistrict locationDistrict = this.mLocationService.getLastValidDistrict();
            return locationDistrict;
        } catch (RemoteException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public LocationBean getCurLocation() {
        if (this.mLocationService == null) {
            return null;
        }
        try {
            LocationBean locationBean = this.mLocationService.getCurLocation();
            return locationBean;
        } catch (RemoteException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public LatLng getLastValidLocation() {
        if (this.mLocationService == null) {
            return null;
        }
        try {
            LatLng latLng = this.mLocationService.getLastValidLocation();
            return latLng;
        } catch (RemoteException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public long getGpsTime() {
        if (this.mLocationService == null) {
            return 0L;
        }
        try {
            long gpsTime = this.mLocationService.getGpsTime();
            return gpsTime;
        } catch (RemoteException e) {
            e.printStackTrace();
            return 0L;
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public int getGpsSignalLevel() {
        if (this.mLocationService == null) {
            return 5;
        }
        try {
            int gpsSignalLevel = this.mLocationService.getGpsSignalLevel();
            return gpsSignalLevel;
        } catch (RemoteException e) {
            e.printStackTrace();
            return 5;
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public void setIsUseCarSpeed(boolean mIsUseCarSpeed) {
        if (this.mLocationService != null) {
            try {
                this.mLocationService.setIsUseCarSpeed(mIsUseCarSpeed);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public boolean hasSensor() {
        if (this.mLocationService == null) {
            return false;
        }
        try {
            boolean ishasSensor = this.mLocationService.hasSensor();
            return ishasSensor;
        } catch (RemoteException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public boolean isSupportIns() {
        if (this.mLocationService == null) {
            return false;
        }
        try {
            boolean isSupport = this.mLocationService.isSupportIns();
            return isSupport;
        } catch (RemoteException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public String getLocationSDKVersion() {
        if (this.mLocationService == null) {
            return null;
        }
        try {
            String version = this.mLocationService.getLocationSDKVersion();
            return version;
        } catch (RemoteException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public boolean hasWecarId() {
        if (this.mLocationService != null) {
            try {
                return this.mLocationService.hasWecarId();
            } catch (RemoteException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public void restartWithWeCarId(String weCarId) {
        if (this.mLocationService != null) {
            try {
                this.mLocationService.restartWithWeCarId(weCarId);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public void startSimulateLocation(String filePath) {
        if (this.mLocationService != null) {
            try {
                this.mLocationService.startSimulateLocation(filePath);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public void stopSimulateLocation() {
        if (this.mLocationService != null) {
            try {
                this.mLocationService.stopSimulateLocation();
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.location.ILocationApi
    public boolean isSimulateLocation() {
        if (this.mLocationService == null) {
            return false;
        }
        try {
            boolean isSimulating = this.mLocationService.isSimulateLocation();
            return isSimulating;
        } catch (RemoteException e) {
            e.printStackTrace();
            return false;
        }
    }
}
