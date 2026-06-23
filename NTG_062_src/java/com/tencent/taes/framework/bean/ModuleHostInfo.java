package com.tencent.taes.framework.bean;

import android.support.annotation.Keep;

/* JADX INFO: loaded from: classes.dex */
@Keep
public class ModuleHostInfo {
    private String hostName;
    private boolean isLoaded;
    private String version;

    public String getVersion() {
        return this.version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getHostName() {
        return this.hostName;
    }

    public void setHostName(String hostName) {
        this.hostName = hostName;
    }

    public boolean isLoaded() {
        return this.isLoaded;
    }

    public void setLoaded(boolean loaded) {
        this.isLoaded = loaded;
    }
}
