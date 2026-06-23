package com.tencent.taes.remote.api.routeguide;

import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarNaviRoadConditionInfo;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarSnapShotInfo;
import com.tencent.taes.remote.api.IRegitsterConnectStateApi;

/* JADX INFO: loaded from: classes.dex */
public interface IRouteGuideApi extends IRegitsterConnectStateApi {
    int getNaviStatus();

    WeCarNaviRoadConditionInfo getWeCarNaviRoadConditionInfo();

    WeCarSnapShotInfo getWeCarSnapShotInfo();
}
