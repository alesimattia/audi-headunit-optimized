package com.tencent.taes.remote.api.tts.listener;

/* JADX INFO: loaded from: classes.dex */
public interface ITtsPlayListener {
    void onError(int i, String str, String str2, String str3);

    void onPlayBegin(String str, String str2);

    void onPlayCompleted(String str, String str2);

    void onPlayInterrupted(String str, String str2);

    void onProgressReturn(int i, int i2, String str, String str2);
}
