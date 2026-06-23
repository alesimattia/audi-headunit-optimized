package com.tencent.taes.remote.api.account.bean;

/* JADX INFO: loaded from: classes.dex */
public class LoginStatus {
    private long expireTime;
    private int isLinked;
    private long isLogin;
    private int isLoginUser;
    private int isLoginVUser;
    private int isTokenExpired;
    private long lastLoginTime;

    public int getIsLoginUser() {
        return this.isLoginUser;
    }

    public void setIsLoginUser(int isLoginUser) {
        this.isLoginUser = isLoginUser;
    }

    public int getIsLoginVUser() {
        return this.isLoginVUser;
    }

    public void setIsLoginVUser(int isLoginVUser) {
        this.isLoginVUser = isLoginVUser;
    }

    public int getIsLinked() {
        return this.isLinked;
    }

    public void setIsLinked(int isLinked) {
        this.isLinked = isLinked;
    }

    public long getLastLoginTime() {
        return this.lastLoginTime;
    }

    public void setLastLoginTime(long lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public long getExpireTime() {
        return this.expireTime;
    }

    public void setExpireTime(long expireTime) {
        this.expireTime = expireTime;
    }

    public long getIsLogin() {
        return this.isLogin;
    }

    public void setIsLogin(long isLogin) {
        this.isLogin = isLogin;
    }

    public boolean hasLoginUser() {
        return this.isLoginUser == 1;
    }

    public boolean hasLoginVUser() {
        return this.isLoginVUser == 1;
    }

    public boolean hasLinked() {
        return this.isLinked == 1;
    }

    public boolean hasLoginQQ() {
        return this.isLogin == 1;
    }

    public boolean isTokenExpired() {
        return this.isTokenExpired == 1;
    }

    public void setIsTokenExpired(int isTokenExpired) {
        this.isTokenExpired = isTokenExpired;
    }
}
