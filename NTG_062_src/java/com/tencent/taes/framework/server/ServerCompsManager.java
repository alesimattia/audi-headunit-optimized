package com.tencent.taes.framework.server;

import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Process;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import com.tencent.taes.framework.APIResult;
import com.tencent.taes.framework.TaesConstants;
import com.tencent.taes.framework.auth.IClientVerifyResult;
import com.tencent.taes.framework.bean.ModuleHostInfo;
import com.tencent.taes.framework.interfaces.ICompManager;
import com.tencent.taes.framework.interfaces.IRouterStrategy;
import com.tencent.taes.framework.listener.LoadListener;
import com.tencent.taes.framework.parser.ComponentConfigInfo;
import com.tencent.taes.framework.parser.ConfigConstant;
import com.tencent.taes.framework.remote.IServiceManagerService;
import com.tencent.taes.framework.server.router.SMSRouterStrategy;
import com.tencent.taes.framework.server.router.SingleAppRouterStrategy;
import com.tencent.taes.framework.server.router.SubServiceRouterStrategy;
import com.tencent.taes.remote.impl.BaseRemoteApi;
import com.tencent.taes.util.PackageUtils;
import java.lang.reflect.Constructor;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: loaded from: classes.dex */
public class ServerCompsManager extends BaseClient implements ICompManager {
    private static final String TAG = "ServerCompsManager";
    private AtomicBoolean isInited;
    private String mAppAlias;
    private String mAppId;
    private Map<String, Object> mCacheAPIs;
    private Map<String, ComponentConfigInfo> mCacheLoadComps;
    private Handler mHandler;
    private HandlerThread mHandlerThread;
    private Map<String, ComponentConfigInfo> mLoadedComps;
    private Pair<List<ComponentConfigInfo>, ICompManager.Listener> mPendingLoadList;
    private String[] mRemoteSmsPkgs;
    private IRouterStrategy mRouterStrategy;
    private IServiceManagerService mServiceManagerService;

    public ServerCompsManager(Context context) {
        super(context);
        this.mCacheLoadComps = new ConcurrentHashMap();
        this.mLoadedComps = new ConcurrentHashMap();
        this.mCacheAPIs = new ConcurrentHashMap();
        this.isInited = new AtomicBoolean(false);
        this.mHandlerThread = new HandlerThread("SM_Work_Thread");
        this.mHandlerThread.start();
        this.mHandler = new Handler(this.mHandlerThread.getLooper());
    }

    @Override // com.tencent.taes.framework.interfaces.ICompManager
    public void init(Context context, Object... args) {
        if (this.isInited.compareAndSet(false, true)) {
            this.mRemoteSmsPkgs = (String[]) args[0];
            this.mAppId = (String) args[1];
            this.mAppAlias = (String) args[2];
            this.mRouterStrategy = new SMSRouterStrategy();
            this.mRouterStrategy.scanAndSortService(context, ConfigConstant.ACTION_CREATE_SMS, Arrays.asList(this.mRemoteSmsPkgs));
            IRouterStrategy.ServiceItemInfo serviceItemInfo = this.mRouterStrategy.getHostServiceInfo();
            if (serviceItemInfo != null) {
                connect(serviceItemInfo.intent, null);
            }
        }
    }

    @Override // com.tencent.taes.framework.interfaces.ICompManager
    public boolean checkModuleLoaded(String moduleName) {
        return this.mLoadedComps.containsKey(moduleName);
    }

    @Override // com.tencent.taes.framework.interfaces.ICompManager
    public void loadComponents(List<ComponentConfigInfo> configList, ICompManager.Listener listener) {
        for (ComponentConfigInfo configInfo : configList) {
            this.mCacheLoadComps.put(configInfo.getName(), configInfo);
        }
        if (!this.isInited.get()) {
            TaesConstants.CompLoadState state = TaesConstants.CompLoadState.ERROR_NO_INIT;
            listener.onLoadFail(state.code, state.message);
        } else if (this.mRouterStrategy.getHostServiceInfo() == null) {
            TaesConstants.CompLoadState state2 = TaesConstants.CompLoadState.ERROR_SMS_NO_FOUND;
            listener.onLoadFail(state2.code, state2.message);
        } else if (this.mServiceManagerService == null) {
            this.mPendingLoadList = new Pair<>(configList, listener);
        } else {
            loadComponentsInner(configList, listener);
        }
    }

