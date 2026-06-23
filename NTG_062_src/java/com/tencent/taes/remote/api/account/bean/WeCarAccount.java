package com.tencent.taes.remote.api.account.bean;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public class WeCarAccount implements Parcelable {
    public static final Parcelable.Creator<WeCarAccount> CREATOR = new Parcelable.Creator<WeCarAccount>() { // from class: com.tencent.taes.remote.api.account.bean.WeCarAccount.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public WeCarAccount createFromParcel(Parcel source) {
            return new WeCarAccount(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public WeCarAccount[] newArray(int size) {
            return new WeCarAccount[size];
        }
    };
    private String mChannel;
    private String mSessionKey;
    private String mWeCarId;
    private byte[] mWeCarKey;
    private TxAccount mWxAccount;

    public WeCarAccount() {
    }

    public String getWeCarId() {
        return this.mWeCarId;
    }

    public void setWeCarId(String wecarid) {
        this.mWeCarId = wecarid;
    }

    public String getSessionKey() {
        return this.mSessionKey;
    }

    public void setSessionKey(String sessionKey) {
        this.mSessionKey = sessionKey;
    }

    public void setWxAccount(TxAccount wxAccount) {
        this.mWxAccount = wxAccount;
    }

    public TxAccount getWxAccount() {
        return this.mWxAccount;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("wecarid: ");
        sb.append(this.mWeCarId);
        sb.append(", sKey: ");
        sb.append(this.mSessionKey);
        sb.append(", channel: ");
        StringBuilder sb2 = sb.append(this.mChannel);
        if (this.mWxAccount != null) {
            sb2.append(", wx account[");
            sb2.append(this.mWxAccount.toString());
            sb2.append("]");
        }
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.mWeCarId);
        dest.writeByteArray(this.mWeCarKey);
        dest.writeString(this.mSessionKey);
        dest.writeParcelable(this.mWxAccount, flags);
        dest.writeString(this.mChannel);
    }

    protected WeCarAccount(Parcel in) {
        this.mWeCarId = in.readString();
        this.mWeCarKey = in.createByteArray();
        this.mSessionKey = in.readString();
        this.mWxAccount = (TxAccount) in.readParcelable(TxAccount.class.getClassLoader());
        this.mChannel = in.readString();
    }

    public String getChannel() {
        return this.mChannel;
    }

    public void setChannel(String mChannel) {
        this.mChannel = mChannel;
    }
}
