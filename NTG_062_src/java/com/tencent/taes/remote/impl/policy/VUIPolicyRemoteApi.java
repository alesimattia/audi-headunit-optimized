package com.tencent.taes.remote.impl.policy;

import android.os.IBinder;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import android.util.Pair;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.policy.IPolicyService;
import com.tencent.taes.remote.api.policy.IVUIPolicyApi;
import com.tencent.taes.remote.api.policy.bean.Response;
import com.tencent.taes.remote.api.policy.listener.PolicyCallback;
import com.tencent.taes.remote.impl.BaseRemoteApi;

/* JADX INFO: loaded from: classes.dex */
public class VUIPolicyRemoteApi extends BaseRemoteApi implements IVUIPolicyApi {
    private static final String TAG = "PolicyRemoteApi";
    private IPolicyService mPolicyService;

    private VUIPolicyRemoteApi(IBinder binder, IBinder smsbinder) {
        super(binder, smsbinder);
        this.mPolicyService = IPolicyService.Stub.asInterface(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public Pair<String, String> subscribeModuleBinder() {
        return new Pair<>(ServerCompConstant.POLICY, "com.tencent.taes.policy.impl.VuiPolicyService");
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderConnect(IBinder binder) {
        this.mPolicyService = IPolicyService.Stub.asInterface(binder);
        super.binderConnect(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderDisConnect() {
        super.binderDisConnect();
    }

    private static String build(String callTag, StackTraceElement ste) {
        StringBuilder buf = new StringBuilder();
        buf.append("\n以下堆栈信息仅供调试：\n");
        buf.append("[");
        buf.append(callTag);
        buf.append("]");
        if (ste.isNativeMethod()) {
            buf.append("(Native Method)");
        } else {
            String fName = ste.getFileName();
            if (fName == null) {
                buf.append("(Unknown Source)");
            } else {
                int lineNum = ste.getLineNumber();
                buf.append('(');
                buf.append(fName);
                if (lineNum >= 0) {
                    buf.append(':');
                    buf.append(lineNum);
                }
                buf.append("):");
            }
        }
        return buf.toString();
    }

    @Override // com.tencent.taes.remote.api.policy.IVUIPolicyApi
    public Response requestJudge(String appName, int type, @NonNull PolicyCallback callBack, String callerTag) {
        if (this.mPolicyService != null) {
            try {
                StackTraceElement ste = new Throwable().getStackTrace()[1];
                String callerDebugInfo = build(callerTag, ste);
                return this.mPolicyService.requestJudge(appName, type, callBack.getInnerListener(), callerDebugInfo);
            } catch (RemoteException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.policy.IVUIPolicyApi
    public void stopJudge(int taskId) {
        if (this.mPolicyService != null) {
            try {
                this.mPolicyService.stopJudge(taskId);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.policy.IVUIPolicyApi
    public String dumpState() {
        if (this.mPolicyService != null) {
            try {
                return this.mPolicyService.dumpState();
            } catch (RemoteException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }
}
