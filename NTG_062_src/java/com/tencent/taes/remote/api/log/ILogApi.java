package com.tencent.taes.remote.api.log;

import com.tencent.taes.remote.api.log.bean.LogConfiguration;

/* JADX INFO: loaded from: classes.dex */
public interface ILogApi {
    LogConfiguration getLogConfiguration(String str);

    LogConfiguration registerModule(String str);

    boolean unregisterModule(String str);
}
