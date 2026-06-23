package com.tencent.taes.api.search;

import com.tencent.taes.api.base.BaseApi;

/* JADX INFO: loaded from: classes.dex */
public interface IPoiSearchApi extends com.tencent.taes.remote.api.search.IPoiSearchApi, BaseApi {
    void goFavoritePage();

    void goPoiDetailPage(String str, String str2, double d, double d2);

    void searchKeyword(String str);

    void searchNearby(int i, String str);
}
