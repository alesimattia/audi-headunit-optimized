package com.tencent.taes.remote.api.search.bean;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public class SearchPoi implements Parcelable {
    public static final Parcelable.Creator<SearchPoi> CREATOR = new Parcelable.Creator<SearchPoi>() { // from class: com.tencent.taes.remote.api.search.bean.SearchPoi.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SearchPoi createFromParcel(Parcel in) {
            return new SearchPoi(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SearchPoi[] newArray(int size) {
            return new SearchPoi[size];
        }
    };
    public String address;
    public String title;

    public SearchPoi() {
    }

    protected SearchPoi(Parcel in) {
        this.title = in.readString();
        this.address = in.readString();
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.title);
        dest.writeString(this.address);
    }

    public String toString() {
        return "SearchPoi{title=" + this.title + ", address=" + this.address + '}';
    }
}
