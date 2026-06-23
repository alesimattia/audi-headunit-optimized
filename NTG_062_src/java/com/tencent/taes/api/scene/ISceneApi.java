package com.tencent.taes.api.scene;

import com.tencent.taes.api.base.BaseApi;
import com.tencent.taes.api.scene.bean.SceneInfo;
import com.tencent.taes.api.scene.listener.SceneInfoListener;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface ISceneApi extends BaseApi {
    List<SceneInfo> getSceneInfoList();

    void registerSceneInfoListener(SceneInfoListener sceneInfoListener);

    boolean showSceneDetail(String str, boolean z);

    void unregisterSceneInfoListener(SceneInfoListener sceneInfoListener);
}
