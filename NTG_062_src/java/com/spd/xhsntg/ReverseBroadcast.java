package com.spd.xhsntg;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class ReverseBroadcast extends BroadcastReceiver {
    public static final String ACTION_REVERSE_START = "com.spd.action.ntg.reverse.START";
    public static final String ACTION_REVERSE_STOP = "com.spd.action.ntg.reverse.STOP";
    public static final String KEY_REVERSE = "reverse";
    private static final String TAG = "ReverseBroadcast";
    private static List<Callback> mCallback;
    private static boolean sIsExitActivity;
    private static boolean sIsTopActivity;
    private static int sReverse;

    public interface Callback {
        void onReverseState(int i, boolean z);
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        Log.d(TAG, "onReceive:" + action);
        if (ACTION_REVERSE_START.equals(action)) {
            if (sReverse != 1) {
                updateReverseState(1, false);
                needExitActivity();
                startNTG(context, 1);
                return;
            }
            return;
        }
        if (ACTION_REVERSE_STOP.equals(action)) {
            updateReverseState(0, sIsExitActivity);
        }
    }

    private void startNTG(Context context, int reverse) {
        Intent intent = new Intent(context, (Class<?>) FullscreenActivity.class);
        intent.setPackage(context.getPackageName());
        intent.putExtra(KEY_REVERSE, reverse);
        intent.setFlags(268959744);
        context.startActivity(intent);
    }

    private void updateReverseState(int reverse, boolean needExit) {
        sReverse = reverse;
        if (mCallback != null) {
            for (Callback cb : mCallback) {
                if (cb != null) {
                    cb.onReverseState(reverse, needExit);
                }
            }
        }
    }

    public static int isReverse() {
        return sReverse;
    }

    public static void setTopActivity(boolean isTop) {
        sIsTopActivity = isTop;
    }

    public static void needExitActivity() {
        if (sIsTopActivity) {
            sIsExitActivity = false;
        } else {
            sIsExitActivity = true;
        }
    }

    public static void addCallback(Callback cb) {
        if (mCallback == null) {
            mCallback = new ArrayList();
        }
        if (!mCallback.contains(cb)) {
            mCallback.add(cb);
        }
    }

    public static void removeCallback(Callback cb) {
        if (mCallback == null) {
            return;
        }
        mCallback.remove(cb);
    }
}
