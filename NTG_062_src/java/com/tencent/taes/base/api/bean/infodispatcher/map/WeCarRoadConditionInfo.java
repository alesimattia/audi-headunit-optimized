package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class WeCarRoadConditionInfo extends WeCarBaseBean {
    public static final int ROAD_COND_STATE_BLOCK = 2;
    public static final int ROAD_COND_STATE_CLEAR = 0;
    public static final int ROAD_COND_STATE_HEAVY_BLOCK = 4;
    public static final int ROAD_COND_STATE_NONE = 3;
    public static final int ROAD_COND_STATE_SLOW = 1;
    public double destPosLat;
    public double destPosLng;
    public int mLength;
    public int mPassTime;
    public int mRoadCondState;
    public String mRoadName;
    public double startPosLat;
    public double startPosLng;

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof WeCarRoadConditionInfo)) {
            return false;
        }
        WeCarRoadConditionInfo that = (WeCarRoadConditionInfo) o;
        return this.mRoadCondState == that.mRoadCondState && this.mLength == that.mLength && this.mPassTime == that.mPassTime && this.startPosLat == that.startPosLat && this.startPosLng == that.startPosLng && this.destPosLat == that.destPosLat && this.destPosLng == that.destPosLng && equals(this.mRoadName, that.mRoadName);
    }

    public int hashCode() {
        return Objects.hash(Integer.valueOf(this.mRoadCondState), Integer.valueOf(this.mLength), Integer.valueOf(this.mPassTime), this.mRoadName, Double.valueOf(this.startPosLat), Double.valueOf(this.startPosLng), Double.valueOf(this.destPosLat), Double.valueOf(this.destPosLng));
    }

    public String toString() {
        return "WeCarRoadConditionInfo{mRoadCondState=" + this.mRoadCondState + ", mLength=" + this.mLength + ", mPassTime=" + this.mPassTime + ", mRoadName='" + this.mRoadName + "', startPosLat=" + this.startPosLat + ", startPosLng=" + this.startPosLng + ", destPosLat=" + this.destPosLat + ", destPosLng=" + this.destPosLng + '}';
    }
}
