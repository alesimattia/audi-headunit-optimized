package com.tencent.taes.remote.api.tts;

import com.tencent.taes.remote.api.IRegitsterConnectStateApi;
import com.tencent.taes.remote.api.tts.listener.IOnlineTtsListener;

/* JADX INFO: loaded from: classes.dex */
public interface IOnlineTtsApi extends IRegitsterConnectStateApi {
    void playTts(String str);

    void playTts(String str, IOnlineTtsListener iOnlineTtsListener);

    void setSpeaker(int i);

    void setSpeedLevel(int i);

    void setStreamType(int i);
}
