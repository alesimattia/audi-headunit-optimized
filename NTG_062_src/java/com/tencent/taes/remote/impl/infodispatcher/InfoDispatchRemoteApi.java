package com.tencent.taes.remote.impl.infodispatcher;

import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarAppEvent;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarArriveEvent;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarDrLocationInfo;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarEnlargeMapInfo;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarEtaInfo;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarGuideInfo;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarHighwayInfo;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarLaneLineInfo;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarLinkInfo;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarMapModeEvent;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarMapMonitorEvent;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarNaviInfo;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarNaviRoadConditionInfo;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarRoadsideCameraInfo;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarRouteEvent;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarStartStopEvent;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarYawEvent;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarZoneSpeedInfo;
import com.tencent.taes.base.api.bean.infodispatcher.music.WeCarMediaInfo;
import com.tencent.taes.base.api.bean.infodispatcher.wechat.WeCarWeChatMessage;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi;
import com.tencent.taes.remote.api.infodispatcher.IInfoDispatchService;
import com.tencent.taes.remote.api.infodispatcher.listener.IInfoDispatchListener;
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
import com.tencent.taes.remote.impl.BaseRemoteApi;
import com.tencent.taes.util.GsonUtils;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: classes.dex */
public class InfoDispatchRemoteApi extends BaseRemoteApi implements IInfoDispatchApi {
    private static final String TAG = "InfoDispatchRemoteApi";
    private final List<OnAppEventListener> mAppEventListeners;
    private final List<OnArriveEventListener> mArriveEventListeners;
    private final List<OnCameraInfoListener> mCameraInfoListeners;
    private final List<OnDrLocationInfoListener> mDrLocationInfoListeners;
    private final List<OnETAInfoListener> mETAInfoListeners;
    private final List<OnEnlargeMapInfoListener> mEnlargedMapInfoListeners;
    private final List<OnGuideInfoListener> mGuideInfoListeners;
    private final List<OnHighwayInfoListener> mHighwayInfoListeners;
    private IInfoDispatchListener.Stub mInfoDispatchListener;
    private IInfoDispatchService mInfoDispatchService;
    private final List<OnLaneLineInfoListener> mLaneLineInfoListeners;
    private final List<OnLinkInfoListener> mLinkInfoListeners;
    private final List<OnMapModeEventListener> mMapModeEventListeners;
    private final List<OnMapMonitorListener> mMapMonitorListeners;
    private final List<OnMediaInfoListener> mMediaInfoListeners;
    private final List<OnNaviRoadConditionInfoListener> mNaviRoadConditionInfoListeners;
    private final List<OnOtherInfoListener> mOtherInfoListeners;
    private final List<OnRouteEventListener> mRouteEventListeners;
    private WeCarStartStopEvent mStartEventCache;
    private final List<OnStartStopEventListener> mStartStopEventListeners;
    private Handler mUIHandler;
    private WeCarNaviInfo mWeCarNaviInfo;
    private final List<OnWeChatMessageListener> mWeChatMessageListeners;
    private final List<OnYawEventListener> mYawEventListeners;
    private final List<OnZoneSpeedInfoListener> mZoneSpeedInfoListeners;

