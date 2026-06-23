package com.tencent.taes.util;

import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Process;
import android.support.annotation.Keep;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.util.Log;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
@Keep
public class PackageUtils {
    static final String INSTALL_APP_PATH = "INSTALL_APP_PATH";
    static final String INSTALL_APP_PKG = "INSTALL_APP_PKG";
    static final String INSTALL_OPEN_APP_PKG_ATY = "INSTALL_OPEN_APP_PKG_ATY";
    private static final String TAG = "PackageUtils";
    static final String TENCENT_SOTAINSTALLER = "com.tencent.sotainstaller";
    static final String TENCENT_SOTAINSTALLER_SERVICE = "com.tencent.sotainstaller.InstallerService";
    private static String sProcessName;
    private static long apkUpdateTime = 0;
    private static String sVersionName = null;
    private static int sVersionCode = 0;

    public static boolean startSotaInstallerService(@NonNull Context context, @NonNull String path, @NonNull String pkgName, boolean isStartAty) {
        Log.d(TAG, "PackageUtils.startSotaInstallerService: path: " + path + " pkgName: " + pkgName + " isStartAty: " + isStartAty);
        PackageManager manager = context.getPackageManager();
        try {
            ApplicationInfo info = manager.getApplicationInfo(TENCENT_SOTAINSTALLER, 128);
            if (info == null) {
                return false;
            }
            Intent intent = new Intent();
            intent.setClassName(TENCENT_SOTAINSTALLER, TENCENT_SOTAINSTALLER_SERVICE);
            intent.putExtra(INSTALL_APP_PKG, pkgName);
            intent.putExtra(INSTALL_APP_PATH, path);
            intent.putExtra(INSTALL_OPEN_APP_PKG_ATY, isStartAty);
            try {
                if (Build.VERSION.SDK_INT >= 26) {
                    context.startForegroundService(intent);
                    return true;
                }
                context.startService(intent);
                return true;
            } catch (Exception e) {
                Log.e(TAG, "startSotaInstallerService", e);
                return false;
            }
        } catch (PackageManager.NameNotFoundException e2) {
            Log.e(TAG, "startSotaInstallerService", e2);
            return false;
        }
    }

