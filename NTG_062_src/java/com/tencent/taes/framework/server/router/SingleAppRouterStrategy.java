package com.tencent.taes.framework.server.router;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.util.Log;
import com.tencent.taes.framework.interfaces.IRouterStrategy;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class SingleAppRouterStrategy implements IRouterStrategy {
    private String TAG = "SingleAppRouterStrategy";
    private List<IRouterStrategy.ServiceItemInfo> mServiceList = new ArrayList();

    @Override // com.tencent.taes.framework.interfaces.IRouterStrategy
    public void scanAndSortService(Context context, String action, List<String> smsPkgs) {
        List<ResolveInfo> resolveInfo;
        String[] versions;
        String str;
        StringBuilder sb;
        String str2 = action;
        Log.d(this.TAG, "getMatchIntentByAction  action:" + str2);
        this.mServiceList.clear();
        Intent intent = new Intent(str2);
        PackageManager pm = context.getPackageManager();
        try {
            intent.addFlags(32);
            resolveInfo = pm.queryIntentServices(intent, 0);
        } catch (Exception ex) {
            Log.e("ServiceUtils", ex.toString());
            resolveInfo = null;
        }
        List<ResolveInfo> resolveInfo2 = resolveInfo;
        if (resolveInfo2 != null && resolveInfo2.size() != 0) {
            int i = 0;
            while (true) {
                int i2 = i;
                int i3 = resolveInfo2.size();
                if (i2 >= i3) {
                    return;
                }
                ResolveInfo serviceInfo = resolveInfo2.get(i2);
                String packageName = serviceInfo.serviceInfo.packageName;
                if (context.getPackageName().equals(packageName)) {
                    String className = serviceInfo.serviceInfo.name;
                    ComponentName component = new ComponentName(packageName, className);
                    Intent explicitIntent = new Intent(intent);
                    explicitIntent.setComponent(component);
                    long versionCode = -1;
                    String versionName = "";
                    try {
                        ApplicationInfo packageInfo = context.getPackageManager().getApplicationInfo(packageName, 128);
                        Bundle metaData = packageInfo.metaData;
                        if (metaData != null && metaData.getString(str2) != null) {
                            try {
                                versionName = metaData.getString(str2).replace("L", "");
                                versions = versionName.split("\\.");
                                str = this.TAG;
                                sb = new StringBuilder();
                            } catch (PackageManager.NameNotFoundException e) {
                                e = e;
                            }
                            try {
                                sb.append("version:");
                                sb.append(versionName);
                                sb.append(" versions:");
                                sb.append(versions.length);
                                Log.d(str, sb.toString());
                                if (versions.length == 4) {
                                    String versionTmp = versions[0] + versions[1] + versions[2] + String.format("%04d", Integer.valueOf(versions[3]));
                                    versionCode = Long.valueOf(versionTmp).longValue();
                                } else {
                                    Log.e(this.TAG, packageName + "   " + className + " VersionCode 不合法  x.x.x.xxxx !!!");
                                }
                            } catch (PackageManager.NameNotFoundException e2) {
                                e = e2;
                                e.printStackTrace();
                            }
                        }
                    } catch (PackageManager.NameNotFoundException e3) {
                        e = e3;
                    }
                    this.mServiceList.add(new IRouterStrategy.ServiceItemInfo(versionName, versionCode, packageName, explicitIntent));
                    Log.d(this.TAG, "scanAndSortExitService  mServiceList: " + this.mServiceList);
                    return;
                }
                i = i2 + 1;
                str2 = action;
            }
        }
    }

    @Override // com.tencent.taes.framework.interfaces.IRouterStrategy
    public IRouterStrategy.ServiceItemInfo getHostServiceInfo() {
        if (this.mServiceList != null && !this.mServiceList.isEmpty()) {
            return this.mServiceList.get(0);
        }
        return null;
    }
}
