package com.tencent.taes.util.config;

import android.content.Context;
import android.support.annotation.Nullable;
import android.util.Log;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class ConfigManager {
    private static final String TAG = "ConfigManager";
    private Map<String, ConfigInfo> mConfigInfoMap;

    private ConfigManager() {
        this.mConfigInfoMap = new HashMap();
    }

    private static class LazyHolder {
        private static final ConfigManager sInstance = new ConfigManager();

        private LazyHolder() {
        }
    }

    public static ConfigManager getInstance() {
        return LazyHolder.sInstance;
    }

    @Nullable
    public ConfigInfo getConfigInfo(Context context, String filename) {
        if (!this.mConfigInfoMap.containsKey(filename)) {
            ConfigParser mConfigParser = new ConfigParser(context, filename);
            if (mConfigParser.getJSONObject() != null) {
                ConfigInfo configInfo = new ConfigInfo(mConfigParser.getJSONObject());
                this.mConfigInfoMap.put(filename, configInfo);
            } else {
                Log.e(TAG, "Json object is null !");
            }
        }
        return this.mConfigInfoMap.get(filename);
    }
}