    public static String getProcessName(Context context) {
        if (!TextUtils.isEmpty(sProcessName)) {
            return sProcessName;
        }
        int pid = Process.myPid();
        String processName = null;
        BufferedReader reader = null;
        try {
            try {
                reader = new BufferedReader(new FileReader("/proc/" + pid + "/cmdline"));
                processName = reader.readLine();
                if (!TextUtils.isEmpty(processName)) {
                    processName = processName.trim();
                }
                reader.close();
            } catch (IOException e) {
            }
        } catch (Throwable th) {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e2) {
                }
            }
            throw th;
        }
        if (TextUtils.isEmpty(processName)) {
            processName = getProcessNameByAMS(context, pid);
        }
        if (!TextUtils.isEmpty(processName)) {
            sProcessName = processName;
        }
        return processName;
    }

    private static String getProcessNameByAMS(Context context, int pid) {
        ActivityManager am;
        List<ActivityManager.RunningAppProcessInfo> processList;
        if (context != null && (am = (ActivityManager) context.getSystemService("activity")) != null && (processList = am.getRunningAppProcesses()) != null) {
            for (ActivityManager.RunningAppProcessInfo appProcess : processList) {
                if (appProcess.pid == pid) {
                    return appProcess.processName;
                }
            }
            return "";
        }
        return "";
    }

    public static long getApkUpdateTime(Context context) {
        ApplicationInfo info;
        if (apkUpdateTime != 0) {
            return apkUpdateTime;
        }
        if (context != null) {
            try {
                PackageManager pm = context.getPackageManager();
                if (pm != null && (info = pm.getApplicationInfo(context.getPackageName(), 0)) != null) {
                    File apkFile = new File(info.sourceDir);
                    boolean apkFileExists = apkFile.exists();
                    apkUpdateTime = apkFileExists ? apkFile.lastModified() : System.currentTimeMillis();
                }
            } catch (Exception e) {
            }
        }
        return apkUpdateTime;
    }

    public static String getTopActivity(Context context) {
        ActivityManager am;
        List<ActivityManager.RunningTaskInfo> taskList;
        ActivityManager.RunningTaskInfo taskInfo;
        if (context == null || (am = (ActivityManager) context.getSystemService("activity")) == null || (taskList = am.getRunningTasks(1)) == null || taskList.size() <= 0 || (taskInfo = taskList.get(0)) == null) {
            return null;
        }
        ComponentName cn = taskInfo.topActivity;
        return cn.getClassName();
    }

    public static String getAppVersionName(Context context) {
        PackageInfo pi;
        if (!TextUtils.isEmpty(sVersionName)) {
            return sVersionName;
        }
        if (context != null) {
            try {
                PackageManager pm = context.getPackageManager();
                if (pm != null && (pi = pm.getPackageInfo(context.getPackageName(), 0)) != null) {
                    sVersionName = pi.versionName;
                }
            } catch (Exception e) {
            }
        }
        return sVersionName;
    }

    public static int getAppVersionCode(Context context) {
        PackageInfo pi;
        if (sVersionCode != 0) {
            return sVersionCode;
        }
        if (context != null) {
            try {
                PackageManager pm = context.getPackageManager();
                if (pm != null && (pi = pm.getPackageInfo(context.getPackageName(), 0)) != null) {
                    sVersionCode = pi.versionCode;
                }
            } catch (Exception e) {
                return 0;
            }
        }
        return sVersionCode;
    }

    public static boolean isMainAppProcess(Context context) {
        String currentProcess = getProcessName(context);
        return TextUtils.equals(context.getPackageName(), currentProcess) || TextUtils.isEmpty(currentProcess);
    }

    public static boolean isAppRunning(Context context, String packageName) {
        ActivityManager am = (ActivityManager) context.getSystemService("activity");
        List<ActivityManager.RunningAppProcessInfo> infoList = am.getRunningAppProcesses();
        for (ActivityManager.RunningAppProcessInfo info : infoList) {
            String processName = info.processName;
            if (packageName.equals(processName)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isCurrentRunning(Context context, String packageName) {
        ActivityManager am;
        try {
            am = (ActivityManager) context.getSystemService("activity");
        } catch (Exception e) {
        }
        if (am != null && am.getRunningTasks(1) != null && am.getRunningTasks(1).size() >= 1) {
            ComponentName componentName = am.getRunningTasks(1).get(0).topActivity;
            return componentName.getPackageName().equals(packageName);
        }
        return false;
    }

    public static boolean isCurrentInApp(Context context, String packageName) {
        if (isCurrentRunning(context, packageName)) {
            return true;
        }
        if (isCurrentRunning(context, "com.tencent.wecarspeech")) {
            try {
                ActivityManager am = (ActivityManager) context.getSystemService("activity");
                if (am != null && am.getRunningTasks(2) != null && am.getRunningTasks(2).size() >= 2) {
                    ComponentName componentName = am.getRunningTasks(2).get(1).topActivity;
                    if (componentName.getPackageName().equals(packageName)) {
                        return true;
                    }
                }
                return false;
            } catch (Exception e) {
            }
        }
        return false;
    }

    public static boolean startActivityByPackageName(Context context, String packageName) {
        Intent intent;
        if (!TextUtils.isEmpty(packageName) && context != null) {
            try {
                PackageManager pm = context.getPackageManager();
                if (pm != null && (intent = pm.getLaunchIntentForPackage(packageName)) != null) {
                    context.startActivity(intent);
                    return true;
                }
            } catch (Exception e) {
            }
        }
        return false;
    }

    public static void goHome(Context context) {
        try {
            Intent i = new Intent("android.intent.action.MAIN");
            i.addCategory("android.intent.category.HOME");
            i.addFlags(270532608);
            context.startActivity(i);
        } catch (Exception e) {
        }
    }

    public static boolean isAPPInstalled(Context context, String pkgName) {
        if (context != null) {
            try {
                PackageManager pm = context.getPackageManager();
                if (pm != null) {
                    if (pm.getPackageInfo(pkgName, 1) == null) {
                        return false;
                    }
                    return true;
                }
            } catch (PackageManager.NameNotFoundException e) {
            }
        }
        return false;
    }

    public static boolean isInstallApp(Context context, String packageName) {
        if (TextUtils.isEmpty(packageName)) {
            return false;
        }
        PackageManager packageManager = context.getPackageManager();
        try {
            packageManager.getPackageInfo(packageName, 0);
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }
}
