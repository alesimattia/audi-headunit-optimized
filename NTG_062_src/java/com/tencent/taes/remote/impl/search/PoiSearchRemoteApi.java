package com.tencent.taes.remote.impl.search;

import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import android.util.Pair;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.search.IPoiSearchApi;
import com.tencent.taes.remote.api.search.IPoiSearchService;
import com.tencent.taes.remote.api.search.listener.PoiSearchListener;
import com.tencent.taes.remote.impl.BaseRemoteApi;

/* JADX INFO: loaded from: classes.dex */
public class PoiSearchRemoteApi extends BaseRemoteApi implements IPoiSearchApi {
    private static final String TAG = "PoiSearchRemoteApi";
    private IPoiSearchService mPoiSearchService;

    private PoiSearchRemoteApi(IBinder binder, IBinder smsbinder) {
        super(binder, smsbinder);
        this.mPoiSearchService = IPoiSearchService.Stub.asInterface(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public Pair<String, String> subscribeModuleBinder() {
        return new Pair<>(ServerCompConstant.MAP, IPoiSearchService.Stub.class.getName());
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderConnect(IBinder binder) {
        this.mPoiSearchService = IPoiSearchService.Stub.asInterface(binder);
        super.binderConnect(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderDisConnect() {
        super.binderDisConnect();
    }

    @Override // com.tencent.taes.remote.api.search.IPoiSearchApi
    public String searchKeyWord(String keyword, PoiSearchListener listener) {
        Log.d(TAG, "searchKeyWord : " + keyword + ", PoiSearchListener : " + listener);
        if (this.mPoiSearchService != null) {
            try {
                return this.mPoiSearchService.searchKeyWord(keyword, listener.getInnerListener());
            } catch (RemoteException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.search.IPoiSearchApi
    public void cancelSearch(String taskId) {
        Log.d(TAG, "cancelSearch, taskId = " + taskId);
        if (this.mPoiSearchService != null) {
            try {
                this.mPoiSearchService.cancelSearch(taskId);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.search.IPoiSearchApi
    public void showPoiResult(String taskId) {
        Log.d(TAG, "showPoiResult, taskId = " + taskId);
        if (this.mPoiSearchService != null) {
            try {
                this.mPoiSearchService.showPoiResult(taskId);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }
}
