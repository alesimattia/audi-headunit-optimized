package com.tencent.taes.remote.api.policy.listener;

import android.os.RemoteException;
import com.tencent.taes.remote.api.policy.listener.IPolicyListener;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
public abstract class PolicyCallback {
    private IPolicyListener mInnerListener = new InnerListener(this);

    public abstract void onNotify(int i, int i2, int i3);

    public IPolicyListener getInnerListener() {
        return this.mInnerListener;
    }

    private static class InnerListener extends IPolicyListener.Stub {
        WeakReference<PolicyCallback> mOuterListenerRef;

        public InnerListener(PolicyCallback outerListener) {
            if (outerListener != null) {
                this.mOuterListenerRef = new WeakReference<>(outerListener);
            }
        }

        @Override // com.tencent.taes.remote.api.policy.listener.IPolicyListener
        public void onNotify(int taskId, int policyResult, int currentType) throws RemoteException {
            PolicyCallback listener = this.mOuterListenerRef == null ? null : this.mOuterListenerRef.get();
            if (listener != null) {
                listener.onNotify(taskId, policyResult, currentType);
            }
        }
    }
}
