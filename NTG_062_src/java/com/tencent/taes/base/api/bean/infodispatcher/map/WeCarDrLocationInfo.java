package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;

/* JADX INFO: loaded from: classes.dex */
public class WeCarDrLocationInfo extends WeCarBaseBean {
    public String nemaData;

    public WeCarDrLocationInfo() {
    }

    public WeCarDrLocationInfo(String nemaData) {
        this.nemaData = nemaData;
    }

    public String toString() {
        return "WeCarDrLocationInfo{nemaData='" + this.nemaData + "'}";
    }
}