    private InfoDispatchRemoteApi(IBinder binder, IBinder smsbinder) {
        super(binder, smsbinder);
        this.mUIHandler = new Handler(Looper.getMainLooper());
        this.mWeCarNaviInfo = new WeCarNaviInfo();
        this.mStartEventCache = null;
        this.mArriveEventListeners = new CopyOnWriteArrayList();
        this.mEnlargedMapInfoListeners = new CopyOnWriteArrayList();
        this.mETAInfoListeners = new CopyOnWriteArrayList();
        this.mGuideInfoListeners = new CopyOnWriteArrayList();
        this.mHighwayInfoListeners = new CopyOnWriteArrayList();
        this.mLaneLineInfoListeners = new CopyOnWriteArrayList();
        this.mRouteEventListeners = new CopyOnWriteArrayList();
        this.mStartStopEventListeners = new CopyOnWriteArrayList();
        this.mYawEventListeners = new CopyOnWriteArrayList();
        this.mZoneSpeedInfoListeners = new CopyOnWriteArrayList();
        this.mCameraInfoListeners = new CopyOnWriteArrayList();
        this.mNaviRoadConditionInfoListeners = new CopyOnWriteArrayList();
        this.mMediaInfoListeners = new CopyOnWriteArrayList();
        this.mWeChatMessageListeners = new CopyOnWriteArrayList();
        this.mOtherInfoListeners = new CopyOnWriteArrayList();
        this.mMapMonitorListeners = new CopyOnWriteArrayList();
        this.mAppEventListeners = new CopyOnWriteArrayList();
        this.mDrLocationInfoListeners = new CopyOnWriteArrayList();
        this.mLinkInfoListeners = new CopyOnWriteArrayList();
        this.mMapModeEventListeners = new CopyOnWriteArrayList();
        this.mInfoDispatchListener = new IInfoDispatchListener.Stub() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.1
            @Override // com.tencent.taes.remote.api.infodispatcher.listener.IInfoDispatchListener
            public void onNaviInfoDispatch(String jsonStr) throws RemoteException {
                InfoDispatchRemoteApi.this.dispatchNaviInfo(jsonStr);
            }

            @Override // com.tencent.taes.remote.api.infodispatcher.listener.IInfoDispatchListener
            public void onMusicInfoDispatch(String jsonStr) throws RemoteException {
                InfoDispatchRemoteApi.this.dispatchMusicInfo(jsonStr);
            }

            @Override // com.tencent.taes.remote.api.infodispatcher.listener.IInfoDispatchListener
            public void onWeChatInfoDispatch(String jsonStr) throws RemoteException {
                InfoDispatchRemoteApi.this.dispatchWeChatInfo(jsonStr);
            }

            @Override // com.tencent.taes.remote.api.infodispatcher.listener.IInfoDispatchListener
            public void onOtherInfoDispatch(String appid, String jsonStr) throws RemoteException {
                InfoDispatchRemoteApi.this.dispatchOtherInfo(appid, jsonStr);
            }
        };
        onBind(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public Pair<String, String> subscribeModuleBinder() {
        return new Pair<>(ServerCompConstant.INFO_DISPATCHER, IInfoDispatchService.Stub.class.getName());
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderConnect(IBinder binder) {
        onBind(binder);
        super.binderConnect(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderDisConnect() {
        super.binderDisConnect();
        this.mStartEventCache = null;
    }

    private void onBind(IBinder binder) {
        this.mInfoDispatchService = IInfoDispatchService.Stub.asInterface(binder);
        try {
            this.mInfoDispatchService.registerInfoDispatchListener(this.mInfoDispatchListener);
        } catch (RemoteException e) {
            Log.e(TAG, "registerInfoDispatchListener exception caught", e);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public boolean sendMessage(String appid, String jsonStr) {
        if (this.mInfoDispatchService != null) {
            try {
                this.mInfoDispatchService.sendMessage(appid, jsonStr);
                return true;
            } catch (RemoteException e) {
                e.printStackTrace();
                Log.e(TAG, "sendMessage exception caught", e);
                return false;
            }
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerArriveEventListener(OnArriveEventListener listener) {
        if (listener != null && !this.mArriveEventListeners.contains(listener)) {
            this.mArriveEventListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterArriveEventListener(OnArriveEventListener listener) {
        if (listener == null) {
            return;
        }
        this.mArriveEventListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerEnlargeMapInfoListenerr(OnEnlargeMapInfoListener listener) {
        if (listener != null && !this.mEnlargedMapInfoListeners.contains(listener)) {
            this.mEnlargedMapInfoListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterEnlargeMapInfoListener(OnEnlargeMapInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mEnlargedMapInfoListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerETAInfoListener(OnETAInfoListener listener) {
        if (listener != null && !this.mETAInfoListeners.contains(listener)) {
            this.mETAInfoListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterETAInfoListener(OnETAInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mETAInfoListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerGuideInfoListener(OnGuideInfoListener listener) {
        if (listener != null && !this.mGuideInfoListeners.contains(listener)) {
            this.mGuideInfoListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterGuideInfoListener(OnGuideInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mGuideInfoListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerHighwayInfoListener(OnHighwayInfoListener listener) {
        if (listener != null && !this.mHighwayInfoListeners.contains(listener)) {
            this.mHighwayInfoListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterHighwayInfoListener(OnHighwayInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mHighwayInfoListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerLaneLineInfoListener(OnLaneLineInfoListener listener) {
        if (listener != null && !this.mLaneLineInfoListeners.contains(listener)) {
            this.mLaneLineInfoListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterLaneLineInfoListener(OnLaneLineInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mLaneLineInfoListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerRouteEventListener(OnRouteEventListener listener) {
        if (listener != null && !this.mRouteEventListeners.contains(listener)) {
            this.mRouteEventListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterRouteEventListener(OnRouteEventListener listener) {
        if (listener == null) {
            return;
        }
        this.mRouteEventListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerStartStopEventListener(OnStartStopEventListener listener) {
        if (listener != null) {
            if (!this.mStartStopEventListeners.contains(listener)) {
                this.mStartStopEventListeners.add(listener);
            }
            if (this.mStartEventCache != null) {
                listener.onStartStopEvent(this.mStartEventCache);
            }
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterStartStopEventListener(OnStartStopEventListener listener) {
        if (listener == null) {
            return;
        }
        this.mStartStopEventListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerYawEventListener(OnYawEventListener listener) {
        if (listener != null && !this.mYawEventListeners.contains(listener)) {
            this.mYawEventListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterYawEventListener(OnYawEventListener listener) {
        if (listener == null) {
            return;
        }
        this.mYawEventListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerZoneSpeedInfoListener(OnZoneSpeedInfoListener listener) {
        if (listener != null && !this.mZoneSpeedInfoListeners.contains(listener)) {
            this.mZoneSpeedInfoListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterZoneSpeedInfoListener(OnZoneSpeedInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mZoneSpeedInfoListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerCameraInfoListener(OnCameraInfoListener listener) {
        if (listener != null && !this.mCameraInfoListeners.contains(listener)) {
            this.mCameraInfoListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterCameraInfoListener(OnCameraInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mCameraInfoListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerNaviRoadConditionInfoListener(OnNaviRoadConditionInfoListener listener) {
        if (listener != null && !this.mNaviRoadConditionInfoListeners.contains(listener)) {
            this.mNaviRoadConditionInfoListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterNaviRoadConditionInfoListener(OnNaviRoadConditionInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mNaviRoadConditionInfoListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerMediaInfoListener(OnMediaInfoListener listener) {
        if (listener != null && !this.mMediaInfoListeners.contains(listener)) {
            this.mMediaInfoListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterMediaInfoListener(OnMediaInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mMediaInfoListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerWeChatMessageListener(OnWeChatMessageListener listener) {
        if (listener != null && !this.mWeChatMessageListeners.contains(listener)) {
            this.mWeChatMessageListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterWeChatMessageListener(OnWeChatMessageListener listener) {
        if (listener == null) {
            return;
        }
        this.mWeChatMessageListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerOtherInfoListener(OnOtherInfoListener listener) {
        if (listener != null && !this.mOtherInfoListeners.contains(listener)) {
            this.mOtherInfoListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterOtherInfoListener(OnOtherInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mOtherInfoListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerMapMonitorListener(OnMapMonitorListener listener) {
        if (listener != null && !this.mMapMonitorListeners.contains(listener)) {
            this.mMapMonitorListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterMapMonitorListener(OnMapMonitorListener listener) {
        if (listener == null) {
            return;
        }
        this.mMapMonitorListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerAppEventListener(OnAppEventListener listener) {
        if (listener != null && !this.mAppEventListeners.contains(listener)) {
            this.mAppEventListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterAppEventListener(OnAppEventListener listener) {
        if (listener == null) {
            return;
        }
        this.mAppEventListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerDrLocationInfoListener(OnDrLocationInfoListener listener) {
        if (listener != null && !this.mDrLocationInfoListeners.contains(listener)) {
            this.mDrLocationInfoListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterDrLocationInfoListener(OnDrLocationInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mDrLocationInfoListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerLinkInfoListener(OnLinkInfoListener listener) {
        if (listener != null && !this.mLinkInfoListeners.contains(listener)) {
            this.mLinkInfoListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterLinkInfoListener(OnLinkInfoListener listener) {
        if (listener == null) {
            return;
        }
        this.mLinkInfoListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void registerMapModeEventListener(OnMapModeEventListener listener) {
        if (listener != null && !this.mMapModeEventListeners.contains(listener)) {
            this.mMapModeEventListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.infodispatcher.IInfoDispatchApi
    public void unregisterMapModeEventListener(OnMapModeEventListener listener) {
        if (listener == null) {
            return;
        }
        this.mMapModeEventListeners.remove(listener);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchOtherInfo(final String appid, final String jsonStr) {
        Log.d(TAG, "onOtherInfoDispatch jsonStr = " + jsonStr);
        if (!TextUtils.isEmpty(appid) && !TextUtils.isEmpty(jsonStr)) {
            this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.2
                @Override // java.lang.Runnable
                public void run() {
                    for (OnOtherInfoListener listener : InfoDispatchRemoteApi.this.mOtherInfoListeners) {
                        if (listener != null) {
                            listener.onOtherInfoChanged(appid, jsonStr);
                        }
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchWeChatInfo(String jsonStr) {
        Log.d(TAG, "onWeChatInfoDispatch jsonStr = " + jsonStr);
        if (!TextUtils.isEmpty(jsonStr)) {
            final WeCarWeChatMessage weCarWeChatMessage = (WeCarWeChatMessage) GsonUtils.fromJson(jsonStr, WeCarWeChatMessage.class);
            this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.3
                @Override // java.lang.Runnable
                public void run() {
                    for (OnWeChatMessageListener listener : InfoDispatchRemoteApi.this.mWeChatMessageListeners) {
                        if (listener != null) {
                            listener.onWeChatMessageChanged(weCarWeChatMessage);
                        }
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchMusicInfo(String jsonStr) {
        Log.d(TAG, "onMusicInfoDispatch jsonStr = " + jsonStr);
        if (!TextUtils.isEmpty(jsonStr)) {
            final WeCarMediaInfo weCarMediaInfo = (WeCarMediaInfo) GsonUtils.fromJson(jsonStr, WeCarMediaInfo.class);
            this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.4
                @Override // java.lang.Runnable
                public void run() {
                    for (OnMediaInfoListener listener : InfoDispatchRemoteApi.this.mMediaInfoListeners) {
                        if (listener != null) {
                            listener.onMediaInfoChanged(weCarMediaInfo);
                        }
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchNaviInfo(String jsonStr) {
        Log.d(TAG, "onNaviInfoDispatch jsonStr = " + jsonStr);
        if (!TextUtils.isEmpty(jsonStr)) {
            WeCarNaviInfo temp = (WeCarNaviInfo) GsonUtils.fromJson(jsonStr, WeCarNaviInfo.class);
            switch (temp.type) {
                case 1:
                    onGuideInfoChanged(temp.weCarGuideInfo);
                    break;
                case 2:
                    onETAInfoChanged(temp.weCarEtaInfo);
                    break;
                case 3:
                    onRoadsideCameraInfoChanged(temp.weCarRoadsideCameraInfo, temp.weCarRoadsideCameraInfos);
                    break;
                case 4:
                    onHighwayInfoChanged(temp.weCarHighwayInfo);
                    break;
                case 5:
                    onZoneSpeedInfoChanged(temp.weCarZoneSpeedInfo);
                    break;
                case 6:
                    onLaneLineInfoChanged(temp.weCarLaneLineInfo);
                    break;
                case 7:
                    onNaviRoadConditionInfo(temp.weCarNaviRoadConditionInfo);
                    break;
                case 8:
                    onStartStopEvent(temp.weCarStartStopEvent);
                    break;
                case 9:
                    onArriveEvent(temp.weCarArriveEvent);
                    break;
                case 10:
                    onYawEvent(temp.weCarYawEvent);
                    break;
                case 11:
                    onRouteEvent(temp.weCarRouteEvent);
                    break;
                case 12:
                    onEnlargedMapInfoChanged(temp.weCarEnlargeMapInfo);
                    break;
                case 13:
                    onMapMonitorEvent(temp.weCarMapMonitorEvent);
                    break;
                case 14:
                    onAppEvent(temp.weCarAppEvent);
                    break;
                case 15:
                    onDrLocationInfoChanged(temp.weCarDrLocationInfo);
                    break;
                case 16:
                    onLinkInfoChanged(temp.weCarLinkInfo);
                    break;
                case 17:
                    onMapModeEvent(temp.weCarMapModeEvent);
                    break;
            }
        }
    }

    private void onMapModeEvent(final WeCarMapModeEvent weCarMapModeEvent) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.5
            @Override // java.lang.Runnable
            public void run() {
                for (OnMapModeEventListener listener : InfoDispatchRemoteApi.this.mMapModeEventListeners) {
                    if (listener != null) {
                        listener.onMapModeEvent(weCarMapModeEvent);
                    }
                }
            }
        });
    }

    private void onLinkInfoChanged(final WeCarLinkInfo weCarLinkInfo) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.6
            @Override // java.lang.Runnable
            public void run() {
                for (OnLinkInfoListener listener : InfoDispatchRemoteApi.this.mLinkInfoListeners) {
                    if (listener != null) {
                        listener.onLinkInfoChanged(weCarLinkInfo);
                    }
                }
            }
        });
    }

    private void onDrLocationInfoChanged(final WeCarDrLocationInfo weCarDrLocationInfo) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.7
            @Override // java.lang.Runnable
            public void run() {
                for (OnDrLocationInfoListener listener : InfoDispatchRemoteApi.this.mDrLocationInfoListeners) {
                    if (listener != null) {
                        listener.onDrLocationInfoChanged(weCarDrLocationInfo);
                    }
                }
            }
        });
    }

    private void onAppEvent(final WeCarAppEvent weCarAppEvent) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.8
            @Override // java.lang.Runnable
            public void run() {
                for (OnAppEventListener listener : InfoDispatchRemoteApi.this.mAppEventListeners) {
                    if (listener != null) {
                        listener.onAppEvent(weCarAppEvent);
                    }
                }
            }
        });
    }

    private void onMapMonitorEvent(final WeCarMapMonitorEvent weCarMapMonitorEvent) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.9
            @Override // java.lang.Runnable
            public void run() {
                for (OnMapMonitorListener listener : InfoDispatchRemoteApi.this.mMapMonitorListeners) {
                    if (listener != null) {
                        listener.onFinish(weCarMapMonitorEvent);
                    }
                }
            }
        });
    }

    private void compatibleWithOldVersions(WeCarNaviInfo temp) {
        if (!this.mWeCarNaviInfo.weCarGuideInfo.equals(temp.weCarGuideInfo)) {
            this.mWeCarNaviInfo.weCarGuideInfo = temp.weCarGuideInfo;
            onGuideInfoChanged(this.mWeCarNaviInfo.weCarGuideInfo);
        }
        if (!this.mWeCarNaviInfo.weCarEtaInfo.equals(temp.weCarEtaInfo)) {
            this.mWeCarNaviInfo.weCarEtaInfo = temp.weCarEtaInfo;
            onETAInfoChanged(this.mWeCarNaviInfo.weCarEtaInfo);
        }
        if (!this.mWeCarNaviInfo.weCarRoadsideCameraInfo.equals(temp.weCarRoadsideCameraInfo)) {
            this.mWeCarNaviInfo.weCarRoadsideCameraInfo = temp.weCarRoadsideCameraInfo;
            this.mWeCarNaviInfo.weCarRoadsideCameraInfos.clear();
            this.mWeCarNaviInfo.weCarRoadsideCameraInfos.addAll(temp.weCarRoadsideCameraInfos);
            onRoadsideCameraInfoChanged(this.mWeCarNaviInfo.weCarRoadsideCameraInfo, this.mWeCarNaviInfo.weCarRoadsideCameraInfos);
        }
        if (!this.mWeCarNaviInfo.weCarHighwayInfo.equals(temp.weCarHighwayInfo)) {
            this.mWeCarNaviInfo.weCarHighwayInfo = temp.weCarHighwayInfo;
            onHighwayInfoChanged(this.mWeCarNaviInfo.weCarHighwayInfo);
        }
        if (!this.mWeCarNaviInfo.weCarZoneSpeedInfo.equals(temp.weCarZoneSpeedInfo)) {
            this.mWeCarNaviInfo.weCarZoneSpeedInfo = temp.weCarZoneSpeedInfo;
            onZoneSpeedInfoChanged(this.mWeCarNaviInfo.weCarZoneSpeedInfo);
        }
        if (!this.mWeCarNaviInfo.weCarLaneLineInfo.equals(temp.weCarLaneLineInfo)) {
            this.mWeCarNaviInfo.weCarLaneLineInfo = temp.weCarLaneLineInfo;
            onLaneLineInfoChanged(this.mWeCarNaviInfo.weCarLaneLineInfo);
        }
        if (!this.mWeCarNaviInfo.weCarNaviRoadConditionInfo.equals(temp.weCarNaviRoadConditionInfo)) {
            this.mWeCarNaviInfo.weCarNaviRoadConditionInfo = temp.weCarNaviRoadConditionInfo;
            onNaviRoadConditionInfo(this.mWeCarNaviInfo.weCarNaviRoadConditionInfo);
        }
        if (!this.mWeCarNaviInfo.weCarStartStopEvent.equals(temp.weCarStartStopEvent)) {
            this.mWeCarNaviInfo.weCarStartStopEvent = temp.weCarStartStopEvent;
            onStartStopEvent(this.mWeCarNaviInfo.weCarStartStopEvent);
        }
        if (!this.mWeCarNaviInfo.weCarArriveEvent.equals(temp.weCarArriveEvent)) {
            this.mWeCarNaviInfo.weCarArriveEvent = temp.weCarArriveEvent;
            onArriveEvent(this.mWeCarNaviInfo.weCarArriveEvent);
        }
        if (!this.mWeCarNaviInfo.weCarYawEvent.equals(temp.weCarYawEvent)) {
            this.mWeCarNaviInfo.weCarYawEvent = temp.weCarYawEvent;
            onYawEvent(this.mWeCarNaviInfo.weCarYawEvent);
        }
        if (!this.mWeCarNaviInfo.weCarRouteEvent.equals(temp.weCarRouteEvent)) {
            this.mWeCarNaviInfo.weCarRouteEvent = temp.weCarRouteEvent;
            onRouteEvent(this.mWeCarNaviInfo.weCarRouteEvent);
        }
        if (!this.mWeCarNaviInfo.weCarEnlargeMapInfo.equals(temp.weCarEnlargeMapInfo)) {
            this.mWeCarNaviInfo.weCarEnlargeMapInfo = temp.weCarEnlargeMapInfo;
            onEnlargedMapInfoChanged(this.mWeCarNaviInfo.weCarEnlargeMapInfo);
        }
    }

    private void onEnlargedMapInfoChanged(final WeCarEnlargeMapInfo weCarEnlargeMapInfo) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.10
            @Override // java.lang.Runnable
            public void run() {
                for (OnEnlargeMapInfoListener listener : InfoDispatchRemoteApi.this.mEnlargedMapInfoListeners) {
                    if (listener != null) {
                        listener.onEnlargedMapInfoChanged(weCarEnlargeMapInfo);
                    }
                }
            }
        });
    }

    private void onRouteEvent(final WeCarRouteEvent weCarRouteEvent) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.11
            @Override // java.lang.Runnable
            public void run() {
                for (OnRouteEventListener listener : InfoDispatchRemoteApi.this.mRouteEventListeners) {
                    if (listener != null) {
                        listener.onRouteEvent(weCarRouteEvent);
                    }
                }
            }
        });
    }

    private void onYawEvent(final WeCarYawEvent weCarYawEvent) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.12
            @Override // java.lang.Runnable
            public void run() {
                for (OnYawEventListener listener : InfoDispatchRemoteApi.this.mYawEventListeners) {
                    if (listener != null) {
                        listener.onYawEvent(weCarYawEvent);
                    }
                }
            }
        });
    }

    private void onArriveEvent(final WeCarArriveEvent weCarArriveEvent) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.13
            @Override // java.lang.Runnable
            public void run() {
                for (OnArriveEventListener listener : InfoDispatchRemoteApi.this.mArriveEventListeners) {
                    if (listener != null) {
                        listener.onArriveEvent(weCarArriveEvent);
                    }
                }
            }
        });
    }

    private void onStartStopEvent(final WeCarStartStopEvent weCarStartStopEvent) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.14
            @Override // java.lang.Runnable
            public void run() {
                for (OnStartStopEventListener listener : InfoDispatchRemoteApi.this.mStartStopEventListeners) {
                    if (listener != null) {
                        listener.onStartStopEvent(weCarStartStopEvent);
                    }
                    InfoDispatchRemoteApi.this.setStarEventCache(weCarStartStopEvent);
                }
            }
        });
    }

    private void onNaviRoadConditionInfo(final WeCarNaviRoadConditionInfo weCarNaviRoadConditionInfo) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.15
            @Override // java.lang.Runnable
            public void run() {
                for (OnNaviRoadConditionInfoListener listener : InfoDispatchRemoteApi.this.mNaviRoadConditionInfoListeners) {
                    if (listener != null) {
                        listener.onNaviRoadConditionInfo(weCarNaviRoadConditionInfo);
                    }
                }
            }
        });
    }

    private void onLaneLineInfoChanged(final WeCarLaneLineInfo weCarLaneLineInfo) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.16
            @Override // java.lang.Runnable
            public void run() {
                for (OnLaneLineInfoListener listener : InfoDispatchRemoteApi.this.mLaneLineInfoListeners) {
                    if (listener != null) {
                        listener.onLaneLineInfoChanged(weCarLaneLineInfo);
                    }
                }
            }
        });
    }

    private void onZoneSpeedInfoChanged(final WeCarZoneSpeedInfo weCarZoneSpeedInfo) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.17
            @Override // java.lang.Runnable
            public void run() {
                for (OnZoneSpeedInfoListener listener : InfoDispatchRemoteApi.this.mZoneSpeedInfoListeners) {
                    if (listener != null) {
                        listener.onZoneSpeedInfoChanged(weCarZoneSpeedInfo);
                    }
                }
            }
        });
    }

    private void onHighwayInfoChanged(final WeCarHighwayInfo serviceAreaInfo) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.18
            @Override // java.lang.Runnable
            public void run() {
                for (OnHighwayInfoListener listener : InfoDispatchRemoteApi.this.mHighwayInfoListeners) {
                    if (listener != null) {
                        listener.onHighwayInfoChanged(serviceAreaInfo);
                    }
                }
            }
        });
    }

    private void onRoadsideCameraInfoChanged(final WeCarRoadsideCameraInfo weCarRoadsideCameraInfo, final List<WeCarRoadsideCameraInfo> weCarRoadsideCameraInfoList) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.19
            @Override // java.lang.Runnable
            public void run() {
                for (OnCameraInfoListener listener : InfoDispatchRemoteApi.this.mCameraInfoListeners) {
                    if (listener != null) {
                        listener.onRoadsideCameraInfoChanged(weCarRoadsideCameraInfo, weCarRoadsideCameraInfoList);
                    }
                }
            }
        });
    }

    private void onETAInfoChanged(final WeCarEtaInfo weCarEtaInfo) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.20
            @Override // java.lang.Runnable
            public void run() {
                for (OnETAInfoListener listener : InfoDispatchRemoteApi.this.mETAInfoListeners) {
                    if (listener != null) {
                        listener.onETAInfoChanged(weCarEtaInfo);
                    }
                }
            }
        });
    }

    private void onGuideInfoChanged(final WeCarGuideInfo weCarGuideInfo) {
        this.mUIHandler.post(new Runnable() { // from class: com.tencent.taes.remote.impl.infodispatcher.InfoDispatchRemoteApi.21
            @Override // java.lang.Runnable
            public void run() {
                for (OnGuideInfoListener listener : InfoDispatchRemoteApi.this.mGuideInfoListeners) {
                    if (listener != null) {
                        listener.onGuideInfoChanged(weCarGuideInfo);
                    }
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setStarEventCache(WeCarStartStopEvent event) {
        if (event == null) {
            return;
        }
        if (event.eventType == 1) {
            this.mStartEventCache = new WeCarStartStopEvent();
            this.mStartEventCache.eventType = event.eventType;
            this.mStartEventCache.commuteType = event.commuteType;
            this.mStartEventCache.disInMetre = event.disInMetre;
            this.mStartEventCache.startNode = event.startNode;
            this.mStartEventCache.endNode = event.endNode;
            this.mStartEventCache.isRealNavi = event.isRealNavi;
            this.mStartEventCache.mode = event.mode;
            this.mStartEventCache.timeInSecond = event.timeInSecond;
            this.mStartEventCache.startSucc = event.startSucc;
            return;
        }
        this.mStartEventCache = null;
    }
}
