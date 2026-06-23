package com.tencent.taes.remote.impl.operate;

import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import android.util.Pair;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.operate.IOperateApi;
import com.tencent.taes.remote.api.operate.IOperateService;
import com.tencent.taes.remote.api.operate.bean.SceneBannerInfo;
import com.tencent.taes.remote.api.operate.bean.SceneStatusBannerInfo;
import com.tencent.taes.remote.api.operate.bean.SceneWeakPushInfo;
import com.tencent.taes.remote.api.operate.listener.ISceneBannerInfoListener;
import com.tencent.taes.remote.api.operate.listener.ISceneWeakPushInfoListener;
import com.tencent.taes.remote.api.operate.listener.IStatusBannerInfoListener;
import com.tencent.taes.remote.api.operate.listener.SceneBannerInfoListener;
import com.tencent.taes.remote.api.operate.listener.SceneStatusBannerInfoListener;
import com.tencent.taes.remote.api.operate.listener.SceneWeakPushInfoListener;
import com.tencent.taes.remote.impl.BaseRemoteApi;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: classes.dex */
public class OperateApiRemoteApi extends BaseRemoteApi implements IOperateApi {
    private static final String TAG = "OperateApiRemoteApi";
    private List<SceneBannerInfo> mInfoList;
    private IOperateService mOperateService;
    private ISceneBannerInfoListener.Stub mSceneBannerInfoListener;
    private final List<SceneBannerInfoListener> mSceneBannerInfoListeners;
    private final List<SceneStatusBannerInfoListener> mSceneStatusBannerInfoListeners;
    private ISceneWeakPushInfoListener.Stub mSceneWeakPushInfoListener;
    private final List<SceneWeakPushInfoListener> mSceneWeakPushInfoListeners;
    private IStatusBannerInfoListener.Stub mStatusBannerInfoListener;
    private List<SceneStatusBannerInfo> mStatusInfoList;
    private List<SceneWeakPushInfo> mWeakPushInfoList;

