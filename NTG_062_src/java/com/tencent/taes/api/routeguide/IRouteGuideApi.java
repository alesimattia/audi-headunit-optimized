package com.tencent.taes.api.routeguide;

import com.tencent.taes.api.base.BaseApi;

/* JADX INFO: loaded from: classes.dex */
public interface IRouteGuideApi extends com.tencent.taes.remote.api.routeguide.IRouteGuideApi, BaseApi {
    void goCompany();

    void goHome();

    void setCruiseSpeakType(boolean z);

    void startCruise(boolean z);

    void startNavi(boolean z, boolean z2, double d, double d2);

    void startNavi(boolean z, boolean z2, double d, double d2, double d3, double d4);

    void stopCruise(boolean z);

    void stopNavi(boolean z);

    void updateNaviDest(double d, double d2);
}
