package com.tencent.taes.framework.bean;

import java.io.Serializable;

/* JADX INFO: loaded from: classes.dex */
public class BaseInfo implements Serializable, Comparable<BaseInfo> {
    private static final long serialVersionUID = 7689157515674961581L;
    protected String mAppId;
    protected long mLastUsedTime;
    protected AppType mType;

    public String getAppId() {
        return this.mAppId;
    }

    public void setAppId(String appId) {
        this.mAppId = appId;
    }

    public long getLastUsedTime() {
        return this.mLastUsedTime;
    }

    public void setLastUsedTime(long mLastUsedTime) {
        this.mLastUsedTime = mLastUsedTime;
    }

    public AppType getType() {
        return this.mType;
    }

    public void setType(AppType type) {
        this.mType = type;
    }

    @Override // java.lang.Comparable
    public int compareTo(BaseInfo o) {
        long cp = o.mLastUsedTime - this.mLastUsedTime;
        if (cp >= 0) {
            return 1;
        }
        return -1;
    }
}
