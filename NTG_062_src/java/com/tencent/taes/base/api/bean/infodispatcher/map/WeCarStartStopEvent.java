package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class WeCarStartStopEvent extends WeCarBaseBean {
    public int commuteType;
    public int disInMetre;
    public WeCarRoutePoiNode endNode;
    public int eventType;
    public boolean isRealNavi;
    public int mode;
    public WeCarRoutePoiNode startNode;
    public boolean startSucc;
    public int timeInSecond;

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        WeCarStartStopEvent that = (WeCarStartStopEvent) o;
        if (this.mode == that.mode && this.eventType == that.eventType && this.startSucc == that.startSucc && this.isRealNavi == that.isRealNavi && this.commuteType == that.commuteType && this.timeInSecond == that.timeInSecond && this.disInMetre == that.disInMetre && Objects.equals(this.startNode, that.startNode) && Objects.equals(this.endNode, that.endNode)) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        return Objects.hash(Integer.valueOf(this.mode), Integer.valueOf(this.eventType), this.startNode, this.endNode, Boolean.valueOf(this.startSucc), Boolean.valueOf(this.isRealNavi), Integer.valueOf(this.commuteType), Integer.valueOf(this.timeInSecond), Integer.valueOf(this.disInMetre));
    }
}
