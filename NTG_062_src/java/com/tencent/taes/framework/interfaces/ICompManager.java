package com.tencent.taes.framework.interfaces;

import android.content.Context;
import android.os.Bundle;
import com.tencent.taes.framework.APIResult;
import com.tencent.taes.framework.bean.ModuleHostInfo;
import com.tencent.taes.framework.parser.ComponentConfigInfo;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface ICompManager {
    public static final int ERROR_LOAD_OVERTIME = -10000;
    public static final int ERROR_NO_FOUND_LIFECYCLE = -10001;
    public static final int ERROR_SERVER_DISCONNECT = -20001;
    public static final int ERROR_SERVER_NO_FOUND = -20002;

    public interface Listener {
        void onCompLoadFail(String str, int i);

        void onCompLoadSuccess(String str);

        void onLoadComplete();

        void onLoadFail(int i, String str);

        void onLoadSuccess();
    }

    boolean checkModuleLoaded(String str);

    <T> APIResult<T> getApi(String str, Class<T> cls, Bundle bundle);

    ModuleHostInfo getModuleHostInfo(String str);

    String getModuleHostPkgName(String str);

    void init(Context context, Object... objArr);

    void loadComponents(List<ComponentConfigInfo> list, Listener listener);

    void release();

    void unloadComponent(ComponentConfigInfo componentConfigInfo);
}
