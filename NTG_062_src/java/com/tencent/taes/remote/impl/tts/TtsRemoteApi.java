package com.tencent.taes.remote.impl.tts;

import android.media.AudioAttributes;
import android.os.Build;
import android.os.IBinder;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import android.util.Pair;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.tts.ITtsApi;
import com.tencent.taes.remote.api.tts.ITtsService;
import com.tencent.taes.remote.api.tts.listener.IPlayingCallback;
import com.tencent.taes.remote.api.tts.listener.IPlayingListener;
import com.tencent.taes.remote.api.tts.listener.IQrCodeCallback;
import com.tencent.taes.remote.api.tts.listener.IQrCodeListener;
import com.tencent.taes.remote.api.tts.listener.ISpeakerCallback;
import com.tencent.taes.remote.api.tts.listener.ISpeakerListener;
import com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback;
import com.tencent.taes.remote.api.tts.listener.ITtsPlayListener;
import com.tencent.taes.remote.api.tts.listener.ITtsResponseCallback;
import com.tencent.taes.remote.api.tts.listener.ITtsResponseListener;
import com.tencent.taes.remote.api.tts.listener.ITtsSpeakerCallback;
import com.tencent.taes.remote.api.tts.listener.ITtsSpeakerListener;
import com.tencent.taes.remote.impl.BaseRemoteApi;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: classes.dex */
public class TtsRemoteApi extends BaseRemoteApi implements ITtsApi {
    private static final String TAG = "TtsRemoteApi";
    private int defaultSpeedLevel;
    private int defaultStreamType;
    private ITtsService mITtsService;
    private List<IPlayingListener> mPlayingListener;
    private IPlayingCallback.Stub mTtsPlayCallbackStub;
    private ITtsSpeakerCallback.Stub mTtsSpeakerCallbackStub;
    private List<ITtsSpeakerListener> mTtsSpeakerListenerList;

