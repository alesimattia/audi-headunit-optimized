package com.tencent.taes.framework.listener;

import com.tencent.taes.base.api.INoProguard;

/* JADX INFO: loaded from: classes.dex */
public interface TAESCommonListener extends INoProguard {
    void onFail(int i, String str);

    void onSuccess();
}
