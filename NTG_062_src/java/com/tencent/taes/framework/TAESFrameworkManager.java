package com.tencent.taes.framework;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import com.tencent.taes.framework.TaesConstants;
import com.tencent.taes.framework.interfaces.ICompManager;
import com.tencent.taes.framework.listener.TAESCommonListener;
import com.tencent.taes.framework.listener.TAESCompsListener;
import com.tencent.taes.framework.listener.TAESLoadListener;
import com.tencent.taes.framework.parser.ComponentConfigInfo;
import com.tencent.taes.framework.parser.ComponentUtils;
import com.tencent.taes.framework.parser.ConfigConstant;
import com.tencent.taes.framework.server.ServerCompsManager;
import com.tencent.taes.framework.server.eventbus.EventDispatcher;
import com.tencent.taes.util.config.ConfigInfo;
import com.tencent.taes.util.config.ConfigManager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: loaded from: classes.dex */
public class TAESFrameworkManager {
    private static final String TAG = "TAESFrameworkManager";
    private AtomicBoolean isInited;
    private List<ComponentConfigInfo> mClientComps;
    private Map<String, List<TAESCommonListener>> mCompsLoadListeners;
    private ConfigInfo mConfigInfo;
    private Context mContext;
    private EventDispatcher mEventDispatcher;
    private TAESCompsListener mListener;
    private HashMap<String, Pair<Integer, String>> mLoadFailCompsMsg;
    private ICompManager mRemoteCompManager;
    private String[] mRemoteSmsPkgs;
    private List<ComponentConfigInfo> mServerComps;

    private TAESFrameworkManager() {
        this.mClientComps = new ArrayList();
        this.mServerComps = new ArrayList();
        this.mCompsLoadListeners = new ConcurrentHashMap();
        this.isInited = new AtomicBoolean(false);
        this.mLoadFailCompsMsg = new HashMap<>();
    }

    private static class CoreFrameworkManagerHolder {
        private static final TAESFrameworkManager INSTANCE = new TAESFrameworkManager();

        private CoreFrameworkManagerHolder() {
        }
    }

    public static TAESFrameworkManager getInstance() {
        return CoreFrameworkManagerHolder.INSTANCE;
    }

    public void init(Context context) {
        if (this.isInited.get()) {
            return;
        }
        this.mConfigInfo = ConfigManager.getInstance().getConfigInfo(context, ConfigConstant.CONFIG_FILE_NAME);
        if (this.mConfigInfo == null) {
            Log.e(TAG, "ERROR_NO_CONFIG_FILE");
            throw new RuntimeException("ERROR_NO_CONFIG_FILE assets:component_config.json");
        }
        String[] pkgs = this.mConfigInfo.getStringArray(ConfigConstant.CONFIG_KEY_CONNECT_SMS_NAMES);
        String appId = this.mConfigInfo.getString(ConfigConstant.CONFIG_KEY_APP_ID);
        String alias = this.mConfigInfo.getString(ConfigConstant.CONFIG_KEY_APP_ALIAS);
        init(context, appId, alias, pkgs);
        loadComponents(ComponentUtils.parseConfig(this.mConfigInfo), null);
    }

    public void init(Context context, String appId, String alias, String[] pkgs) {
        if (TextUtils.isEmpty(appId) || TextUtils.isEmpty(alias)) {
            throw new IllegalArgumentException("AppId or Alias is Null !!!");
        }
        if (this.isInited.get()) {
            return;
        }
        this.mRemoteSmsPkgs = pkgs;
        this.mEventDispatcher = new EventDispatcher(context, this.mRemoteSmsPkgs);
        this.mContext = context;
        this.mRemoteCompManager = new ServerCompsManager(this.mContext);
        this.mRemoteCompManager.init(context, pkgs, appId, alias);
        this.isInited.set(true);
    }

    public synchronized void loadComponents(List<ComponentConfigInfo> configList, TAESCompsListener listener) {
        this.mListener = listener;
        for (ComponentConfigInfo configInfo : configList) {
            if (configInfo.isServerComponent()) {
                this.mServerComps.add(configInfo);
            } else {
                this.mClientComps.add(configInfo);
            }
        }
        loadServerComponents();
    }

