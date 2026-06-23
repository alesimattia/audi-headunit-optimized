package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class WeCarSnapShotInfo extends WeCarBaseBean {
    public String nextRoadName;
    public int remainDisInMetre;
    public int remainTimeInSecond;
    public int turnDis;
    public int turnIconNum;

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        WeCarSnapShotInfo that = (WeCarSnapShotInfo) o;
        if (this.turnDis == that.turnDis && this.turnIconNum == that.turnIconNum && this.remainTimeInSecond == that.remainTimeInSecond && this.remainDisInMetre == that.remainDisInMetre && equals(this.nextRoadName, that.nextRoadName)) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        return Objects.hash(Integer.valueOf(this.turnDis), Integer.valueOf(this.turnIconNum), this.nextRoadName, Integer.valueOf(this.remainTimeInSecond), Integer.valueOf(this.remainDisInMetre));
    }

    public String toString() {
        return "WeCarSnapShotInfo{turnDis=" + this.turnDis + ", turnIconNum=" + this.turnIconNum + ", nextRoadName='" + this.nextRoadName + "', remainTimeInSecond=" + this.remainTimeInSecond + ", remainDisInMetre=" + this.remainDisInMetre + '}';
    }
}