    private TtsRemoteApi(IBinder binder, IBinder smsbinder) {
        super(binder, smsbinder);
        this.defaultStreamType = 3;
        this.defaultSpeedLevel = 0;
        this.mTtsSpeakerListenerList = new CopyOnWriteArrayList();
        this.mTtsSpeakerCallbackStub = new ITtsSpeakerCallback.Stub() { // from class: com.tencent.taes.remote.impl.tts.TtsRemoteApi.1
            @Override // com.tencent.taes.remote.api.tts.listener.ITtsSpeakerCallback
            public void onSpeakerChanged(String speaker) throws RemoteException {
                Log.d(TtsRemoteApi.TAG, "mTtsSpeakerCallbackStub:onSpeakerChanged");
                for (ITtsSpeakerListener listener : TtsRemoteApi.this.mTtsSpeakerListenerList) {
                    listener.onSpeakerChanged(speaker);
                }
            }
        };
        this.mPlayingListener = new CopyOnWriteArrayList();
        this.mTtsPlayCallbackStub = new IPlayingCallback.Stub() { // from class: com.tencent.taes.remote.impl.tts.TtsRemoteApi.2
            @Override // com.tencent.taes.remote.api.tts.listener.IPlayingCallback
            public void onPlayingChanged(boolean isPlaying) throws RemoteException {
                for (IPlayingListener listener : TtsRemoteApi.this.mPlayingListener) {
                    listener.onPlayingChanged(isPlaying);
                }
            }
        };
        this.mITtsService = ITtsService.Stub.asInterface(binder);
        registerClientCallback();
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public Pair<String, String> subscribeModuleBinder() {
        return new Pair<>(ServerCompConstant.TTS, ITtsService.Stub.class.getName());
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderConnect(IBinder binder) {
        this.mITtsService = ITtsService.Stub.asInterface(binder);
        Log.i(TAG, "binderConnect: ");
        registerClientCallback();
        super.binderConnect(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderDisConnect() {
        Log.i(TAG, "binderDisConnect: ");
        super.binderDisConnect();
    }

    private void registerClientCallback() {
        if (this.mITtsService != null) {
            try {
                this.mITtsService.addTtsSpeakerListener(this.mTtsSpeakerCallbackStub);
                this.mITtsService.addPlayingListener(this.mTtsPlayCallbackStub);
            } catch (RemoteException e) {
                e.printStackTrace();
                Log.e(TAG, e.getMessage());
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public boolean isInited() {
        if (this.mITtsService != null) {
            try {
                Log.i(TAG, "isInited: " + this.mITtsService.isInited());
                return this.mITtsService.isInited();
            } catch (RemoteException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public String playTts(String text, int streamType, ITtsPlayListener listener) {
        return playTtsByStreamType(text, streamType, this.defaultSpeedLevel, listener);
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public String playTts(String text, int streamType, int speedLevel, ITtsPlayListener listener) {
        return playTtsByStreamType(text, streamType, speedLevel, listener);
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public String playTts(String text, ITtsPlayListener listener, AudioAttributes audioAttributes) {
        return playTts(text, this.defaultSpeedLevel, listener, audioAttributes);
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public String playTts(String text, int speedLevel, final ITtsPlayListener listener, AudioAttributes audioAttributes) throws RemoteException {
        Log.i(TAG, "playTts: text = " + text + ";speedLevel = " + speedLevel + ";listener = " + listener + ";audioAttributes = " + audioAttributes);
        String msgId = "";
        if (this.mITtsService != null) {
            try {
                if (listener != null) {
                    msgId = this.mITtsService.playTtsByAudioAttribute(text, speedLevel, new ITtsPlayCallback.Stub() { // from class: com.tencent.taes.remote.impl.tts.TtsRemoteApi.3
                        @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
                        public void onPlayBegin(String sMsgId, String sText) throws RemoteException {
                            Log.i(TtsRemoteApi.TAG, "onPlayBegin: ");
                            listener.onPlayBegin(sMsgId, sText);
                        }

                        @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
                        public void onPlayCompleted(String sMsgId, String sText) throws RemoteException {
                            Log.i(TtsRemoteApi.TAG, "onPlayCompleted: ");
                            listener.onPlayCompleted(sMsgId, sText);
                        }

                        @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
                        public void onPlayInterrupted(String sMsgId, String sText) throws RemoteException {
                            Log.i(TtsRemoteApi.TAG, "onPlayInterrupted: ");
                            listener.onPlayInterrupted(sMsgId, sText);
                        }

                        @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
                        public void onError(int errorCode, String msg, String sMsgId, String sText) throws RemoteException {
                            Log.i(TtsRemoteApi.TAG, "onError: ");
                            listener.onError(errorCode, msg, sMsgId, sText);
                        }

                        @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
                        public void onProgressReturn(int textindex, int textlen, String sMsgId, String sText) throws RemoteException {
                            Log.i(TtsRemoteApi.TAG, "onProgressReturn: ");
                            listener.onProgressReturn(textindex, textlen, sMsgId, sText);
                        }
                    }, audioAttributes);
                } else {
                    msgId = this.mITtsService.playTtsByAudioAttribute(text, speedLevel, null, audioAttributes);
                }
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
        return msgId;
    }

    private String playTtsByStreamType(String text, int streamType, int speedLevel, final ITtsPlayListener listener) throws RemoteException {
        Log.i(TAG, "playTts: text = " + text + ";streamType = " + streamType + ";speedLevel = " + speedLevel + ";listener = " + listener);
        String msgId = "";
        if (this.mITtsService != null) {
            try {
                if (listener != null) {
                    msgId = this.mITtsService.playTts(text, streamType, speedLevel, new ITtsPlayCallback.Stub() { // from class: com.tencent.taes.remote.impl.tts.TtsRemoteApi.4
                        @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
                        public void onPlayBegin(String sMsgId, String sText) throws RemoteException {
                            Log.i(TtsRemoteApi.TAG, "onPlayBegin: ");
                            listener.onPlayBegin(sMsgId, sText);
                        }

                        @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
                        public void onPlayCompleted(String sMsgId, String sText) throws RemoteException {
                            Log.i(TtsRemoteApi.TAG, "onPlayCompleted: ");
                            listener.onPlayCompleted(sMsgId, sText);
                        }

                        @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
                        public void onPlayInterrupted(String sMsgId, String sText) throws RemoteException {
                            Log.i(TtsRemoteApi.TAG, "onPlayInterrupted: ");
                            listener.onPlayInterrupted(sMsgId, sText);
                        }

                        @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
                        public void onError(int errorCode, String msg, String sMsgId, String sText) throws RemoteException {
                            Log.i(TtsRemoteApi.TAG, "onError: ");
                            listener.onError(errorCode, msg, sMsgId, sText);
                        }

                        @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
                        public void onProgressReturn(int textindex, int textlen, String sMsgId, String sText) throws RemoteException {
                            Log.i(TtsRemoteApi.TAG, "onProgressReturn: ");
                            listener.onProgressReturn(textindex, textlen, sMsgId, sText);
                        }
                    }, false);
                } else {
                    msgId = this.mITtsService.playTts(text, streamType, speedLevel, null, false);
                }
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
        return msgId;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void stopPlay(String msgId) {
        if (this.mITtsService != null) {
            try {
                Log.i(TAG, "stopPlay: msgId = " + msgId);
                if (msgId != null) {
                    this.mITtsService.stopPlay(msgId);
                }
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void setTtsSpeaker(@NonNull String speaker) {
        if (this.mITtsService != null) {
            try {
                this.mITtsService.setTtsSpeaker(speaker);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Nullable
    public String getTtsSpeaker() {
        if (this.mITtsService != null) {
            try {
                return this.mITtsService.getTtsSpeaker();
            } catch (RemoteException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void setOfficialSpeaker() {
        if (this.mITtsService != null) {
            try {
                this.mITtsService.setOfficialSpeaker();
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void setCustomSpeaker(@NonNull String customSpeaker) {
        if (this.mITtsService != null) {
            try {
                this.mITtsService.setCustomSpeaker(customSpeaker);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Nullable
    public String getCustomSpeaker() {
        if (this.mITtsService != null) {
            try {
                return this.mITtsService.getCustomSpeaker();
            } catch (RemoteException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public int setAppendTtsSpeakerPath(@NonNull String path) {
        if (this.mITtsService != null) {
            try {
                return this.mITtsService.setAppendTtsSpeakerPath(path);
            } catch (RemoteException e) {
                e.printStackTrace();
                return -1;
            }
        }
        return -1;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public boolean isOfficialTtsSpeaker() {
        if (this.mITtsService != null) {
            try {
                return this.mITtsService.isOfficialTtsSpeaker();
            } catch (RemoteException e) {
                e.printStackTrace();
                return true;
            }
        }
        return true;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void addTtsSpeakerListener(@NonNull ITtsSpeakerListener listener) {
        if (!this.mTtsSpeakerListenerList.contains(listener)) {
            this.mTtsSpeakerListenerList.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void removeTtsSpeakerListener(@NonNull ITtsSpeakerListener listener) {
        boolean result = this.mTtsSpeakerListenerList.remove(listener);
        if (!result) {
            Log.e(TAG, "ITtsSpeakerListener is NOT added");
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Nullable
    public String[] getAvailableTtsSpeaker() {
        if (this.mITtsService != null) {
            try {
                return this.mITtsService.getAvailableTtsSpeaker();
            } catch (RemoteException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void addPlayingListener(@NonNull IPlayingListener listener) {
        if (!this.mPlayingListener.contains(listener)) {
            this.mPlayingListener.add(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void removePlayingListener(@NonNull IPlayingListener listener) {
        boolean result = this.mPlayingListener.remove(listener);
        if (!result) {
            Log.e(TAG, "IPlayingListener is NOT added");
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public String getVersion() {
        if (this.mITtsService != null) {
            try {
                return this.mITtsService.getVersion();
            } catch (RemoteException e) {
                e.printStackTrace();
                return "";
            }
        }
        return "";
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void getQrCodeUrl(String userId, String weCarId, @NonNull final IQrCodeListener listener) {
        if (this.mITtsService != null) {
            try {
                this.mITtsService.getQrCodeUrl(userId, weCarId, new IQrCodeCallback.Stub() { // from class: com.tencent.taes.remote.impl.tts.TtsRemoteApi.5
                    @Override // com.tencent.taes.remote.api.tts.listener.IQrCodeCallback
                    public void onResult(String response) throws RemoteException {
                        listener.onResult(response);
                    }
                });
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void getAppendTtsSpeakerList(String userId, String weCarId, @NonNull final ITtsResponseListener listener) {
        if (this.mITtsService != null) {
            try {
                this.mITtsService.getAppendTtsSpeakerList(userId, weCarId, new ITtsResponseCallback.Stub() { // from class: com.tencent.taes.remote.impl.tts.TtsRemoteApi.6
                    @Override // com.tencent.taes.remote.api.tts.listener.ITtsResponseCallback
                    public void onResult(String response) throws RemoteException {
                        listener.onResult(response);
                    }
                });
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void registerTtsSpeakerNotification(@NonNull final ITtsResponseListener listener) {
        if (this.mITtsService != null) {
            try {
                this.mITtsService.registerTtsSpeakerNotification(new ITtsResponseCallback.Stub() { // from class: com.tencent.taes.remote.impl.tts.TtsRemoteApi.7
                    @Override // com.tencent.taes.remote.api.tts.listener.ITtsResponseCallback
                    public void onResult(String response) throws RemoteException {
                        listener.onResult(response);
                    }
                });
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void unRegisterTtsSpeakerNotification() {
        if (this.mITtsService != null) {
            try {
                this.mITtsService.unRegisterTtsSpeakerNotification();
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    public void setTtsRecordPcm(boolean on) {
        if (this.mITtsService != null) {
            try {
                this.mITtsService.setTtsRecordPcm(on);
            } catch (RemoteException ex) {
                ex.printStackTrace();
            }
        }
    }

    public boolean getTtsRecordPcmValue() {
        if (this.mITtsService != null) {
            try {
                return this.mITtsService.getTtsRecordPcmValue();
            } catch (RemoteException ex) {
                ex.printStackTrace();
                return false;
            }
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public void initTts() {
        initTts(1);
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public void initTts(int playerType) {
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void setSpeaker(int speaker) {
        if (this.mITtsService != null) {
            try {
                this.mITtsService.setSpeaker(speaker);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public int getSpeaker() {
        if (this.mITtsService != null) {
            try {
                return this.mITtsService.getSpeaker();
            } catch (RemoteException e) {
                e.printStackTrace();
                return 0;
            }
        }
        return 0;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void addSpeakerListener(final ISpeakerListener listener) {
        if (this.mITtsService != null) {
            try {
                this.mITtsService.addSpeakerListener(new ISpeakerCallback.Stub() { // from class: com.tencent.taes.remote.impl.tts.TtsRemoteApi.8
                    @Override // com.tencent.taes.remote.api.tts.listener.ISpeakerCallback
                    public void onSpeakerChanged(int speaker) throws RemoteException {
                        if (listener != null) {
                            listener.onSpeakerChanged(speaker);
                        }
                    }
                });
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public String playTts(String text) {
        return playTtsByStreamType(text, this.defaultStreamType, this.defaultSpeedLevel, null);
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public String playTts(String text, ITtsPlayListener listener) {
        return playTtsByStreamType(text, this.defaultStreamType, this.defaultSpeedLevel, listener);
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public String playTts(String text, int audioType, int speedLevel) {
        if (Build.VERSION.SDK_INT >= 21) {
            return playTts(text, audioType, this.defaultSpeedLevel, null, true);
        }
        return playTts(text, audioType, this.defaultSpeedLevel, null, false);
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public String playTts(String text, int audioType, ITtsPlayListener listener, boolean isUsage) {
        return playTts(text, audioType, this.defaultSpeedLevel, listener, isUsage);
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public String playTts(String text, int audioType, int speedLevel, final ITtsPlayListener listener, boolean isUsage) throws RemoteException {
        Log.i(TAG, "playTts: text = " + text + ";audioType = " + audioType + ";speedLevel = " + speedLevel + ";listener = " + listener + ";isUsage = " + isUsage);
        String msgId = "";
        if (this.mITtsService != null) {
            try {
                if (listener != null) {
                    msgId = this.mITtsService.playTts(text, audioType, speedLevel, new ITtsPlayCallback.Stub() { // from class: com.tencent.taes.remote.impl.tts.TtsRemoteApi.9
                        @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
                        public void onPlayBegin(String sMsgId, String sText) throws RemoteException {
                            Log.i(TtsRemoteApi.TAG, "onPlayBegin: ");
                            listener.onPlayBegin(sMsgId, sText);
                        }

                        @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
                        public void onPlayCompleted(String sMsgId, String sText) throws RemoteException {
                            Log.i(TtsRemoteApi.TAG, "onPlayCompleted: ");
                            listener.onPlayCompleted(sMsgId, sText);
                        }

                        @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
                        public void onPlayInterrupted(String sMsgId, String sText) throws RemoteException {
                            Log.i(TtsRemoteApi.TAG, "onPlayInterrupted: ");
                            listener.onPlayInterrupted(sMsgId, sText);
                        }

                        @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
                        public void onError(int errorCode, String msg, String sMsgId, String sText) throws RemoteException {
                            Log.i(TtsRemoteApi.TAG, "onError: ");
                            listener.onError(errorCode, msg, sMsgId, sText);
                        }

                        @Override // com.tencent.taes.remote.api.tts.listener.ITtsPlayCallback
                        public void onProgressReturn(int textindex, int textlen, String sMsgId, String sText) throws RemoteException {
                            Log.i(TtsRemoteApi.TAG, "onProgressReturn: ");
                            listener.onProgressReturn(textindex, textlen, sMsgId, sText);
                        }
                    }, isUsage);
                } else {
                    msgId = this.mITtsService.playTts(text, audioType, speedLevel, null, isUsage);
                }
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
        return msgId;
    }
}
