package com.tencent.taes.util;

import android.app.Activity;
import android.app.Application;
import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
public class ContextHolder {
    private static Activity mActivity;
    private static Context sApplicationContext;

    public static void setContext(Context context) {
        sApplicationContext = context;
    }

    public static Context getContext() {
        if (sApplicationContext == null) {
            try {
                Application application = (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication", new Class[0]).invoke(null, (Object[]) null);
                if (application != null) {
                    sApplicationContext = application;
                    return application;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                Application application2 = (Application) Class.forName("android.app.AppGlobals").getMethod("getInitialApplication", new Class[0]).invoke(null, (Object[]) null);
                if (application2 != null) {
                    sApplicationContext = application2;
                    return application2;
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
            throw new IllegalStateException("ContextHolder is not initialed, it is recommend to init with application context.");
        }
        return sApplicationContext;
    }

    public static Activity getActivity() {
        return mActivity;
    }

    public static void setActivity(Activity mActivity2) {
        mActivity = mActivity2;
    }
}
