package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.INoProguard;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class WeCarNaviInfo implements INoProguard {
    public int type = 0;
    public WeCarAppEvent weCarAppEvent;
    public WeCarArriveEvent weCarArriveEvent;
    public WeCarDrLocationInfo weCarDrLocationInfo;
    public WeCarEnlargeMapInfo weCarEnlargeMapInfo;
    public WeCarEtaInfo weCarEtaInfo;
    public WeCarGuideInfo weCarGuideInfo;
    public WeCarHighwayInfo weCarHighwayInfo;
    public WeCarLaneLineInfo weCarLaneLineInfo;
    public WeCarLinkInfo weCarLinkInfo;
    public WeCarMapModeEvent weCarMapModeEvent;
    public WeCarMapMonitorEvent weCarMapMonitorEvent;
    public WeCarNaviRoadConditionInfo weCarNaviRoadConditionInfo;
    public WeCarRoadsideCameraInfo weCarRoadsideCameraInfo;
    public List<WeCarRoadsideCameraInfo> weCarRoadsideCameraInfos;
    public WeCarRouteEvent weCarRouteEvent;
    public WeCarStartStopEvent weCarStartStopEvent;
    public WeCarYawEvent weCarYawEvent;
    public WeCarZoneSpeedInfo weCarZoneSpeedInfo;

    public interface Type {
        public static final int ALL = 0;
        public static final int TypeWeCarAppEvent = 14;
        public static final int TypeWeCarArriveEvent = 9;
        public static final int TypeWeCarDrLocationInfo = 15;
        public static final int TypeWeCarEnlargeMapInfo = 12;
        public static final int TypeWeCarEtaInfo = 2;
        public static final int TypeWeCarGuideInfo = 1;
        public static final int TypeWeCarHighwayInfo = 4;
        public static final int TypeWeCarLaneLineInfo = 6;
        public static final int TypeWeCarLinkInfo = 16;
        public static final int TypeWeCarMapMode = 17;
        public static final int TypeWeCarMapMonitorEvent = 13;
        public static final int TypeWeCarNaviRoadConditionInfo = 7;
        public static final int TypeWeCarRoadsideCameraInfo = 3;
        public static final int TypeWeCarRouteEvent = 11;
        public static final int TypeWeCarStartStopEvent = 8;
        public static final int TypeWeCarYawEvent = 10;
        public static final int TypeWeCarZoneSpeedInfo = 5;
    }

    public void setWeCarGuideInfo(WeCarGuideInfo weCarGuideInfo) {
        this.weCarGuideInfo = weCarGuideInfo;
        this.type = 1;
    }

    public void setWeCarEtaInfo(WeCarEtaInfo weCarEtaInfo) {
        this.weCarEtaInfo = weCarEtaInfo;
        this.type = 2;
    }

    public void setWeCarRoadsideCameraInfo(WeCarRoadsideCameraInfo weCarRoadsideCameraInfo, List<WeCarRoadsideCameraInfo> weCarRoadsideCameraInfos) {
        this.weCarRoadsideCameraInfo = weCarRoadsideCameraInfo;
        this.weCarRoadsideCameraInfos = weCarRoadsideCameraInfos;
        this.type = 3;
    }

    public void setWeCarHighwayInfo(WeCarHighwayInfo weCarHighwayInfo) {
        this.weCarHighwayInfo = weCarHighwayInfo;
        this.type = 4;
    }

    public void setWeCarZoneSpeedInfo(WeCarZoneSpeedInfo weCarZoneSpeedInfo) {
        this.weCarZoneSpeedInfo = weCarZoneSpeedInfo;
        this.type = 5;
    }

    public void setWeCarLaneLineInfo(WeCarLaneLineInfo weCarLaneLineInfo) {
        this.weCarLaneLineInfo = weCarLaneLineInfo;
        this.type = 6;
    }

    public void setWeCarNaviRoadConditionInfo(WeCarNaviRoadConditionInfo weCarNaviRoadConditionInfo) {
        this.weCarNaviRoadConditionInfo = weCarNaviRoadConditionInfo;
        this.type = 7;
    }

    public void setWeCarStartStopEvent(WeCarStartStopEvent weCarStartStopEvent) {
        this.weCarStartStopEvent = weCarStartStopEvent;
        this.type = 8;
    }

    public void setWeCarArriveEvent(WeCarArriveEvent weCarArriveEvent) {
        this.weCarArriveEvent = weCarArriveEvent;
        this.type = 9;
    }

    public void setWeCarYawEvent(WeCarYawEvent weCarYawEvent) {
        this.weCarYawEvent = weCarYawEvent;
        this.type = 10;
    }

    public void setWeCarRouteEvent(WeCarRouteEvent weCarRouteEvent) {
        this.weCarRouteEvent = weCarRouteEvent;
        this.type = 11;
    }

    public void setWeCarEnlargeMapInfo(WeCarEnlargeMapInfo weCarEnlargeMapInfo) {
        this.weCarEnlargeMapInfo = weCarEnlargeMapInfo;
        this.type = 12;
    }

    public void setWeCarMapMonitorEvent(WeCarMapMonitorEvent weCarMapMonitorEvent) {
        this.weCarMapMonitorEvent = weCarMapMonitorEvent;
        this.type = 13;
    }

    public void setWeCarAppEvent(WeCarAppEvent weCarAppEvent) {
        this.weCarAppEvent = weCarAppEvent;
        this.type = 14;
    }

    public void setWeCarDrLocationInfo(WeCarDrLocationInfo weCarDrLocationInfo) {
        this.weCarDrLocationInfo = weCarDrLocationInfo;
        this.type = 15;
    }

    public void setWeCarLinkInfo(WeCarLinkInfo weCarLinkInfo) {
        this.weCarLinkInfo = weCarLinkInfo;
        this.type = 16;
    }

    public void setWeCarMapModeEvent(WeCarMapModeEvent weCarMapModeEvent) {
        this.weCarMapModeEvent = weCarMapModeEvent;
        this.type = 17;
    }
}
