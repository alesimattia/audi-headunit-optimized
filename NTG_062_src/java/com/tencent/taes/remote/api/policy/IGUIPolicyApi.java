package com.tencent.taes.remote.api.policy;

import android.support.annotation.NonNull;
import com.tencent.taes.remote.api.policy.bean.Response;
import com.tencent.taes.remote.api.policy.listener.PolicyCallback;

/* JADX INFO: loaded from: classes.dex */
public interface IGUIPolicyApi {
    String dumpState();

    Response requestJudge(String str, int i, @NonNull PolicyCallback policyCallback, String str2);

    void stopJudge(int i);
}
