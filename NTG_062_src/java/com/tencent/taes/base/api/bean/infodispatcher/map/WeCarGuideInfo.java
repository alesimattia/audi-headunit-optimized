package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class WeCarGuideInfo extends WeCarBaseBean {
    public float currentGpsAngle;
    public String currentRoadName;
    public int currentRoadSpeedLimit;
    public int currentRoadType;
    public int currentSpeed;
    public boolean isOverSpeed;
    public String nextRoadName;
    public WeCarRoadConditionInfo roadCondInfo = new WeCarRoadConditionInfo();
    public int thenDis;
    public int thenTurnIconNum;
    public int turnDis;
    public int turnIconNum;
    public int turnTotalDis;

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof WeCarGuideInfo)) {
            return false;
        }
        WeCarGuideInfo weCarGuideInfo = (WeCarGuideInfo) o;
        return this.turnDis == weCarGuideInfo.turnDis && this.turnIconNum == weCarGuideInfo.turnIconNum && this.turnTotalDis == weCarGuideInfo.turnTotalDis && this.thenTurnIconNum == weCarGuideInfo.thenTurnIconNum && this.thenDis == weCarGuideInfo.thenDis && this.isOverSpeed == weCarGuideInfo.isOverSpeed && this.currentSpeed == weCarGuideInfo.currentSpeed && this.currentRoadType == weCarGuideInfo.currentRoadType && this.currentRoadSpeedLimit == weCarGuideInfo.currentRoadSpeedLimit && Float.compare(weCarGuideInfo.currentGpsAngle, this.currentGpsAngle) == 0 && equals(this.nextRoadName, weCarGuideInfo.nextRoadName) && equals(this.currentRoadName, weCarGuideInfo.currentRoadName) && equals(this.roadCondInfo, weCarGuideInfo.roadCondInfo);
    }

    public int hashCode() {
        return Objects.hash(Integer.valueOf(this.turnDis), Integer.valueOf(this.turnIconNum), Integer.valueOf(this.turnTotalDis), this.nextRoadName, Integer.valueOf(this.thenTurnIconNum), Integer.valueOf(this.thenDis), Boolean.valueOf(this.isOverSpeed), Integer.valueOf(this.currentSpeed), Integer.valueOf(this.currentRoadType), this.currentRoadName, Integer.valueOf(this.currentRoadSpeedLimit), this.roadCondInfo, Float.valueOf(this.currentGpsAngle));
    }
}
