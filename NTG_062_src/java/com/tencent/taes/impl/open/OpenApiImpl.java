package com.tencent.taes.impl.open;

import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import com.tencent.taes.TaesSDKHelper;
import com.tencent.taes.api.open.IOpenApi;
import com.tencent.taes.framework.BuildConfig;
import com.tencent.taes.framework.TAESFrameworkManager;
import com.tencent.taes.framework.bean.IPCEvent;
import com.tencent.taes.framework.parser.ConfigConstant;
import com.tencent.taes.impl.base.AbstractApi;
import com.tencent.taes.remote.api.open.OpenApiConsts;
import com.tencent.taes.util.config.ConfigManager;

/* JADX INFO: loaded from: classes.dex */
public class OpenApiImpl extends AbstractApi implements IOpenApi {
    public static final String TAG = "OpenApiImp";
    private String mIntentScheme = ConfigManager.getInstance().getConfigInfo(TaesSDKHelper.getContext(), TaesSDKHelper.getConfigFileName()).getString(ConfigConstant.INTENT_URI_SCHEME);
    private String mIntentAction = ConfigManager.getInstance().getConfigInfo(TaesSDKHelper.getContext(), TaesSDKHelper.getConfigFileName()).getString(ConfigConstant.INTENT_API_ACTION);

    @Override // com.tencent.taes.impl.base.AbstractApi
    public void dispose() {
    }

    @Override // com.tencent.taes.api.open.IOpenApi
    public void openApp() {
        Log.d(TAG, "openApp");
        Intent intent = new Intent(this.mIntentAction);
        intent.setData(Uri.parse(this.mIntentScheme + "://"));
        intent.setFlags(268435456);
        TaesSDKHelper.getContext().startActivity(intent);
    }

    @Override // com.tencent.taes.api.open.IOpenApi
    public void exitApp(boolean showDialog) {
        Log.d(TAG, "exitApp : showDialog ——>> " + showDialog);
        if (showDialog) {
            Intent intent = new Intent(this.mIntentAction);
            intent.setData(Uri.parse(this.mIntentScheme + "://" + OpenApiConsts.Host.EXIT_APP + "?"));
            intent.putExtra(OpenApiConsts.Key.SHOW_DIALOG, showDialog);
            intent.setFlags(268435456);
            TaesSDKHelper.getContext().startActivity(intent);
            return;
        }
        TAESFrameworkManager.getInstance().getEventDispatcher().publish(new IPCEvent(OpenApiConsts.Host.EXIT_APP));
    }

    @Override // com.tencent.taes.api.open.IOpenApi
    public String getAppVersionName() throws PackageManager.NameNotFoundException {
        PackageInfo packageInfo = null;
        try {
            packageInfo = TaesSDKHelper.getContext().getPackageManager().getPackageInfo(TaesSDKHelper.WECAR_PACKAGE_NAME, 0);
        } catch (PackageManager.NameNotFoundException e) {
            Log.e(TAG, "com.tencent.wecar is not install.");
            try {
                packageInfo = TaesSDKHelper.getContext().getPackageManager().getPackageInfo(TaesSDKHelper.WECAR_NAVI_PACKAGE_NAME, 0);
            } catch (PackageManager.NameNotFoundException e2) {
                Log.e(TAG, "com.tencent.wecarnavi is not install.");
            }
        }
        if (packageInfo == null) {
            Log.e(TAG, "getAppVersionName failed!!!");
            return "";
        }
        return packageInfo.versionName;
    }

    @Override // com.tencent.taes.api.open.IOpenApi
    public long getAppVersionCode() throws PackageManager.NameNotFoundException {
        PackageInfo packageInfo = null;
        try {
            packageInfo = TaesSDKHelper.getContext().getPackageManager().getPackageInfo(TaesSDKHelper.WECAR_PACKAGE_NAME, 0);
        } catch (PackageManager.NameNotFoundException e) {
            Log.e(TAG, "com.tencent.wecar is not install.");
            try {
                packageInfo = TaesSDKHelper.getContext().getPackageManager().getPackageInfo(TaesSDKHelper.WECAR_NAVI_PACKAGE_NAME, 0);
            } catch (PackageManager.NameNotFoundException e2) {
                Log.e(TAG, "com.tencent.wecarnavi is not install.");
            }
        }
        if (packageInfo == null) {
            Log.e(TAG, "getAppVersionCode failed!!!");
            return -1L;
        }
        if (Build.VERSION.SDK_INT >= 28) {
            Log.e(TAG, "versionCode: " + packageInfo.getLongVersionCode());
            return packageInfo.getLongVersionCode();
        }
        Log.e(TAG, "versionCode: " + packageInfo.versionCode);
        return packageInfo.versionCode;
    }

    @Override // com.tencent.taes.api.open.IOpenApi
    public void showNavigationBar(boolean show) {
        Bundle bundle = new Bundle();
        bundle.putString(OpenApiConsts.Key.APP_EVENT_NAME, OpenApiConsts.Key.SHOW_NAVIGATION_BAR);
        bundle.putBoolean(OpenApiConsts.Key.SHOW_NAVIGATION_BAR, show);
        TAESFrameworkManager.getInstance().getEventDispatcher().publish(new IPCEvent(OpenApiConsts.Host.APP_EVENT, bundle));
    }

    @Override // com.tencent.taes.api.open.IOpenApi
    public void showStatusBar(boolean show) {
        Bundle bundle = new Bundle();
        bundle.putString(OpenApiConsts.Key.APP_EVENT_NAME, OpenApiConsts.Key.SHOW_STATUS_BAR);
        bundle.putBoolean(OpenApiConsts.Key.SHOW_STATUS_BAR, show);
        TAESFrameworkManager.getInstance().getEventDispatcher().publish(new IPCEvent(OpenApiConsts.Host.APP_EVENT, bundle));
    }

    @Override // com.tencent.taes.api.base.BaseApi
    public String getApiVersion() {
        return BuildConfig.VERSION_NAME;
    }
}
