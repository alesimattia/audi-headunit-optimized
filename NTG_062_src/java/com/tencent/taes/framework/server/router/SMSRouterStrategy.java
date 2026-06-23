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
import com.tencent.taes.framework.parser.ConfigConstant;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class SMSRouterStrategy implements IRouterStrategy {
    private Context mContext;
    private String TAG = "SMSRouterStrategy";
    private List<IRouterStrategy.ServiceItemInfo> mServiceList = new ArrayList();

    @Override // com.tencent.taes.framework.interfaces.IRouterStrategy
    public void scanAndSortService(Context context, String action, List<String> smsPkgs) {
        List<ResolveInfo> resolveInfo;
        Log.d(this.TAG, "getMatchIntentByAction  action:" + action);
        this.mContext = context;
        this.mServiceList.clear();
        Intent intent = new Intent(action);
        PackageManager pm = context.getPackageManager();
        try {
            intent.addFlags(32);
            resolveInfo = pm.queryIntentServices(intent, 0);
        } catch (Exception ex) {
            Log.e("ServiceUtils", ex.toString());
            resolveInfo = null;
        }
        if (resolveInfo == null || resolveInfo.size() == 0) {
            return;
        }
        if (!isSupportSMSRoute(context, context.getPackageName())) {
            addServiceList(resolveInfo, action, context.getPackageName(), intent);
            return;
        }
        for (String pkgName : smsPkgs) {
            if (isSupportSMSRoute(context, pkgName)) {
                addServiceList(resolveInfo, action, pkgName, intent);
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

    private boolean isSupportSMSRoute(Context context, String pkgName) {
        try {
            ApplicationInfo packageInfo = context.getPackageManager().getApplicationInfo(pkgName, 128);
            Bundle metaData = packageInfo.metaData;
            if (metaData != null && metaData.containsKey(ConfigConstant.METE_DATA_SUPPORT_SMS_ROUTE)) {
                return metaData.getBoolean(ConfigConstant.METE_DATA_SUPPORT_SMS_ROUTE);
            }
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            Log.d(this.TAG, e.getMessage());
            return true;
        }
    }

    private void addServiceList(List<ResolveInfo> resolveInfos, String action, String pkgName, Intent intent) {
        long versionCode;
        String str = action;
        int i = 0;
        while (i < resolveInfos.size()) {
            ResolveInfo serviceInfo = resolveInfos.get(i);
            String packageName = serviceInfo.serviceInfo.packageName;
            if (pkgName.equals(packageName)) {
                String className = serviceInfo.serviceInfo.name;
                ComponentName component = new ComponentName(packageName, className);
                Intent explicitIntent = new Intent(intent);
                explicitIntent.setComponent(component);
                String versionName = "";
                try {
                    ApplicationInfo packageInfo = this.mContext.getPackageManager().getApplicationInfo(packageName, 128);
                    Bundle metaData = packageInfo.metaData;
                    if (metaData == null || metaData.getString(str) == null) {
                        versionCode = -1;
                    } else {
                        versionName = metaData.getString(str).replace("L", "");
                        String[] versions = versionName.split("\\.");
                        String str2 = this.TAG;
                        StringBuilder sb = new StringBuilder();
                        try {
                            sb.append("version:");
                            sb.append(versionName);
                            sb.append(" versions:");
                            sb.append(versions.length);
                            Log.d(str2, sb.toString());
                            try {
                                if (versions.length == 4) {
                                    StringBuilder sb2 = new StringBuilder();
                                    sb2.append(versions[0]);
                                    sb2.append(versions[1]);
                                    sb2.append(versions[2]);
                                    Object[] objArr = new Object[1];
                                    objArr[0] = Integer.valueOf(versions[3]);
                                    sb2.append(String.format("%04d", objArr));
                                    String versionTmp = sb2.toString();
                                    long versionCode2 = Long.valueOf(versionTmp).longValue();
                                    versionCode = versionCode2;
                                } else {
                                    versionCode = -1;
                                    Log.e(this.TAG, packageName + "   " + className + " VersionCode 不合法  x.x.x.xxxx !!!");
                                }
                            } catch (PackageManager.NameNotFoundException e) {
                                e = e;
                                e.printStackTrace();
                            }
                        } catch (PackageManager.NameNotFoundException e2) {
                            e = e2;
                            versionCode = -1;
                        }
                    }
                } catch (PackageManager.NameNotFoundException e3) {
                    e = e3;
                    versionCode = -1;
                }
                this.mServiceList.add(new IRouterStrategy.ServiceItemInfo(versionName, versionCode, packageName, explicitIntent));
                Log.d(this.TAG, "scanAndSortExitService  mServiceList: " + this.mServiceList);
                return;
            }
            i++;
            str = action;
        }
    }
}
