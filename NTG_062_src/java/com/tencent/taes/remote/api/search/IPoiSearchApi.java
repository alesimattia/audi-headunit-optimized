package com.tencent.taes.remote.api.search;

import com.tencent.taes.remote.api.search.listener.PoiSearchListener;

/* JADX INFO: loaded from: classes.dex */
public interface IPoiSearchApi {
    void cancelSearch(String str);

    String searchKeyWord(String str, PoiSearchListener poiSearchListener);

    void showPoiResult(String str);
}
