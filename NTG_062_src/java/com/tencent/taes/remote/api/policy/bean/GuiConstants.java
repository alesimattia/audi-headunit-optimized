package com.tencent.taes.remote.api.policy.bean;

/* JADX INFO: loaded from: classes.dex */
public class GuiConstants {

    @Deprecated
    public static final int CALLBACK_GRANT = 301;
    public static final int CALLBACK_INTERRUPT = 302;
    public static final int FROM_SYSTEM = 2;
    public static final int FROM_USER = 1;
    public static final int FROM_VOIP = 3;
    public static final int REQUEST_GRANT = 101;
    public static final int REQUEST_REJECT = 102;
    public static final int UNDEFINED = 0;

    public static boolean isTypeValid(int type) {
        return 2 == type || 1 == type || 3 == type;
    }
}
