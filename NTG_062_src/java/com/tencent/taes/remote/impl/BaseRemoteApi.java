package com.tencent.taes.remote.impl;

import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import android.util.Pair;
import com.tencent.taes.framework.APIResult;
import com.tencent.taes.framework.remote.IServiceManagerService;
import com.tencent.taes.framework.server.connect.DeathRecipientHelper;
import com.tencent.taes.remote.api.IRegitsterConnectStateApi;
import com.tencent.taes.remote.api.IServerConnectListener;
import com.tencent.taes.remote.api.policy.bean.VuiConstants;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: classes.dex */
public abstract class BaseRemoteApi implements Runnable, IRegitsterConnectStateApi {
    private static final String TAG = "BaseRemoteApi";
    private IBinder mBinder;
    private DeathRecipientHelper mDeathRecipientHelper;
    private Handler mHandler;
    private HandlerThread mHandlerThread;
    private IServiceManagerService mServiceManagerService;
    private CopyOnWriteArrayList<IServerConnectListener> serverConnectListeners = new CopyOnWriteArrayList<>();
    private final int mDefualtInterval = VuiConstants.CALLBACK_GRANT;
    private int mRetryCount = 0;

    public abstract Pair<String, String> subscribeModuleBinder();

    public BaseRemoteApi(IBinder binder, IBinder smsBinder) {
        Log.d(TAG, "BaseRemoteApi:" + binder + "   " + getClass().getName());
        this.mHandlerThread = new HandlerThread(getClass().getName());
        this.mHandlerThread.start();
        this.mHandler = new Handler(this.mHandlerThread.getLooper());
        this.mServiceManagerService = IServiceManagerService.Stub.asInterface(smsBinder);
        this.mBinder = binder;
        this.mDeathRecipientHelper = new DeathRecipientHelper(new IBinder.DeathRecipient() { // from class: com.tencent.taes.remote.impl.BaseRemoteApi.1
            @Override // android.os.IBinder.DeathRecipient
            public void binderDied() {
                Log.d(BaseRemoteApi.TAG, "BaseRemoteApi binderDied！！" + BaseRemoteApi.this.getClass().getName());
                BaseRemoteApi.this.handleDisconnect();
            }
        });
        this.mDeathRecipientHelper.listenBinderDeath(binder);
    }

    public void setServiceManagerService(IServiceManagerService mServiceManagerService) {
        this.mServiceManagerService = mServiceManagerService;
        if (this.mBinder != null && this.mBinder.isBinderAlive()) {
            Log.d(TAG, getClass().getName() + " Binder:" + this.mBinder + " isAlive !");
            return;
        }
        handleDisconnect();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleDisconnect() {
        binderDisConnect();
        this.mHandler.removeCallbacksAndMessages(null);
        this.mHandler.postDelayed(this, VuiConstants.CALLBACK_GRANT + ((int) (Math.random() * 2000.0d)));
    }

    @Override // java.lang.Runnable
    public void run() {
        this.mRetryCount++;
        Pair<String, String> binderInfo = subscribeModuleBinder();
        if (this.mServiceManagerService != null && this.mServiceManagerService.asBinder().isBinderAlive()) {
            try {
                Bundle bundle = this.mServiceManagerService.getRemoteBinder((String) binderInfo.first, (String) binderInfo.second, null);
                if (bundle != null) {
                    int code = bundle.getInt("code", APIResult.ERROR_API_RESULT_NULL);
                    Log.d(TAG, "getApi Remote " + ((String) binderInfo.first) + "  " + ((String) binderInfo.second) + "  " + code);
                    if (code == 0) {
                        this.mBinder = bundle.getBinder("data");
                        binderConnect(this.mBinder);
                        this.mDeathRecipientHelper.listenBinderDeath(this.mBinder);
                        this.mRetryCount = 0;
                        return;
                    }
                }
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
        long interval = VuiConstants.CALLBACK_GRANT + (this.mRetryCount * 1000);
        this.mHandler.postDelayed(this, interval <= 10000 ? interval : 10000L);
    }

    public void binderConnect(IBinder binder) {
        for (IServerConnectListener listener : this.serverConnectListeners) {
            if (listener != null) {
                listener.onConnected();
            }
        }
    }

    public void binderDisConnect() {
        for (IServerConnectListener listener : this.serverConnectListeners) {
            if (listener != null) {
                listener.onDisConnected();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.IRegitsterConnectStateApi
    public void registerConnectListener(IServerConnectListener listener) {
        if (!this.serverConnectListeners.contains(listener)) {
            this.serverConnectListeners.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.IRegitsterConnectStateApi
    public void unregisterConnectListener(IServerConnectListener listener) {
        if (this.serverConnectListeners.contains(listener)) {
            this.serverConnectListeners.remove(listener);
        }
    }
}
