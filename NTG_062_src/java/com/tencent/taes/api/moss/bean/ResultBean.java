package com.tencent.taes.api.moss.bean;

import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class ResultBean {
    public String version = "";
    public String timestamp = "";
    public String host = "";
    public int acrossTime = -1;
    public String traceId = "";
    public int status = -1;
    public String message = "";
    public List<MiniAppInfo> data = new ArrayList();

    public static ResultBean fromJSON(String json) throws JSONException {
        ResultBean resultBean = new ResultBean();
        JSONObject obj = new JSONObject(json);
        resultBean.version = obj.optString("version");
        resultBean.timestamp = obj.optString("timestamp");
        resultBean.host = obj.optString("host");
        resultBean.acrossTime = obj.optInt("acrossTime");
        resultBean.traceId = obj.optString("traceId");
        resultBean.status = obj.optInt("status");
        resultBean.message = obj.optString("message");
        JSONObject data = obj.optJSONObject("data");
        if (data != null) {
            JSONArray value = data.optJSONArray("value");
            for (int i = 0; i < value.length(); i++) {
                JSONObject item = value.getJSONObject(i);
                resultBean.data.add(createAppDataFromJSON(item.toString()));
            }
        }
        return resultBean;
    }

    public static MiniAppInfo createAppDataFromJSON(String json) throws JSONException {
        MiniAppInfo appData = new MiniAppInfo();
        JSONObject obj = new JSONObject(json);
        appData.id = obj.optInt("id");
        appData.appId = obj.optString("appid");
        appData.pkgName = obj.optString("pkgName");
        appData.cnName = obj.optString("cnName");
        appData.mossUrl = obj.optString("mossUrl");
        appData.logoUrl = obj.optString("logoUrl");
        appData.version = obj.optString("version");
        appData.mossMD5 = obj.optString("mossMD5");
        appData.channelId = obj.optString("channelId");
        appData.pagePath = obj.optString("pagePath");
        return appData;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer("ResultBean{");
        sb.append("version='");
        sb.append(this.version);
        sb.append('\'');
        sb.append(", timestamp='");
        sb.append(this.timestamp);
        sb.append('\'');
        sb.append(", host='");
        sb.append(this.host);
        sb.append('\'');
        sb.append(", acrossTime=");
        sb.append(this.acrossTime);
        sb.append(", traceId='");
        sb.append(this.traceId);
        sb.append('\'');
        sb.append(", status=");
        sb.append(this.status);
        sb.append(", message='");
        sb.append(this.message);
        sb.append('\'');
        sb.append(", data=");
        sb.append(this.data);
        sb.append('}');
        return sb.toString();
    }
}
