package com.tencent.taes.impl.location;

import android.util.Log;
import com.tencent.taes.api.location.ILocationApi;
import com.tencent.taes.framework.APIResult;
import com.tencent.taes.framework.BuildConfig;
import com.tencent.taes.framework.TAESFrameworkManager;
import com.tencent.taes.framework.listener.TAESCommonListener;
import com.tencent.taes.impl.base.AbstractApi;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.IServerConnectListener;
import com.tencent.taes.remote.api.location.bean.LocationBean;

/* JADX INFO: loaded from: classes.dex */
public class LocationApiImpl extends AbstractApi implements ILocationApi {
    public static final String TAG = "LocationApiImp";
    private com.tencent.taes.remote.api.location.ILocationApi mLocationApi;

    public LocationApiImpl() {
        TAESFrameworkManager.getInstance().registerCompLoadListener(ServerCompConstant.LOCATION, new TAESCommonListener() { // from class: com.tencent.taes.impl.location.LocationApiImpl.1
            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onSuccess() {
                LocationApiImpl.this.getLocationApi();
            }

            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onFail(int i, String s) {
                Log.e(LocationApiImpl.TAG, "LocationloadFail：errorCode = " + i + ", msg = " + s);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public com.tencent.taes.remote.api.location.ILocationApi getLocationApi() {
        if (this.mLocationApi == null) {
            APIResult<com.tencent.taes.remote.api.location.ILocationApi> apiAPIResult = TAESFrameworkManager.getInstance().getApi(ServerCompConstant.LOCATION, com.tencent.taes.remote.api.location.ILocationApi.class, null);
            if (apiAPIResult.isSuccess()) {
                this.mLocationApi = apiAPIResult.data;
            } else {
                Log.d(TAG, "getApi Fail:" + apiAPIResult.codeDescription());
            }
        }
        return this.mLocationApi;
    }

    @Override // com.tencent.taes.api.location.ILocationApi
    public LocationBean getCurLocation() {
        Log.d(TAG, "getCurLocation");
        if (getLocationApi() != null) {
            return getLocationApi().getCurLocation();
        }
        return new LocationBean();
    }

    @Override // com.tencent.taes.impl.base.AbstractApi
    public void dispose() {
    }

    @Override // com.tencent.taes.api.base.BaseApi
    public String getApiVersion() {
        return BuildConfig.VERSION_NAME;
    }

    @Override // com.tencent.taes.remote.api.IRegitsterConnectStateApi
    public void registerConnectListener(IServerConnectListener iServerConnectListener) {
        if (this.mLocationApi == null) {
            getLocationApi();
        } else {
            this.mLocationApi.registerConnectListener(iServerConnectListener);
        }
    }

    @Override // com.tencent.taes.remote.api.IRegitsterConnectStateApi
    public void unregisterConnectListener(IServerConnectListener iServerConnectListener) {
        if (this.mLocationApi == null) {
            getLocationApi();
        } else {
            this.mLocationApi.unregisterConnectListener(iServerConnectListener);
        }
    }
}
