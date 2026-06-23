package com.tencent.taes.remote.api.search.bean;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public class SearchCity implements Parcelable {
    public static final Parcelable.Creator<SearchCity> CREATOR = new Parcelable.Creator<SearchCity>() { // from class: com.tencent.taes.remote.api.search.bean.SearchCity.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SearchCity createFromParcel(Parcel in) {
            return new SearchCity(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SearchCity[] newArray(int size) {
            return new SearchCity[size];
        }
    };
    public String cityName;

    public SearchCity() {
    }

    protected SearchCity(Parcel in) {
        this.cityName = in.readString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.cityName);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public String toString() {
        return "SearchCity{cityName=" + this.cityName + '}';
    }
}
