package com.tencent.taes.remote.api.account.bean;

/* JADX INFO: loaded from: classes.dex */
public class QQBindInfo extends BaseModel {
    private CodeInfo codeInfo;
    private int isBind;
    private int isExpire;
    private QQUserInfo qqUserInfo;

    public boolean isQQBind() {
        return this.isBind == 1;
    }

    public void setQQBind(int isBind) {
        this.isBind = isBind;
    }

    public boolean isQQExpire() {
        return this.isExpire == 1;
    }

    public void setQQExpire(int isExpire) {
        this.isExpire = isExpire;
    }

    public CodeInfo getCodeInfo() {
        return this.codeInfo;
    }

    public void setCodeInfo(CodeInfo codeInfo) {
        this.codeInfo = codeInfo;
    }

    public QQUserInfo getQQUserInfo() {
        return this.qqUserInfo;
    }

    public void setQQUserInfo(QQUserInfo qqUserInfo) {
        this.qqUserInfo = qqUserInfo;
    }
}
