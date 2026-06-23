package com.tencent.taes.remote.api.account.bean;

import android.os.Environment;

/* JADX INFO: loaded from: classes.dex */
public final class Constants {
    public static final int ACCOUNT_EXPIRED = 1;
    public static final int ACCOUNT_UNEXPIRED = 0;
    public static final String ACTION_ACCOUNT_CHECK_LOGIN_STATUS_PUSH = "com.tencent.wecarbase.ACTION_ACCOUNT_CHECK_LOGIN_STATUS_PUSH";
    public static final String ACTION_AUTH_RESULT = "com.tencent.wecarbase.ACTION_AUTH_RESULT";
    public static final String ACTION_FEED_BACK_CENT_OPEN_OR_CLOSE = "com.tencent.wecarbase.ACTION_FEED_BACK_CENT_OPEN_OR_CLOSE";
    public static final String ACTION_OPEN_BIND = "com.tencent.taiservice.wecarbase.open_bind";
    public static final String ACTION_QQ_BIND = "com.tencent.wecarbase.ACTION_QQ_BIND";
    public static final String ACTION_QQ_UNBIND = "com.tencent.wecarbase.ACTION_QQ_UNBIND";
    public static final String ACTION_QQ_UPDATE = "com.tencent.wecarbase.ACTION_QQ_UPDATE";
    public static final String ACTION_QUERY_BIND = "com.tencent.taiservice.wecarbase.query_bind";
    public static final String ACTION_TAI_SERVICE_STARTED = "com.tencent.taiservice.wecarbase.started";
    public static final String ACTION_TAI_SERVICE_STARTED_AND_NET_OK = "com.tencent.taiservice.wecarbase.started_and_net_ok";
    public static final String ACTION_WECAR_ID_CHANGED = "com.tencent.wecarbase.ACTION_WECAR_ID_CHANGED";
    public static final String ACTION_WECAR_ID_REGISTERED = "com.tencent.wecarbase.ACTION_WECAR_ID_REGISTERED";
    public static final String ACTION_WX_BIND = "com.tencent.wecarbase.ACTION_WX_BIND";
    public static final String ACTION_WX_BIND_PUSH = "com.tencent.wecarbase.ACTION_WX_BIND_PUSH";
    public static final String ACTION_WX_PAGE_OPEN_OR_CLOSE = "com.tencent.wecarbase.ACTION_WX_PAGE_OPEN_OR_CLOSE";
    public static final String ACTION_WX_UNBIND = "com.tencent.wecarbase.ACTION_WX_UNBIND";
    public static final String ACTION_WX_UPDATE = "com.tencent.wecarbase.ACTION_WX_UPDATE";
    public static final String BASE_URL_DEV = "devgw.tai.qq.com";
    public static final String BASE_URL_DEV_TEST = "devgw.tai.qq.com/wecardev";
    public static final String BASE_URL_ONLINE = "gw.tai.qq.com";
    public static final String BASE_URL_PRE_ONLINE = "intgw.tai.qq.com";
    public static final int BIND_VER_FOR_WECARID_REG_WHITHOUT_NAV_REPORT = 4;
    public static final String CHANNEL_VERIFY = "/verify/checkEncryChannelValid";
    public static final int DEVICE_AUTH_RESULT = 20;
    public static final String EXTRA_HAS_AUTH = "extra_has_auth";
    public static final String EXTRA_KEY_FROM = "from";
    public static final String EXTRA_NEW_QQ_ACCOUNT = "extra_new_qq_account";
    public static final String EXTRA_NEW_WECAR_ACCOUNT = "extra_new_wecar_account";
    public static final String EXTRA_NEW_WX_ACCOUNT = "extra_new_wx_account";
    public static final String EXTRA_OLD_QQ_ACCOUNT = "extra_old_qq_account";
    public static final String EXTRA_OLD_WECAR_ACCOUNT = "extra_old_wecar_account";
    public static final String EXTRA_OLD_WX_ACCOUNT = "extra_old_wx_account";
    public static final String EXTRA_OPEN_OR_CLOSE = "extra_open_or_close";
    public static final String EXTRA_TX_ACCOUNT = "extra_tx_account";
    public static final String EXTRA_WECAR_ACCOUNT = "extra_wecar_account";
    public static final String IMMERSE_MODEL = "immerse";
    public static final String IS_MAIN_THREAD = "ISMapublic static final inthread";
    public static final int LOGIN_TYPE_QQ = 1;
    public static final int LOGIN_TYPE_WX = 0;
    public static final String PACKAGE_NAME = "PackageName";
    public static final String PATH_USER_GET_AUTH_QRCODE = "/accountsvc3/refreshAccessCode";
    public static final String PUBLIC_ACTION_WX_BIND = "com.tencent.taiservice.wecarbase.wx_bind";
    public static final String PUBLIC_ACTION_WX_UNBIND = "com.tencent.taiservice.wecarbase.wx_unbind";
    public static final String SDK_VERSION = "SDKVersion";
    public static final int TAES_BIND_VER = 5;
    public static final int TAES_TDF_BIND_VER = 6;
    public static final String TAI_ACCOUNT_ENV = "taes_account_env";
    public static final String TTS_RES_PATH_IFLYTEK_GUANGQI = "/system/speechData/tts/";
    public static final int TYPE_QQ = 1;
    public static final int TYPE_WX = 2;
    public static final String UNINIT_CHANNEL = "";
    public static final int UNSET_URL = -1;
    public static final String URI_ACCOUNT = "/account";
    public static final String URI_PRODUCT_CONFIG = "/config/product";
    public static final String URI_USER_CONFIG = "/config/account";
    public static final String URI_USER_CONFIG_SET = "/config/setAcctConf";
    public static final String URI_WX_BIND_INFO = "/user/bindinfo";
    public static final String URI_WX_QR_CODE_INFO = "/user/bindinfo";
    public static final String URI_WX_UNBIND_CAR = "/user/unbindcar";
    public static final String URI_WX_USER_INFO = "/user/userinfo";
    public static final int USE_URL_DEV = 1;
    public static final int USE_URL_ONLINE = 0;
    public static final int USE_URL_PRE_ONLINE = 2;
    public static final String VERSION_CODE = "VersionCode";
    public static final int WECARID_CHANGED = 11;
    public static final int WECARID_REGISTER = 10;
    public static final int WX_ACCOUNT_LOGIN = 21;
    public static final int WX_ACCOUNT_LOGOUT = 22;
    public static final int WX_ACCOUNT_UPDATE = 23;
    public static final int WX_TICKET_UPDATE = 24;
    public static final String TTS_RES_PATH_IFLYTEK = Environment.getExternalStorageDirectory().getPath() + "/tencent/wecarspeech/data3/tts/";
    public static final String TTS_RES_PATH_DOBBY_LIUQI = Environment.getExternalStorageDirectory().getPath() + "/tencent/wecarspeech/dingdang/res/tts/";
    public static final String TTS_RES_PATH_DOBBY = Environment.getExternalStorageDirectory().getPath() + "/tencent/wecarspeech/data3/dingdang/res/tts/";
    public static final String TTS_RES_PATH_DOBBY_V2 = Environment.getExternalStorageDirectory().getPath() + "/tencent/wecarspeech/data/tts/";
    public static final String TTS_RES_MD5_FROM_SPEECH = Environment.getExternalStorageDirectory().getPath() + "/tencent/wecarspeech/data/md5.log";

    private Constants() {
    }
}
