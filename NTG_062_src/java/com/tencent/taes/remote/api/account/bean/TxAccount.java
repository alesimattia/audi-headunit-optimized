package com.tencent.taes.remote.api.account.bean;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import com.tencent.taes.util.StringUtils;

/* JADX INFO: loaded from: classes.dex */
public class TxAccount implements Parcelable {
    public static final Parcelable.Creator<TxAccount> CREATOR = new Parcelable.Creator<TxAccount>() { // from class: com.tencent.taes.remote.api.account.bean.TxAccount.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public TxAccount createFromParcel(Parcel source) {
            return new TxAccount(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public TxAccount[] newArray(int size) {
            return new TxAccount[size];
        }
    };
    private int isTokenExpired;
    private int loginType;
    private String mAvatarUrl;
    private String mId;
    private String mNickName;
    private String mPhone;
    private String mUserId;
    private String pkgName;

    public boolean isWX() {
        return this.loginType == 2;
    }

    public TxAccount() {
    }

    public int getLoginType() {
        return this.loginType;
    }

    public void setLoginType(int loginType) {
        this.loginType = loginType;
    }

    public int getTokenExpired() {
        return this.isTokenExpired;
    }

    public void setisTokenExpired(int isTokenExpired) {
        this.isTokenExpired = isTokenExpired;
    }

    public String getPkgName() {
        return this.pkgName;
    }

    public void setPkgName(String pkgName) {
        this.pkgName = pkgName;
    }

    public String getId() {
        return this.mId;
    }

    public void setId(String mId) {
        this.mId = mId;
    }

    public String getUserId() {
        return this.mUserId;
    }

    public void setUserId(String userId) {
        this.mUserId = userId;
    }

    public String getNickName() {
        return this.mNickName;
    }

    public void setNickName(String nickName) {
        this.mNickName = nickName;
    }

    public String getAvatarUrl() {
        return this.mAvatarUrl;
    }

    public void setAvatarUrl(String avatar) {
        this.mAvatarUrl = avatar;
    }

    public String getPhone() {
        return this.mPhone;
    }

    public void setPhone(String mPhone) {
        this.mPhone = mPhone;
    }

    public boolean equals(Object o) {
        if (o == null || !(o instanceof TxAccount)) {
            return false;
        }
        TxAccount a = (TxAccount) o;
        String id = a.getId();
        if (id == null || !id.equals(this.mId)) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        int result = 31 + 10;
        return result;
    }

    public String toString() {
        return "id: " + this.mId + ", nick: " + this.mNickName + ", userId: " + this.mUserId + ", mAvatarUrl: " + this.mAvatarUrl + ", loginType: " + this.loginType + ", pkgName: " + this.pkgName + ", isTokenExpired:" + this.isTokenExpired + ", phone:" + this.mPhone;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.loginType);
        dest.writeString(this.pkgName);
        dest.writeString(this.mId);
        dest.writeLong((TextUtils.isEmpty(this.mUserId) || !StringUtils.isInteger(this.mUserId)) ? 0L : Long.parseLong(this.mUserId));
        dest.writeString(this.mNickName);
        dest.writeString(this.mAvatarUrl);
        dest.writeInt(this.isTokenExpired);
        if (1 == this.loginType) {
            dest.writeString(this.mUserId);
        }
        dest.writeString(this.mPhone);
    }

    protected TxAccount(Parcel in) {
        this.loginType = in.readInt();
        this.pkgName = in.readString();
        this.mId = in.readString();
        long userTmp = in.readLong();
        this.mUserId = userTmp == 0 ? "" : String.valueOf(userTmp);
        this.mNickName = in.readString();
        this.mAvatarUrl = in.readString();
        this.isTokenExpired = in.readInt();
        if (1 == this.loginType && "".equals(this.mUserId)) {
            this.mUserId = in.readString();
        }
        this.mPhone = in.readString();
    }
}
