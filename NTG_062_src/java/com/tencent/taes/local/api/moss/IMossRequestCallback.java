package com.tencent.taes.local.api.moss;

import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface IMossRequestCallback<T> {
    void onFailed(String str);

    void onSucceeded(List<T> list);
}
