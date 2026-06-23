package com.tencent.taes.api.infodispatch;

import com.tencent.taes.api.base.BaseApi;
import com.tencent.taes.remote.api.IRegitsterConnectStateApi;
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

/* JADX INFO: loaded from: classes.dex */
public interface InfoDispatchApi extends BaseApi, IRegitsterConnectStateApi {
    void registerAppEventListener(OnAppEventListener onAppEventListener);

    void registerArriveEventListener(OnArriveEventListener onArriveEventListener);

    void registerCameraInfoListener(OnCameraInfoListener onCameraInfoListener);

    void registerDrLocationInfoListener(OnDrLocationInfoListener onDrLocationInfoListener);

    void registerETAInfoListener(OnETAInfoListener onETAInfoListener);

    void registerEnlargeMapInfoListenerr(OnEnlargeMapInfoListener onEnlargeMapInfoListener);

    void registerGuideInfoListener(OnGuideInfoListener onGuideInfoListener);

    void registerHighwayInfoListener(OnHighwayInfoListener onHighwayInfoListener);

    void registerLaneLineInfoListener(OnLaneLineInfoListener onLaneLineInfoListener);

    void registerLinkInfoListener(OnLinkInfoListener onLinkInfoListener);

    void registerMapModeEventListener(OnMapModeEventListener onMapModeEventListener);

    void registerMapMonitorListener(OnMapMonitorListener onMapMonitorListener);

    void registerMediaInfoListener(OnMediaInfoListener onMediaInfoListener);

    void registerNaviRoadConditionInfoListener(OnNaviRoadConditionInfoListener onNaviRoadConditionInfoListener);

    void registerOtherInfoListener(OnOtherInfoListener onOtherInfoListener);

    void registerRouteEventListener(OnRouteEventListener onRouteEventListener);

    void registerStartStopEventListener(OnStartStopEventListener onStartStopEventListener);

    void registerWeChatMessageListener(OnWeChatMessageListener onWeChatMessageListener);

    void registerYawEventListener(OnYawEventListener onYawEventListener);

    void registerZoneSpeedInfoListener(OnZoneSpeedInfoListener onZoneSpeedInfoListener);

    boolean sendMessage(String str, String str2);

    void unregisterAppEventListener(OnAppEventListener onAppEventListener);

    void unregisterArriveEventListener(OnArriveEventListener onArriveEventListener);

    void unregisterCameraInfoListener(OnCameraInfoListener onCameraInfoListener);

    void unregisterDrLocationInfoListener(OnDrLocationInfoListener onDrLocationInfoListener);

    void unregisterETAInfoListener(OnETAInfoListener onETAInfoListener);

    void unregisterEnlargeMapInfoListener(OnEnlargeMapInfoListener onEnlargeMapInfoListener);

    void unregisterGuideInfoListener(OnGuideInfoListener onGuideInfoListener);

    void unregisterHighwayInfoListener(OnHighwayInfoListener onHighwayInfoListener);

    void unregisterLaneLineInfoListener(OnLaneLineInfoListener onLaneLineInfoListener);

    void unregisterLinkInfoListener(OnLinkInfoListener onLinkInfoListener);

    void unregisterMapModeEventListener(OnMapModeEventListener onMapModeEventListener);

    void unregisterMapMonitorListener(OnMapMonitorListener onMapMonitorListener);

    void unregisterMediaInfoListener(OnMediaInfoListener onMediaInfoListener);

    void unregisterNaviRoadConditionInfoListener(OnNaviRoadConditionInfoListener onNaviRoadConditionInfoListener);

    void unregisterOtherInfoListener(OnOtherInfoListener onOtherInfoListener);

    void unregisterRouteEventListener(OnRouteEventListener onRouteEventListener);

    void unregisterStartStopEventListener(OnStartStopEventListener onStartStopEventListener);

    void unregisterWeChatMessageListener(OnWeChatMessageListener onWeChatMessageListener);

    void unregisterYawEventListener(OnYawEventListener onYawEventListener);

    void unregisterZoneSpeedInfoListener(OnZoneSpeedInfoListener onZoneSpeedInfoListener);
}
