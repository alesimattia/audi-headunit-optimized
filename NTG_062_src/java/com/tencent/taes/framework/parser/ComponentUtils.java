package com.tencent.taes.framework.parser;

import android.support.annotation.Keep;
import com.tencent.taes.framework.parser.ComponentConfigInfo;
import com.tencent.taes.util.config.ConfigInfo;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
@Keep
public class ComponentUtils {
    public static List<ComponentConfigInfo> parseConfig(ConfigInfo configInfo) {
        String actionName;
        ArrayList<Map<String, Object>> mapArrayList;
        int length;
        JSONArray jsonObject;
        JSONArray jsonObject2;
        boolean parallelLoad;
        List<ComponentConfigInfo.SupportFeaturesBean> featuresBeans;
        List<ComponentConfigInfo> componentConfigInfos = new ArrayList<>();
        ArrayList<Map<String, Object>> mapArrayList2 = configInfo.getMapArrayList(ConfigConstant.CONFIG_KEY_MODULES);
        if (mapArrayList2 == null || mapArrayList2.size() == 0) {
            return componentConfigInfos;
        }
        int length2 = mapArrayList2.size();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= length2) {
                return componentConfigInfos;
            }
            Map<String, Object> map = mapArrayList2.get(i2);
            if (map == null) {
                mapArrayList = mapArrayList2;
                length = length2;
            } else {
                String name = (String) map.get(ConfigConstant.CONFIG_KEY_NAME);
                String moduleClsName = "";
                if (map.containsKey(ConfigConstant.CONFIG_KEY_LC_CLS_NAME)) {
                    moduleClsName = (String) map.get(ConfigConstant.CONFIG_KEY_LC_CLS_NAME);
                }
                String moduleClsName2 = moduleClsName;
                String appClsName = map.containsKey(ConfigConstant.CONFIG_KEY_APP_LC_CLS) ? (String) map.get(ConfigConstant.CONFIG_KEY_APP_LC_CLS) : "";
                String appClsName2 = appClsName;
                String desc = map.containsKey(ConfigConstant.CONFIG_KEY_DESC) ? (String) map.get(ConfigConstant.CONFIG_KEY_DESC) : "";
                String desc2 = desc;
                String type = map.containsKey("type") ? (String) map.get("type") : "";
                String type2 = type;
                boolean bootCompleteLoad = map.containsKey(ConfigConstant.CONFIG_KEY_BOOTCOMPLETE) ? ((Boolean) map.get(ConfigConstant.CONFIG_KEY_BOOTCOMPLETE)).booleanValue() : false;
                boolean bootCompleteLoad2 = bootCompleteLoad;
                boolean necessaryLoad = map.containsKey(ConfigConstant.CONFIG_KEY_NECESSARY) ? ((Boolean) map.get(ConfigConstant.CONFIG_KEY_NECESSARY)).booleanValue() : true;
                boolean necessaryLoad2 = necessaryLoad;
                boolean persistent = map.containsKey(ConfigConstant.CONFIG_KEY_PERSISTENT) ? ((Boolean) map.get(ConfigConstant.CONFIG_KEY_PERSISTENT)).booleanValue() : true;
                boolean persistent2 = persistent;
                boolean parallelLoad2 = map.containsKey(ConfigConstant.CONFIG_KEY_PARALLEL) ? ((Boolean) map.get(ConfigConstant.CONFIG_KEY_PARALLEL)).booleanValue() : false;
                if (!map.containsKey(ConfigConstant.CONFIG_KEY_ACTION_NAME)) {
                    actionName = "";
                } else {
                    String actionName2 = (String) map.get(ConfigConstant.CONFIG_KEY_ACTION_NAME);
                    actionName = actionName2;
                }
                ComponentConfigInfo componentConfigInfo = new ComponentConfigInfo();
                mapArrayList = mapArrayList2;
                componentConfigInfo.setName(name);
                componentConfigInfo.setDesc(desc2);
                componentConfigInfo.setType(type2);
                componentConfigInfo.setLifecycleImpCls(moduleClsName2);
                componentConfigInfo.setApplicationApiImplCls(appClsName2);
                componentConfigInfo.setBootCompleteLoad(bootCompleteLoad2);
                componentConfigInfo.setNecessaryLoad(necessaryLoad2);
                componentConfigInfo.setParallelLoad(parallelLoad2);
                componentConfigInfo.setPersistent(persistent2);
                componentConfigInfo.setActionName(actionName);
                if (map.containsKey(ConfigConstant.CONFIG_KEY_SUPPORT_FEATURES) && (jsonObject = (JSONArray) map.get(ConfigConstant.CONFIG_KEY_SUPPORT_FEATURES)) != null) {
                    List<ComponentConfigInfo.SupportFeaturesBean> featuresBeans2 = new ArrayList<>();
                    int j = 0;
                    while (true) {
                        int j2 = j;
                        int j3 = jsonObject.length();
                        length = length2;
                        if (j2 >= j3) {
                            break;
                        }
                        try {
                            JSONObject jsonObject1 = jsonObject.getJSONObject(j2);
                            jsonObject2 = jsonObject;
                            try {
                                ComponentConfigInfo.SupportFeaturesBean supportFeaturesBean = new ComponentConfigInfo.SupportFeaturesBean();
                                parallelLoad = parallelLoad2;
                                try {
                                    supportFeaturesBean.setApi(jsonObject1.optString(ConfigConstant.CONFIG_KEY_SUPPORT_FEATURES_API));
                                    supportFeaturesBean.setApiImpl(jsonObject1.optString(ConfigConstant.CONFIG_KEY_SUPPORT_FEATURES_API_IMPL));
                                    supportFeaturesBean.setBinderName(jsonObject1.optString(ConfigConstant.CONFIG_KEY_SUPPORT_FEATURES_BINDER));
                                    featuresBeans = featuresBeans2;
                                    try {
                                        featuresBeans.add(supportFeaturesBean);
                                    } catch (JSONException e) {
                                        e = e;
                                        e.printStackTrace();
                                    }
                                } catch (JSONException e2) {
                                    e = e2;
                                    featuresBeans = featuresBeans2;
                                }
                            } catch (JSONException e3) {
                                e = e3;
                                parallelLoad = parallelLoad2;
                                featuresBeans = featuresBeans2;
                            }
                        } catch (JSONException e4) {
                            e = e4;
                            jsonObject2 = jsonObject;
                            parallelLoad = parallelLoad2;
                            featuresBeans = featuresBeans2;
                        }
                        j = j2 + 1;
                        featuresBeans2 = featuresBeans;
                        length2 = length;
                        jsonObject = jsonObject2;
                        parallelLoad2 = parallelLoad;
                    }
                    componentConfigInfo.setSupportFeatures(featuresBeans2);
                } else {
                    length = length2;
                }
                if (map.containsKey(ConfigConstant.CONFIG_KEY_CONNECT_NAMES)) {
                    try {
                        JSONArray jsonArray = (JSONArray) map.get(ConfigConstant.CONFIG_KEY_CONNECT_NAMES);
                        if (jsonArray != null) {
                            String[] pkgs = new String[jsonArray.length()];
                            for (int j4 = 0; j4 < jsonArray.length(); j4++) {
                                pkgs[j4] = jsonArray.getString(j4);
                            }
                            componentConfigInfo.setConnectPriorityPkgNames(pkgs);
                        }
                    } catch (JSONException e5) {
                        e5.printStackTrace();
                    }
                }
                componentConfigInfos.add(componentConfigInfo);
            }
            i = i2 + 1;
            mapArrayList2 = mapArrayList;
            length2 = length;
        }
    }

    public static List<ComponentConfigInfo> getServerComponents(ConfigInfo configInfo) {
        List<ComponentConfigInfo> configInfos = parseConfig(configInfo);
        List<ComponentConfigInfo> serverConfigInfos = new ArrayList<>();
        for (ComponentConfigInfo componentConfigInfo : configInfos) {
            if (componentConfigInfo.isServerComponent()) {
                serverConfigInfos.add(componentConfigInfo);
            }
        }
        return serverConfigInfos;
    }

    public static List<ComponentConfigInfo> getNecessaryServerComponents(ConfigInfo configInfo) {
        List<ComponentConfigInfo> configInfos = parseConfig(configInfo);
        List<ComponentConfigInfo> serverConfigInfos = new ArrayList<>();
        for (ComponentConfigInfo componentConfigInfo : configInfos) {
            if (componentConfigInfo.isServerComponent() && componentConfigInfo.isNecessaryLoad()) {
                serverConfigInfos.add(componentConfigInfo);
            }
        }
        return serverConfigInfos;
    }

    public static List<ComponentConfigInfo> getBootCompleteServerComponents(ConfigInfo configInfo) {
        List<ComponentConfigInfo> configInfos = parseConfig(configInfo);
        List<ComponentConfigInfo> serverConfigInfos = new ArrayList<>();
        for (ComponentConfigInfo componentConfigInfo : configInfos) {
            if (componentConfigInfo.isServerComponent() && componentConfigInfo.isBootCompleteLoad()) {
                serverConfigInfos.add(componentConfigInfo);
            }
        }
        return serverConfigInfos;
    }

    public static List<ComponentConfigInfo> getLocalComponents(ConfigInfo configInfo) {
        List<ComponentConfigInfo> configInfos = parseConfig(configInfo);
        List<ComponentConfigInfo> localConfigInfos = new ArrayList<>();
        for (ComponentConfigInfo componentConfigInfo : configInfos) {
            if (componentConfigInfo.isLocalComponent()) {
                localConfigInfos.add(componentConfigInfo);
            }
        }
        return localConfigInfos;
    }

    public static List<ComponentConfigInfo> filterServerComponents(List<ComponentConfigInfo> configInfos) {
        List<ComponentConfigInfo> serverConfigs = new ArrayList<>();
        for (ComponentConfigInfo componentConfigInfo : configInfos) {
            if (componentConfigInfo.isServerComponent()) {
                serverConfigs.add(componentConfigInfo);
            }
        }
        return serverConfigs;
    }

    public static List<ComponentConfigInfo> filterLocalComponents(List<ComponentConfigInfo> configInfos) {
        List<ComponentConfigInfo> localConfigs = new ArrayList<>();
        for (ComponentConfigInfo componentConfigInfo : configInfos) {
            if (componentConfigInfo.isLocalComponent()) {
                localConfigs.add(componentConfigInfo);
            }
        }
        return localConfigs;
    }

    public static List<ComponentConfigInfo> filterNecessaryServerComponents(List<ComponentConfigInfo> configInfos) {
        List<ComponentConfigInfo> necessaryLoad = new ArrayList<>();
        for (ComponentConfigInfo configInfo : configInfos) {
            if (configInfo.isNecessaryLoad() && configInfo.isServerComponent()) {
                necessaryLoad.add(configInfo);
            }
        }
        return necessaryLoad;
    }
}
