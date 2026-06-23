package com.tencent.taes.impl.moss;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.tencent.mossbiz.IWeCarMasAudioCallback;
import com.tencent.mossbiz.IWeCarMasCallback;
import com.tencent.mossbiz.IWeCarMasService;
import com.tencent.taes.TaesSDKHelper;
import com.tencent.taes.api.moss.IMossApi;
import com.tencent.taes.api.moss.bean.MiniAppInfo;
import com.tencent.taes.api.moss.bean.MossAudioBean;
import com.tencent.taes.api.moss.bean.ResultBean;
import com.tencent.taes.api.moss.listener.MossCallback;
import com.tencent.taes.framework.BuildConfig;
import com.tencent.taes.impl.base.AbstractApi;
import com.tencent.taes.local.api.moss.IMossRequestCallback;
import com.tencent.taes.util.GsonUtils;
import java.util.List;
import org.json.JSONException;

/* JADX INFO: loaded from: classes.dex */
public class MossApiImpl extends AbstractApi implements IMossApi {
    private MossCallback callback;
    private Context context;
    private IWeCarMasService weCarMasService;
    private static final String TAG = MossApiImpl.class.getSimpleName();
    public static String PLAY = "play";
    public static String END = "end";
    public static String PAUSE = "pause";
    public static String STOP = "stop";
    public static String WAItING = "waiting";
    public static String ERROR = "error";
    private boolean isConnection = false;
    private ServiceConnection conn = new ServiceConnection() { // from class: com.tencent.taes.impl.moss.MossApiImpl.2
        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName name) {
            Log.e(MossApiImpl.TAG, "连接失败..." + name);
            MossApiImpl.this.isConnection = false;
            MossApiImpl.this.weCarMasService = null;
            if (MossApiImpl.this.callback != null) {
                MossApiImpl.this.callback.connectionFail();
            }
        }

        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName name, IBinder service) {
            Log.e(MossApiImpl.TAG, "连接成功..." + name);
            try {
                MossApiImpl.this.weCarMasService = IWeCarMasService.Stub.asInterface(service);
                MossApiImpl.this.weCarMasService.initAudioListener(MossApiImpl.this.weCarMasAudioCallback);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (MossApiImpl.this.callback != null) {
                MossApiImpl.this.callback.connectionSuccess();
            }
        }
    };
    private IWeCarMasAudioCallback weCarMasAudioCallback = new IWeCarMasAudioCallback.Stub() { // from class: com.tencent.taes.impl.moss.MossApiImpl.3
        @Override // com.tencent.mossbiz.IWeCarMasAudioCallback
        public void onProgress(long currentPosition, long duration) throws RemoteException {
            if (MossApiImpl.this.callback != null) {
                MossApiImpl.this.callback.onProgress(currentPosition, duration);
            }
        }

        @Override // com.tencent.mossbiz.IWeCarMasAudioCallback
        public void onMusicPlay() throws RemoteException {
            if (MossApiImpl.this.callback != null) {
                MossApiImpl.this.callback.onMusicStatusChange(MossApiImpl.PLAY);
            }
        }

        @Override // com.tencent.mossbiz.IWeCarMasAudioCallback
        public void onMusicEnd() throws RemoteException {
            if (MossApiImpl.this.callback != null) {
                MossApiImpl.this.callback.onMusicStatusChange(MossApiImpl.END);
            }
        }

        @Override // com.tencent.mossbiz.IWeCarMasAudioCallback
        public void onMusicPause() throws RemoteException {
            if (MossApiImpl.this.callback != null) {
                MossApiImpl.this.callback.onMusicStatusChange(MossApiImpl.PAUSE);
            }
        }

        @Override // com.tencent.mossbiz.IWeCarMasAudioCallback
        public void onMusicStop() throws RemoteException {
            if (MossApiImpl.this.callback != null) {
                MossApiImpl.this.callback.onMusicStatusChange(MossApiImpl.STOP);
            }
        }

        @Override // com.tencent.mossbiz.IWeCarMasAudioCallback
        public void onMusicWaiting() throws RemoteException {
            if (MossApiImpl.this.callback != null) {
                MossApiImpl.this.callback.onMusicStatusChange(MossApiImpl.WAItING);
            }
        }

        @Override // com.tencent.mossbiz.IWeCarMasAudioCallback
        public void onMusicError() throws RemoteException {
            if (MossApiImpl.this.callback != null) {
                MossApiImpl.this.callback.onMusicStatusChange(MossApiImpl.ERROR);
            }
        }

        @Override // com.tencent.mossbiz.IWeCarMasAudioCallback
        public void onMusicInfoChange() throws RemoteException {
            if (MossApiImpl.this.callback != null) {
                MossApiImpl.this.callback.onMusicInfoChange(MossApiImpl.this.getMossAudioBean());
            }
        }
    };

    @Override // com.tencent.taes.impl.base.AbstractApi
    public void dispose() {
    }

    @Override // com.tencent.taes.api.moss.IMossApi
    public void loadAllAppsFromNet(final IMossRequestCallback<MiniAppInfo> mossRequestCallback) {
        if (this.weCarMasService != null) {
            try {
                this.weCarMasService.loadAllAppsFromNet(new IWeCarMasCallback.Stub() { // from class: com.tencent.taes.impl.moss.MossApiImpl.1
                    @Override // com.tencent.mossbiz.IWeCarMasCallback
                    public void onResponse(boolean result, String response) throws JSONException, RemoteException {
                        if (response == null) {
                            return;
                        }
                        ResultBean bean = null;
                        try {
                            bean = ResultBean.fromJSON(response);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        if (bean == null) {
                            return;
                        }
                        List<MiniAppInfo> appDataList = bean.data;
                        if (mossRequestCallback != null) {
                            mossRequestCallback.onSucceeded(appDataList);
                        }
                    }
                });
                return;
            } catch (Exception e) {
                e.printStackTrace();
                if (mossRequestCallback != null) {
                    mossRequestCallback.onFailed("error");
                    return;
                }
                return;
            }
        }
        if (this.callback != null) {
            this.callback.connectionFail();
            if (mossRequestCallback != null) {
                mossRequestCallback.onFailed("error");
            }
        }
    }

    @Override // com.tencent.taes.api.moss.IMossApi
    public void openMossApp(String appId, String pagePath) {
        if (this.weCarMasService != null) {
            try {
                this.weCarMasService.openMossApp(appId, pagePath);
                return;
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
        }
        if (this.callback != null) {
            this.callback.connectionFail();
        }
    }

    @Override // com.tencent.taes.api.moss.IMossApi
    public void getRecentAppList(IMossRequestCallback<String> mossRequestCallback) {
        if (this.weCarMasService != null) {
            try {
                List<String> list = this.weCarMasService.getRecentAppList();
                if (mossRequestCallback != null) {
                    mossRequestCallback.onSucceeded(list);
                    return;
                }
                return;
            } catch (RemoteException e) {
                e.printStackTrace();
                if (mossRequestCallback != null) {
                    mossRequestCallback.onFailed("error");
                    return;
                }
                return;
            }
        }
        if (this.callback != null) {
            this.callback.connectionFail();
            if (mossRequestCallback != null) {
                mossRequestCallback.onFailed("error");
            }
        }
    }

    @Override // com.tencent.taes.api.base.BaseApi
    public String getApiVersion() {
        return BuildConfig.VERSION_NAME;
    }

    @Override // com.tencent.taes.api.moss.IMossApi
    public void play() {
        if (this.weCarMasService != null) {
            try {
                this.weCarMasService.onPlayer();
                return;
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
        }
        if (this.callback != null) {
            this.callback.connectionFail();
        }
    }

    @Override // com.tencent.taes.api.moss.IMossApi
    public void pause() {
        if (this.weCarMasService != null) {
            try {
                this.weCarMasService.onAudioPause();
                return;
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
        }
        if (this.callback != null) {
            this.callback.connectionFail();
        }
    }

    @Override // com.tencent.taes.api.moss.IMossApi
    public void next() {
        if (this.weCarMasService != null) {
            try {
                this.weCarMasService.onAudioNext();
                return;
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
        }
        if (this.callback != null) {
            this.callback.connectionFail();
        }
    }

    @Override // com.tencent.taes.api.moss.IMossApi
    public void prev() {
        if (this.weCarMasService != null) {
            try {
                this.weCarMasService.onAudioPre();
                return;
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
        }
        if (this.callback != null) {
            this.callback.connectionFail();
        }
    }

    @Override // com.tencent.taes.api.moss.IMossApi
    public void registerMossCallback(MossCallback callback) {
        this.callback = callback;
    }

    @Override // com.tencent.taes.api.moss.IMossApi
    public void unRegisterMossCallback() {
        this.callback = null;
    }

    @Override // com.tencent.taes.api.moss.IMossApi
    public MossAudioBean getMossAudioBean() {
        if (this.weCarMasService != null) {
            try {
                MossAudioBean mossAudioBean = (MossAudioBean) GsonUtils.fromJson(this.weCarMasService.musicInfo(), MossAudioBean.class);
                return mossAudioBean;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        if (this.callback != null) {
            this.callback.connectionFail();
            return null;
        }
        return null;
    }

    @Override // com.tencent.taes.api.moss.IMossApi
    public void registerConnection(Context context) {
        this.context = context;
        if (context != null && !this.isConnection) {
            try {
                Intent intent = new Intent();
                intent.setAction("com.tencent.mossbiz.aidl");
                intent.setPackage(TaesSDKHelper.WECAR_PACKAGE_NAME);
                this.isConnection = context.bindService(intent, this.conn, 1);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.api.moss.IMossApi
    public void unRegisterConnection() {
        if (this.context != null && this.isConnection) {
            try {
                this.context.unbindService(this.conn);
                this.isConnection = false;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
