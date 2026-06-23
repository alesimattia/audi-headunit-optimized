package com.tencent.taes.remote.api.account.bean;

import androidx.core.app.NotificationCompat;
import com.google.gson.annotations.SerializedName;

/* JADX INFO: loaded from: classes.dex */
public class BaseModel {

    @SerializedName(NotificationCompat.CATEGORY_ERROR)
    public int errorCode = -1;
    private String info;
    private long nonce;
    private String sKey;
    private String xtraceid;

    public String getXtraceid() {
        return this.xtraceid;
    }

    public void setXtraceid(String xtraceid) {
        this.xtraceid = xtraceid;
    }

    public String getInfo() {
        return this.info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getErrorCode() {
        return this.errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public boolean isOk() {
        return this.errorCode == 0;
    }

    public String getKey() {
        return this.sKey;
    }

    public void setKey(String sKey) {
        this.sKey = sKey;
    }

    public long getBNonce() {
        return this.nonce;
    }

    public void setBNonce(long nonce) {
        this.nonce = nonce;
    }
}
