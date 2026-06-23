package com.tencent.taes.impl.infodispatch;

import android.util.Log;
import com.tencent.taes.api.infodispatch.InfoDispatchApi;
import com.tencent.taes.framework.APIResult;
import com.tencent.taes.framework.BuildConfig;
import com.tencent.taes.framework.TAESFrameworkManager;
import com.tencent.taes.framework.listener.TAESCommonListener;
import com.tencent.taes.impl.base.AbstractApi;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.IServerConnectListener;
import com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi;
import com.tencent.taes.remote.api.infodispatcher.listener.OnAppEventListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnArriveEventListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnCameraInfoListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnDrLocationInfoListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnETAInfoListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnEnlargeMapInfoListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnGuideInfoListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnHighwayInfoListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnLaneLineInfoListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnLinkInfoListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnMapModeEventListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnMapMonitorListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnMediaInfoListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnNaviRoadConditionInfoListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnOtherInfoListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnRouteEventListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnStartStopEventListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnWeChatMessageListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnYawEventListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnZoneSpeedInfoListener;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: classes.dex */
public class InfoDispatchApiImpl extends AbstractApi implements InfoDispatchApi {
    private static final String TAG = "InfoDispatchApiImpl";
    private IInfoDispatchApi mInfoDispatchRemoteApi;
    private final List<OnArriveEventListener> mArriveEventListeners = new CopyOnWriteArrayList();
    private final List<OnEnlargeMapInfoListener> mEnlargedMapInfoListeners = new CopyOnWriteArrayList();
    private final List<OnETAInfoListener> mETAInfoListeners = new CopyOnWriteArrayList();
    private final List<OnGuideInfoListener> mGuideInfoListeners = new CopyOnWriteArrayList();
    private final List<OnHighwayInfoListener> mHighwayInfoListeners = new CopyOnWriteArrayList();
    private final List<OnLaneLineInfoListener> mLaneLineInfoListeners = new CopyOnWriteArrayList();
    private final List<OnRouteEventListener> mRouteEventListeners = new CopyOnWriteArrayList();
    private final List<OnStartStopEventListener> mStartStopEventListeners = new CopyOnWriteArrayList();
    private final List<OnYawEventListener> mYawEventListeners = new CopyOnWriteArrayList();
    private final List<OnZoneSpeedInfoListener> mZoneSpeedInfoListeners = new CopyOnWriteArrayList();
    private final List<OnCameraInfoListener> mCameraInfoListeners = new CopyOnWriteArrayList();
    private final List<OnNaviRoadConditionInfoListener> mNaviRoadConditionInfoListeners = new CopyOnWriteArrayList();
    private final List<OnMediaInfoListener> mMediaInfoListeners = new CopyOnWriteArrayList();
    private final List<OnWeChatMessageListener> mWeChatMessageListeners = new CopyOnWriteArrayList();
    private final List<OnOtherInfoListener> mOtherInfoListeners = new CopyOnWriteArrayList();
    private final List<OnMapMonitorListener> mMapMonitorListeners = new CopyOnWriteArrayList();
    private final List<OnAppEventListener> mAppEventListeners = new CopyOnWriteArrayList();
    private final List<OnDrLocationInfoListener> mDrLocationInfoListeners = new CopyOnWriteArrayList();
    private final List<OnLinkInfoListener> mLinkInfoListeners = new CopyOnWriteArrayList();
    private final List<OnMapModeEventListener> mMapModeEventListeners = new CopyOnWriteArrayList();

    public InfoDispatchApiImpl() {
        TAESFrameworkManager.getInstance().registerCompLoadListener(ServerCompConstant.INFO_DISPATCHER, new TAESCommonListener() { // from class: com.tencent.taes.impl.infodispatch.InfoDispatchApiImpl.1
            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onSuccess() {
                InfoDispatchApiImpl.this.getInfoDispatchRemoteApi();
            }

            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onFail(int i, String s) {
                InfoDispatchApiImpl.this.printMsg("TAESFrameworkManager.getInstance().getInfoDispatchRemoteApi 获取失败 onFail：errorCode = " + i + ", msg = " + s);
            }
        });
    }

