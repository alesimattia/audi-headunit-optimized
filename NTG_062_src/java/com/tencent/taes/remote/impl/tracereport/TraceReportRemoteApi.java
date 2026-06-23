package com.tencent.taes.remote.impl.tracereport;

import android.os.IBinder;
import android.os.RemoteException;
import android.util.Pair;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.location.bean.LocationBean;
import com.tencent.taes.remote.api.tracereport.ITraceReportApi;
import com.tencent.taes.remote.api.tracereport.ITraceReportService;
import com.tencent.taes.remote.impl.BaseRemoteApi;

/* JADX INFO: loaded from: classes.dex */
public class TraceReportRemoteApi extends BaseRemoteApi implements ITraceReportApi {
    private ITraceReportService mTraceReportService;

    private TraceReportRemoteApi(IBinder binder, IBinder smsbinder) {
        super(binder, smsbinder);
        this.mTraceReportService = ITraceReportService.Stub.asInterface(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public Pair<String, String> subscribeModuleBinder() {
        return new Pair<>(ServerCompConstant.TRACEREPORT, ITraceReportService.Stub.class.getName());
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderConnect(IBinder binder) {
        this.mTraceReportService = ITraceReportService.Stub.asInterface(binder);
        super.binderConnect(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderDisConnect() {
        super.binderDisConnect();
    }

    @Override // com.tencent.taes.remote.api.tracereport.ITraceReportApi
    public void startTraceReport() {
        if (this.mTraceReportService != null) {
            try {
                this.mTraceReportService.startTraceReport();
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tracereport.ITraceReportApi
    public void stopTraceReport() {
        if (this.mTraceReportService != null) {
            try {
                this.mTraceReportService.stopTraceReport();
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tracereport.ITraceReportApi
    public void setCustomTracePoint(LocationBean trace) {
        if (this.mTraceReportService != null) {
            try {
                this.mTraceReportService.setCustomTracePoint(trace);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tracereport.ITraceReportApi
    public void setCustomDestInfo(String dest) {
        if (this.mTraceReportService != null) {
            try {
                this.mTraceReportService.setCustomDestInfo(dest);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tracereport.ITraceReportApi
    public void setUseCustomTrace(boolean useCustomTrace) {
        if (this.mTraceReportService != null) {
            try {
                this.mTraceReportService.setUseCustomTrace(useCustomTrace);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.tracereport.ITraceReportApi
    public void setExtData(String extData) {
        if (this.mTraceReportService != null) {
            try {
                this.mTraceReportService.setExtData(extData);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }
}