    private OperateApiRemoteApi(IBinder binder, IBinder smsbinder) {
        super(binder, smsbinder);
        this.mSceneBannerInfoListeners = new CopyOnWriteArrayList();
        this.mSceneStatusBannerInfoListeners = new CopyOnWriteArrayList();
        this.mSceneWeakPushInfoListeners = new CopyOnWriteArrayList();
        this.mSceneBannerInfoListener = new ISceneBannerInfoListener.Stub() { // from class: com.tencent.taes.remote.impl.operate.OperateApiRemoteApi.1
            @Override // com.tencent.taes.remote.api.operate.listener.ISceneBannerInfoListener
            public void onSceneBannerInfo(List<SceneBannerInfo> info) throws RemoteException {
                Log.d(OperateApiRemoteApi.TAG, "onSceneBannerInfo info = " + info);
                OperateApiRemoteApi.this.mInfoList = info;
                for (SceneBannerInfoListener listener : OperateApiRemoteApi.this.mSceneBannerInfoListeners) {
                    if (listener != null) {
                        listener.onSceneBannerInfo(info);
                    }
                }
            }
        };
        this.mStatusBannerInfoListener = new IStatusBannerInfoListener.Stub() { // from class: com.tencent.taes.remote.impl.operate.OperateApiRemoteApi.2
            @Override // com.tencent.taes.remote.api.operate.listener.IStatusBannerInfoListener
            public void onSceneBannerInfo(List<SceneStatusBannerInfo> info) throws RemoteException {
                OperateApiRemoteApi.this.mStatusInfoList = info;
                for (SceneStatusBannerInfoListener listener : OperateApiRemoteApi.this.mSceneStatusBannerInfoListeners) {
                    if (listener != null) {
                        listener.onSceneStatusBannerInfo(info);
                    }
                }
            }
        };
        this.mSceneWeakPushInfoListener = new ISceneWeakPushInfoListener.Stub() { // from class: com.tencent.taes.remote.impl.operate.OperateApiRemoteApi.3
            @Override // com.tencent.taes.remote.api.operate.listener.ISceneWeakPushInfoListener
            public void onSceneWeakPushInfo(List<SceneWeakPushInfo> info) throws RemoteException {
                OperateApiRemoteApi.this.mWeakPushInfoList = info;
                for (SceneWeakPushInfoListener listener : OperateApiRemoteApi.this.mSceneWeakPushInfoListeners) {
                    if (listener != null) {
                        listener.onSceneWeakPushInfo(info);
                    }
                }
            }
        };
        onBind(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public Pair<String, String> subscribeModuleBinder() {
        return new Pair<>(ServerCompConstant.OPERATE, IOperateService.Stub.class.getName());
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderConnect(IBinder binder) {
        onBind(binder);
        super.binderConnect(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderDisConnect() {
        super.binderDisConnect();
    }

    private void onBind(IBinder binder) {
        this.mOperateService = IOperateService.Stub.asInterface(binder);
        Log.d(TAG, "onBind mOperateService = " + this.mOperateService);
        try {
            this.mOperateService.registerSceneBannerInfoListener(this.mSceneBannerInfoListener);
        } catch (RemoteException e) {
            Log.e(TAG, "registerSceneBannerInfoListener exception caught ", e);
        }
        try {
            this.mOperateService.registerStatusBannerInfoListener(this.mStatusBannerInfoListener);
        } catch (RemoteException e2) {
            Log.e(TAG, "registerStatusBannerInfoListener exception caught ", e2);
        }
        try {
            this.mOperateService.registerSceneWeakPushInfoListener(this.mSceneWeakPushInfoListener);
        } catch (RemoteException e3) {
            Log.e(TAG, "registerSceneWeakPushInfoListener exception caught ", e3);
        }
    }

    @Override // com.tencent.taes.remote.api.operate.IOperateApi
    public List<SceneBannerInfo> getSceneBannerInfoList() {
        Log.d(TAG, "getSceneBannerInfoList mOperateService = " + this.mOperateService);
        if (this.mOperateService != null) {
            try {
                return this.mOperateService.getSceneBannerInfos();
            } catch (RemoteException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.operate.IOperateApi
    public void registerSceneBannerInfoListener(SceneBannerInfoListener listener) {
        Log.d(TAG, "registerSceneBannerInfoListener mInfoList = " + this.mInfoList);
        if (listener != null) {
            if (!this.mSceneBannerInfoListeners.contains(listener)) {
                this.mSceneBannerInfoListeners.add(listener);
            }
            if (this.mInfoList != null) {
                listener.onSceneBannerInfo(this.mInfoList);
            }
        }
    }

    @Override // com.tencent.taes.remote.api.operate.IOperateApi
    public void unregisterSceneBannerInfoListener(SceneBannerInfoListener listener) {
        Log.d(TAG, "unregisterSceneBannerInfoListener listener = " + listener);
        if (listener == null) {
            return;
        }
        this.mSceneBannerInfoListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.operate.IOperateApi
    public boolean showSceneBannerDetail(String uuid, boolean isShow) {
        Log.d(TAG, "showSceneBannerDetail mOperateService = " + this.mOperateService);
        if (this.mOperateService != null) {
            try {
                this.mOperateService.showSceneBannerDetail(uuid, isShow);
                return false;
            } catch (RemoteException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.operate.IOperateApi
    public List<SceneStatusBannerInfo> getStatusBannerInfos() {
        Log.d(TAG, "getStatusBannerInfos mOperateService = " + this.mOperateService);
        if (this.mOperateService != null) {
            try {
                return this.mOperateService.getStatusBannerInfos();
            } catch (RemoteException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.operate.IOperateApi
    public void registerStatusBannerInfoListener(SceneStatusBannerInfoListener listener) {
        Log.d(TAG, "registerStatusBannerInfoListener mInfoList = " + this.mStatusInfoList);
        if (listener != null) {
            if (!this.mSceneStatusBannerInfoListeners.contains(listener)) {
                this.mSceneStatusBannerInfoListeners.add(listener);
            }
            if (this.mStatusInfoList != null) {
                listener.onSceneStatusBannerInfo(this.mStatusInfoList);
            }
        }
    }

    @Override // com.tencent.taes.remote.api.operate.IOperateApi
    public void unregisterStatusBannerInfoListener(SceneStatusBannerInfoListener listener) {
        Log.d(TAG, "unregisterStatusBannerInfoListener listener = " + listener);
        if (listener == null) {
            return;
        }
        this.mSceneStatusBannerInfoListeners.remove(listener);
    }

    @Override // com.tencent.taes.remote.api.operate.IOperateApi
    public List<SceneWeakPushInfo> getSceneWeakPushInfos() {
        Log.d(TAG, "getSceneWeakPushInfos mOperateService = " + this.mOperateService);
        if (this.mOperateService != null) {
            try {
                return this.mOperateService.getSceneWeakPushInfos();
            } catch (RemoteException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.operate.IOperateApi
    public void registerSceneWeakPushInfoListener(SceneWeakPushInfoListener listener) {
        Log.d(TAG, "registerSceneWeakPushInfoListener mWeakPushInfoList = " + this.mWeakPushInfoList);
        if (listener != null) {
            if (!this.mSceneWeakPushInfoListeners.contains(listener)) {
                this.mSceneWeakPushInfoListeners.add(listener);
            }
            if (this.mWeakPushInfoList != null) {
                listener.onSceneWeakPushInfo(this.mWeakPushInfoList);
            }
        }
    }

    @Override // com.tencent.taes.remote.api.operate.IOperateApi
    public void unregisterSceneWeakPushInfoListener(SceneWeakPushInfoListener listener) {
        Log.d(TAG, "unregisterSceneWeakPushInfoListener listener = " + listener);
        if (listener == null) {
            return;
        }
        this.mSceneWeakPushInfoListeners.remove(listener);
    }
}
