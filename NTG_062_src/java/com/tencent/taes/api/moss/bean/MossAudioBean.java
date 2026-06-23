package com.tencent.taes.api.moss.bean;

/* JADX INFO: loaded from: classes.dex */
public class MossAudioBean {
    public String appId;
    public String author;
    public String cnName;
    public int currentPosition;
    public int id;
    public String logoUrl;
    public String mossPath;
    public String name;
    public String pkgName;
    public boolean playStatus;
    public String poster;
    public int saveCurrentPosition;
    public String src;

    public String toString() {
        return "MossAudioInfo{poster='" + this.poster + "', name='" + this.name + "', author='" + this.author + "', src='" + this.src + "', currentPosition=" + this.currentPosition + ", saveCurrentPosition=" + this.saveCurrentPosition + ", id=" + this.appId + ", mossPath=" + this.mossPath + ", appId='" + this.appId + "', pkgName='" + this.pkgName + "', cnName='" + this.cnName + "', logoUrl='" + this.logoUrl + "'}";
    }
}
