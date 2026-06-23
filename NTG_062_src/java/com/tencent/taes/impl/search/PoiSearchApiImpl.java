package com.tencent.taes.impl.search;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import com.tencent.taes.TaesSDKHelper;
import com.tencent.taes.api.search.IPoiSearchApi;
import com.tencent.taes.framework.APIResult;
import com.tencent.taes.framework.BuildConfig;
import com.tencent.taes.framework.TAESFrameworkManager;
import com.tencent.taes.framework.listener.TAESCommonListener;
import com.tencent.taes.framework.parser.ConfigConstant;
import com.tencent.taes.impl.base.AbstractApi;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.search.bean.SearchApiConsts;
import com.tencent.taes.remote.api.search.listener.PoiSearchListener;
import com.tencent.taes.util.config.ConfigManager;

/* JADX INFO: loaded from: classes.dex */
public class PoiSearchApiImpl extends AbstractApi implements IPoiSearchApi {
    public static final String TAG = "PoiSearchApi";
    private com.tencent.taes.remote.api.search.IPoiSearchApi mPoiSearchApi = null;
    private String mIntentScheme = ConfigManager.getInstance().getConfigInfo(TaesSDKHelper.getContext(), TaesSDKHelper.getConfigFileName()).getString(ConfigConstant.INTENT_URI_SCHEME);
    private String mIntentAction = ConfigManager.getInstance().getConfigInfo(TaesSDKHelper.getContext(), TaesSDKHelper.getConfigFileName()).getString(ConfigConstant.INTENT_API_ACTION);

    public PoiSearchApiImpl() {
        TAESFrameworkManager.getInstance().registerCompLoadListener(ServerCompConstant.MAP, new TAESCommonListener() { // from class: com.tencent.taes.impl.search.PoiSearchApiImpl.1
            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onSuccess() {
                PoiSearchApiImpl.this.getSearchApi();
            }

            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onFail(int i, String s) {
                Log.e(PoiSearchApiImpl.TAG, "MapServiceloadFail：errorCode = " + i + ", msg = " + s);
            }
        });
    }

    public com.tencent.taes.remote.api.search.IPoiSearchApi getSearchApi() {
        if (this.mPoiSearchApi == null) {
            APIResult<com.tencent.taes.remote.api.search.IPoiSearchApi> apiAPIResult = TAESFrameworkManager.getInstance().getApi(ServerCompConstant.MAP, com.tencent.taes.remote.api.search.IPoiSearchApi.class, null);
            if (apiAPIResult.isSuccess()) {
                this.mPoiSearchApi = apiAPIResult.data;
            } else {
                Log.d(TAG, "getApi Fail:" + apiAPIResult.codeDescription());
            }
        }
        return this.mPoiSearchApi;
    }

    @Override // com.tencent.taes.impl.base.AbstractApi
    public void dispose() {
    }

    @Override // com.tencent.taes.remote.api.search.IPoiSearchApi
    public String searchKeyWord(String keyword, PoiSearchListener listener) {
        if (TextUtils.isEmpty(keyword)) {
            Intent intent = new Intent(this.mIntentAction);
            intent.setData(Uri.parse(this.mIntentScheme + "://" + SearchApiConsts.Host.OPEN_SEARCH_PAGE + "?"));
            intent.putExtra("from", 1);
            intent.setFlags(268435456);
            TaesSDKHelper.getContext().startActivity(intent);
            return null;
        }
        if (getSearchApi() != null) {
            return getSearchApi().searchKeyWord(keyword, listener);
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.search.IPoiSearchApi
    public void cancelSearch(String taskId) {
        if (getSearchApi() != null) {
            getSearchApi().cancelSearch(taskId);
        }
    }

    @Override // com.tencent.taes.remote.api.search.IPoiSearchApi
    public void showPoiResult(String taskId) {
        if (getSearchApi() != null) {
            getSearchApi().showPoiResult(taskId);
        }
    }

    @Override // com.tencent.taes.api.search.IPoiSearchApi
    public void searchNearby(int type, String keyword) {
        Intent intent = new Intent(this.mIntentAction);
        StringBuilder sb = new StringBuilder();
        sb.append(this.mIntentScheme);
        sb.append("://");
        sb.append(SearchApiConsts.Host.NEARBY_SEARCH);
        sb.append("?");
        sb.append(SearchApiConsts.Key.KEY_SEARCH_TYPE);
        sb.append("=");
        sb.append(type);
        sb.append("&");
        sb.append(SearchApiConsts.Key.SEARCH_POI_KEY_WORD);
        sb.append("=");
        sb.append(TextUtils.isEmpty(keyword) ? "" : keyword);
        intent.setData(Uri.parse(sb.toString()));
        intent.setFlags(268435456);
        TaesSDKHelper.getContext().startActivity(intent);
    }

    @Override // com.tencent.taes.api.search.IPoiSearchApi
    public void searchKeyword(String keyword) {
        Intent intent = new Intent(this.mIntentAction);
        if (TextUtils.isEmpty(keyword)) {
            intent.setData(Uri.parse(this.mIntentScheme + "://" + SearchApiConsts.Host.OPEN_SEARCH_PAGE + "?"));
            intent.setFlags(268435456);
            TaesSDKHelper.getContext().startActivity(intent);
            return;
        }
        intent.setData(Uri.parse(this.mIntentScheme + "://" + SearchApiConsts.Host.OPEN_SEARCH_RESULT_PAGE + "?" + SearchApiConsts.Key.SEARCH_POI_KEY_WORD + "=" + keyword));
        intent.setFlags(268435456);
        TaesSDKHelper.getContext().startActivity(intent);
    }

    @Override // com.tencent.taes.api.search.IPoiSearchApi
    public void goFavoritePage() {
        Intent intent = new Intent(this.mIntentAction);
        intent.setData(Uri.parse(this.mIntentScheme + "://" + SearchApiConsts.Host.OPEN_FAVORITE_PAGE + "?"));
        intent.setFlags(268435456);
        TaesSDKHelper.getContext().startActivity(intent);
    }

    @Override // com.tencent.taes.api.search.IPoiSearchApi
    public void goPoiDetailPage(String name, String address, double lat, double lon) {
        Bundle bundle = new Bundle();
        bundle.putString(ConfigConstant.CONFIG_KEY_NAME, name);
        bundle.putString("address", address);
        bundle.putDouble("lat", lat);
        bundle.putDouble("lon", lon);
        Intent intent = new Intent(this.mIntentAction);
        intent.setData(Uri.parse(this.mIntentScheme + "://" + SearchApiConsts.Host.OPEN_POI_DETAIL_PAGE + "?"));
        intent.setFlags(268435456);
        intent.putExtras(bundle);
        TaesSDKHelper.getContext().startActivity(intent);
    }

    @Override // com.tencent.taes.api.base.BaseApi
    public String getApiVersion() {
        return BuildConfig.VERSION_NAME;
    }
}
