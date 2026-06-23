package com.tencent.taes.api.moss.listener;

import com.tencent.taes.api.moss.bean.MossAudioBean;

/* JADX INFO: loaded from: classes.dex */
public interface MossCallback {
    void connectionFail();

    void connectionSuccess();

    void onMusicInfoChange(MossAudioBean mossAudioBean);

    void onMusicStatusChange(String str);

    void onProgress(long j, long j2);
}
