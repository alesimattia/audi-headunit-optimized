package com.tencent.taes.remote.api.account.bean;

/* JADX INFO: loaded from: classes.dex */
public class LoginUser extends BaseModel {
    private CodeInfo codeInfo;
    private LoginStatus loginStatus;
    private UserInfo userInfo;

    public LoginStatus getLoginStatus() {
        return this.loginStatus;
    }

    public void setLoginStatus(LoginStatus loginStatus) {
        this.loginStatus = loginStatus;
    }

    public UserInfo getUserInfo() {
        return this.userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public CodeInfo getCodeInfo() {
        return this.codeInfo;
    }

    public void setCodeInfo(CodeInfo codeInfo) {
        this.codeInfo = codeInfo;
    }
}
