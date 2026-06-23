package com.tencent.taes.framework.server.connect;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.SystemClock;
import android.support.annotation.CallSuper;
import android.text.TextUtils;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public abstract class BaseServiceConnection implements ServiceConnection {
    public static final int DEFAULT_REBIND_COUNT_LIMIT = 50;
    public static final long DEFAULT_REBIND_INTERVAL = 4000;
    public static final long DEFAULT_REBIND_TIME_LIMIT = 600000;
    public static final int FLAG_REBIND_ON_BIND = 2;
    public static final int FLAG_REBIND_ON_DIED = 1;
    public static final int STATE_BINDING = 1;
    public static final int STATE_BOUND = 2;
    public static final int STATE_DIED = 3;
    public static final int STATE_FAILED = 4;
    public static final int STATE_UNBIND = 0;
    private int mBindFlags;
    private Intent mBindIntent;
    private Context mContext;
    private final IBinder.DeathRecipient mDeathRecipient;
    private final DeathRecipientHelper mDeathRecipientHelper;
    private volatile boolean mIsBound;
    private int mRebindCount;
    private int mRebindCountLimit;
    private int mRebindFlags;
    private long mRebindInterval;
    private final Runnable mRebindRunnable;
    private long mRebindTime;
    private long mRebindTimeLimit;
    private volatile int mState;
    private String mTag;

    public abstract void onRebindingService(int i);

    public abstract void onServiceDied();

    static /* synthetic */ int access$608(BaseServiceConnection x0) {
        int i = x0.mRebindCount;
        x0.mRebindCount = i + 1;
        return i;
    }

    public BaseServiceConnection(String tag, Context context, int rebindFlags) {
        this(tag, context, rebindFlags, 50, DEFAULT_REBIND_TIME_LIMIT, DEFAULT_REBIND_INTERVAL);
    }

    public BaseServiceConnection(String tag, Context context, int rebindFlags, int rebindCountLimit, long rebindTimeLimit, long rebindInterval) {
        this.mDeathRecipient = new IBinder.DeathRecipient() { // from class: com.tencent.taes.framework.server.connect.BaseServiceConnection.1
            @Override // android.os.IBinder.DeathRecipient
            public void binderDied() {
                BaseServiceConnection.this.mState = 3;
                Log.i(BaseServiceConnection.this.mTag, "DeathRecipient binderDied");
                BaseServiceConnection.this.onServiceDied();
                if ((BaseServiceConnection.this.mRebindFlags & 1) != 0) {
                    Log.i(BaseServiceConnection.this.mTag, "try rebind on binderDied after " + BaseServiceConnection.this.mRebindInterval + "ms");
                    SimpleThrottle.onEvent(BaseServiceConnection.this.mRebindRunnable, BaseServiceConnection.this.mRebindInterval);
                }
            }
        };
        this.mDeathRecipientHelper = new DeathRecipientHelper(this.mDeathRecipient);
        this.mRebindRunnable = new Runnable() { // from class: com.tencent.taes.framework.server.connect.BaseServiceConnection.2
            @Override // java.lang.Runnable
            public void run() {
                long interval = SystemClock.elapsedRealtime() - BaseServiceConnection.this.mRebindTime;
                Log.i(BaseServiceConnection.this.mTag, "rebindService mRebindCount=" + BaseServiceConnection.this.mRebindCount + " interval=" + interval);
                int countLimit = BaseServiceConnection.this.mRebindCountLimit;
                long timeLimit = BaseServiceConnection.this.mRebindTimeLimit;
                if (BaseServiceConnection.this.mRebindCount >= countLimit && interval > 0 && interval < timeLimit) {
                    Log.w(BaseServiceConnection.this.mTag, "rebindService too many! Skipping rebind.");
                    return;
                }
                if (interval >= timeLimit) {
                    BaseServiceConnection.this.mRebindCount = 0;
                    BaseServiceConnection.this.mRebindTime = SystemClock.elapsedRealtime();
                }
                BaseServiceConnection.access$608(BaseServiceConnection.this);
                BaseServiceConnection.this.unbindService();
                BaseServiceConnection.this.bindService(BaseServiceConnection.this.mBindIntent, BaseServiceConnection.this.mBindFlags);
                BaseServiceConnection.this.onRebindingService(BaseServiceConnection.this.mRebindCount);
            }
        };
        this.mTag = TextUtils.isEmpty(tag) ? "BaseServiceConnection" : tag;
        this.mContext = context;
        this.mRebindFlags = rebindFlags;
        this.mRebindCountLimit = rebindCountLimit;
        this.mRebindTimeLimit = rebindTimeLimit;
        this.mRebindInterval = rebindInterval;
    }

    public boolean isServiceBound() {
        return this.mIsBound;
    }

    public boolean isServiceDied() {
        return this.mState == 3;
    }

    public int getState() {
        return this.mState;
    }

    public boolean bindService(Intent intent, int flag) {
        if (intent == null) {
            Log.i(this.mTag, "bindService intent is null");
            return false;
        }
        this.mBindIntent = intent;
        this.mBindFlags = flag;
        if (!this.mIsBound) {
            try {
                Log.i(this.mTag, "bindService intent=" + intent + " flag=" + flag);
                this.mIsBound = this.mContext.bindService(intent, this, flag);
                Log.i(this.mTag, "bindService success=" + this.mIsBound);
                if (!this.mIsBound) {
                    this.mState = 4;
                    try {
                        this.mContext.unbindService(this);
                    } catch (Exception e) {
                        e.printStackTrace();
                        Log.e(this.mTag, "bindService and unbindService error: " + e);
                    }
                } else {
                    this.mState = 1;
                }
            } catch (SecurityException e2) {
                e2.printStackTrace();
                Log.e(this.mTag, "bindService error: " + e2);
            }
        }
        if (!this.mIsBound && (this.mRebindFlags & 2) != 0) {
            Log.i(this.mTag, "try rebind on binding failed");
            SimpleThrottle.onEvent(this.mRebindRunnable, this.mRebindInterval);
        }
        return this.mIsBound;
    }

    public void unbindService() {
        this.mDeathRecipientHelper.unlistenBinderDeath();
        if (this.mIsBound) {
            try {
                Log.i(this.mTag, "unbindService");
                this.mContext.unbindService(this);
            } catch (Exception e) {
                e.printStackTrace();
                Log.e(this.mTag, "unbindService error: " + e);
            }
            this.mState = 0;
            this.mIsBound = false;
        }
    }

    public void rebindService() {
        if (this.mBindIntent != null) {
            Log.i(this.mTag, "rebindService");
            unbindService();
            this.mRebindCount = 0;
            this.mRebindTime = 0L;
            bindService(this.mBindIntent, this.mBindFlags);
        }
    }

    public void rebindServiceIfBound() {
        if (this.mIsBound) {
            Log.i(this.mTag, "rebindServiceIfBound");
            unbindService();
            this.mRebindCount = 0;
            this.mRebindTime = 0L;
            bindService(this.mBindIntent, this.mBindFlags);
        }
    }

    public void rebindServiceIfDied() {
        if (this.mIsBound && this.mState == 3) {
            Log.i(this.mTag, "rebindServiceIfDied");
            unbindService();
            this.mRebindCount = 0;
            this.mRebindTime = 0L;
            bindService(this.mBindIntent, this.mBindFlags);
        }
    }

    @Override // android.content.ServiceConnection
    @CallSuper
    public void onServiceConnected(ComponentName name, IBinder service) {
        Log.i(this.mTag, "onServiceConnected name=" + name + " service=" + service);
        SimpleThrottle.cancelEvent(this.mRebindRunnable);
        this.mDeathRecipientHelper.listenBinderDeath(service);
        this.mState = 2;
    }

    @Override // android.content.ServiceConnection
    @CallSuper
    public void onServiceDisconnected(ComponentName name) {
        Log.i(this.mTag, "onServiceDisconnected: " + name);
    }

    @Override // android.content.ServiceConnection
    public void onBindingDied(ComponentName name) {
        Log.i(this.mTag, "onBindingDied: " + name + ", call binderDied");
        this.mDeathRecipient.binderDied();
    }
}
