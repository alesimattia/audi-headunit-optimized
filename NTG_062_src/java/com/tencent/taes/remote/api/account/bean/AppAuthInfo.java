package com.tencent.taes.remote.api.account.bean;

/* JADX INFO: loaded from: classes.dex */
public class AppAuthInfo {
    private int appToken;
    private String appUserId;
    private long expireTime;

    public String getAppUserId() {
        return this.appUserId;
    }

    public void setAppUserId(String appUserId) {
        this.appUserId = appUserId;
    }

    public int getAppToken() {
        return this.appToken;
    }

    public void setAppToken(int appToken) {
        this.appToken = appToken;
    }

    public long getExpireTime() {
        return this.expireTime;
    }

    public void setExpireTime(long expireTime) {
        this.expireTime = expireTime;
    }
}
