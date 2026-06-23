package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class WeCarZoneSpeedInfo extends WeCarBaseBean {
    public int avgSpeed;
    public boolean isOverspeed;
    public boolean isShow;
    public int remainDist;
    public int speedLimit;

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof WeCarZoneSpeedInfo)) {
            return false;
        }
        WeCarZoneSpeedInfo that = (WeCarZoneSpeedInfo) o;
        return this.isShow == that.isShow && this.speedLimit == that.speedLimit && this.remainDist == that.remainDist && this.isOverspeed == that.isOverspeed && this.avgSpeed == that.avgSpeed;
    }

    public int hashCode() {
        return Objects.hash(Boolean.valueOf(this.isShow), Integer.valueOf(this.speedLimit), Integer.valueOf(this.remainDist), Boolean.valueOf(this.isOverspeed), Integer.valueOf(this.avgSpeed));
    }
}
