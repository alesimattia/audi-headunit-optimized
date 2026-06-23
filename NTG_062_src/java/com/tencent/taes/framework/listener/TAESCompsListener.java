package com.tencent.taes.framework.listener;

import com.tencent.taes.framework.interfaces.ICompManager;

/* JADX INFO: loaded from: classes.dex */
public interface TAESCompsListener extends ICompManager.Listener {
    void onLoadLocalCompsComplete();

    void onLoadServerCompsComplete();
}
