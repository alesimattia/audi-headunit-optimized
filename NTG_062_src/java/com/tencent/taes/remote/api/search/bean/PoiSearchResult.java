package com.tencent.taes.remote.api.search.bean;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class PoiSearchResult implements Parcelable {
    public static final Parcelable.Creator<PoiSearchResult> CREATOR = new Parcelable.Creator<PoiSearchResult>() { // from class: com.tencent.taes.remote.api.search.bean.PoiSearchResult.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public PoiSearchResult createFromParcel(Parcel in) {
            return new PoiSearchResult(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public PoiSearchResult[] newArray(int size) {
            return new PoiSearchResult[size];
        }
    };
    public static final int SEARCH_RESULT_CODE_INVALID = -1;
    public static final int SEARCH_RESULT_CODE_NET_ERR = 1;
    public static final int SEARCH_RESULT_CODE_OK = 0;
    public ArrayList<SearchCity> mCityList;
    public ArrayList<SearchPoi> mPoiList;
    public int searchErrorCode;

    public PoiSearchResult() {
        this.searchErrorCode = -1;
        this.mPoiList = new ArrayList<>();
        this.mCityList = new ArrayList<>();
    }

    protected PoiSearchResult(Parcel in) {
        this.searchErrorCode = -1;
        this.mPoiList = new ArrayList<>();
        this.mCityList = new ArrayList<>();
        this.searchErrorCode = in.readInt();
        this.mPoiList = in.createTypedArrayList(SearchPoi.CREATOR);
        this.mCityList = in.createTypedArrayList(SearchCity.CREATOR);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.searchErrorCode);
        dest.writeTypedList(this.mPoiList);
        dest.writeTypedList(this.mCityList);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }
}
