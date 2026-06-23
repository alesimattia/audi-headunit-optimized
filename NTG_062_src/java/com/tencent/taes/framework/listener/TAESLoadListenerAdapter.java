package com.tencent.taes.framework.listener;

import android.support.annotation.Keep;

/* JADX INFO: loaded from: classes.dex */
@Keep
public class TAESLoadListenerAdapter<T> implements TAESLoadListener<T> {
    @Override // com.tencent.taes.framework.listener.TAESLoadListener
    public void onSuccess(T t) throws Exception {
    }

    @Override // com.tencent.taes.framework.listener.TAESLoadListener
    public void onFail(int errorCode, String msg) {
    }
}