    private void loadComponentsInner(final List<ComponentConfigInfo> configList, final ICompManager.Listener listener) {
        this.mHandler.post(new Runnable() { // from class: com.tencent.taes.framework.server.ServerCompsManager.1
            @Override // java.lang.Runnable
            public void run() {
                final CountDownLatch countDownLatch = new CountDownLatch(configList.size());
                for (final ComponentConfigInfo configInfo : configList) {
                    if (ServerCompsManager.this.mLoadedComps.containsKey(configInfo.getName())) {
                        Log.d(ServerCompsManager.TAG, "loadComponents already load configInfo:" + configInfo.getName());
                        listener.onCompLoadSuccess(configInfo.getName());
                        countDownLatch.countDown();
                    } else {
                        try {
                            Log.d(ServerCompsManager.TAG, "loadComponents configInfo:" + configInfo.getName());
                            ServerCompsManager.this.mServiceManagerService.loadServiceComponent(configInfo, new LoadListener.Stub() { // from class: com.tencent.taes.framework.server.ServerCompsManager.1.1
                                @Override // com.tencent.taes.framework.listener.LoadListener
                                public void onSuccess() throws RemoteException {
                                    ServerCompsManager.this.mLoadedComps.put(configInfo.getName(), configInfo);
                                    listener.onCompLoadSuccess(configInfo.getName());
                                    countDownLatch.countDown();
                                }

                                @Override // com.tencent.taes.framework.listener.LoadListener
                                public void onFail(int errorCode, String msg) throws RemoteException {
                                    TaesConstants.CompLoadState state = TaesConstants.CompLoadState.ERROR_SERVER_COMP_LOAD_FAIL;
                                    listener.onCompLoadFail(configInfo.getName(), state.code);
                                    countDownLatch.countDown();
                                }
                            });
                        } catch (RemoteException e) {
                            e.printStackTrace();
                        }
                    }
                }
                try {
                    boolean result = countDownLatch.await(10L, TimeUnit.SECONDS);
                    if (result) {
                        listener.onLoadSuccess();
                    } else {
                        for (ComponentConfigInfo configInfo2 : configList) {
                            if (!ServerCompsManager.this.mLoadedComps.containsKey(configInfo2.getName())) {
                                TaesConstants.CompLoadState state = TaesConstants.CompLoadState.ERROR_SERVER_COMP_LOAD_FAIL;
                                listener.onCompLoadFail(configInfo2.getName(), state.code);
                            }
                        }
                    }
                    listener.onLoadComplete();
                } catch (InterruptedException e2) {
                    e2.printStackTrace();
                }
            }
        });
    }

