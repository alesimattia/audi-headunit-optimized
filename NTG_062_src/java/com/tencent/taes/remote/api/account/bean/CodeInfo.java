package com.tencent.taes.remote.api.account.bean;

/* JADX INFO: loaded from: classes.dex */
public class CodeInfo {
    public static final int QR_MOSS = 2;
    public static final int QR_MY_CAR = 1;
    private int codeType;
    private long expireTime;
    private int isExpire;
    private int isLoginUser;
    private int isScanned;
    private String ticket;

    public String getTicket() {
        return this.ticket;
    }

    public void setTicket(String ticket) {
        this.ticket = ticket;
    }

    public long getExpireTime() {
        return this.expireTime;
    }

    public void setExpireTime(long expireTime) {
        this.expireTime = expireTime;
    }

    public String toString() {
        return "CodeInfo{ticket=" + this.ticket + ", expireTime=" + this.expireTime + ", codeType=" + this.codeType + '}';
    }

    public int getCodeType() {
        return this.codeType;
    }

    public void setCodeType(int codeType) {
        this.codeType = codeType;
    }

    public int getIsScanned() {
        return this.isScanned;
    }

    public int getIsLoginUser() {
        return this.isLoginUser;
    }

    public int getIsExpire() {
        return this.isExpire;
    }
}
