package com.tencent.taes.remote.api.account.bean;

import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;

/* JADX INFO: loaded from: classes.dex */
public class RegisterResult extends BaseModel {

    @SerializedName("content")
    private Content mContent;

    static class Content {

        @SerializedName("cartoken")
        private String mCarToken;

        @SerializedName("deviceId")
        private String mDeviceId;

        @SerializedName("devicetype")
        private int mDeviceType;

        @SerializedName("nonce")
        private long mNonce;

        @SerializedName("sKey")
        private String mSessionKey;

        @SerializedName("uuid")
        private String mUUID;

        @SerializedName("commonId")
        private String mWecarId;

        @SerializedName("wecarKey")
        private String mWecarKey;

        Content() {
        }
    }

    public String getWeCarId() {
        if (this.mContent != null) {
            return this.mContent.mWecarId;
        }
        return null;
    }

    public long getNonce() {
        if (this.mContent != null) {
            return this.mContent.mNonce;
        }
        return 0L;
    }

    public String getCsrToken() {
        return this.mContent.mCarToken;
    }

    public String getWeCarKey() {
        if (this.mContent != null) {
            return this.mContent.mWecarKey;
        }
        return null;
    }

    public String getSessionKey() {
        if (this.mContent != null) {
            return this.mContent.mSessionKey;
        }
        return null;
    }

    public String getDeviceId() {
        if (this.mContent != null) {
            return this.mContent.mDeviceId;
        }
        return null;
    }

    public int getDeviceType() {
        if (this.mContent != null) {
            return this.mContent.mDeviceType;
        }
        return -1;
    }

    public String getUUID() {
        if (this.mContent != null) {
            return this.mContent.mUUID;
        }
        return null;
    }

    public String toString() {
        Gson gson = new Gson();
        return gson.toJson(this);
    }
}
