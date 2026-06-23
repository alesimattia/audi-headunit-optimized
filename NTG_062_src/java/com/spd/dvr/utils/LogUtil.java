package com.spd.dvr.utils;

import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public class LogUtil {
    public static boolean Debug = true;
    private static final String TAG = "DVR";

    public static void DLOG(String msg) {
        if (Debug) {
            Log.i(TAG, msg);
        }
    }

    public static void ELOG(Throwable e) {
        Log.e(TAG, e.getMessage(), e);
    }

    public static void ELOG(String msg) {
        Log.e(TAG, msg);
    }
}
