package com.tencent.taes.api.moss.bean;

import com.google.gson.annotations.SerializedName;

/* JADX INFO: loaded from: classes.dex */
public class MiniAppInfo {

    @SerializedName("appid")
    public String appId;

    @SerializedName("channelId")
    public String channelId;

    @SerializedName("cnName")
    public String cnName;

    @SerializedName("commonDomain")
    public String commonDomain;

    @SerializedName("downloadDomain")
    public String downloadDomain;

    @SerializedName("id")
    public int id;

    @SerializedName("lastUsedTime")
    public String lastUsedTime;

    @SerializedName("logoUrl")
    public String logoUrl;

    @SerializedName("mossMD5")
    public String mossMD5;

    @SerializedName("mossUrl")
    public String mossUrl;

    @SerializedName("operateDomain")
    public String operateDomain;

    @SerializedName("pagePath")
    public String pagePath;

    @SerializedName("pkgName")
    public String pkgName;

    @SerializedName("socketDomain")
    public String socketDomain;

    @SerializedName("uploadDomain")
    public String uploadDomain;

    @SerializedName("version")
    public String version;

    public String toString() {
        return "MiniAppInfo{id=" + this.id + ", appId='" + this.appId + "', pkgName='" + this.pkgName + "', cnName='" + this.cnName + "', mossUrl='" + this.mossUrl + "', logoUrl='" + this.logoUrl + "', version='" + this.version + "', mossMD5='" + this.mossMD5 + "', channelId='" + this.channelId + "', pagePath='" + this.pagePath + "', lastUsedTime='" + this.lastUsedTime + "', commonDomain='" + this.commonDomain + "', socketDomain='" + this.socketDomain + "', uploadDomain='" + this.uploadDomain + "', downloadDomain='" + this.downloadDomain + "', operateDomain='" + this.operateDomain + "'}";
    }
}
