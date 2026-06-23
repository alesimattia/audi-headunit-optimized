package com.tencent.taes.framework.listener;

import com.tencent.taes.base.api.INoProguard;

/* JADX INFO: loaded from: classes.dex */
public interface TAESLoadListener<T> extends INoProguard {
    void onFail(int i, String str);

    void onSuccess(T t) throws Exception;
}
