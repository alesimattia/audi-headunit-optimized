package com.tencent.taes.framework.server;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.IBinder;
import android.support.annotation.CallSuper;
import android.util.Log;
import com.tencent.taes.framework.interfaces.IConnection;
import com.tencent.taes.framework.server.connect.BaseServiceConnection;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: classes.dex */
public abstract class BaseClient implements IConnection.Operation, IConnection.State {
    private static final String TAG = "BaseClient";
    private List<IConnection.Listener> mConnectListeners = new CopyOnWriteArrayList();
    protected Context mContext;
    private IBinder mIBinder;
    private ServiceConnection mServiceConnection;

    protected abstract void handleConnect(IBinder iBinder);

    protected abstract void handleDisConnect();

    public BaseClient(Context context) {
        this.mContext = context;
    }

    @Override // com.tencent.taes.framework.interfaces.IConnection.Operation
    public void connect(Intent serviceIntent, IConnection.Listener listener) {
        Log.i(TAG, "connect");
        if (listener != null) {
            this.mConnectListeners.add(listener);
        }
        if (this.mServiceConnection == null) {
            this.mServiceConnection = new ServiceConnection(this.mContext);
            boolean result = this.mServiceConnection.bindService(serviceIntent, 1);
            if (result) {
                notifyBindFail();
            }
        }
    }

    @Override // com.tencent.taes.framework.interfaces.IConnection.Operation
    public void disconnect() {
        Log.i(TAG, "disconnect");
        if (this.mServiceConnection != null) {
            this.mServiceConnection.unbindService();
            this.mServiceConnection = null;
        }
    }

    public void destroy() {
        Log.i(TAG, "destroy");
        disconnect();
    }

    @Override // com.tencent.taes.framework.interfaces.IConnection.State
    public boolean isConnecting() {
        return this.mIBinder == null && this.mServiceConnection != null && this.mServiceConnection.isServiceBound() && !this.mServiceConnection.isServiceDied();
    }

    @Override // com.tencent.taes.framework.interfaces.IConnection.State
    public boolean isConnected() {
        return this.mIBinder != null && this.mIBinder.isBinderAlive();
    }

    @Override // com.tencent.taes.framework.interfaces.IConnection.State
    public boolean isConnectionDied() {
        return this.mServiceConnection != null && this.mServiceConnection.isServiceDied();
    }

    @Override // com.tencent.taes.framework.interfaces.IConnection.State
    public int getConnectionState() {
        if (isConnected()) {
            return 2;
        }
        if (isConnecting()) {
            return 1;
        }
        if (isConnectionDied()) {
            return 3;
        }
        return 0;
    }

    @Override // com.tencent.taes.framework.interfaces.IConnection.State
    public String getConnectionStateString() {
        if (isConnected()) {
            return "Connected";
        }
        if (isConnecting()) {
            return "Connecting";
        }
        if (isConnectionDied()) {
            return "ConnectionDied";
        }
        return "Unconnected";
    }

    public void registerConnectListener(IConnection.Listener listener) {
        synchronized (this.mConnectListeners) {
            try {
                if (listener == null) {
                    return;
                }
                if (isConnected()) {
                    listener.onConnected();
                } else {
                    this.mConnectListeners.add(listener);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public void unregisterConnectListener(IConnection.Listener listener) {
        synchronized (this.mConnectListeners) {
            try {
                if (listener == null) {
                    return;
                }
                this.mConnectListeners.remove(listener);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    protected void notifyConnected() {
        synchronized (this.mConnectListeners) {
            for (IConnection.Listener listener : this.mConnectListeners) {
                listener.onConnected();
            }
        }
    }

    protected void notifyBindFail() {
        synchronized (this.mConnectListeners) {
            for (IConnection.Listener listener : this.mConnectListeners) {
                listener.onBindFail();
            }
        }
    }

    protected void notifyDisConnected() {
        synchronized (this.mConnectListeners) {
            for (IConnection.Listener listener : this.mConnectListeners) {
                listener.onDisconnected();
            }
        }
    }

    private class ServiceConnection extends BaseServiceConnection {
        public ServiceConnection(Context context) {
            super(BaseClient.TAG, context, 3);
        }

        @Override // com.tencent.taes.framework.server.connect.BaseServiceConnection, android.content.ServiceConnection
        public void onServiceConnected(ComponentName name, IBinder service) {
            super.onServiceConnected(name, service);
            BaseClient.this.mIBinder = service;
            BaseClient.this.handleConnect(service);
            BaseClient.this.notifyConnected();
        }

        @Override // com.tencent.taes.framework.server.connect.BaseServiceConnection, android.content.ServiceConnection
        @CallSuper
        public void onServiceDisconnected(ComponentName name) {
            super.onServiceDisconnected(name);
            BaseClient.this.handleDisConnect();
            BaseClient.this.notifyDisConnected();
            BaseClient.this.mIBinder = null;
        }

        @Override // com.tencent.taes.framework.server.connect.BaseServiceConnection
        public void onServiceDied() {
            BaseClient.this.handleDisConnect();
            BaseClient.this.notifyDisConnected();
            BaseClient.this.mIBinder = null;
        }

        @Override // com.tencent.taes.framework.server.connect.BaseServiceConnection
        public void onRebindingService(int rebindCount) {
        }
    }

    protected Intent findIntentFromPkgs(Context context, String[] servicePackageNames, Intent intent) {
        for (String pkg : servicePackageNames) {
            Intent intent1 = getMatchIntentInPackage(context, intent, pkg);
            if (intent1 != null) {
                return intent1;
            }
        }
        return null;
    }

    protected Intent getMatchIntentInPackage(Context context, Intent implicitIntent, String pkg) {
        List<ResolveInfo> resolveInfo;
        Log.d(TAG, "getMatchIntentInPackage " + pkg);
        PackageManager pm = context.getPackageManager();
        int i = 0;
        try {
            implicitIntent.addFlags(32);
            resolveInfo = pm.queryIntentServices(implicitIntent, 0);
        } catch (Exception ex) {
            Log.e("ServiceUtils", ex.toString());
            resolveInfo = null;
        }
        if (resolveInfo == null || resolveInfo.size() == 0) {
            return null;
        }
        Intent explicitIntent = null;
        while (true) {
            if (i >= resolveInfo.size()) {
                break;
            }
            ResolveInfo serviceInfo = resolveInfo.get(i);
            if (!serviceInfo.serviceInfo.packageName.equals(pkg)) {
                i++;
            } else {
                String packageName = serviceInfo.serviceInfo.packageName;
                String className = serviceInfo.serviceInfo.name;
                ComponentName component = new ComponentName(packageName, className);
                explicitIntent = new Intent(implicitIntent);
                explicitIntent.setComponent(component);
                break;
            }
        }
        Log.d(TAG, "getMatchIntentInPackage = " + explicitIntent);
        return explicitIntent;
    }
}
