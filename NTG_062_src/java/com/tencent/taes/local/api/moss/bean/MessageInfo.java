package com.tencent.taes.local.api.moss.bean;

import com.tencent.taes.framework.bean.AppType;
import com.tencent.taes.framework.bean.BaseInfo;

/* JADX INFO: loaded from: classes.dex */
public class MessageInfo extends BaseInfo {
    private static final long serialVersionUID = -364045581793633194L;
    protected boolean isVertical;
    private String mAppName;
    private String mContent;
    protected int mDisplayWidth;
    private String mLogoUrl;
    protected String mPagePath;
    private String mTitle;

    public MessageInfo() {
        this.mType = AppType.Moss;
    }

    public String getAppName() {
        return this.mAppName;
    }

    public void setAppName(String mAppName) {
        this.mAppName = mAppName;
    }

    public String getTitle() {
        return this.mTitle;
    }

    public void setTitle(String mTitle) {
        this.mTitle = mTitle;
    }

    public String getContent() {
        return this.mContent;
    }

    public void setContent(String mContent) {
        this.mContent = mContent;
    }

    public String getLogoUrl() {
        return this.mLogoUrl;
    }

    public void setLogoUrl(String mLogoUrl) {
        this.mLogoUrl = mLogoUrl;
    }

    public int getDisplayWidth() {
        return this.mDisplayWidth;
    }

    public void setDisplayWidth(int displayWidth) {
        this.mDisplayWidth = displayWidth;
    }

    public boolean isVertical() {
        return this.isVertical;
    }

    public void setVertical(boolean vertical) {
        this.isVertical = vertical;
    }

    public String getPagePath() {
        return this.mPagePath;
    }

    public void setPagePath(String pagePath) {
        this.mPagePath = pagePath;
    }
}
