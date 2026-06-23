package com.tencent.taes.remote.api.tts;

import android.media.AudioAttributes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.tencent.taes.remote.api.IRegitsterConnectStateApi;
import com.tencent.taes.remote.api.tts.listener.IPlayingListener;
import com.tencent.taes.remote.api.tts.listener.IQrCodeListener;
import com.tencent.taes.remote.api.tts.listener.ISpeakerListener;
import com.tencent.taes.remote.api.tts.listener.ITtsPlayListener;
import com.tencent.taes.remote.api.tts.listener.ITtsResponseListener;
import com.tencent.taes.remote.api.tts.listener.ITtsSpeakerListener;

/* JADX INFO: loaded from: classes.dex */
public interface ITtsApi extends IRegitsterConnectStateApi {
    void addPlayingListener(@NonNull IPlayingListener iPlayingListener);

    @Deprecated
    void addSpeakerListener(ISpeakerListener iSpeakerListener);

    void addTtsSpeakerListener(@NonNull ITtsSpeakerListener iTtsSpeakerListener);

    void getAppendTtsSpeakerList(String str, String str2, @NonNull ITtsResponseListener iTtsResponseListener);

    @Nullable
    String[] getAvailableTtsSpeaker();

    @Nullable
    String getCustomSpeaker();

    void getQrCodeUrl(String str, String str2, @NonNull IQrCodeListener iQrCodeListener);

    @Deprecated
    int getSpeaker();

    @Nullable
    String getTtsSpeaker();

    String getVersion();

    @Deprecated
    void initTts();

    @Deprecated
    void initTts(int i);

    boolean isInited();

    boolean isOfficialTtsSpeaker();

    @Deprecated
    String playTts(String str);

    @Deprecated
    String playTts(String str, int i, int i2);

    String playTts(String str, int i, int i2, ITtsPlayListener iTtsPlayListener);

    @Deprecated
    String playTts(String str, int i, int i2, ITtsPlayListener iTtsPlayListener, boolean z);

    String playTts(String str, int i, ITtsPlayListener iTtsPlayListener);

    String playTts(String str, int i, ITtsPlayListener iTtsPlayListener, AudioAttributes audioAttributes);

    @Deprecated
    String playTts(String str, int i, ITtsPlayListener iTtsPlayListener, boolean z);

    @Deprecated
    String playTts(String str, ITtsPlayListener iTtsPlayListener);

    String playTts(String str, ITtsPlayListener iTtsPlayListener, AudioAttributes audioAttributes);

    void registerTtsSpeakerNotification(@NonNull ITtsResponseListener iTtsResponseListener);

    void removePlayingListener(@NonNull IPlayingListener iPlayingListener);

    void removeTtsSpeakerListener(@NonNull ITtsSpeakerListener iTtsSpeakerListener);

    int setAppendTtsSpeakerPath(@NonNull String str);

    void setCustomSpeaker(@NonNull String str);

    void setOfficialSpeaker();

    @Deprecated
    void setSpeaker(int i);

    void setTtsSpeaker(@NonNull String str);

    void stopPlay(String str);

    void unRegisterTtsSpeakerNotification();
}
