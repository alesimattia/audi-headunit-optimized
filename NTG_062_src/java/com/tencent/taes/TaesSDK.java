package com.tencent.taes;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.tencent.taes.api.account.IAccountApi;
import com.tencent.taes.api.gui.IGUIPolicyApi;
import com.tencent.taes.api.infodispatch.InfoDispatchApi;
import com.tencent.taes.api.location.ILocationApi;
import com.tencent.taes.api.map.IMapApi;
import com.tencent.taes.api.moss.IMossApi;
import com.tencent.taes.api.open.IOpenApi;
import com.tencent.taes.api.routeguide.IRouteGuideApi;
import com.tencent.taes.api.scene.ISceneApi;
import com.tencent.taes.api.search.IPoiSearchApi;
import com.tencent.taes.api.tts.ITtsApi;
import com.tencent.taes.framework.TAESFrameworkManager;
import com.tencent.taes.framework.listener.TAESCompsListener;
import com.tencent.taes.framework.parser.ComponentUtils;
import com.tencent.taes.framework.parser.ConfigConstant;
import com.tencent.taes.impl.account.AccountApiImpl;
import com.tencent.taes.impl.base.AbstractApi;
import com.tencent.taes.impl.gui.GUIPolicyApiImpl;
import com.tencent.taes.impl.infodispatch.InfoDispatchApiImpl;
import com.tencent.taes.impl.location.LocationApiImpl;
import com.tencent.taes.impl.map.MapApiImpl;
import com.tencent.taes.impl.moss.MossApiImpl;
import com.tencent.taes.impl.open.OpenApiImpl;
import com.tencent.taes.impl.routeguide.RouteGuideApiImpl;
import com.tencent.taes.impl.scene.SceneApiImpl;
import com.tencent.taes.impl.search.PoiSearchApiImpl;
import com.tencent.taes.impl.tts.TtsApiImpl;
import com.tencent.taes.remote.api.map.IMapSurfaceApi;
import com.tencent.taes.util.FileUtils;
import com.tencent.taes.util.config.ConfigInfo;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class TaesSDK {
    private static final String TAG = "TaesSDK";
    private static InitListener mInitListener;
    private static volatile TaesSDK sAPIs = null;
    private final Map<Class<?>, AbstractApi> mAPIInstanceMap = new HashMap();
    private final Map<Class<?>, Class<? extends AbstractApi>> APIs = Collections.unmodifiableMap(new HashMap<Class<?>, Class<? extends AbstractApi>>() { // from class: com.tencent.taes.TaesSDK.1
        {
            put(InfoDispatchApi.class, InfoDispatchApiImpl.class);
            put(ILocationApi.class, LocationApiImpl.class);
            put(IMapApi.class, MapApiImpl.class);
            put(IMossApi.class, MossApiImpl.class);
            put(IOpenApi.class, OpenApiImpl.class);
            put(IRouteGuideApi.class, RouteGuideApiImpl.class);
            put(ISceneApi.class, SceneApiImpl.class);
            put(IPoiSearchApi.class, PoiSearchApiImpl.class);
            put(IAccountApi.class, AccountApiImpl.class);
            put(ITtsApi.class, TtsApiImpl.class);
            put(IGUIPolicyApi.class, GUIPolicyApiImpl.class);
        }
    });

    public interface InitListener {
        void onInitError(String str, int i);

        void onInitSuccess();
    }

    private TaesSDK() {
    }

    public static void init(Context context, int versionType, String appId, String alias, InitListener initListener) {
        mInitListener = initListener;
        TaesSDKHelper.setContext(context);
        TaesSDKHelper.setVersionType(versionType);
        if (mInitListener == null || context == null) {
            Log.e(TAG, "mInitListener is null or mContext is null");
            return;
        }
        InputStream inputStream = null;
        try {
            try {
                try {
                    InputStream inputStream2 = context.getAssets().open(TaesSDKHelper.getConfigFileName());
                    String configJson = FileUtils.readInputStream(inputStream2);
                    if (TextUtils.isEmpty(configJson)) {
                        Log.e(TAG, "config is null");
                        if (inputStream2 != null) {
                            try {
                                inputStream2.close();
                                return;
                            } catch (IOException e) {
                                e.printStackTrace();
                                return;
                            }
                        }
                        return;
                    }
                    ConfigInfo configInfo = new ConfigInfo(new JSONObject(configJson));
                    String[] pkgs = configInfo.getStringArray(ConfigConstant.CONFIG_KEY_CONNECT_SMS_NAMES);
                    TAESFrameworkManager.getInstance().init(context, appId, alias, pkgs);
                    TAESFrameworkManager.getInstance().loadComponents(ComponentUtils.getServerComponents(configInfo), new TAESCompsListener() { // from class: com.tencent.taes.TaesSDK.2
                        @Override // com.tencent.taes.framework.listener.TAESCompsListener
                        public void onLoadLocalCompsComplete() {
                        }

                        @Override // com.tencent.taes.framework.listener.TAESCompsListener
                        public void onLoadServerCompsComplete() {
                        }

                        @Override // com.tencent.taes.framework.interfaces.ICompManager.Listener
                        public void onCompLoadSuccess(String moduleName) {
                            Log.d(TaesSDK.TAG, "loadComponent " + moduleName + " Success !");
                        }

                        @Override // com.tencent.taes.framework.interfaces.ICompManager.Listener
                        public void onCompLoadFail(String moduleName, int errorCode) {
                            if (TaesSDK.mInitListener != null) {
                                TaesSDK.mInitListener.onInitError(moduleName, errorCode);
                            }
                        }

                        @Override // com.tencent.taes.framework.interfaces.ICompManager.Listener
                        public void onLoadComplete() {
                            if (TaesSDK.mInitListener != null) {
                                TaesSDK.mInitListener.onInitSuccess();
                            }
                            Log.d(TaesSDK.TAG, "onLoadComplete ");
                        }

                        @Override // com.tencent.taes.framework.interfaces.ICompManager.Listener
                        public void onLoadSuccess() {
                            Log.d(TaesSDK.TAG, "onLoadSuccess ");
                        }

                        @Override // com.tencent.taes.framework.interfaces.ICompManager.Listener
                        public void onLoadFail(int errCode, String msg) {
                            if (TaesSDK.mInitListener != null) {
                                TaesSDK.mInitListener.onInitError(msg, errCode);
                            }
                        }
                    });
                    if (inputStream2 != null) {
                        inputStream2.close();
                    }
                } catch (Exception e2) {
                    e2.printStackTrace();
                    if (0 != 0) {
                        inputStream.close();
                    }
                }
            } catch (IOException e3) {
                e3.printStackTrace();
            }
        } catch (Throwable th) {
            if (0 != 0) {
                try {
                    inputStream.close();
                } catch (IOException e4) {
                    e4.printStackTrace();
                }
            }
            throw th;
        }
    }

    public static void unInit() {
        TaesSDKHelper.setContext(null);
    }

    private static TaesSDK getInstance() {
        if (sAPIs == null) {
            synchronized (TaesSDK.class) {
                if (sAPIs == null) {
                    sAPIs = new TaesSDK();
                }
            }
        }
        return sAPIs;
    }

    public static <T> T getApi(Class<T> cls) {
        if (TaesSDKHelper.getContext() == null) {
            throw new IllegalStateException("Context cannot be null!");
        }
        return (T) getInstance().create(cls);
    }

    public static IPoiSearchApi getPoiSearchApi() {
        return (IPoiSearchApi) getApi(IPoiSearchApi.class);
    }

    public static IOpenApi getOpenApi() {
        return (IOpenApi) getApi(IOpenApi.class);
    }

    public static IMossApi getMossApi() {
        return (IMossApi) getApi(IMossApi.class);
    }

    public static ISceneApi getSceneApi() {
        return (ISceneApi) getApi(ISceneApi.class);
    }

    public static IAccountApi getAccountApi() {
        return (IAccountApi) getApi(IAccountApi.class);
    }

    public static ITtsApi getTtsApi() {
        return (ITtsApi) getApi(ITtsApi.class);
    }

    public static IMapApi getMapApi() {
        return (IMapApi) getApi(IMapApi.class);
    }

    public static InfoDispatchApi getInfoDispatchApi() {
        return (InfoDispatchApi) getApi(InfoDispatchApi.class);
    }

    public static IRouteGuideApi getRouteGuideApi() {
        return (IRouteGuideApi) getApi(IRouteGuideApi.class);
    }

    public static ILocationApi getLocationApi() {
        return (ILocationApi) getApi(ILocationApi.class);
    }

    public static IGUIPolicyApi getGUIPolicyApi() {
        return (IGUIPolicyApi) getApi(IGUIPolicyApi.class);
    }

    public static void destoryPoiSearchApi() {
        destroyApi(IPoiSearchApi.class);
    }

    public static void destoryOpenApi() {
        destroyApi(IOpenApi.class);
    }

    public static void destoryMossApi() {
        destroyApi(IMossApi.class);
    }

    public static void destoryAccountApi() {
        destroyApi(IAccountApi.class);
    }

    public static void destoryTtsApi() {
        destroyApi(ITtsApi.class);
    }

    public static void destoryInfoDispatchApi() {
        destroyApi(InfoDispatchApi.class);
    }

    public static void destoryMapApi() {
        destroyApi(IMapSurfaceApi.class);
    }

    public static void destoryRouteGuideApi() {
        destroyApi(IRouteGuideApi.class);
    }

    public static void destoryLocationApi() {
        destroyApi(ILocationApi.class);
    }

    public static void destroyGUIPolicyApi() {
        destroyApi(IGUIPolicyApi.class);
    }

    private static void destroyApi(Class<?> paramClass) {
        getInstance().dispose(paramClass);
    }

    private <T> T create(Class<T> cls) {
        if (cls == null) {
            throw new NullPointerException("the param of getApi can't be null.");
        }
        T tCast = (T) null;
        synchronized (cls) {
            if (this.mAPIInstanceMap.containsKey(cls)) {
                tCast = cls.cast(this.mAPIInstanceMap.get(cls));
            } else {
                try {
                    Class<? extends AbstractApi> cls2 = this.APIs.get(cls);
                    if (cls2 == null) {
                        throw new NullPointerException("the param of getApi can't get a class from APIs.");
                    }
                    tCast = cls.cast(cls2.newInstance());
                    this.mAPIInstanceMap.put(cls, (AbstractApi) tCast);
                    Log.d(TAG, "create API " + cls.getSimpleName() + " successfully!");
                } catch (Exception e) {
                    Log.e(TAG, "create API " + cls.getSimpleName() + " failed!");
                    e.printStackTrace();
                }
            }
        }
        return (T) tCast;
    }

    private void dispose(Class<?> paramClass) {
        synchronized (paramClass) {
            AbstractApi localApi = this.mAPIInstanceMap.get(paramClass);
            if (localApi != null) {
                Log.d(TAG, "dispose API " + paramClass.getSimpleName() + " successfully!");
                localApi.dispose();
                this.mAPIInstanceMap.remove(paramClass);
            }
        }
    }
}
