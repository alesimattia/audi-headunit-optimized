package com.tencent.taes.remote.api.search.listener;

import android.os.RemoteException;
import com.tencent.taes.remote.api.search.bean.PoiSearchResult;
import com.tencent.taes.remote.api.search.listener.IPoiSearchListener;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
public abstract class PoiSearchListener {
    private IPoiSearchListener mInnerListener = new InnerListener(this);

    public abstract void onResult(String str, PoiSearchResult poiSearchResult);

    public IPoiSearchListener getInnerListener() {
        return this.mInnerListener;
    }

    private static class InnerListener extends IPoiSearchListener.Stub {
        WeakReference<PoiSearchListener> mOuterListenerRef;

        public InnerListener(PoiSearchListener outerListener) {
            if (outerListener != null) {
                this.mOuterListenerRef = new WeakReference<>(outerListener);
            }
        }

        @Override // com.tencent.taes.remote.api.search.listener.IPoiSearchListener
        public void onResult(String taskId, PoiSearchResult result) throws RemoteException {
            PoiSearchListener poiSearchListener = this.mOuterListenerRef != null ? this.mOuterListenerRef.get() : null;
            if (poiSearchListener != null) {
                poiSearchListener.onResult(taskId, result);
            }
        }
    }
}