    private void loadServerComponents() {
        if (this.mRemoteCompManager != null) {
            List<ComponentConfigInfo> copyList = new ArrayList<>(this.mServerComps);
            this.mRemoteCompManager.loadComponents(copyList, new ICompManager.Listener() { // from class: com.tencent.taes.framework.TAESFrameworkManager.1
                @Override // com.tencent.taes.framework.interfaces.ICompManager.Listener
                public void onCompLoadSuccess(String moduleName) {
                    TAESFrameworkManager.this.notifyCompLoadSuccess(moduleName);
                }

                @Override // com.tencent.taes.framework.interfaces.ICompManager.Listener
                public void onCompLoadFail(String moduleName, int errorCode) {
                    TAESFrameworkManager.this.notifyCompLoadFail(moduleName, errorCode);
                }

                @Override // com.tencent.taes.framework.interfaces.ICompManager.Listener
                public void onLoadComplete() {
                    TAESFrameworkManager.this.notifyLoadComplete();
                }

                @Override // com.tencent.taes.framework.interfaces.ICompManager.Listener
                public void onLoadSuccess() {
                    Log.d(TAESFrameworkManager.TAG, "loadServerComponents onLoadSuccess");
                    TAESFrameworkManager.this.notifyLoadSuccess();
                }

                @Override // com.tencent.taes.framework.interfaces.ICompManager.Listener
                public void onLoadFail(int errCode, String msg) {
                    TAESFrameworkManager.this.notifyLoadFail(errCode, msg);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyCompLoadSuccess(String moduleName) {
        Log.d(TAG, "onLoadSuccess moduleName:" + moduleName);
        if (this.mListener != null) {
            this.mListener.onCompLoadSuccess(moduleName);
        }
        List<TAESCommonListener> listeners = this.mCompsLoadListeners.get(moduleName);
        if (listeners != null) {
            for (TAESCommonListener listener : listeners) {
                listener.onSuccess();
            }
        }
        this.mCompsLoadListeners.remove(moduleName);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyCompLoadFail(String moduleName, int errorCode) {
        Log.d(TAG, "onLoadFail moduleName:" + moduleName);
        if (this.mListener != null) {
            this.mListener.onCompLoadFail(moduleName, errorCode);
        }
        List<TAESCommonListener> listeners = this.mCompsLoadListeners.get(moduleName);
        if (listeners != null) {
            for (TAESCommonListener listener : listeners) {
                TaesConstants.CompLoadState compLoadState = TaesConstants.CompLoadState.ERROR_COMP_LOAD_FAIL;
                listener.onFail(compLoadState.code, compLoadState.message + moduleName + " " + errorCode);
            }
        }
        this.mCompsLoadListeners.remove(moduleName);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyLoadComplete() {
        Log.d(TAG, "loadLocalComponents onLoadComplete");
        if (this.mListener != null) {
            this.mListener.onLoadComplete();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyLoadSuccess() {
        Log.d(TAG, "loadComponents onLoadSuccess");
        if (this.mListener != null) {
            this.mListener.onLoadSuccess();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyLoadFail(int errCode, String msg) {
        Log.e(TAG, "loadLocalComponents onLoadFail " + errCode + "  " + msg);
        if (this.mListener != null) {
            this.mListener.onLoadFail(errCode, msg);
        }
        notifyCompsLoadFail(this.mServerComps, errCode, msg);
    }

    private void notifyCompsLoadFail(List<ComponentConfigInfo> configInfos, int errCode, String msg) {
        for (ComponentConfigInfo configInfo : configInfos) {
            List<TAESCommonListener> listeners = this.mCompsLoadListeners.get(configInfo.getName());
            if (listeners != null && listeners.size() != 0) {
                for (TAESCommonListener listener : listeners) {
                    listener.onFail(errCode, msg);
                }
                this.mCompsLoadListeners.remove(configInfo.getName());
            }
            this.mLoadFailCompsMsg.put(configInfo.getName(), new Pair<>(Integer.valueOf(errCode), msg));
        }
    }

    public synchronized void unloadComponent(ComponentConfigInfo config) {
        if (config.isServerComponent() && this.mRemoteCompManager != null) {
            this.mRemoteCompManager.unloadComponent(config);
        }
    }

    public boolean checkModuleLoaded(String moduleName) {
        if (!this.isInited.get()) {
            return false;
        }
        return this.mRemoteCompManager.checkModuleLoaded(moduleName);
    }

    public synchronized <T> APIResult<T> getApi(String moduleName, Class<T> paraClass, Bundle args) {
        if (!this.isInited.get()) {
            return APIResult.ofError(100);
        }
        APIResult<T> apiResult = APIResult.ofError(APIResult.ERROR_MODULE_NOT_FOUND);
        ComponentConfigInfo configInfo = getComponentConfigInfo(moduleName);
        if (configInfo != null && configInfo.isServerComponent()) {
            apiResult = this.mRemoteCompManager.getApi(moduleName, paraClass, args);
        }
        if (apiResult != null) {
            Log.d(TAG, "getApi " + paraClass.getName() + " apiResult:" + apiResult.isSuccess() + "   " + apiResult.codeDescription());
        }
        return apiResult;
    }

    public synchronized <T> void loadApi(final String moduleName, final Class<T> paraClass, final Bundle args, final TAESLoadListener<T> listener) {
        APIResult<T> result = getApi(moduleName, paraClass, args);
        if (result.isSuccess()) {
            try {
                listener.onSuccess(result.data);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return;
        }
        registerCompLoadListener(moduleName, new TAESCommonListener() { // from class: com.tencent.taes.framework.TAESFrameworkManager.2
            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onSuccess() {
                if (listener != null) {
                    APIResult api = TAESFrameworkManager.this.getApi(moduleName, paraClass, args);
                    if (api.isSuccess()) {
                        try {
                            listener.onSuccess(api.data);
                            return;
                        } catch (Exception e2) {
                            e2.printStackTrace();
                            return;
                        }
                    }
                    listener.onFail(api.code, api.codeDescription());
                }
            }

            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onFail(int errorCode, String msg) {
                if (listener != null) {
                    listener.onFail(errorCode, msg);
                }
            }
        });
    }

    public void release() {
        if (this.mRemoteCompManager != null) {
            this.mRemoteCompManager.release();
            this.mRemoteCompManager = null;
        }
        this.mServerComps.clear();
        this.mClientComps.clear();
    }

    public synchronized void registerCompLoadListener(String moduleName, TAESCommonListener listener) {
        Pair<Integer, String> errMsg;
        if (checkModuleLoaded(moduleName)) {
            listener.onSuccess();
            return;
        }
        if (this.mLoadFailCompsMsg.containsKey(moduleName) && (errMsg = this.mLoadFailCompsMsg.get(moduleName)) != null) {
            listener.onFail(((Integer) errMsg.first).intValue(), (String) errMsg.second);
            return;
        }
        if (this.mCompsLoadListeners.containsKey(moduleName)) {
            this.mCompsLoadListeners.get(moduleName).add(listener);
        } else {
            List<TAESCommonListener> listeners = new CopyOnWriteArrayList<>();
            listeners.add(listener);
            this.mCompsLoadListeners.put(moduleName, listeners);
        }
    }

    public void unregisterCompLoadListener(String moduleName, TAESCommonListener listener) {
        if (this.mCompsLoadListeners.containsKey(moduleName)) {
            this.mCompsLoadListeners.get(moduleName).remove(listener);
        }
    }

    public EventDispatcher getEventDispatcher() {
        return this.mEventDispatcher;
    }

    private ComponentConfigInfo getComponentConfigInfo(String moudleName) {
        for (ComponentConfigInfo config : this.mClientComps) {
            if (config.getName().equals(moudleName)) {
                return config;
            }
        }
        for (ComponentConfigInfo config2 : this.mServerComps) {
            if (config2.getName().equals(moudleName)) {
                return config2;
            }
        }
        return null;
    }
}
