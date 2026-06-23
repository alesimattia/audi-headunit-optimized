package com.tencent.taes.remote.api.infodispatcher.util;

import com.tencent.taes.base.api.INoProguard;

/* JADX INFO: loaded from: classes.dex */
public interface InfoDispatchConsts extends INoProguard {

    public interface AppEventType extends INoProguard {
        public static final int BACKGROUD = 4;
        public static final int EXIT = 2;
        public static final int FOREGROUND = 3;
        public static final int INIT = 1;
        public static final int INVALID = -1;
    }

    public interface ArriveEventType extends INoProguard {
        public static final int ARRIVE_DEST = 2;
        public static final int ARRIVE_DEST_NEAR = 1;
        public static final int ARRIVE_VIA = 3;
        public static final int INVALID = -1;
    }

    public interface CommuteType extends INoProguard {
        public static final int COMPANY = 2;
        public static final int HOME = 1;
        public static final int INVALID = -1;
    }

    public interface DestType extends INoProguard {
        public static final int COMPANY = 1;
        public static final int HOME = 0;
        public static final int INVALID = -1;
        public static final int OTHER = 2;
    }

    public interface LaneLineIconType extends INoProguard {
    }

    public interface MapModeType extends INoProguard {
        public static final int CAR_2D = 2;
        public static final int CAR_3D = 1;
        public static final int NORTH_2D = 0;
    }

    public interface MapMonitorTaskType extends INoProguard {
        public static final int INVALID = 0;
        public static final int MAP = 1;
    }

    public interface NavigationEventType extends INoProguard {
        public static final int INVALID = -1;
        public static final int SIMULATED_NAVI_PAUSE = 3;
        public static final int SIMULATED_NAVI_RESUME = 4;
        public static final int START = 1;
        public static final int STOP = 2;
    }

    public interface NavigationModeType extends INoProguard {
        public static final int COMMUTE = 3;
        public static final int CRUISE = 2;
        public static final int INVALID = -1;
        public static final int NAVI = 1;
    }

    public interface RoadsideCameraType extends INoProguard {
        public static final int RoadsideCamera_Type_Accident = 14;
        public static final int RoadsideCamera_Type_BlindBend_Conti = 8;
        public static final int RoadsideCamera_Type_BlindBend_Left = 6;
        public static final int RoadsideCamera_Type_BlindBend_Right = 7;
        public static final int RoadsideCamera_Type_BlindSlope_Conti = 11;
        public static final int RoadsideCamera_Type_BlindSlope_Down = 10;
        public static final int RoadsideCamera_Type_BlindSlope_Up = 9;
        public static final int RoadsideCamera_Type_Bridge = 4;
        public static final int RoadsideCamera_Type_Children = 23;
        public static final int RoadsideCamera_Type_HOVCamera = 19;
        public static final int RoadsideCamera_Type_Honk = 31;
        public static final int RoadsideCamera_Type_IntervalCamera = 22;
        public static final int RoadsideCamera_Type_Invalid = -1;
        public static final int RoadsideCamera_Type_JointCamera = 18;
        public static final int RoadsideCamera_Type_Joint_Left = 0;
        public static final int RoadsideCamera_Type_Joint_Main = 2;
        public static final int RoadsideCamera_Type_Joint_Right = 1;
        public static final int RoadsideCamera_Type_Narrow_Both = 27;
        public static final int RoadsideCamera_Type_Narrow_Left = 25;
        public static final int RoadsideCamera_Type_Narrow_Right = 26;
        public static final int RoadsideCamera_Type_OverTakeForbidden = 30;
        public static final int RoadsideCamera_Type_PeccanryCamera = 17;
        public static final int RoadsideCamera_Type_Railway = 5;
        public static final int RoadsideCamera_Type_Rockfall_Left = 12;
        public static final int RoadsideCamera_Type_Rockfall_Right = 13;
        public static final int RoadsideCamera_Type_Slip = 29;
        public static final int RoadsideCamera_Type_SpeedCamera = 15;
        public static final int RoadsideCamera_Type_TrafficLightCamera = 16;
        public static final int RoadsideCamera_Type_Tunnel = 3;
        public static final int RoadsideCamera_Type_Uneven = 24;
        public static final int RoadsideCamera_Type_Viliage = 28;
        public static final int RoadsideCamera_Type_ZoonInCamera = 20;
        public static final int RoadsideCamera_Type_ZoonOutCamera = 21;
    }

    public interface RouteEventType extends INoProguard {
        public static final int INVALID = -1;
        public static final int START = 1;
        public static final int STOP = 2;
    }

    public interface RouteType extends INoProguard {
        public static final int TypeChangeDestNode = 8;
        public static final int TypeNormal = 0;
        public static final int TypeParallelSwitch = 2;
        public static final int TypeRetryRoute = 7;
        public static final int TypeRouteCondition = 6;
        public static final int TypeUpdatePassNode = 4;
        public static final int TypeUpdatePreference = 3;
    }

    public interface YawEventType extends INoProguard {
        public static final int Invalid = -1;
        public static final int RouteInBound = 4;
        public static final int YawBegin = 2;
        public static final int YawEnd = 3;
        public static final int YawFail = 1;
        public static final int YawInBound = 5;
    }
}