    @Override // com.tencent.taes.framework.interfaces.ICompManager
    public <T> APIResult<T> getApi(final String moduleName, Class<T> paraClass, Bundle args) {
        if (!this.isInited.get()) {
            return APIResult.ofError(100);
        }
        if (!this.mCacheLoadComps.containsKey(moduleName)) {
            return APIResult.ofError(APIResult.ERROR_MODULE_NOT_FOUND);
        }
        String key = paraClass.getName();
        if (this.mCacheAPIs.containsKey(key)) {
            return APIResult.ofSuccess(this.mCacheAPIs.get(key));
        }
        if (this.mServiceManagerService == null) {
            return APIResult.ofError(APIResult.ERROR_SERVER_BIND_FAIL);
        }
        if (this.mLoadedComps.containsKey(moduleName)) {
            return createApi(moduleName, paraClass, args);
        }
        this.mHandler.post(new Runnable() { // from class: com.tencent.taes.framework.server.ServerCompsManager.2
            @Override // java.lang.Runnable
            public void run() {
                final ComponentConfigInfo configInfo = (ComponentConfigInfo) ServerCompsManager.this.mCacheLoadComps.get(moduleName);
                try {
                    ServerCompsManager.this.mServiceManagerService.loadServiceComponent(configInfo, new LoadListener.Stub() { // from class: com.tencent.taes.framework.server.ServerCompsManager.2.1
                        @Override // com.tencent.taes.framework.listener.LoadListener
                        public void onSuccess() throws RemoteException {
                            ServerCompsManager.this.mLoadedComps.put(configInfo.getName(), configInfo);
                            Log.d(ServerCompsManager.TAG, "getApi loadServiceComponent success " + configInfo.getName());
                        }

                        @Override // com.tencent.taes.framework.listener.LoadListener
                        public void onFail(int errorCode, String msg) throws RemoteException {
                            Log.e(ServerCompsManager.TAG, "getApi loadServiceComponent fail " + configInfo.getName());
                        }
                    });
                } catch (RemoteException e) {
                    e.printStackTrace();
                }
            }
        });
        return APIResult.ofError(APIResult.ERROR_MODULE_LOADING);
    }

    private <T> APIResult<T> createApi(String moduleName, Class<T> paraClass, Bundle args) {
        ComponentConfigInfo.SupportFeaturesBean featuresBean;
        String key = paraClass.getName();
        try {
            ComponentConfigInfo configInfo = this.mLoadedComps.get(moduleName);
            featuresBean = configInfo.getFeaturesBean(key);
            Log.d(TAG, "getApi Remote featuresBean：" + featuresBean);
        } catch (Exception e) {
            e = e;
        }
        try {
        } catch (Exception e2) {
            e = e2;
            e.printStackTrace();
        }
        if (featuresBean == null) {
            return APIResult.ofError(APIResult.ERROR_CALL_NO_SUCH_API);
        }
        String binderName = featuresBean.getBinderName();
        String apiImpl = featuresBean.getApiImpl();
        Bundle bundle = this.mServiceManagerService.getRemoteBinder(moduleName, binderName, args);
        if (bundle != null) {
            int code = bundle.getInt("code", APIResult.ERROR_API_RESULT_NULL);
            Log.d(TAG, "getApi Remote " + code);
            if (code == 0) {
                IBinder binder = bundle.getBinder("data");
                Constructor<?> constructor = Class.forName(apiImpl).getDeclaredConstructor(IBinder.class, IBinder.class);
                constructor.setAccessible(true);
                Object objNewInstance = constructor.newInstance(binder, this.mServiceManagerService.asBinder());
                this.mCacheAPIs.put(key, objNewInstance);
                return APIResult.ofSuccess(objNewInstance);
            }
            return APIResult.ofError(code);
        }
        return APIResult.ofError(APIResult.ERROR_API_RESULT_NULL);
        e.printStackTrace();
        return APIResult.ofError(APIResult.ERROR_API_RESULT_NULL);
    }

