package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class WeCarRoadsideCameraInfo extends WeCarBaseBean {
    public boolean isOverSpeed;
    public boolean isShow;
    public int remainDist;
    public int speedLimit;
    public int startDist;
    public int type;

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof WeCarRoadsideCameraInfo)) {
            return false;
        }
        WeCarRoadsideCameraInfo that = (WeCarRoadsideCameraInfo) o;
        return this.isShow == that.isShow && this.type == that.type && this.startDist == that.startDist && this.remainDist == that.remainDist && this.speedLimit == that.speedLimit && this.isOverSpeed == that.isOverSpeed;
    }

    public int hashCode() {
        return Objects.hash(Boolean.valueOf(this.isShow), Integer.valueOf(this.type), Integer.valueOf(this.startDist), Integer.valueOf(this.remainDist), Integer.valueOf(this.speedLimit), Boolean.valueOf(this.isOverSpeed));
    }
}
