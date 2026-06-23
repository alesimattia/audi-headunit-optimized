package com.tencent.taes.api.open;

import com.tencent.taes.api.base.BaseApi;

/* JADX INFO: loaded from: classes.dex */
public interface IOpenApi extends BaseApi {
    void exitApp(boolean z);

    long getAppVersionCode();

    String getAppVersionName();

    void openApp();

    void showNavigationBar(boolean z);

    void showStatusBar(boolean z);
}
