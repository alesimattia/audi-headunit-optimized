package com.tencent.taes.remote.api.account.bean;

/* JADX INFO: loaded from: classes.dex */
public class UserInfo {
    private String accessToken;
    private String headimgurl;
    private String nickname;
    private String phone;
    private String refreshToken;
    private String userid;

    public String getUserid() {
        return this.userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getHeadimgurl() {
        return this.headimgurl;
    }

    public void setHeadimgurl(String headimgurl) {
        this.headimgurl = headimgurl;
    }

    public String getNickname() {
        return this.nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getAccessToken() {
        return this.accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public String getRefreshToken() {
        return this.refreshToken;
    }

    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken;
    }

    public String toString() {
        return "UserInfo{userid=" + this.userid + "headimgurl=" + this.headimgurl + "nickname=" + this.nickname + "phone=" + this.phone + "accessToken=" + this.accessToken + "refreshToken=" + this.refreshToken + '}';
    }

    public String getPhone() {
        return this.phone;
    }
}
