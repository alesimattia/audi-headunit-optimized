package com.tencent.taes.util.config;

import android.support.annotation.Nullable;
import android.util.Log;
import com.tencent.taes.local.LocalCompConstant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class ConfigInfo {
    private static final String TAG = "ConfigInfo";
    private Map<String, Object> mMap = new HashMap();

    public ConfigInfo(JSONObject jsonObject) {
        if (jsonObject == null) {
            return;
        }
        try {
            Iterator<String> sIterator = jsonObject.keys();
            while (sIterator != null) {
                if (sIterator.hasNext()) {
                    String key = sIterator.next();
                    Log.d(TAG, "--key = " + key);
                    Object obj = jsonObject.get(key);
                    this.mMap.put(key, obj);
                } else {
                    return;
                }
            }
        } catch (JSONException e) {
            Log.e(TAG, "Json parse fail!", e);
        }
    }

    public int getInt(String key) {
        return getInt(key, 0);
    }

    public int getInt(String key, int defaultValue) {
        Object obj = this.mMap.get(key);
        if (obj == null) {
            return defaultValue;
        }
        Integer result = ConfigUtils.toInteger(obj);
        if (result == null) {
            result = Integer.valueOf(defaultValue);
            configLogForInvalid(key, obj, "Int");
        }
        return result.intValue();
    }

    @Nullable
    public String getString(String key) {
        Object obj = this.mMap.get(key);
        if (obj == null) {
            return null;
        }
        String result = ConfigUtils.toString(obj);
        if (result == null) {
            configLogForInvalid(key, obj, "String");
        }
        return result;
    }

    public String getString(String key, String defaultValue) {
        String s = getString(key);
        return s == null ? defaultValue : s;
    }

    public boolean getBoolean(String key) {
        return getBoolean(key, false);
    }

    public boolean getBoolean(String key, boolean defaultValue) {
        Object obj = this.mMap.get(key);
        if (obj == null) {
            return defaultValue;
        }
        Boolean result = ConfigUtils.toBoolean(obj);
        if (result == null) {
            result = Boolean.valueOf(defaultValue);
            configLogForInvalid(key, obj, "boolean");
        }
        return result.booleanValue();
    }

    public int[] getIntArray(String key) {
        Object obj = this.mMap.get(key);
        if (obj == null) {
            return null;
        }
        int[] result = ConfigUtils.toIntArray(obj);
        if (result == null) {
            configLogForInvalid(key, obj, "intArray");
        }
        return result;
    }

    public ArrayList<Integer> getIntegerArrayList(String key) {
        Object obj = this.mMap.get(key);
        if (obj == null) {
            return null;
        }
        ArrayList<Integer> result = ConfigUtils.toIntArrayList(obj);
        if (result == null) {
            configLogForInvalid(key, obj, "integerArrayList");
        }
        return result;
    }

    public String[] getStringArray(String key) {
        Object obj = this.mMap.get(key);
        if (obj == null) {
            return null;
        }
        String[] result = ConfigUtils.toStringArray(obj);
        if (result == null) {
            configLogForInvalid(key, obj, "StringArray");
        }
        return result;
    }

    public ArrayList<String> getStringArrayList(String key) {
        Object obj = this.mMap.get(key);
        if (obj == null) {
            return null;
        }
        ArrayList<String> result = ConfigUtils.toStringArrayList(obj);
        if (result == null) {
            configLogForInvalid(key, obj, "StringArrayList");
        }
        return result;
    }

    public Map<String, Object>[] getMapArray(String key) {
        Object obj = this.mMap.get(key);
        if (obj == null) {
            return null;
        }
        Map<String, Object>[] result = ConfigUtils.toMapArray(obj);
        if (result == null) {
            configLogForInvalid(key, obj, "MapArray");
        }
        return result;
    }

    public ArrayList<Map<String, Object>> getMapArrayList(String key) {
        Object obj = this.mMap.get(key);
        if (obj == null) {
            return null;
        }
        ArrayList<Map<String, Object>> result = ConfigUtils.toMapArrayList(obj);
        if (result == null) {
            configLogForInvalid(key, obj, "MapArrayList");
        }
        return result;
    }

    public Map<String, Object> getMap(String key) {
        Object obj = this.mMap.get(key);
        if (obj == null) {
            return null;
        }
        Map<String, Object> result = ConfigUtils.toMap(obj);
        if (result == null) {
            configLogForInvalid(key, obj, LocalCompConstant.MAP);
        }
        return result;
    }

    private void configLogForInvalid(Object indexOrName, Object actual, String requiredType) {
        Log.e(TAG, "Value " + actual + " at " + indexOrName + " of type " + actual.getClass().getName() + " cannot be converted to Integer");
    }
}
