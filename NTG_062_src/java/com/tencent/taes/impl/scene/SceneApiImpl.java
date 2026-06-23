package com.tencent.taes.impl.scene;

import android.util.Log;
import com.tencent.taes.api.scene.ISceneApi;
import com.tencent.taes.api.scene.bean.SceneInfo;
import com.tencent.taes.api.scene.listener.SceneInfoListener;
import com.tencent.taes.framework.APIResult;
import com.tencent.taes.framework.BuildConfig;
import com.tencent.taes.framework.TAESFrameworkManager;
import com.tencent.taes.framework.listener.TAESCommonListener;
import com.tencent.taes.impl.base.AbstractApi;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.operate.IOperateApi;
import com.tencent.taes.remote.api.operate.bean.SceneBannerInfo;
import com.tencent.taes.remote.api.operate.listener.SceneBannerInfoListener;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: classes.dex */
public class SceneApiImpl extends AbstractApi implements ISceneApi {
    private static final String TAG = "SceneApiImpl";
    private List<SceneInfo> mSceneInfoList;
    private final List<SceneInfoListener> mSceneInfoListeners = new CopyOnWriteArrayList();
    private IOperateApi mOperateApi = null;
    private SceneBannerInfoListener mSceneBannerInfoListener = new SceneBannerInfoListener() { // from class: com.tencent.taes.impl.scene.SceneApiImpl.1
        @Override // com.tencent.taes.remote.api.operate.listener.SceneBannerInfoListener
        public void onSceneBannerInfo(List<SceneBannerInfo> list) {
            Log.d(SceneApiImpl.TAG, "onSceneBannerInfo");
            SceneApiImpl.this.mSceneInfoList = SceneApiImpl.this.convertToSceneInfo(list);
            for (SceneInfoListener listener : SceneApiImpl.this.mSceneInfoListeners) {
                listener.onSceneInfo(SceneApiImpl.this.mSceneInfoList);
            }
        }
    };

    public SceneApiImpl() {
        TAESFrameworkManager.getInstance().registerCompLoadListener(ServerCompConstant.OPERATE, new TAESCommonListener() { // from class: com.tencent.taes.impl.scene.SceneApiImpl.2
            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onSuccess() {
                SceneApiImpl.this.getOperateRemoteApi();
            }

            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onFail(int i, String s) {
                Log.e(SceneApiImpl.TAG, "TAESFrameworkManager.getInstance().getSceneRemoteApi 获取失败 onFail：errorCode = " + i + ", msg = " + s);
            }
        });
    }

    private void unInit() {
        this.mOperateApi = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getOperateRemoteApi() {
        if (this.mOperateApi == null) {
            APIResult<IOperateApi> apiAPIResult = TAESFrameworkManager.getInstance().getApi(ServerCompConstant.OPERATE, IOperateApi.class, null);
            if (apiAPIResult.isSuccess()) {
                this.mOperateApi = apiAPIResult.data;
                initListener();
                Log.d(TAG, "TAESFrameworkManager.getInstance().getOperateRemoteApi mOperateApi = " + this.mOperateApi);
                return;
            }
            Log.e(TAG, "TAESFrameworkManager.getInstance().getOperateRemoteApi 获取失败 " + apiAPIResult.codeDescription());
        }
    }

    private void initListener() {
        if (this.mOperateApi == null) {
            return;
        }
        this.mOperateApi.registerSceneBannerInfoListener(this.mSceneBannerInfoListener);
    }

    private void unInitListener() {
        Log.d(TAG, "unInitListener");
        if (this.mOperateApi == null) {
            return;
        }
        this.mOperateApi.unregisterSceneBannerInfoListener(this.mSceneBannerInfoListener);
        for (SceneInfoListener listener : this.mSceneInfoListeners) {
            unregisterSceneInfoListener(listener);
        }
    }

    private void clearListener() {
        this.mSceneInfoListeners.clear();
    }

    @Override // com.tencent.taes.api.scene.ISceneApi
    public List<SceneInfo> getSceneInfoList() {
        if (this.mOperateApi == null) {
            Log.e(TAG, "getSceneInfoList Exception：mOperateApi = " + this.mOperateApi);
            getOperateRemoteApi();
            return null;
        }
        return convertToSceneInfo(this.mOperateApi.getSceneBannerInfoList());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public List<SceneInfo> convertToSceneInfo(List<SceneBannerInfo> list) {
        List<SceneInfo> sceneInfos = new CopyOnWriteArrayList<>();
        for (SceneBannerInfo info : list) {
            if (info != null) {
                SceneInfo sceneInfo = new SceneInfo();
                sceneInfo.setUuid(info.getUuid());
                sceneInfo.setBgImage(info.getBgImage());
                sceneInfo.setIcon(info.getIcon());
                sceneInfo.setIconText(info.getIconText());
                sceneInfo.setTitle(info.getTitle());
                sceneInfo.setSubTitle(info.getSubTitle());
                sceneInfo.setValidStartTime(info.getValidStartTime());
                sceneInfo.setValidEndTime(info.getValidEndTime());
                sceneInfo.setVanishTime(info.getVanishTime());
                sceneInfo.setClosable(info.isClosable());
                sceneInfos.add(sceneInfo);
            }
        }
        return sceneInfos;
    }

    @Override // com.tencent.taes.api.scene.ISceneApi
    public void registerSceneInfoListener(SceneInfoListener listener) {
        Log.d(TAG, "registerSceneInfoListener mSceneInfoList = " + this.mSceneInfoList);
        if (listener == null) {
            return;
        }
        if (!this.mSceneInfoListeners.contains(listener)) {
            this.mSceneInfoListeners.add(listener);
        }
        if (this.mSceneInfoList != null) {
            listener.onSceneInfo(this.mSceneInfoList);
        }
        Log.d(TAG, "registerSceneBannerInfoListener");
    }

    @Override // com.tencent.taes.api.scene.ISceneApi
    public void unregisterSceneInfoListener(SceneInfoListener listener) {
        Log.d(TAG, "unregisterSceneInfoListener");
        if (listener == null) {
            return;
        }
        this.mSceneInfoListeners.remove(listener);
    }

    @Override // com.tencent.taes.api.scene.ISceneApi
    public boolean showSceneDetail(String uuid, boolean isShow) {
        if (this.mOperateApi == null) {
            Log.e(TAG, "showSceneDetail Exception：mOperateApi = " + this.mOperateApi);
            getOperateRemoteApi();
            return false;
        }
        return this.mOperateApi.showSceneBannerDetail(uuid, isShow);
    }

    @Override // com.tencent.taes.impl.base.AbstractApi
    public void dispose() {
        Log.d(TAG, "dispose");
        unInitListener();
        clearListener();
        unInit();
    }

    @Override // com.tencent.taes.api.base.BaseApi
    public String getApiVersion() {
        return BuildConfig.VERSION_NAME;
    }
}
