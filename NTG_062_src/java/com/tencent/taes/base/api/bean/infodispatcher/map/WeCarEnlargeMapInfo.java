package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class WeCarEnlargeMapInfo extends WeCarBaseBean {
    public boolean show;

    public WeCarEnlargeMapInfo() {
    }

    public WeCarEnlargeMapInfo(boolean show) {
        this.show = show;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        WeCarEnlargeMapInfo that = (WeCarEnlargeMapInfo) o;
        if (this.show == that.show) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        return Objects.hash(Boolean.valueOf(this.show));
    }
}
