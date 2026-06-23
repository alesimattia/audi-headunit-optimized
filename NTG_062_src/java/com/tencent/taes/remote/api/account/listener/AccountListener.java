package com.tencent.taes.remote.api.account.listener;

import android.os.RemoteException;
import android.util.Log;
import com.tencent.taes.remote.api.account.bean.WeCarAccount;
import com.tencent.taes.remote.api.account.listener.IAccountListener;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
public abstract class AccountListener {
    private static String TAG = AccountListener.class.getSimpleName();
    private IAccountListener mInnerListener = new InnerListener(this);

    public abstract void onError(int i);

    public abstract void onSuccess(WeCarAccount weCarAccount);

    public IAccountListener getInnerListener() {
        return this.mInnerListener;
    }

    private static class InnerListener extends IAccountListener.Stub {
        WeakReference<AccountListener> mOuterListenerRef;

        public InnerListener(AccountListener outerListener) {
            if (outerListener != null) {
                this.mOuterListenerRef = new WeakReference<>(outerListener);
            }
        }

        @Override // com.tencent.taes.remote.api.account.listener.IAccountListener
        public void onSuccess(WeCarAccount account) throws RemoteException {
            AccountListener listener = this.mOuterListenerRef == null ? null : this.mOuterListenerRef.get();
            Log.d(AccountListener.TAG, "onSuccess, listener = " + listener + ", account = " + account);
            if (listener != null) {
                listener.onSuccess(account);
            }
        }

        @Override // com.tencent.taes.remote.api.account.listener.IAccountListener
        public void onError(int error) throws RemoteException {
            AccountListener listener = this.mOuterListenerRef == null ? null : this.mOuterListenerRef.get();
            Log.d(AccountListener.TAG, "onError, listener = " + listener + ", error = " + error);
            if (listener != null) {
                listener.onError(error);
            }
        }
    }
}
