package com.tencent.taes.api.moss;

import android.content.Context;
import com.tencent.taes.api.base.BaseApi;
import com.tencent.taes.api.moss.bean.MiniAppInfo;
import com.tencent.taes.api.moss.bean.MossAudioBean;
import com.tencent.taes.api.moss.listener.MossCallback;
import com.tencent.taes.local.api.moss.IMossRequestCallback;

/* JADX INFO: loaded from: classes.dex */
public interface IMossApi extends BaseApi {
    MossAudioBean getMossAudioBean();

    void getRecentAppList(IMossRequestCallback<String> iMossRequestCallback);

    void loadAllAppsFromNet(IMossRequestCallback<MiniAppInfo> iMossRequestCallback);

    void next();

    void openMossApp(String str, String str2);

    void pause();

    void play();

    void prev();

    void registerConnection(Context context);

    void registerMossCallback(MossCallback mossCallback);

    void unRegisterConnection();

    void unRegisterMossCallback();
}
