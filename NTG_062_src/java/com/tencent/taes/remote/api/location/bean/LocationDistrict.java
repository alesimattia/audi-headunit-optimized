package com.tencent.taes.remote.api.location.bean;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public class LocationDistrict implements Parcelable {
    public static final Parcelable.Creator<LocationDistrict> CREATOR = new Parcelable.Creator<LocationDistrict>() { // from class: com.tencent.taes.remote.api.location.bean.LocationDistrict.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public LocationDistrict createFromParcel(Parcel source) {
            return new LocationDistrict(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public LocationDistrict[] newArray(int size) {
            return new LocationDistrict[size];
        }
    };
    public static final int DISTRICT_INVALID_VALUE = -1;
    public static final int DISTRICT_TYPE_CITY = 3;
    public static final int DISTRICT_TYPE_COUNTRY = 1;
    public static final int DISTRICT_TYPE_COUNTY = 4;
    public static final int DISTRICT_TYPE_INVALID = -1;
    public static final int DISTRICT_TYPE_PROVINCE = 2;
    public static final int DISTRICT_TYPE_WORLD = 0;
    public int cityID;
    public String cityName;
    public int districtID;
    public String districtName;
    public String name;
    public int provinceID;
    public String provinceName;
    public int type;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.type);
        dest.writeInt(this.districtID);
        dest.writeInt(this.provinceID);
        dest.writeInt(this.cityID);
        dest.writeString(this.name);
        dest.writeString(this.provinceName);
        dest.writeString(this.cityName);
        dest.writeString(this.districtName);
    }

    public void readFromParcel(Parcel in) {
        this.type = in.readInt();
        this.districtID = in.readInt();
        this.provinceID = in.readInt();
        this.cityID = in.readInt();
        this.name = in.readString();
        this.provinceName = in.readString();
        this.cityName = in.readString();
        this.districtName = in.readString();
    }

    public LocationDistrict() {
        this.districtID = -1;
        this.provinceID = -1;
        this.cityID = -1;
    }

    protected LocationDistrict(Parcel in) {
        this.districtID = -1;
        this.provinceID = -1;
        this.cityID = -1;
        this.type = in.readInt();
        this.districtID = in.readInt();
        this.provinceID = in.readInt();
        this.cityID = in.readInt();
        this.name = in.readString();
        this.provinceName = in.readString();
        this.cityName = in.readString();
        this.districtName = in.readString();
    }
}
