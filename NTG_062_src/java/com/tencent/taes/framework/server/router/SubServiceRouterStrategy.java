package com.tencent.taes.framework.server.router;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import com.tencent.taes.framework.interfaces.IRouterStrategy;
import com.tencent.taes.framework.parser.ConfigConstant;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class SubServiceRouterStrategy implements IRouterStrategy {
    private static final String TAES_SERVICE_APP = "com.tencent.taes";
    private IRouterStrategy mCurrentStrategy;

    @Override // com.tencent.taes.framework.interfaces.IRouterStrategy
    public void scanAndSortService(Context context, String action, List<String> smsPkgs) {
        if (!isSupportSMSDynamicRoute(context)) {
            this.mCurrentStrategy = new SingleAppRouterStrategy();
        } else {
            this.mCurrentStrategy = new CommonRouterStrategy();
        }
        this.mCurrentStrategy.scanAndSortService(context, action, smsPkgs);
    }

    @Override // com.tencent.taes.framework.interfaces.IRouterStrategy
    public IRouterStrategy.ServiceItemInfo getHostServiceInfo() {
        return this.mCurrentStrategy.getHostServiceInfo();
    }

    private boolean checkAppInstalled(Context context, String pkgName) {
        PackageInfo packageInfo;
        if (TextUtils.isEmpty(pkgName)) {
            return false;
        }
        try {
            packageInfo = context.getPackageManager().getPackageInfo(pkgName, 0);
        } catch (PackageManager.NameNotFoundException e) {
            Log.e("SubServiceRouterStrategy", "com.tencent.taes NameNotFoundException!");
            packageInfo = null;
        }
        return packageInfo != null;
    }

    private boolean isSupportSMSDynamicRoute(Context context) {
        try {
            ApplicationInfo packageInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
            Bundle metaData = packageInfo.metaData;
            if (metaData != null && metaData.containsKey(ConfigConstant.METE_DATA_SUPPORT_SMS_ROUTE)) {
                return metaData.getBoolean(ConfigConstant.METE_DATA_SUPPORT_SMS_ROUTE);
            }
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
            return true;
        }
    }
}
