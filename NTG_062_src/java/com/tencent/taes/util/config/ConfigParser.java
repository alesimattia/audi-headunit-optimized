package com.tencent.taes.util.config;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.tencent.taes.util.FileUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
class ConfigParser {
    private static final String TAG = "ConfigParser";
    private JSONObject mConfigJsonObject = null;
    private Context mContext;
    private String mJsonString;

    ConfigParser(Context context, String filename) {
        this.mJsonString = null;
        this.mContext = context;
        File file = new File(filename);
        if (file.canRead()) {
            this.mJsonString = loadJsonFromSdcard(file);
        } else {
            try {
                this.mJsonString = FileUtils.readAssets(this.mContext, filename);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (!TextUtils.isEmpty(this.mJsonString)) {
            parseJsonString();
        }
    }

    private void parseJsonString() {
        try {
            this.mConfigJsonObject = new JSONObject(this.mJsonString);
        } catch (JSONException e) {
            this.mConfigJsonObject = null;
            Log.e(TAG, "Json parse fail!", e);
        }
    }

    private String loadJsonFromSdcard(File file) {
        try {
            InputStream is = new FileInputStream(file);
            int size = is.available();
            byte[] buffer = new byte[size];
            is.read(buffer);
            is.close();
            return new String(buffer, "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    JSONObject getJSONObject() {
        return this.mConfigJsonObject;
    }

    String getJsonString() {
        return this.mJsonString;
    }
}
