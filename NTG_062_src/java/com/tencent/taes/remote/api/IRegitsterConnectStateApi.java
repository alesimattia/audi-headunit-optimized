package com.tencent.taes.remote.api;

/* JADX INFO: loaded from: classes.dex */
public interface IRegitsterConnectStateApi {
    void registerConnectListener(IServerConnectListener iServerConnectListener);

    void unregisterConnectListener(IServerConnectListener iServerConnectListener);
}
