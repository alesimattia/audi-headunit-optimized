package com.tencent.taes.impl.tts;

import android.media.AudioAttributes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.tencent.taes.api.tts.ITtsApi;
import com.tencent.taes.framework.APIResult;
import com.tencent.taes.framework.BuildConfig;
import com.tencent.taes.framework.TAESFrameworkManager;
import com.tencent.taes.framework.listener.TAESCommonListener;
import com.tencent.taes.impl.base.AbstractApi;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.IServerConnectListener;
import com.tencent.taes.remote.api.tts.listener.IPlayingListener;
import com.tencent.taes.remote.api.tts.listener.IQrCodeListener;
import com.tencent.taes.remote.api.tts.listener.ISpeakerListener;
import com.tencent.taes.remote.api.tts.listener.ITtsPlayListener;
import com.tencent.taes.remote.api.tts.listener.ITtsResponseListener;
import com.tencent.taes.remote.api.tts.listener.ITtsSpeakerListener;

/* JADX INFO: loaded from: classes.dex */
public class TtsApiImpl extends AbstractApi implements ITtsApi {
    private static final String TAG = TtsApiImpl.class.getSimpleName();
    private com.tencent.taes.remote.api.tts.ITtsApi mTtsApi = null;

    public TtsApiImpl() {
        TAESFrameworkManager.getInstance().registerCompLoadListener(ServerCompConstant.TTS, new TAESCommonListener() { // from class: com.tencent.taes.impl.tts.TtsApiImpl.1
            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onSuccess() {
                TtsApiImpl.this.getTtsApi();
            }

            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onFail(int i, String s) {
                Log.e(TtsApiImpl.TAG, "MapServiceloadFail：errorCode = " + i + ", msg = " + s);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public com.tencent.taes.remote.api.tts.ITtsApi getTtsApi() {
        if (this.mTtsApi == null) {
            APIResult<com.tencent.taes.remote.api.tts.ITtsApi> apiAPIResult = TAESFrameworkManager.getInstance().getApi(ServerCompConstant.TTS, com.tencent.taes.remote.api.tts.ITtsApi.class, null);
            if (apiAPIResult.isSuccess()) {
                this.mTtsApi = apiAPIResult.data;
            } else {
                Log.d(TAG, "getApi Fail:" + apiAPIResult.codeDescription());
            }
        }
        return this.mTtsApi;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public String playTts(String text, int streamType, int speedLevel, ITtsPlayListener listener) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.playTts(text, streamType, speedLevel, listener);
        }
        return "";
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public String playTts(String text, int streamType, ITtsPlayListener listener) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.playTts(text, streamType, listener);
        }
        return "";
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public String playTts(String text, ITtsPlayListener listener, AudioAttributes audioAttributes) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.playTts(text, listener, audioAttributes);
        }
        return "";
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public String playTts(String text, int speedLevel, ITtsPlayListener listener, AudioAttributes audioAttributes) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.playTts(text, speedLevel, listener, audioAttributes);
        }
        return "";
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void stopPlay(String msgId) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.stopPlay(msgId);
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void setTtsSpeaker(@NonNull String s) {
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Nullable
    public String getTtsSpeaker() {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.getTtsSpeaker();
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public int setAppendTtsSpeakerPath(@NonNull String s) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.setAppendTtsSpeakerPath(s);
        }
        return -1;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public boolean isOfficialTtsSpeaker() {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.isOfficialTtsSpeaker();
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void addTtsSpeakerListener(@Nullable ITtsSpeakerListener iTtsSpeakerListener) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.addTtsSpeakerListener(iTtsSpeakerListener);
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void removeTtsSpeakerListener(@NonNull ITtsSpeakerListener iTtsSpeakerListener) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.removeTtsSpeakerListener(iTtsSpeakerListener);
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Nullable
    public String[] getAvailableTtsSpeaker() {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.getAvailableTtsSpeaker();
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void addPlayingListener(IPlayingListener listener) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.addPlayingListener(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void removePlayingListener(@NonNull IPlayingListener iPlayingListener) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.removePlayingListener(iPlayingListener);
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public String getVersion() {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.getVersion();
        }
        return "connect error";
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void getQrCodeUrl(String s, String s1, @NonNull IQrCodeListener iQrCodeListener) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.getQrCodeUrl(s, s1, iQrCodeListener);
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void getAppendTtsSpeakerList(String s, String s1, @NonNull ITtsResponseListener iTtsResponseListener) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.getAppendTtsSpeakerList(s, s1, iTtsResponseListener);
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void registerTtsSpeakerNotification(@NonNull ITtsResponseListener iTtsResponseListener) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.registerTtsSpeakerNotification(iTtsResponseListener);
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void unRegisterTtsSpeakerNotification() {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.unRegisterTtsSpeakerNotification();
        }
    }

    @Override // com.tencent.taes.impl.base.AbstractApi
    public void dispose() {
    }

    @Override // com.tencent.taes.api.base.BaseApi
    public String getApiVersion() {
        return BuildConfig.VERSION_NAME;
    }

    @Override // com.tencent.taes.remote.api.IRegitsterConnectStateApi
    public void registerConnectListener(IServerConnectListener iServerConnectListener) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.registerConnectListener(iServerConnectListener);
        }
    }

    @Override // com.tencent.taes.remote.api.IRegitsterConnectStateApi
    public void unregisterConnectListener(IServerConnectListener iServerConnectListener) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.unregisterConnectListener(iServerConnectListener);
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void setOfficialSpeaker() {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.setOfficialSpeaker();
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public void setCustomSpeaker(@NonNull String customSpeaker) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.setCustomSpeaker(customSpeaker);
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Nullable
    public String getCustomSpeaker() {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.getCustomSpeaker();
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public void initTts() {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.initTts();
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public void initTts(int playerType) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.initTts(playerType);
        }
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    public boolean isInited() {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.isInited();
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public String playTts(String text) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.playTts(text);
        }
        return "";
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public String playTts(String text, ITtsPlayListener listener) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.playTts(text, listener);
        }
        return "";
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public String playTts(String text, int audioType, int speedLevel) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.playTts(text, audioType, speedLevel);
        }
        return "";
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public String playTts(String text, int audioType, ITtsPlayListener listener, boolean isUsage) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.playTts(text, audioType, listener, isUsage);
        }
        return "";
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public String playTts(String text, int audioType, int speedLevel, ITtsPlayListener listener, boolean isUsage) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.playTts(text, audioType, speedLevel, listener, isUsage);
        }
        return "";
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public void setSpeaker(int speaker) {
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public int getSpeaker() {
        if (getTtsApi() != null && this.mTtsApi != null) {
            return this.mTtsApi.getSpeaker();
        }
        return -1;
    }

    @Override // com.tencent.taes.remote.api.tts.ITtsApi
    @Deprecated
    public void addSpeakerListener(ISpeakerListener listener) {
        if (getTtsApi() != null && this.mTtsApi != null) {
            this.mTtsApi.addSpeakerListener(listener);
        }
    }
}
