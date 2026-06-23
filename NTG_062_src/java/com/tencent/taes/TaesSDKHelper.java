package com.tencent.taes;

import android.content.Context;
import com.tencent.taes.framework.parser.ConfigConstant;

/* JADX INFO: loaded from: classes.dex */
public class TaesSDKHelper {
    public static final int FOR_WECAR = 0;
    public static final int FOR_WECAR_NAVI = 1;
    public static final String WECAR_NAVI_PACKAGE_NAME = "com.tencent.wecarnavi";
    public static final String WECAR_PACKAGE_NAME = "com.tencent.wecar";
    private static final String mConfigForNavi = "component_config_navi.json";
    private static Context mContext;
    private static int mVersionType = 0;

    public static Context getContext() {
        return mContext;
    }

    public static void setContext(Context context) {
        mContext = context;
    }

    public static void setVersionType(int versionType) {
        mVersionType = versionType;
    }

    public static String getConfigFileName() {
        if (mVersionType != 0 && mVersionType == 1) {
            return mConfigForNavi;
        }
        return ConfigConstant.CONFIG_FILE_NAME;
    }
}
