package com.tencent.taes.remote.api.account.bean;

/* JADX INFO: loaded from: classes.dex */
public class LinkStatus {
    private int isLinked;
    private int isLoginVUser;
    private long linkTime;

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

    public long getLinkTime() {
        return this.linkTime;
    }

    public void setLinkTime(long linkTime) {
        this.linkTime = linkTime;
    }

    public boolean hasLoginVUser() {
        return this.isLoginVUser == 1;
    }

    public boolean hasLinked() {
        return this.isLinked == 1;
    }
}
