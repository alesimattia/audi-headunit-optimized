package com.tencent.taes.remote.api.account.bean;

/* JADX INFO: loaded from: classes.dex */
public class QQUserInfo {
    private String accessToken;
    private String bindTime;
    private String headImgUrl;
    private String nickname;
    private String qqUserid;

    public String getUserid() {
        return this.qqUserid;
    }

    public void setUserid(String userid) {
        this.qqUserid = userid;
    }

    public String getHeadimgurl() {
        return this.headImgUrl;
    }

    public void setHeadimgurl(String headimgurl) {
        this.headImgUrl = headimgurl;
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

    public String getBindTime() {
        return this.bindTime;
    }

    public void setBindTime(String bindTime) {
        this.bindTime = bindTime;
    }
}
