package com.tencent.taes.impl.routeguide;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import com.tencent.taes.TaesSDKHelper;
import com.tencent.taes.api.routeguide.IRouteGuideApi;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarNaviRoadConditionInfo;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarSnapShotInfo;
import com.tencent.taes.framework.APIResult;
import com.tencent.taes.framework.BuildConfig;
import com.tencent.taes.framework.TAESFrameworkManager;
import com.tencent.taes.framework.bean.IPCEvent;
import com.tencent.taes.framework.listener.TAESCommonListener;
import com.tencent.taes.framework.parser.ConfigConstant;
import com.tencent.taes.impl.base.AbstractApi;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.IServerConnectListener;
import com.tencent.taes.remote.api.open.OpenApiConsts;
import com.tencent.taes.util.config.ConfigManager;

/* JADX INFO: loaded from: classes.dex */
public class RouteGuideApiImpl extends AbstractApi implements IRouteGuideApi {
    public static final String TAG = "RouteGuideApiImp";
    private com.tencent.taes.remote.api.routeguide.IRouteGuideApi mRouteGuideApi = null;
    private String mIntentScheme = ConfigManager.getInstance().getConfigInfo(TaesSDKHelper.getContext(), TaesSDKHelper.getConfigFileName()).getString(ConfigConstant.INTENT_URI_SCHEME);
    private String mIntentAction = ConfigManager.getInstance().getConfigInfo(TaesSDKHelper.getContext(), TaesSDKHelper.getConfigFileName()).getString(ConfigConstant.INTENT_API_ACTION);

