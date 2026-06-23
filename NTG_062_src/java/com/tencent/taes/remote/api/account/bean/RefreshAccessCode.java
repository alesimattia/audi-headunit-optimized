package com.tencent.taes.remote.api.account.bean;

/* JADX INFO: loaded from: classes.dex */
public class RefreshAccessCode extends BaseModel {
    private String codeUrl;
    private String sceneId;

    public String getSceneId() {
        return this.sceneId;
    }

    public String getCodeUrl() {
        return this.codeUrl;
    }

    public String toString() {
        return "RefreshAccessCode{sceneId=" + this.sceneId + " ;codeUrl=" + this.codeUrl + '}';
    }
}
