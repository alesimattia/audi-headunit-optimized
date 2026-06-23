package com.tencent.taes.framework.interfaces;

import com.tencent.taes.framework.bean.IPCEvent;

/* JADX INFO: loaded from: classes.dex */
public interface IEventSubscriber {
    void onEvent(IPCEvent iPCEvent);

    void subscribe(String str, IEventListener iEventListener);

    void unsubscribe(IEventListener iEventListener);

    void unsubscribe(String str, IEventListener iEventListener);
}
