package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class WeCarArriveEvent extends WeCarBaseBean {
    public int eventType;

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof WeCarArriveEvent)) {
            return false;
        }
        WeCarArriveEvent that = (WeCarArriveEvent) o;
        return this.eventType == that.eventType;
    }

    public int hashCode() {
        return Objects.hash(Integer.valueOf(this.eventType));
    }
}
