package com.tencent.taes.remote.impl.tts;

import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import android.util.Pair;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.tts.IOnlineTtsApi;
import com.tencent.taes.remote.api.tts.IOnlineTtsService;
import com.tencent.taes.remote.api.tts.listener.IOnlineTtsCallback;
import com.tencent.taes.remote.api.tts.listener.IOnlineTtsListener;
import com.tencent.taes.remote.impl.BaseRemoteApi;

/* JADX INFO: loaded from: classes.dex */
public class OnlineTtsRemoteApi extends BaseRemoteApi implements IOnlineTtsApi {
    private static final String TAG = "OnlineTtsRemoteApi";
    private IOnlineTtsService mIOnlineTtsService;

    private OnlineTtsRemoteApi(IBinder binder, IBinder smsbinder) {
        super(binder, smsbinder);
        this.mIOnlineTtsService = IOnlineTtsService.Stub.asInterface(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public Pair<String, String> subscribeModuleBinder() {
        return new Pair<>(ServerCompConstant.ONLINE_TTS, IOnlineTtsService.Stub.class.getName());
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderConnect(IBinder binder) {
        this.mIOnlineTtsService = IOnlineTtsService.Stub.asInterface(binder);
        super.binderConnect(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderDisConnect() {
        super.binderDisConnect();
    }

    @Override // com.tencent.taes.remote.api.tts.IOnlineTtsApi
    public void playTts(String text) {
        playTts(text, null);
    }

    @Override // com.tencent.taes.remote.api.tts.IOnlineTtsApi
    public void playTts(String text, final IOnlineTtsListener listener) {
        if (this.mIOnlineTtsService != null) {
            try {
                this.mIOnlineTtsService.playTts(text, new IOnlineTtsCallback.Stub() { // from class: com.tencent.taes.remote.impl.tts.OnlineTtsRemoteApi.1
                    @Override // com.tencent.taes.remote.api.tts.listener.IOnlineTtsCallback
                    public void onPlayBegin() throws RemoteException {
                        if (listener != null) {
                            listener.onPlayBegin();
                        }
                    }

                    @Override // com.tencent.taes.remote.api.tts.listener.IOnlineTtsCallback
                    public void onPlayCompleted() throws RemoteException {
                        if (listener != null) {
                            listener.onPlayCompleted();
                        }
                    }
                });
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tts.IOnlineTtsApi
    public void setStreamType(int streamType) {
        if (this.mIOnlineTtsService != null) {
            try {
                Log.i(TAG, "setStreamType: " + streamType);
                this.mIOnlineTtsService.setStreamType(streamType);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tts.IOnlineTtsApi
    public void setSpeaker(int speaker) {
        if (this.mIOnlineTtsService != null) {
            try {
                Log.i(TAG, "setSpeaker: " + speaker);
                this.mIOnlineTtsService.setSpeaker(speaker);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tts.IOnlineTtsApi
    public void setSpeedLevel(int speedLevel) {
        if (this.mIOnlineTtsService != null) {
            try {
                Log.i(TAG, "setSpeedLevel: " + speedLevel);
                this.mIOnlineTtsService.setSpeedLevel(speedLevel);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }
}
