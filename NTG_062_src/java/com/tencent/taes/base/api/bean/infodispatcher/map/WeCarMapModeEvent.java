package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;

/* JADX INFO: loaded from: classes.dex */
public class WeCarMapModeEvent extends WeCarBaseBean {
    public int mapModeType;

    public WeCarMapModeEvent() {
    }

    public WeCarMapModeEvent(int mapModeType) {
        this.mapModeType = mapModeType;
    }
}
