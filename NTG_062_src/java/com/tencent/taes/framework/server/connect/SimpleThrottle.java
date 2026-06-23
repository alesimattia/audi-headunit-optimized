package com.tencent.taes.framework.server.connect;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import java.lang.reflect.Field;

/* JADX INFO: loaded from: classes.dex */
public class SimpleThrottle {
    private static final long DEFAULT_TIME_WINDOW = 100;
    private static Handler sHandler = new Handler(Looper.getMainLooper()) { // from class: com.tencent.taes.framework.server.connect.SimpleThrottle.1
        @Override // android.os.Handler
        public void dispatchMessage(Message msg) {
            Runnable runnable = (Runnable) SimpleThrottle.getDeclaredField(msg, "callback");
            if (runnable instanceof EventRunnable) {
                ((EventRunnable) runnable).run(msg.obj);
            } else {
                super.dispatchMessage(msg);
            }
        }
    };

    public static void onEvent(Runnable r) {
        onEvent(r, DEFAULT_TIME_WINDOW);
    }

    public static void onEvent(Runnable r, long timeWindow) {
        sHandler.removeCallbacks(r);
        sHandler.postDelayed(r, timeWindow);
    }

    public static void cancelEvent(Runnable r) {
        sHandler.removeCallbacks(r);
    }

    public static void onEvent(EventRunnable r, Object token) {
        onEvent(r, token, DEFAULT_TIME_WINDOW);
    }

    public static void onEvent(EventRunnable r, Object token, long timeWindow) {
        sHandler.removeCallbacks(r, token);
        postDelayed(r, token, timeWindow);
    }

    public static void cancelEvent(EventRunnable r, Object token) {
        sHandler.removeCallbacks(r, token);
    }

    private static boolean postDelayed(Runnable r, Object token, long delayMillis) {
        if (delayMillis < 0) {
            delayMillis = 0;
        }
        return sHandler.postAtTime(r, token, SystemClock.uptimeMillis() + delayMillis);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Object getDeclaredField(Object obj, String fieldName) {
        try {
            Class<?> clazz = obj.getClass();
            Field field = clazz.getDeclaredField(fieldName);
            field.setAccessible(true);
            return field.get(obj);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static abstract class EventRunnable implements Runnable {
        public abstract void run(Object obj);

        @Override // java.lang.Runnable
        public final void run() {
        }
    }
}