    @Override // com.tencent.taes.framework.interfaces.ICompManager
    public String getModuleHostPkgName(String module) {
        try {
            ApplicationInfo packageInfo = this.mContext.getPackageManager().getApplicationInfo(this.mContext.getPackageName(), 128);
            Bundle metaData = packageInfo.metaData;
            if (metaData != null && metaData.containsKey(ConfigConstant.METE_DATA_SUPPORT_SMS_ROUTE) && !metaData.getBoolean(ConfigConstant.METE_DATA_SUPPORT_SMS_ROUTE)) {
                return this.mContext.getPackageName();
            }
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        ComponentConfigInfo configInfo = this.mCacheLoadComps.get(module);
        if (configInfo != null) {
            SubServiceRouterStrategy mSubServiceStrategy = new SubServiceRouterStrategy();
            mSubServiceStrategy.scanAndSortService(this.mContext, configInfo.getActionName(), Arrays.asList(this.mRemoteSmsPkgs));
            IRouterStrategy.ServiceItemInfo serviceItemInfo = mSubServiceStrategy.getHostServiceInfo();
            if (serviceItemInfo != null) {
                return serviceItemInfo.pkgName;
            }
        }
        return this.mContext.getPackageName();
    }

    @Override // com.tencent.taes.framework.interfaces.ICompManager
    public ModuleHostInfo getModuleHostInfo(String module) {
        ModuleHostInfo moduleHostInfo = new ModuleHostInfo();
        IRouterStrategy mSubServiceStrategy = null;
        ComponentConfigInfo configInfo = this.mCacheLoadComps.get(module);
        if (configInfo != null) {
            try {
                ApplicationInfo packageInfo = this.mContext.getPackageManager().getApplicationInfo(this.mContext.getPackageName(), 128);
                Bundle metaData = packageInfo.metaData;
                if (metaData != null && metaData.containsKey(ConfigConstant.METE_DATA_SUPPORT_SMS_ROUTE) && !metaData.getBoolean(ConfigConstant.METE_DATA_SUPPORT_SMS_ROUTE)) {
                    mSubServiceStrategy = new SingleAppRouterStrategy();
                }
            } catch (PackageManager.NameNotFoundException e) {
                e.printStackTrace();
            }
            if (mSubServiceStrategy == null) {
                mSubServiceStrategy = new SubServiceRouterStrategy();
            }
            mSubServiceStrategy.scanAndSortService(this.mContext, configInfo.getActionName(), Arrays.asList(this.mRemoteSmsPkgs));
            IRouterStrategy.ServiceItemInfo serviceItemInfo = mSubServiceStrategy.getHostServiceInfo();
            if (serviceItemInfo != null) {
                moduleHostInfo.setHostName(serviceItemInfo.pkgName);
                moduleHostInfo.setVersion(serviceItemInfo.versionCode);
                moduleHostInfo.setLoaded(this.mLoadedComps.containsKey(module));
                return moduleHostInfo;
            }
            return null;
        }
        return null;
    }

    @Override // com.tencent.taes.framework.interfaces.ICompManager
    public void release() {
        destroy();
        this.mRemoteSmsPkgs = null;
        this.mServiceManagerService = null;
        this.mPendingLoadList = null;
        this.mCacheLoadComps.clear();
    }

    @Override // com.tencent.taes.framework.interfaces.ICompManager
    public void unloadComponent(ComponentConfigInfo configInfo) {
        if (configInfo != null && this.mServiceManagerService != null) {
            try {
                this.mServiceManagerService.unloadServiceComponent(configInfo);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.framework.server.BaseClient
    protected void handleConnect(IBinder binder) {
        this.mServiceManagerService = IServiceManagerService.Stub.asInterface(binder);
        if (this.mPendingLoadList != null) {
            Log.d(TAG, "handleConnect " + ((List) this.mPendingLoadList.first).size());
            loadComponents((List) this.mPendingLoadList.first, (ICompManager.Listener) this.mPendingLoadList.second);
            this.mPendingLoadList = null;
        }
        asynHandleConnect();
    }

    private void asynHandleConnect() {
        verifyAppId(this.mAppId, this.mAppAlias);
        for (Object obj : this.mCacheAPIs.values()) {
            if (obj instanceof BaseRemoteApi) {
                ((BaseRemoteApi) obj).setServiceManagerService(this.mServiceManagerService);
            }
        }
    }

    @Override // com.tencent.taes.framework.server.BaseClient
    protected void handleDisConnect() {
        this.mServiceManagerService = null;
        List<ComponentConfigInfo> configInfos = new ArrayList<>();
        configInfos.addAll(this.mLoadedComps.values());
        ICompManager.Listener loadListener = new ICompManager.Listener() { // from class: com.tencent.taes.framework.server.ServerCompsManager.3
            @Override // com.tencent.taes.framework.interfaces.ICompManager.Listener
            public void onCompLoadSuccess(String moduleName) {
                Log.d(ServerCompsManager.TAG, "handleDisConnect Reload Success : " + moduleName);
            }

            @Override // com.tencent.taes.framework.interfaces.ICompManager.Listener
            public void onLoadComplete() {
                Log.d(ServerCompsManager.TAG, "handleDisConnect Reload onLoadComplete");
            }

            @Override // com.tencent.taes.framework.interfaces.ICompManager.Listener
            public void onLoadSuccess() {
                Log.d(ServerCompsManager.TAG, "handleDisConnect Reload onLoadSuccess");
            }

            @Override // com.tencent.taes.framework.interfaces.ICompManager.Listener
            public void onLoadFail(int errCode, String msg) {
                Log.d(ServerCompsManager.TAG, "handleDisConnect Reload onLoadFail:" + msg);
            }

            @Override // com.tencent.taes.framework.interfaces.ICompManager.Listener
            public void onCompLoadFail(String moduleName, int errorCode) {
                Log.d(ServerCompsManager.TAG, "handleDisConnect Reload onCompLoadFail:" + moduleName);
            }
        };
        this.mPendingLoadList = new Pair<>(configInfos, loadListener);
    }

    private void verifyAppId(String appId, String alias) {
        if (!PackageUtils.isMainAppProcess(this.mContext)) {
            return;
        }
        if (this.mServiceManagerService == null) {
            Log.e(TAG, "mServiceManagerService = null !!!");
            return;
        }
        try {
            String pkgName = this.mContext.getPackageName();
            this.mServiceManagerService.verifyAppId(appId, pkgName, getSHA1Signature(this.mContext, pkgName), alias, new IClientVerifyResult.Stub() { // from class: com.tencent.taes.framework.server.ServerCompsManager.4
                @Override // com.tencent.taes.framework.auth.IClientVerifyResult
                public void onVerifyResult(boolean verify) throws RemoteException {
                    if (!verify) {
                        Log.e(ServerCompsManager.TAG, ServerCompsManager.this.mContext + " Kill, AppId verify Fail!!!");
                        ServerCompsManager.this.exitApp();
                    }
                }
            });
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void exitApp() {
        ActivityManager mActivityManager = (ActivityManager) this.mContext.getSystemService("activity");
        List<ActivityManager.RunningAppProcessInfo> mList = mActivityManager.getRunningAppProcesses();
        for (ActivityManager.RunningAppProcessInfo runningAppProcessInfo : mList) {
            if (runningAppProcessInfo.processName.startsWith(this.mContext.getPackageName()) && runningAppProcessInfo.pid != Process.myPid()) {
                Process.killProcess(runningAppProcessInfo.pid);
            }
        }
        Process.killProcess(Process.myPid());
        System.exit(0);
    }

    private String getSHA1Signature(Context context, String pkgName) {
        if (context == null || TextUtils.isEmpty(pkgName)) {
            return "";
        }
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(pkgName, 64);
            byte[] cert = info.signatures[0].toByteArray();
            MessageDigest md = MessageDigest.getInstance("SHA1");
            byte[] publicKey = md.digest(cert);
            StringBuilder hexString = new StringBuilder();
            int length = publicKey.length;
            for (int i = 0; i < length; i++) {
                String appendString = Integer.toHexString(255 & publicKey[i]).toUpperCase(Locale.US);
                if (appendString.length() == 1) {
                    hexString.append("0");
                }
                hexString.append(appendString);
                if (i < length - 1) {
                    hexString.append(":");
                }
            }
            return hexString.toString();
        } catch (PackageManager.NameNotFoundException | NoSuchAlgorithmException e) {
            Log.e(TAG, "getSHA1Signature : ", e);
            return null;
        }
    }
}
