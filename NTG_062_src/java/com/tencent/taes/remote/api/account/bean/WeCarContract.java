package com.tencent.taes.remote.api.account.bean;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public class WeCarContract implements Parcelable {
    public static final Parcelable.Creator<WeCarContract> CREATOR = new Parcelable.Creator<WeCarContract>() { // from class: com.tencent.taes.remote.api.account.bean.WeCarContract.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public WeCarContract createFromParcel(Parcel source) {
            return new WeCarContract(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public WeCarContract[] newArray(int size) {
            return new WeCarContract[size];
        }
    };
    private int auth;
    private boolean available;
    private String brandName;
    private String carModel;
    private long endTime;
    private String productId;
    private long remainTime;
    private long startTime;
    private String wxRegDid;
    private String wxSign;

    public WeCarContract(int auth, long startTime, long endTime, long remainTime, String wxSign, String wxRegDid, boolean available) {
        this.auth = auth;
        this.startTime = startTime;
        this.endTime = endTime;
        this.remainTime = remainTime;
        this.wxSign = wxSign;
        this.wxRegDid = wxRegDid;
        this.available = available;
    }

    public int getAuth() {
        return this.auth;
    }

    public long getStartTime() {
        return this.startTime;
    }

    public long getEndTime() {
        return this.endTime;
    }

    public long getRemainTime() {
        return this.remainTime;
    }

    public String getWxSign() {
        return this.wxSign;
    }

    public String getWxRegDid() {
        return this.wxRegDid;
    }

    public boolean isAvailable() {
        return this.available;
    }

    public String getProductId() {
        return this.productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getBrandName() {
        return this.brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getCarModel() {
        return this.carModel;
    }

    public void setCarModel(String carModel) {
        this.carModel = carModel;
    }

    public String toString() {
        return "WeCarContract{startTime=" + this.startTime + ", endTime=" + this.endTime + ", remainTime=" + this.remainTime + ", wxSign=" + this.wxSign + ", wxRegDid=" + this.wxRegDid + ", available=" + this.available + ", productId=" + this.productId + ", brandName=" + this.brandName + ", carModel=" + this.carModel + '}';
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    protected WeCarContract(Parcel in) {
        this.auth = in.readInt();
        this.startTime = in.readLong();
        this.endTime = in.readLong();
        this.remainTime = in.readLong();
        this.wxSign = in.readString();
        this.wxRegDid = in.readString();
        this.available = in.readInt() != 0;
        this.productId = in.readString();
        this.brandName = in.readString();
        this.carModel = in.readString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.auth);
        parcel.writeLong(this.startTime);
        parcel.writeLong(this.endTime);
        parcel.writeLong(this.remainTime);
        parcel.writeString(this.wxSign);
        parcel.writeString(this.wxRegDid);
        parcel.writeInt(this.available ? 1 : 0);
        parcel.writeString(this.productId);
        parcel.writeString(this.brandName);
        parcel.writeString(this.carModel);
    }
}
