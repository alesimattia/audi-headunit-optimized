package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class WeCarNaviRoadConditionInfo extends WeCarBaseBean {

    @Deprecated
    public String destDesc;

    @Deprecated
    public double destPosLat;

    @Deprecated
    public double destPosLng;

    @Deprecated
    public int etaTime;

    @Deprecated
    public int routeTotalLen;

    @Deprecated
    public double startPosLat;

    @Deprecated
    public double startPosLng;
    public List<WeCarRoadConditionInfo> mRoadConds = new ArrayList();

    @Deprecated
    public int destType = -1;

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof WeCarNaviRoadConditionInfo)) {
            return false;
        }
        WeCarNaviRoadConditionInfo that = (WeCarNaviRoadConditionInfo) o;
        return this.etaTime == that.etaTime && this.routeTotalLen == that.routeTotalLen && this.destType == that.destType && Double.compare(that.startPosLat, this.startPosLat) == 0 && Double.compare(that.startPosLng, this.startPosLng) == 0 && Double.compare(that.destPosLat, this.destPosLat) == 0 && Double.compare(that.destPosLng, this.destPosLng) == 0 && equals(this.mRoadConds, that.mRoadConds) && equals(this.destDesc, that.destDesc);
    }

    public int hashCode() {
        return Objects.hash(this.mRoadConds, Integer.valueOf(this.etaTime), Integer.valueOf(this.routeTotalLen), Integer.valueOf(this.destType), this.destDesc, Double.valueOf(this.startPosLat), Double.valueOf(this.startPosLng), Double.valueOf(this.destPosLat), Double.valueOf(this.destPosLng));
    }

    public String toString() {
        return "WeCarNaviRoadConditionInfo{mRoadConds=" + this.mRoadConds + ", etaTime=" + this.etaTime + ", routeTotalLen=" + this.routeTotalLen + ", destType=" + this.destType + ", destDesc='" + this.destDesc + "', startPosLat=" + this.startPosLat + ", startPosLng=" + this.startPosLng + ", destPosLat=" + this.destPosLat + ", destPosLng=" + this.destPosLng + '}';
    }
}
