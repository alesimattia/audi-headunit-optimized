package com.tencent.taes.remote.api.account.bean;

/* JADX INFO: loaded from: classes.dex */
public class LinkUser extends BaseModel {
    private LinkInfo linkInfo;
    private LinkStatus linkStatus;
    private VUserInfo vuserInfo;

    public LinkStatus getLinkStatus() {
        return this.linkStatus;
    }

    public void setLinkStatus(LinkStatus linkStatus) {
        this.linkStatus = linkStatus;
    }

    public LinkInfo getLinkInfo() {
        return this.linkInfo;
    }

    public void setLinkInfo(LinkInfo linkInfo) {
        this.linkInfo = linkInfo;
    }

    public VUserInfo getVuserInfo() {
        return this.vuserInfo;
    }

    public void setVuserInfo(VUserInfo vuserInfo) {
        this.vuserInfo = vuserInfo;
    }
}
