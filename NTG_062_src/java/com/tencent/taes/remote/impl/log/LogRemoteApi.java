package com.tencent.taes.remote.impl.log;

import android.os.IBinder;
import android.os.RemoteException;
import android.util.Pair;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.log.ILogApi;
import com.tencent.taes.remote.api.log.ILogService;
import com.tencent.taes.remote.api.log.bean.LogConfiguration;
import com.tencent.taes.remote.impl.BaseRemoteApi;

/* JADX INFO: loaded from: classes.dex */
public class LogRemoteApi extends BaseRemoteApi implements ILogApi {
    private static final String TAG = "LogRemoteApi";
    private ILogService mLogService;

    private LogRemoteApi(IBinder binder, IBinder smsbinder) {
        super(binder, smsbinder);
        this.mLogService = ILogService.Stub.asInterface(binder);
    }

    @Override // com.tencent.taes.remote.api.log.ILogApi
    public LogConfiguration registerModule(String moduleName) {
        return null;
    }

    @Override // com.tencent.taes.remote.api.log.ILogApi
    public boolean unregisterModule(String moduleName) {
        return false;
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public Pair<String, String> subscribeModuleBinder() {
        return new Pair<>(ServerCompConstant.LOG, ILogService.Stub.class.getName());
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderConnect(IBinder binder) {
        this.mLogService = ILogService.Stub.asInterface(binder);
        super.binderConnect(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderDisConnect() {
        super.binderDisConnect();
    }

    @Override // com.tencent.taes.remote.api.log.ILogApi
    public LogConfiguration getLogConfiguration(String moduleName) {
        LogConfiguration logConfiguration = new LogConfiguration();
        try {
            LogConfiguration logConfiguration2 = this.mLogService.getLogConfiguration(moduleName);
            return logConfiguration2;
        } catch (RemoteException e) {
            e.printStackTrace();
            return logConfiguration;
        }
    }
}
