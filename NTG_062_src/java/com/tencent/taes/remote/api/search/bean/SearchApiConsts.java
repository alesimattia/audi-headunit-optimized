package com.tencent.taes.remote.api.search.bean;

/* JADX INFO: loaded from: classes.dex */
public interface SearchApiConsts {

    public interface Host {
        public static final String NEARBY_SEARCH = "nearby_search";
        public static final String OPEN_FAVORITE_PAGE = "open_favorite_page";
        public static final String OPEN_POI_DETAIL_PAGE = "open_poi_detail_page";
        public static final String OPEN_SEARCH_PAGE = "open_search_page";
        public static final String OPEN_SEARCH_RESULT_PAGE = "open_search_result_page";
        public static final String SHOW_POI_RESULT = "showPoiResult";
    }

    public interface Key {
        public static final String KEY_SEARCH_TYPE = "key_search_type";
        public static final String SEARCH_POI_KEY_WORD = "key_search_poi_keyword";
        public static final String SEARCH_POI_RESULT_PAGE = "key_search_poi_result_page";
    }

    public interface Value {
        public static final int TYPE_SEARCH_NEARBY = 0;
        public static final int TYPE_SEARCH_ROUTE = 1;
    }
}
