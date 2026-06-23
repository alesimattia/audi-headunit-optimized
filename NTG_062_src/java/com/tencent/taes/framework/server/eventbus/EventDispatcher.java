package com.tencent.taes.framework.server.eventbus;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import com.tencent.taes.framework.bean.IPCEvent;
import com.tencent.taes.framework.interfaces.IEventListener;
import com.tencent.taes.framework.interfaces.IEventPublisher;
import com.tencent.taes.framework.interfaces.IEventSubscriber;
import com.tencent.taes.framework.interfaces.IRouterStrategy;
import com.tencent.taes.framework.listener.IPCEventListener;
import com.tencent.taes.framework.remote.IEventDispatchService;
import com.tencent.taes.framework.server.BaseClient;
import com.tencent.taes.framework.server.router.SMSRouterStrategy;
import com.tencent.taes.util.PackageUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: classes.dex */
public class EventDispatcher extends BaseClient implements IEventSubscriber, IEventPublisher {
    public static final String ACTION = "com.tencent.taes.framework.EVENT_DISPATCH";
    private static final String TAG = "EventDispatcher";
    private IEventDispatchService dispatchService;
    private String mClientName;
    private final M2MHashMap<String, IEventListener> mEventListenersMap;
    private final List<IPCEvent> mPendingPublishEvents;
    private final HashSet<String> mPendingSubscribeEvents;
    private IRouterStrategy mRouterStrategy;

    public EventDispatcher(Context context, String[] remotePkgs) {
        super(context);
        this.mEventListenersMap = new M2MHashMap<>();
        this.mPendingSubscribeEvents = new HashSet<>();
        this.mPendingPublishEvents = new CopyOnWriteArrayList();
        this.mClientName = PackageUtils.getProcessName(this.mContext);
        this.mRouterStrategy = new SMSRouterStrategy();
        this.mRouterStrategy.scanAndSortService(context, ACTION, Arrays.asList(remotePkgs));
        IRouterStrategy.ServiceItemInfo serviceItemInfo = this.mRouterStrategy.getHostServiceInfo();
        if (serviceItemInfo != null) {
            connect(serviceItemInfo.intent, null);
        }
    }

    @Override // com.tencent.taes.framework.interfaces.IEventSubscriber
    public void subscribe(String event, IEventListener listener) {
        Log.i(TAG, "subscribe: " + event);
        if (TextUtils.isEmpty(event) || listener == null) {
            Log.i(TAG, "subscribe but invalid event or listener");
            return;
        }
        synchronized (this.mEventListenersMap) {
            this.mEventListenersMap.put(event, listener);
        }
        subscribeOnServer(event);
    }

    private void subscribeOnServer(String event) {
        synchronized (this.mPendingSubscribeEvents) {
            if (!isConnected()) {
                Log.i(TAG, "subscribe but is not connected, so pending");
                this.mPendingSubscribeEvents.add(event);
            } else {
                if (this.dispatchService == null) {
                    Log.w(TAG, "subscribe but ipcInterface is null, so pending");
                    synchronized (this.mPendingSubscribeEvents) {
                        this.mPendingSubscribeEvents.add(event);
                    }
                    return;
                }
                try {
                    this.dispatchService.subscribe(this.mClientName, event, null);
                } catch (RemoteException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override // com.tencent.taes.framework.interfaces.IEventSubscriber
    public void unsubscribe(String event, IEventListener listener) {
        Log.i(TAG, "unsubscribe: " + event);
        if (TextUtils.isEmpty(event)) {
            return;
        }
        synchronized (this.mEventListenersMap) {
            this.mEventListenersMap.remove(event, listener);
            if (this.mEventListenersMap.containsKey(event)) {
                return;
            }
            if (this.dispatchService == null) {
                Log.w(TAG, "unregisterModule but ipcInterface is null");
                return;
            }
            try {
                this.dispatchService.unsubscribe(this.mClientName, event, null);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.framework.interfaces.IEventSubscriber
    public void unsubscribe(IEventListener listener) {
        Log.i(TAG, "unsubscribe");
        if (listener == null) {
            return;
        }
        List<String> unsubscribeEvents = new ArrayList<>();
        synchronized (this.mEventListenersMap) {
            List<String> removedKeys = this.mEventListenersMap.removeValue(listener);
            for (String event : removedKeys) {
                if (!this.mEventListenersMap.containsKey(event)) {
                    unsubscribeEvents.add(event);
                }
            }
        }
        if (this.dispatchService == null) {
            Log.w(TAG, "unsubscribe but ipcInterface is null");
            return;
        }
        try {
            for (String unsubscribeEvent : unsubscribeEvents) {
                this.dispatchService.unsubscribe(this.mClientName, unsubscribeEvent, null);
            }
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }

    @Override // com.tencent.taes.framework.interfaces.IEventSubscriber
    public void onEvent(IPCEvent event) {
        Log.i(TAG, "onEvent, event:" + event + "  " + Thread.currentThread());
        synchronized (this.mEventListenersMap) {
            Set<IEventListener> listeners = this.mEventListenersMap.getValueSet(event.name);
            if (listeners != null && listeners.size() > 0) {
                for (IEventListener listener : listeners) {
                    listener.onEvent(event);
                }
            }
        }
    }

    @Override // com.tencent.taes.framework.interfaces.IEventPublisher
    public void publish(IPCEvent event) {
        publish(this.mClientName, event, false);
    }

    public synchronized void publish(String clientName, IPCEvent event, boolean isDirect) {
        if (!isConnected()) {
            this.mPendingPublishEvents.add(event);
            return;
        }
        Log.i(TAG, "publish event:" + event);
        if (this.dispatchService != null) {
            try {
                this.dispatchService.publish(clientName, event, isDirect);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.framework.server.BaseClient
    protected void handleConnect(IBinder binder) {
        Log.i(TAG, "handleConnected, re-subscribe events");
        this.dispatchService = IEventDispatchService.Stub.asInterface(binder);
        try {
            this.dispatchService.registerEventListener(PackageUtils.getProcessName(this.mContext), new IPCEventListener.Stub() { // from class: com.tencent.taes.framework.server.eventbus.EventDispatcher.1
                @Override // com.tencent.taes.framework.listener.IPCEventListener
                public void onEvent(IPCEvent event) throws RemoteException {
                    EventDispatcher.this.onEvent(event);
                }
            });
        } catch (RemoteException e) {
            e.printStackTrace();
        }
        synchronized (this.mPendingSubscribeEvents) {
            if (this.mPendingSubscribeEvents.size() > 0) {
                HashSet<String> events = new HashSet<>(this.mPendingSubscribeEvents);
                this.mPendingSubscribeEvents.clear();
                for (String event : events) {
                    subscribeOnServer(event);
                }
            }
        }
        if (this.mPendingPublishEvents.size() != 0) {
            for (IPCEvent publishEvent : this.mPendingPublishEvents) {
                publish(publishEvent);
            }
            this.mPendingPublishEvents.clear();
        }
    }

    @Override // com.tencent.taes.framework.server.BaseClient
    protected void handleDisConnect() {
        Collection<String> events;
        Log.i(TAG, "handleDisconnected, pending subscribe all local events");
        synchronized (this.mEventListenersMap) {
            events = this.mEventListenersMap.keySet();
        }
        synchronized (this.mPendingSubscribeEvents) {
            this.mPendingSubscribeEvents.addAll(events);
        }
    }
}
