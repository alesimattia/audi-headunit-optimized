package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class WeCarRouteEvent extends WeCarBaseBean {
    public int eventType;
    public boolean isRouteSucc;
    public int resultCode;
    public int routeType;

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof WeCarRouteEvent)) {
            return false;
        }
        WeCarRouteEvent that = (WeCarRouteEvent) o;
        return this.routeType == that.routeType && this.eventType == that.eventType && this.resultCode == that.resultCode && this.isRouteSucc == that.isRouteSucc;
    }

    public int hashCode() {
        return Objects.hash(Integer.valueOf(this.routeType), Integer.valueOf(this.eventType), Integer.valueOf(this.resultCode), Boolean.valueOf(this.isRouteSucc));
    }
}
