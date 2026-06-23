package com.tencent.taes.remote.api.account.bean;

import android.support.annotation.Keep;

/* JADX INFO: loaded from: classes.dex */
@Keep
public class DebugInfo {
    private String UserAccount;
    private String accountEnv;
    private int appAuthStatus;
    private String channel;
    private String deviceId;
    private String palChannel;
    private String palDeviceId;
    private boolean palStatus;
    private Object palVersion;
    private String palVin;
    private String sdcardChannel;
    private String vin;
    private String weChatAuthString;
    private RegisterResult wecarIdResult;

    public boolean getPalStatus() {
        return this.palStatus;
    }

    public void setPalStatus(boolean palStatus) {
        this.palStatus = palStatus;
    }

    public String getChannel() {
        return this.channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

    public RegisterResult getWecarIdResult() {
        return this.wecarIdResult;
    }

    public void setWecarIdResult(RegisterResult wecarIdResult) {
        this.wecarIdResult = wecarIdResult;
    }

    public String getPalChannel() {
        return this.palChannel;
    }

    public void setPalChannel(String palChannel) {
        this.palChannel = palChannel;
    }

    public String getSdcardChannel() {
        return this.sdcardChannel;
    }

    public void setSdcardChannel(String sdcardChannel) {
        this.sdcardChannel = sdcardChannel;
    }

    public String getDeviceId() {
        return this.deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
    }

    public String getVin() {
        return this.vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getPalDeviceId() {
        return this.palDeviceId;
    }

    public void setPalDeviceId(String palDeviceId) {
        this.palDeviceId = palDeviceId;
    }

    public String getPalVin() {
        return this.palVin;
    }

    public void setPalVin(String palVin) {
        this.palVin = palVin;
    }

    public int getAppAuthStatus() {
        return this.appAuthStatus;
    }

    public void setAppAuthStatus(int appAuthStatus) {
        this.appAuthStatus = appAuthStatus;
    }

    public String getWeChatAuthString() {
        return this.weChatAuthString;
    }

    public void setWeChatAuthString(String weChatAuthString) {
        this.weChatAuthString = weChatAuthString;
    }

    public Object getPalVersion() {
        return this.palVersion;
    }

    public void setPalVersion(Object palVersion) {
        this.palVersion = palVersion;
    }

    public String getUserAccount() {
        return this.UserAccount;
    }

    public void setUserAccount(String userAccount) {
        this.UserAccount = userAccount;
    }

    public String getAccountEnv() {
        return this.accountEnv;
    }

    public void setAccountEnv(String accountEnv) {
        this.accountEnv = accountEnv;
    }
}
