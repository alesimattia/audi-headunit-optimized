package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class WeCarHighwayInfo extends WeCarBaseBean {
    public boolean isShow;
    public int nextDist;
    public String nextName;
    public int nextNextDist;
    public String nextNextName;
    public int nextNextType;
    public int nextType;

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof WeCarHighwayInfo)) {
            return false;
        }
        WeCarHighwayInfo that = (WeCarHighwayInfo) o;
        return this.isShow == that.isShow && this.nextDist == that.nextDist && this.nextType == that.nextType && this.nextNextDist == that.nextNextDist && this.nextNextType == that.nextNextType && equals(this.nextName, that.nextName) && equals(this.nextNextName, that.nextNextName);
    }

    public int hashCode() {
        return Objects.hash(Boolean.valueOf(this.isShow), this.nextName, Integer.valueOf(this.nextDist), Integer.valueOf(this.nextType), this.nextNextName, Integer.valueOf(this.nextNextDist), Integer.valueOf(this.nextNextType));
    }
}
