package com.tencent.taes.framework.interfaces;

import android.content.Context;
import android.content.Intent;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface IRouterStrategy {
    ServiceItemInfo getHostServiceInfo();

    void scanAndSortService(Context context, String str, List<String> list);

    public static class ServiceItemInfo {
        public Intent intent;
        public String pkgName;
        public int priority;
        public long sdkVersion;
        public String versionCode;

        public ServiceItemInfo(String versionCode, long sdkVersion, String pkgName, Intent intent) {
            this.versionCode = versionCode;
            this.sdkVersion = sdkVersion;
            this.pkgName = pkgName;
            this.intent = intent;
        }

        public String toString() {
            return "ServiceItemInfo{versionCode=" + this.versionCode + "sdkVersion=" + this.sdkVersion + ", pkgName='" + this.pkgName + "', priority=" + this.priority + ", intent=" + this.intent + '}';
        }
    }
}
