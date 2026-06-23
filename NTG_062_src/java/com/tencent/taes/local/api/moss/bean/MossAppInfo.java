package com.tencent.taes.local.api.moss.bean;

import com.tencent.taes.framework.bean.AppType;
import com.tencent.taes.framework.bean.BaseInfo;

/* JADX INFO: loaded from: classes.dex */
public class MossAppInfo extends BaseInfo {
    private static final long serialVersionUID = -7523496019187009023L;
    protected boolean isVertical;
    protected int mDisplayWidth;
    protected String mLogoUrl;
    protected String mName;
    protected String mPagePath;
    protected String sourceId;
    protected boolean tencentMossApp = false;

    public MossAppInfo() {
        this.mType = AppType.Moss;
    }

    public String getName() {
        return this.mName;
    }

    public void setName(String name) {
        this.mName = name;
    }

    public String getLogoUrl() {
        return this.mLogoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.mLogoUrl = logoUrl;
    }

    public void setTencentMossApp(boolean tencentMossApp) {
        this.tencentMossApp = tencentMossApp;
    }

    public String getSourceId() {
        return this.sourceId;
    }

    public void setSourceId(String sourceId) {
        this.sourceId = sourceId;
    }

    public boolean isTencentMossApp() {
        return this.tencentMossApp;
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
