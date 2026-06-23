package com.tencent.taes.framework.server.connect;

import android.os.DeadObjectException;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public class DeathRecipientHelper {
    private static final String TAG = "DeathRecipientHelper";
    private IBinder.DeathRecipient mDeathRecipient;
    private IBinder mLinkedBinder;

    public DeathRecipientHelper(IBinder.DeathRecipient deathRecipient) {
        this.mDeathRecipient = deathRecipient;
    }

    public void listenBinderDeath(IBinder binder) {
        if (binder != null) {
            unlistenBinderDeath();
            try {
                binder.linkToDeath(this.mDeathRecipient, 0);
                this.mLinkedBinder = binder;
                Log.i(TAG, "listenBinderDeath: " + this.mLinkedBinder);
            } catch (DeadObjectException e) {
                Log.i(TAG, "listenBinderDeath error: " + e + ", will callback binderDied");
                new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.tencent.taes.framework.server.connect.DeathRecipientHelper.1
                    @Override // java.lang.Runnable
                    public void run() {
                        if (DeathRecipientHelper.this.mDeathRecipient != null) {
                            DeathRecipientHelper.this.mDeathRecipient.binderDied();
                        }
                    }
                });
            } catch (Exception e2) {
                e2.printStackTrace();
                Log.i(TAG, "listenBinderDeath error: " + e2);
            }
        }
    }

    public void unlistenBinderDeath() {
        if (this.mLinkedBinder != null) {
            try {
                this.mLinkedBinder.unlinkToDeath(this.mDeathRecipient, 0);
                Log.i(TAG, "unlistenBinderDeath: " + this.mLinkedBinder);
            } catch (Exception e) {
                e.printStackTrace();
            }
            this.mLinkedBinder = null;
        }
    }
}