    private void unInit() {
        unInitListener();
        clearListener();
        this.mInfoDispatchRemoteApi = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getInfoDispatchRemoteApi() {
        APIResult<IInfoDispatchApi> apiAPIResult = TAESFrameworkManager.getInstance().getApi(ServerCompConstant.INFO_DISPATCHER, IInfoDispatchApi.class, null);
        if (apiAPIResult.isSuccess()) {
            this.mInfoDispatchRemoteApi = apiAPIResult.data;
            initListener();
            return;
        }
        printMsg("TAESFrameworkManager.getInstance().getInfoDispatchRemoteApi 获取失败 " + apiAPIResult.codeDescription());
        Log.e(TAG, "getAPI Fail:" + apiAPIResult.codeDescription());
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerArriveEventListener(OnArriveEventListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mArriveEventListeners.contains(listener)) {
            this.mArriveEventListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerArriveEventListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerArriveEventListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterArriveEventListener(OnArriveEventListener listener) {
        if (listener == null) {
            return;
        }
        this.mArriveEventListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterArriveEventListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterArriveEventListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerEnlargeMapInfoListenerr(OnEnlargeMapInfoListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mEnlargedMapInfoListeners.contains(listener)) {
            this.mEnlargedMapInfoListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerEnlargeMapInfoListenerr Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerEnlargeMapInfoListenerr(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterEnlargeMapInfoListener(OnEnlargeMapInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mEnlargedMapInfoListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterEnlargeMapInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterEnlargeMapInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerETAInfoListener(OnETAInfoListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mETAInfoListeners.contains(listener)) {
            this.mETAInfoListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerETAInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerETAInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterETAInfoListener(OnETAInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mETAInfoListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterETAInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterETAInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerGuideInfoListener(OnGuideInfoListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mGuideInfoListeners.contains(listener)) {
            this.mGuideInfoListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerGuideInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerGuideInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterGuideInfoListener(OnGuideInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mGuideInfoListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterGuideInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterGuideInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerHighwayInfoListener(OnHighwayInfoListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mHighwayInfoListeners.contains(listener)) {
            this.mHighwayInfoListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerHighwayInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerHighwayInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterHighwayInfoListener(OnHighwayInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mHighwayInfoListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterHighwayInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterHighwayInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerLaneLineInfoListener(OnLaneLineInfoListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mLaneLineInfoListeners.contains(listener)) {
            this.mLaneLineInfoListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerLaneLineInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerLaneLineInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterLaneLineInfoListener(OnLaneLineInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mLaneLineInfoListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterLaneLineInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterLaneLineInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerRouteEventListener(OnRouteEventListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mRouteEventListeners.contains(listener)) {
            this.mRouteEventListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerRouteEventListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerRouteEventListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterRouteEventListener(OnRouteEventListener listener) {
        if (listener == null) {
            return;
        }
        this.mRouteEventListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterRouteEventListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterRouteEventListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerStartStopEventListener(OnStartStopEventListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mStartStopEventListeners.contains(listener)) {
            this.mStartStopEventListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerStartStopEventListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerStartStopEventListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterStartStopEventListener(OnStartStopEventListener listener) {
        if (listener == null) {
            return;
        }
        this.mStartStopEventListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterStartStopEventListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterStartStopEventListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerYawEventListener(OnYawEventListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mYawEventListeners.contains(listener)) {
            this.mYawEventListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerYawEventListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerYawEventListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterYawEventListener(OnYawEventListener listener) {
        if (listener == null) {
            return;
        }
        this.mYawEventListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterYawEventListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterYawEventListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerZoneSpeedInfoListener(OnZoneSpeedInfoListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mZoneSpeedInfoListeners.contains(listener)) {
            this.mZoneSpeedInfoListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerZoneSpeedInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerZoneSpeedInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterZoneSpeedInfoListener(OnZoneSpeedInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mZoneSpeedInfoListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterZoneSpeedInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterZoneSpeedInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerCameraInfoListener(OnCameraInfoListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mCameraInfoListeners.contains(listener)) {
            this.mCameraInfoListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerCameraInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerCameraInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterCameraInfoListener(OnCameraInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mCameraInfoListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterCameraInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterCameraInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerNaviRoadConditionInfoListener(OnNaviRoadConditionInfoListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mNaviRoadConditionInfoListeners.contains(listener)) {
            this.mNaviRoadConditionInfoListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerNaviRoadConditionInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerNaviRoadConditionInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterNaviRoadConditionInfoListener(OnNaviRoadConditionInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mNaviRoadConditionInfoListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterNaviRoadConditionInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterNaviRoadConditionInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerMediaInfoListener(OnMediaInfoListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mMediaInfoListeners.contains(listener)) {
            this.mMediaInfoListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerMediaInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerMediaInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterMediaInfoListener(OnMediaInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mMediaInfoListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterMediaInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterMediaInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerWeChatMessageListener(OnWeChatMessageListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mWeChatMessageListeners.contains(listener)) {
            this.mWeChatMessageListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerWeChatMessageListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerWeChatMessageListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterWeChatMessageListener(OnWeChatMessageListener listener) {
        if (listener == null) {
            return;
        }
        this.mWeChatMessageListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterWeChatMessageListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterWeChatMessageListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerOtherInfoListener(OnOtherInfoListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mOtherInfoListeners.contains(listener)) {
            this.mOtherInfoListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerOtherInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerOtherInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterOtherInfoListener(OnOtherInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mOtherInfoListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterOtherInfoListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterOtherInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerMapMonitorListener(OnMapMonitorListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mMapMonitorListeners.contains(listener)) {
            this.mMapMonitorListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerMapMonitorListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerMapMonitorListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterMapMonitorListener(OnMapMonitorListener listener) {
        if (listener == null) {
            return;
        }
        this.mMapMonitorListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterMapMonitorListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterMapMonitorListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerAppEventListener(OnAppEventListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mAppEventListeners.contains(listener)) {
            this.mAppEventListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "registerAppEventListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerAppEventListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterAppEventListener(OnAppEventListener listener) {
        if (listener == null) {
            return;
        }
        this.mAppEventListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "unregisterAppEventListener Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterAppEventListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerDrLocationInfoListener(OnDrLocationInfoListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mDrLocationInfoListeners.contains(listener)) {
            this.mDrLocationInfoListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "InfoDispatcher sendMessage Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerDrLocationInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterDrLocationInfoListener(OnDrLocationInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mDrLocationInfoListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "InfoDispatcher sendMessage Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterDrLocationInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerLinkInfoListener(OnLinkInfoListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mLinkInfoListeners.contains(listener)) {
            this.mLinkInfoListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "InfoDispatcher sendMessage Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerLinkInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterLinkInfoListener(OnLinkInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mLinkInfoListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "InfoDispatcher sendMessage Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterLinkInfoListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void registerMapModeEventListener(OnMapModeEventListener listener) {
        if (listener == null) {
            return;
        }
        if (!this.mMapModeEventListeners.contains(listener)) {
            this.mMapModeEventListeners.add(listener);
        }
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "InfoDispatcher sendMessage Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.registerMapModeEventListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public void unregisterMapModeEventListener(OnMapModeEventListener listener) {
        if (listener == null) {
            return;
        }
        this.mMapModeEventListeners.remove(listener);
        if (this.mInfoDispatchRemoteApi == null) {
            Log.e(TAG, "InfoDispatcher sendMessage Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            getInfoDispatchRemoteApi();
            return;
        }
        this.mInfoDispatchRemoteApi.unregisterMapModeEventListener(listener);
    }

    @Override // com.tencent.taes.api.infodispatch.InfoDispatchApi
    public boolean sendMessage(String appid, String jsonStr) {
        if (this.mInfoDispatchRemoteApi == null) {
            printMsg("sendMessage Exception：mInfoDispatchRemoteApi = " + this.mInfoDispatchRemoteApi);
            return false;
        }
        return this.mInfoDispatchRemoteApi.sendMessage(appid, jsonStr);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void printMsg(String msg) {
        Log.e(TAG, msg);
    }

    private void initListener() {
        if (this.mInfoDispatchRemoteApi == null) {
            return;
        }
        for (OnArriveEventListener listener : this.mArriveEventListeners) {
            this.mInfoDispatchRemoteApi.registerArriveEventListener(listener);
        }
        for (OnEnlargeMapInfoListener listener2 : this.mEnlargedMapInfoListeners) {
            this.mInfoDispatchRemoteApi.registerEnlargeMapInfoListenerr(listener2);
        }
        for (OnETAInfoListener listener3 : this.mETAInfoListeners) {
            this.mInfoDispatchRemoteApi.registerETAInfoListener(listener3);
        }
        for (OnGuideInfoListener listener4 : this.mGuideInfoListeners) {
            this.mInfoDispatchRemoteApi.registerGuideInfoListener(listener4);
        }
        for (OnHighwayInfoListener listener5 : this.mHighwayInfoListeners) {
            this.mInfoDispatchRemoteApi.registerHighwayInfoListener(listener5);
        }
        for (OnLaneLineInfoListener listener6 : this.mLaneLineInfoListeners) {
            this.mInfoDispatchRemoteApi.registerLaneLineInfoListener(listener6);
        }
        for (OnRouteEventListener listener7 : this.mRouteEventListeners) {
            this.mInfoDispatchRemoteApi.registerRouteEventListener(listener7);
        }
        for (OnStartStopEventListener listener8 : this.mStartStopEventListeners) {
            this.mInfoDispatchRemoteApi.registerStartStopEventListener(listener8);
        }
        for (OnYawEventListener listener9 : this.mYawEventListeners) {
            this.mInfoDispatchRemoteApi.registerYawEventListener(listener9);
        }
        for (OnZoneSpeedInfoListener listener10 : this.mZoneSpeedInfoListeners) {
            this.mInfoDispatchRemoteApi.registerZoneSpeedInfoListener(listener10);
        }
        for (OnCameraInfoListener listener11 : this.mCameraInfoListeners) {
            this.mInfoDispatchRemoteApi.registerCameraInfoListener(listener11);
        }
        for (OnNaviRoadConditionInfoListener listener12 : this.mNaviRoadConditionInfoListeners) {
            this.mInfoDispatchRemoteApi.registerNaviRoadConditionInfoListener(listener12);
        }
        for (OnMediaInfoListener listener13 : this.mMediaInfoListeners) {
            this.mInfoDispatchRemoteApi.registerMediaInfoListener(listener13);
        }
        for (OnWeChatMessageListener listener14 : this.mWeChatMessageListeners) {
            this.mInfoDispatchRemoteApi.registerWeChatMessageListener(listener14);
        }
        for (OnOtherInfoListener listener15 : this.mOtherInfoListeners) {
            this.mInfoDispatchRemoteApi.registerOtherInfoListener(listener15);
        }
        for (OnMapMonitorListener listener16 : this.mMapMonitorListeners) {
            this.mInfoDispatchRemoteApi.registerMapMonitorListener(listener16);
        }
        for (OnAppEventListener listener17 : this.mAppEventListeners) {
            this.mInfoDispatchRemoteApi.registerAppEventListener(listener17);
        }
        for (OnDrLocationInfoListener listener18 : this.mDrLocationInfoListeners) {
            this.mInfoDispatchRemoteApi.registerDrLocationInfoListener(listener18);
        }
        for (OnLinkInfoListener listener19 : this.mLinkInfoListeners) {
            this.mInfoDispatchRemoteApi.registerLinkInfoListener(listener19);
        }
        for (OnMapModeEventListener listener20 : this.mMapModeEventListeners) {
            this.mInfoDispatchRemoteApi.registerMapModeEventListener(listener20);
        }
    }

    private void unInitListener() {
        if (this.mInfoDispatchRemoteApi == null) {
            return;
        }
        for (OnArriveEventListener listener : this.mArriveEventListeners) {
            this.mInfoDispatchRemoteApi.unregisterArriveEventListener(listener);
        }
        for (OnEnlargeMapInfoListener listener2 : this.mEnlargedMapInfoListeners) {
            this.mInfoDispatchRemoteApi.unregisterEnlargeMapInfoListener(listener2);
        }
        for (OnETAInfoListener listener3 : this.mETAInfoListeners) {
            this.mInfoDispatchRemoteApi.unregisterETAInfoListener(listener3);
        }
        for (OnGuideInfoListener listener4 : this.mGuideInfoListeners) {
            this.mInfoDispatchRemoteApi.unregisterGuideInfoListener(listener4);
        }
        for (OnHighwayInfoListener listener5 : this.mHighwayInfoListeners) {
            this.mInfoDispatchRemoteApi.unregisterHighwayInfoListener(listener5);
        }
        for (OnLaneLineInfoListener listener6 : this.mLaneLineInfoListeners) {
            this.mInfoDispatchRemoteApi.unregisterLaneLineInfoListener(listener6);
        }
        for (OnRouteEventListener listener7 : this.mRouteEventListeners) {
            this.mInfoDispatchRemoteApi.unregisterRouteEventListener(listener7);
        }
        for (OnStartStopEventListener listener8 : this.mStartStopEventListeners) {
            this.mInfoDispatchRemoteApi.registerStartStopEventListener(listener8);
        }
        for (OnYawEventListener listener9 : this.mYawEventListeners) {
            this.mInfoDispatchRemoteApi.unregisterYawEventListener(listener9);
        }
        for (OnZoneSpeedInfoListener listener10 : this.mZoneSpeedInfoListeners) {
            this.mInfoDispatchRemoteApi.unregisterZoneSpeedInfoListener(listener10);
        }
        for (OnCameraInfoListener listener11 : this.mCameraInfoListeners) {
            this.mInfoDispatchRemoteApi.unregisterCameraInfoListener(listener11);
        }
        for (OnNaviRoadConditionInfoListener listener12 : this.mNaviRoadConditionInfoListeners) {
            this.mInfoDispatchRemoteApi.unregisterNaviRoadConditionInfoListener(listener12);
        }
        for (OnMediaInfoListener listener13 : this.mMediaInfoListeners) {
            this.mInfoDispatchRemoteApi.unregisterMediaInfoListener(listener13);
        }
        for (OnWeChatMessageListener listener14 : this.mWeChatMessageListeners) {
            this.mInfoDispatchRemoteApi.unregisterWeChatMessageListener(listener14);
        }
        for (OnOtherInfoListener listener15 : this.mOtherInfoListeners) {
            this.mInfoDispatchRemoteApi.unregisterOtherInfoListener(listener15);
        }
        for (OnMapMonitorListener listener16 : this.mMapMonitorListeners) {
            this.mInfoDispatchRemoteApi.unregisterMapMonitorListener(listener16);
        }
        for (OnAppEventListener listener17 : this.mAppEventListeners) {
            this.mInfoDispatchRemoteApi.unregisterAppEventListener(listener17);
        }
        for (OnDrLocationInfoListener listener18 : this.mDrLocationInfoListeners) {
            this.mInfoDispatchRemoteApi.unregisterDrLocationInfoListener(listener18);
        }
        for (OnLinkInfoListener listener19 : this.mLinkInfoListeners) {
            this.mInfoDispatchRemoteApi.unregisterLinkInfoListener(listener19);
        }
        for (OnMapModeEventListener listener20 : this.mMapModeEventListeners) {
            this.mInfoDispatchRemoteApi.unregisterMapModeEventListener(listener20);
        }
    }

    private void clearListener() {
        this.mArriveEventListeners.clear();
        this.mEnlargedMapInfoListeners.clear();
        this.mETAInfoListeners.clear();
        this.mGuideInfoListeners.clear();
        this.mHighwayInfoListeners.clear();
        this.mLaneLineInfoListeners.clear();
        this.mRouteEventListeners.clear();
        this.mStartStopEventListeners.clear();
        this.mYawEventListeners.clear();
        this.mZoneSpeedInfoListeners.clear();
        this.mCameraInfoListeners.clear();
        this.mNaviRoadConditionInfoListeners.clear();
        this.mMediaInfoListeners.clear();
        this.mWeChatMessageListeners.clear();
        this.mOtherInfoListeners.clear();
        this.mMapMonitorListeners.clear();
        this.mAppEventListeners.clear();
        this.mDrLocationInfoListeners.clear();
        this.mLinkInfoListeners.clear();
        this.mMapModeEventListeners.clear();
    }

    @Override // com.tencent.taes.remote.api.IRegitsterConnectStateApi
    public void registerConnectListener(IServerConnectListener iServerConnectListener) {
        if (this.mInfoDispatchRemoteApi == null) {
            getInfoDispatchRemoteApi();
        } else {
            this.mInfoDispatchRemoteApi.registerConnectListener(iServerConnectListener);
        }
    }

    @Override // com.tencent.taes.remote.api.IRegitsterConnectStateApi
    public void unregisterConnectListener(IServerConnectListener iServerConnectListener) {
        if (this.mInfoDispatchRemoteApi == null) {
            getInfoDispatchRemoteApi();
        } else {
            this.mInfoDispatchRemoteApi.unregisterConnectListener(iServerConnectListener);
        }
    }

    @Override // com.tencent.taes.api.base.BaseApi
    public String getApiVersion() {
        return BuildConfig.VERSION_NAME;
    }

    @Override // com.tencent.taes.impl.base.AbstractApi
    public void dispose() {
        unInit();
    }
}
