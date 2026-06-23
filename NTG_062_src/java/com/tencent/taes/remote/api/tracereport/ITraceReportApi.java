package com.tencent.taes.remote.api.tracereport;

import com.tencent.taes.remote.api.location.bean.LocationBean;

/* JADX INFO: loaded from: classes.dex */
public interface ITraceReportApi {
    void setCustomDestInfo(String str);

    void setCustomTracePoint(LocationBean locationBean);

    void setExtData(String str);

    void setUseCustomTrace(boolean z);

    void startTraceReport();

    void stopTraceReport();
}
