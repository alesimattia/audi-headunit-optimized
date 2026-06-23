package com.tencent.taes.remote.impl.routeguide;

import android.os.IBinder;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarNaviRoadConditionInfo;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarSnapShotInfo;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.routeguide.IRouteGuideApi;
import com.tencent.taes.remote.api.routeguide.IRouteGuideService;
import com.tencent.taes.remote.impl.BaseRemoteApi;
import com.tencent.taes.util.GsonUtils;

/* JADX INFO: loaded from: classes.dex */
public class RouteGuideRemoteApi extends BaseRemoteApi implements IRouteGuideApi {
    private static final String TAG = "RouteGuideRemoteApi";
    private IRouteGuideService mRouteGuideService;

    private RouteGuideRemoteApi(IBinder binder, IBinder smsbinder) {
        super(binder, smsbinder);
        this.mRouteGuideService = IRouteGuideService.Stub.asInterface(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public Pair<String, String> subscribeModuleBinder() {
        return new Pair<>(ServerCompConstant.MAP, IRouteGuideService.Stub.class.getName());
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderConnect(IBinder binder) {
        this.mRouteGuideService = IRouteGuideService.Stub.asInterface(binder);
        super.binderConnect(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderDisConnect() {
        super.binderDisConnect();
    }

    @Override // com.tencent.taes.remote.api.routeguide.IRouteGuideApi
    public int getNaviStatus() {
        Log.d(TAG, "getNaviStatus");
        if (this.mRouteGuideService != null) {
            try {
                return this.mRouteGuideService.getNaviStatus();
            } catch (RemoteException e) {
                e.printStackTrace();
                return -1;
            }
        }
        return -1;
    }

    @Override // com.tencent.taes.remote.api.routeguide.IRouteGuideApi
    public WeCarNaviRoadConditionInfo getWeCarNaviRoadConditionInfo() {
        Log.d(TAG, "getWeCarNaviRoadConditionInfo");
        if (this.mRouteGuideService != null) {
            try {
                String weCarNaviRoadConditionInfo = this.mRouteGuideService.getWeCarNaviRoadConditionInfo();
                if (!TextUtils.isEmpty(weCarNaviRoadConditionInfo)) {
                    return (WeCarNaviRoadConditionInfo) GsonUtils.fromJson(weCarNaviRoadConditionInfo, WeCarNaviRoadConditionInfo.class);
                }
                return null;
            } catch (RemoteException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.routeguide.IRouteGuideApi
    public WeCarSnapShotInfo getWeCarSnapShotInfo() {
        Log.d(TAG, "getWeCarSnapShotInfo");
        if (this.mRouteGuideService != null) {
            try {
                String weCarSnapShotInfo = this.mRouteGuideService.getWeCarSnapShotInfo();
                if (!TextUtils.isEmpty(weCarSnapShotInfo)) {
                    return (WeCarSnapShotInfo) GsonUtils.fromJson(weCarSnapShotInfo, WeCarSnapShotInfo.class);
                }
                return null;
            } catch (RemoteException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }
}
