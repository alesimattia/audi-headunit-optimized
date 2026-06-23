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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class CommonRouterStrategy implements IRouterStrategy {
    private String TAG = "CommonRouterStrategy";
    private List<IRouterStrategy.ServiceItemInfo> mServiceList = new ArrayList();

    @Override // com.tencent.taes.framework.interfaces.IRouterStrategy
    public void scanAndSortService(Context context, String action, List<String> smsPkgs) {
        List<ResolveInfo> resolveInfo;
        Intent intent;
        PackageManager pm;
        boolean z;
        Object[] objArr;
        String str = action;
        Log.d(this.TAG, "getMatchIntentByAction  action:" + str);
        this.mServiceList.clear();
        Intent intent2 = new Intent(str);
        PackageManager pm2 = context.getPackageManager();
        boolean z2 = false;
        try {
            intent2.addFlags(32);
            resolveInfo = pm2.queryIntentServices(intent2, 0);
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
                if (i2 < i3) {
                    ResolveInfo serviceInfo = resolveInfo2.get(i2);
                    String packageName = serviceInfo.serviceInfo.packageName;
                    String className = serviceInfo.serviceInfo.name;
                    ComponentName component = new ComponentName(packageName, className);
                    Intent explicitIntent = new Intent(intent2);
                    explicitIntent.setComponent(component);
                    long versionCode = -1;
                    String versionName = "";
                    try {
                        try {
                            ApplicationInfo packageInfo = context.getPackageManager().getApplicationInfo(packageName, 128);
                            Bundle metaData = packageInfo.metaData;
                            if (metaData != null && metaData.getString(str) != null) {
                                intent = intent2;
                                try {
                                    versionName = metaData.getString(str).replace("L", "");
                                    String[] versions = versionName.split("\\.");
                                    String str2 = this.TAG;
                                    StringBuilder sb = new StringBuilder();
                                    pm = pm2;
                                    try {
                                        sb.append("version:");
                                        sb.append(versionName);
                                        sb.append(" versions:");
                                        sb.append(versions.length);
                                        Log.d(str2, sb.toString());
                                        if (versions.length == 4) {
                                            StringBuilder sb2 = new StringBuilder();
                                            try {
                                                sb2.append(versions[0]);
                                                sb2.append(versions[1]);
                                                sb2.append(versions[2]);
                                                objArr = new Object[1];
                                                z = false;
                                            } catch (PackageManager.NameNotFoundException e) {
                                                e = e;
                                                z = false;
                                            }
                                            try {
                                                objArr[0] = Integer.valueOf(versions[3]);
                                                sb2.append(String.format("%04d", objArr));
                                                String versionTmp = sb2.toString();
                                                versionCode = Long.valueOf(versionTmp).longValue();
                                            } catch (PackageManager.NameNotFoundException e2) {
                                                e = e2;
                                                e.printStackTrace();
                                            }
                                        } else {
                                            z = false;
                                            Log.e(this.TAG, packageName + "   " + className + " VersionCode 不合法  x.x.x.xxxx !!!");
                                        }
                                    } catch (PackageManager.NameNotFoundException e3) {
                                        e = e3;
                                        z = false;
                                    }
                                } catch (PackageManager.NameNotFoundException e4) {
                                    e = e4;
                                    pm = pm2;
                                    z = false;
                                }
                            } else {
                                intent = intent2;
                                pm = pm2;
                                z = false;
                            }
                        } catch (PackageManager.NameNotFoundException e5) {
                            e = e5;
                            intent = intent2;
                            pm = pm2;
                            z = false;
                        }
                    } catch (PackageManager.NameNotFoundException e6) {
                        e = e6;
                        intent = intent2;
                        pm = pm2;
                        z = z2;
                    }
                    long versionCode2 = versionCode;
                    Log.d(this.TAG, "versionCode:" + versionCode2);
                    this.mServiceList.add(new IRouterStrategy.ServiceItemInfo(versionName, versionCode2, packageName, explicitIntent));
                    i = i2 + 1;
                    z2 = z;
                    intent2 = intent;
                    pm2 = pm;
                    str = action;
                } else {
                    sortRouter(smsPkgs);
                    Log.d(this.TAG, "scanAndSortExitService  mServiceList: " + this.mServiceList);
                    return;
                }
            }
        }
    }

    private void sortRouter(List<String> smsPkgs) {
        for (IRouterStrategy.ServiceItemInfo itemInfo : this.mServiceList) {
            if (smsPkgs.indexOf(itemInfo.pkgName) == -1) {
                itemInfo.priority = Integer.MAX_VALUE;
            } else {
                itemInfo.priority = smsPkgs.indexOf(itemInfo.pkgName);
            }
        }
        Collections.sort(this.mServiceList, new Comparator<IRouterStrategy.ServiceItemInfo>() { // from class: com.tencent.taes.framework.server.router.CommonRouterStrategy.1
            @Override // java.util.Comparator
            public int compare(IRouterStrategy.ServiceItemInfo o1, IRouterStrategy.ServiceItemInfo o2) {
                if (o1.sdkVersion > o2.sdkVersion) {
                    return -1;
                }
                if (o1.sdkVersion >= o2.sdkVersion && o1.priority <= o2.priority) {
                    return o1.priority < o2.priority ? -1 : 0;
                }
                return 1;
            }
        });
    }

    @Override // com.tencent.taes.framework.interfaces.IRouterStrategy
    public IRouterStrategy.ServiceItemInfo getHostServiceInfo() {
        if (this.mServiceList != null && !this.mServiceList.isEmpty()) {
            return this.mServiceList.get(0);
        }
        return null;
    }
}
