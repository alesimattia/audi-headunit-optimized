package com.tencent.taes.framework.interfaces;

import android.content.Intent;

/* JADX INFO: loaded from: classes.dex */
public interface IConnection {

    public interface Listener {
        void onBindFail();

        void onConnected();

        void onDisconnected();
    }

    public interface Operation {
        void connect(Intent intent, Listener listener);

        void disconnect();
    }

    public interface State {
        public static final int CONNECTED = 2;
        public static final int CONNECTING = 1;
        public static final int CONNECTION_DIED = 3;
        public static final int UNCONNECTED = 0;

        int getConnectionState();

        String getConnectionStateString();

        boolean isConnected();

        boolean isConnecting();

        boolean isConnectionDied();
    }
}