    public RouteGuideApiImpl() {
        TAESFrameworkManager.getInstance().registerCompLoadListener(ServerCompConstant.MAP, new TAESCommonListener() { // from class: com.tencent.taes.impl.routeguide.RouteGuideApiImpl.1
            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onSuccess() {
                RouteGuideApiImpl.this.getRouteGuideApi();
            }

            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onFail(int i, String s) {
                Log.e(RouteGuideApiImpl.TAG, "MapServiceloadFail：errorCode = " + i + ", msg = " + s);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public com.tencent.taes.remote.api.routeguide.IRouteGuideApi getRouteGuideApi() {
        if (this.mRouteGuideApi == null) {
            APIResult<com.tencent.taes.remote.api.routeguide.IRouteGuideApi> apiAPIResult = TAESFrameworkManager.getInstance().getApi(ServerCompConstant.MAP, com.tencent.taes.remote.api.routeguide.IRouteGuideApi.class, null);
            if (apiAPIResult.isSuccess()) {
                this.mRouteGuideApi = apiAPIResult.data;
            } else {
                Log.d(TAG, "getApi Fail:" + apiAPIResult.codeDescription());
            }
        }
        return this.mRouteGuideApi;
    }

    @Override // com.tencent.taes.remote.api.routeguide.IRouteGuideApi
    public WeCarNaviRoadConditionInfo getWeCarNaviRoadConditionInfo() {
        Log.d(TAG, "getNaviStatus");
        if (getRouteGuideApi() != null) {
            return getRouteGuideApi().getWeCarNaviRoadConditionInfo();
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.routeguide.IRouteGuideApi
    public WeCarSnapShotInfo getWeCarSnapShotInfo() {
        if (getRouteGuideApi() != null) {
            return getRouteGuideApi().getWeCarSnapShotInfo();
        }
        return null;
    }

    @Override // com.tencent.taes.api.routeguide.IRouteGuideApi
    public void startNavi(boolean isRealNavi, boolean forceStartSpeak, double destLatitude, double destLongitude) {
        Log.d(TAG, "startNavi : isRealNavi ——>> " + isRealNavi + " , forceStartSpeak ——>> " + forceStartSpeak + " , destLatitude ——>> " + destLatitude + " , destLongitude ——>> " + destLongitude);
        Intent intent = new Intent(this.mIntentAction);
        StringBuilder sb = new StringBuilder();
        sb.append(this.mIntentScheme);
        sb.append("://");
        sb.append(OpenApiConsts.Host.START_STOP_NAVI);
        sb.append("?");
        intent.setData(Uri.parse(sb.toString()));
        intent.putExtra(OpenApiConsts.Key.START_STOP_TYPE, 1);
        intent.putExtra(OpenApiConsts.Key.IS_REAL_NAVI, isRealNavi);
        intent.putExtra(OpenApiConsts.Key.FORCE_START_SPEAK, forceStartSpeak);
        intent.putExtra(OpenApiConsts.Key.DEST_LATITUDE, destLatitude);
        intent.putExtra(OpenApiConsts.Key.DEST_LONGITUDE, destLongitude);
        intent.putExtra(OpenApiConsts.Key.START_NAVI_TYPE, 1);
        intent.setFlags(268435456);
        TaesSDKHelper.getContext().startActivity(intent);
    }

    @Override // com.tencent.taes.api.routeguide.IRouteGuideApi
    public void startNavi(boolean isRealNavi, boolean forceStartSpeak, double startLatitude, double startLongitude, double destLatitude, double destLongitude) {
        Log.d(TAG, "startNavi : isRealNavi ——>> " + isRealNavi + " , forceStartSpeak ——>> " + forceStartSpeak + " , startLatitude ——>> " + startLatitude + " , startLongitude ——>> " + startLongitude + " , destLatitude ——>> " + destLatitude + " , destLongitude ——>> " + destLongitude);
        Intent intent = new Intent(this.mIntentAction);
        StringBuilder sb = new StringBuilder();
        sb.append(this.mIntentScheme);
        sb.append("://");
        sb.append(OpenApiConsts.Host.START_STOP_NAVI);
        sb.append("?");
        intent.setData(Uri.parse(sb.toString()));
        intent.putExtra(OpenApiConsts.Key.START_STOP_TYPE, 1);
        intent.putExtra(OpenApiConsts.Key.IS_REAL_NAVI, isRealNavi);
        intent.putExtra(OpenApiConsts.Key.FORCE_START_SPEAK, forceStartSpeak);
        intent.putExtra(OpenApiConsts.Key.START_LATITUDE, startLatitude);
        intent.putExtra(OpenApiConsts.Key.START_LONGITUDE, startLongitude);
        intent.putExtra(OpenApiConsts.Key.DEST_LATITUDE, destLatitude);
        intent.putExtra(OpenApiConsts.Key.DEST_LONGITUDE, destLongitude);
        intent.putExtra(OpenApiConsts.Key.START_NAVI_TYPE, 2);
        intent.setFlags(268435456);
        TaesSDKHelper.getContext().startActivity(intent);
    }

    @Override // com.tencent.taes.api.routeguide.IRouteGuideApi
    public void stopNavi(boolean closeSpeak) {
        Log.d(TAG, "stopNavi : closeSpeak ——>> " + closeSpeak);
        Bundle data = new Bundle();
        data.putInt(OpenApiConsts.Key.START_STOP_TYPE, 2);
        data.putBoolean(OpenApiConsts.Key.CLOSE_SPEAK, closeSpeak);
        TAESFrameworkManager.getInstance().getEventDispatcher().publish(new IPCEvent(OpenApiConsts.Host.START_STOP_NAVI, data));
    }

    @Override // com.tencent.taes.api.routeguide.IRouteGuideApi
    public void updateNaviDest(double destLatitude, double destLongitude) {
        Log.d(TAG, "updateNaviDest : destLatitude ——>> " + destLatitude + " , destLongitude ——>> " + destLongitude);
        Intent intent = new Intent(this.mIntentAction);
        intent.setData(Uri.parse(this.mIntentScheme + "://" + OpenApiConsts.Host.UPDATE_NAVI_DEST + "?"));
        intent.putExtra(OpenApiConsts.Key.DEST_LATITUDE, destLatitude);
        intent.putExtra(OpenApiConsts.Key.DEST_LONGITUDE, destLongitude);
        intent.setFlags(268435456);
        TaesSDKHelper.getContext().startActivity(intent);
    }

    @Override // com.tencent.taes.api.routeguide.IRouteGuideApi
    public void startCruise(boolean forceStartSpeak) {
        Log.d(TAG, "startCruise : forceStartSpeak ——>> " + forceStartSpeak);
        Intent intent = new Intent(this.mIntentAction);
        intent.setData(Uri.parse(this.mIntentScheme + "://" + OpenApiConsts.Host.START_STOP_CRUISE + "?"));
        intent.putExtra(OpenApiConsts.Key.START_STOP_TYPE, 1);
        intent.putExtra(OpenApiConsts.Key.CLOSE_SPEAK, forceStartSpeak);
        intent.setFlags(268435456);
        TaesSDKHelper.getContext().startActivity(intent);
    }

    @Override // com.tencent.taes.api.routeguide.IRouteGuideApi
    public void stopCruise(boolean closeSpeak) {
        Log.d(TAG, "stopCruise : closeSpeak ——>> " + closeSpeak);
        Intent intent = new Intent(this.mIntentAction);
        intent.setData(Uri.parse(this.mIntentScheme + "://" + OpenApiConsts.Host.START_STOP_CRUISE + "?"));
        intent.putExtra(OpenApiConsts.Key.START_STOP_TYPE, 2);
        intent.putExtra(OpenApiConsts.Key.CLOSE_SPEAK, closeSpeak);
        intent.setFlags(268435456);
        TaesSDKHelper.getContext().startActivity(intent);
    }

    @Override // com.tencent.taes.api.routeguide.IRouteGuideApi
    public void setCruiseSpeakType(boolean open) {
        Log.d(TAG, "setCruiseSpeakType : open ——>> " + open);
        Bundle data = new Bundle();
        data.putBoolean(OpenApiConsts.Key.CLOSE_SPEAK, open);
        TAESFrameworkManager.getInstance().getEventDispatcher().publish(new IPCEvent(OpenApiConsts.Host.SET_CRUISE_SPEAK_TYPE, data));
    }

    @Override // com.tencent.taes.api.routeguide.IRouteGuideApi
    public void goHome() {
        Log.d(TAG, "goHome");
        Intent intent = new Intent(this.mIntentAction);
        intent.setData(Uri.parse(this.mIntentScheme + "://" + OpenApiConsts.Host.GO_HOME_COMPANY + "?"));
        intent.putExtra(OpenApiConsts.Key.GO_HOME_COMPANY_TYPE, 1);
        intent.putExtra("from", 1);
        intent.setFlags(268435456);
        TaesSDKHelper.getContext().startActivity(intent);
    }

    @Override // com.tencent.taes.api.routeguide.IRouteGuideApi
    public void goCompany() {
        Log.d(TAG, "goCompany");
        Intent intent = new Intent(this.mIntentAction);
        intent.setData(Uri.parse(this.mIntentScheme + "://" + OpenApiConsts.Host.GO_HOME_COMPANY + "?"));
        intent.putExtra(OpenApiConsts.Key.GO_HOME_COMPANY_TYPE, 2);
        intent.putExtra("from", 1);
        intent.setFlags(268435456);
        TaesSDKHelper.getContext().startActivity(intent);
    }

    @Override // com.tencent.taes.impl.base.AbstractApi
    public void dispose() {
    }

    @Override // com.tencent.taes.remote.api.routeguide.IRouteGuideApi
    public int getNaviStatus() {
        Log.d(TAG, "getNaviStatus");
        if (getRouteGuideApi() != null) {
            return getRouteGuideApi().getNaviStatus();
        }
        return -1;
    }

    @Override // com.tencent.taes.remote.api.IRegitsterConnectStateApi
    public void registerConnectListener(IServerConnectListener iServerConnectListener) {
        if (this.mRouteGuideApi == null) {
            getRouteGuideApi();
        } else {
            this.mRouteGuideApi.registerConnectListener(iServerConnectListener);
        }
    }

    @Override // com.tencent.taes.remote.api.IRegitsterConnectStateApi
    public void unregisterConnectListener(IServerConnectListener iServerConnectListener) {
        if (this.mRouteGuideApi == null) {
            getRouteGuideApi();
        } else {
            this.mRouteGuideApi.unregisterConnectListener(iServerConnectListener);
        }
    }

    @Override // com.tencent.taes.api.base.BaseApi
    public String getApiVersion() {
        return BuildConfig.VERSION_NAME;
    }
}
