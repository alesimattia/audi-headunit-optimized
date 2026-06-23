package com.tencent.taes.remote.api.account.extra;

import java.util.Locale;

/* JADX INFO: loaded from: classes.dex */
public interface WeCarContractData {
    public static final String ALL_SERVICE_TYPES = String.format(Locale.US, "%d,%d,%d,%d,%d,%d,%d,%d,%d,%d", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
    public static final int NETWORK_TYPE_MOBILE = 2;
    public static final int NETWORK_TYPE_WIFI = 1;
    public static final int WECAR_ALL = 0;
    public static final int WECAR_AR_NAVI = 9;
    public static final int WECAR_FLOW = 3;
    public static final int WECAR_GAMES = 10;
    public static final int WECAR_KARAOKE = 8;
    public static final int WECAR_MUSIC = 4;
    public static final int WECAR_NAVI = 1;
    public static final int WECAR_PARKING = 5;
    public static final int WECAR_RADIO = 7;
    public static final int WECAR_SPEECH = 2;
    public static final int WECAR_WECHAT = 6;
}
