package com.tencent.taes.remote.api.open;

/* JADX INFO: loaded from: classes.dex */
public interface OpenApiConsts {

    public interface Host {
        public static final String APP_EVENT = "AppEvent";
        public static final String EXIT_APP = "exitApp";
        public static final String GO_HOME_COMPANY = "goHomeCompany";
        public static final String JOIN_TEAMTRIP = "joinTeamTrip";
        public static final String SET_CRUISE_SPEAK_TYPE = "setCruiseSpeakType";
        public static final String SHOW_SCENE_BANNER_DETAIL = "showSceneBannerDetail";
        public static final String START_STOP_CRUISE = "startStopCruise";
        public static final String START_STOP_NAVI = "startStopNavi";
        public static final String UPDATE_NAVI_DEST = "updateNaviDest";
    }

    public interface Key {
        public static final String ACTIONS = "actions";
        public static final String APP_EVENT_NAME = "app_event_name";
        public static final String CLOSE_SPEAK = "closeSpeak";
        public static final String DEST_LATITUDE = "destLatitude";
        public static final String DEST_LONGITUDE = "destLongitude";
        public static final String FORCE_START_SPEAK = "forceStartSpeak";
        public static final String FROM = "from";
        public static final String GO_HOME_COMPANY_TYPE = "goHomeCompanyType";
        public static final String HANDLE_TYPE = "handleType";
        public static final String IS_REAL_NAVI = "isRealNavi";
        public static final String SHOW_DIALOG = "showDialog";
        public static final String SHOW_NAVIGATION_BAR = "showNavigationBar";
        public static final String SHOW_STATUS_BAR = "showStatusBar";
        public static final String START_LATITUDE = "startLatitude";
        public static final String START_LONGITUDE = "startLongitude";
        public static final String START_NAVI_TYPE = "startNaviType";
        public static final String START_STOP_TYPE = "startStopType";
        public static final String TEAMTRIP_ID = "teamtripId";
    }

    public interface Value {
        public static final int FROM_OTHER = 2;
        public static final int FROM_SX_CARD = 1;
        public static final int GO_COMPANY = 2;
        public static final int GO_HOME = 1;
        public static final int START = 1;
        public static final int START_NAVI_ONLY_DEST = 1;
        public static final int START_NAVI_START_DEST = 2;
        public static final int STOP = 2;
    }
}
