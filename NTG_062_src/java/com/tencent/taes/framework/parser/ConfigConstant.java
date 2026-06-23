package com.tencent.taes.framework.parser;

import com.tencent.taes.base.api.INoProguard;

/* JADX INFO: loaded from: classes.dex */
public interface ConfigConstant extends INoProguard {
    public static final String ACTION_CREATE_SMS = "com.tencent.taes.framework.CREATE_SMS";
    public static final String ACTION_SMS_REGISTER_BINDER = "com.tencent.taes.framework.REGISTER_BINDE";
    public static final String CONFIG_FILE_NAME = "component_config.json";
    public static final String CONFIG_FILE_PATH = "sdcard/tencent/wecar/config/";
    public static final String CONFIG_KEY_ACTION_NAME = "actionName";
    public static final String CONFIG_KEY_APP_ALIAS = "alias";
    public static final String CONFIG_KEY_APP_ID = "appId";
    public static final String CONFIG_KEY_APP_LC_CLS = "applicationApiImplCls";
    public static final String CONFIG_KEY_BOOTCOMPLETE = "bootCompleteLoad";
    public static final String CONFIG_KEY_CONNECT_NAMES = "connectPriorityPkgNames";
    public static final String CONFIG_KEY_CONNECT_SMS_NAMES = "connectSMSPriorityPkgNames";
    public static final String CONFIG_KEY_DESC = "desc";
    public static final String CONFIG_KEY_LC_CLS_NAME = "lifecycleImpCls";
    public static final String CONFIG_KEY_MODULES = "components";
    public static final String CONFIG_KEY_NAME = "name";
    public static final String CONFIG_KEY_NECESSARY = "necessaryLoad";
    public static final String CONFIG_KEY_PARALLEL = "parallelLoad";
    public static final String CONFIG_KEY_PERSISTENT = "persistent";
    public static final String CONFIG_KEY_SUPPORT_FEATURES = "supportFeatures";
    public static final String CONFIG_KEY_SUPPORT_FEATURES_API = "api";
    public static final String CONFIG_KEY_SUPPORT_FEATURES_API_IMPL = "apiImpl";
    public static final String CONFIG_KEY_SUPPORT_FEATURES_BINDER = "binderName";
    public static final String CONFIG_KEY_TYPE = "type";
    public static final String INTENT_API_ACTION = "intentApiAction";
    public static final String INTENT_URI_SCHEME = "intentApiScheme";
    public static final String METE_DATA_SUPPORT_SMS_ROUTE = "SUPPORT_SMS_ROUTE";
}
