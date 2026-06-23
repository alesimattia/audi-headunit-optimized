package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;

/* JADX INFO: loaded from: classes.dex */
public class WeCarLinkInfo extends WeCarBaseBean {
    public static final int FORM_WAY_ENTRANCE_EXIT_PARK = 12;
    public static final int FORM_WAY_ENTRANCE_EXIT_SERVICE = 13;
    public static final int FORM_WAY_FREEWAY = 1;
    public static final int FORM_WAY_MULTIPLE_CARRIAGEWAY = 2;
    public static final int FORM_WAY_PARALLEL_ROAD = 8;
    public static final int FORM_WAY_PEDESTRIAN_ZONE = 14;
    public static final int FORM_WAY_RAMP_NOT_ON_FREEWAY = 10;
    public static final int FORM_WAY_RAMP_ON_FREEWAY = 9;
    public static final int FORM_WAY_ROUNDABOUT_CIRCLE = 4;
    public static final int FORM_WAY_SERVICE_ROAD = 11;
    public static final int FORM_WAY_SINGLE_CARRIAGEWAY = 3;
    public static final int FORM_WAY_TRAFFICSQUARE = 5;
    public static final int FORM_WAY_UNKNOWN = 0;
    public static final int PATH_INVALID_DATA = 0;
    public static final int PATH_MAP_MATCH_FAILED = 2;
    public static final int PATH_MATCH_FAILED = 1;
    public static final int PATH_MATCH_NORMAL = 4;
    public static final int PATH_UNCALIBRATED = 3;
    public static final int PATH_UNKNOW_ERROR = 5;
    public static final int ROAD_CLASS_0 = 0;
    public static final int ROAD_CLASS_1 = 1;
    public static final int ROAD_CLASS_2 = 2;
    public static final int ROAD_CLASS_3 = 3;
    public static final int ROAD_CLASS_4 = 4;
    public static final int ROAD_CLASS_5 = 5;
    public static final int ROAD_CLASS_6 = 6;
    public static final int VALID_DATA_AVAILABLE = 1;
    public static final int VALID_DATA_NOT_AVAILABLE = 0;
    public int dividedRoad;
    public int formOfWay;
    public int funcRoadClass;
    public int naviDataAvailable;
    public int numberOfLaneAtDrvDir;
    public int pathIndex;
    public int speedLimit;
    public int speedLimitType;

    public WeCarLinkInfo() {
    }

    public WeCarLinkInfo(int naviDataAvailable, int numberOfLaneAtDrvDir, int speedLimit, int speedLimitType, int formOfWay, int funcRoadClass, int pathIndex, int dividedRoad) {
        this.naviDataAvailable = naviDataAvailable;
        this.numberOfLaneAtDrvDir = numberOfLaneAtDrvDir;
        this.speedLimit = speedLimit;
        this.speedLimitType = speedLimitType;
        this.formOfWay = formOfWay;
        this.funcRoadClass = funcRoadClass;
        this.pathIndex = pathIndex;
        this.dividedRoad = dividedRoad;
    }

    public String toString() {
        return "WeCarLinkInfo{naviDataAvailable=" + this.naviDataAvailable + ", numberOfLaneAtDrvDir=" + this.numberOfLaneAtDrvDir + ", speedLimit=" + this.speedLimit + ", speedLimitType=" + this.speedLimitType + ", formOfWay=" + this.formOfWay + ", funcRoadClass=" + this.funcRoadClass + ", pathIndex=" + this.pathIndex + ", dividedRoad=" + this.dividedRoad + '}';
    }
}
