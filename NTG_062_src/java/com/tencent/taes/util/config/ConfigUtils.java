package com.tencent.taes.util.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
class ConfigUtils {
    ConfigUtils() {
    }

    static Boolean toBoolean(Object value) {
        if (value instanceof Boolean) {
            return (Boolean) value;
        }
        if (value instanceof String) {
            String stringValue = (String) value;
            if ("true".equalsIgnoreCase(stringValue)) {
                return true;
            }
            if ("false".equalsIgnoreCase(stringValue)) {
                return false;
            }
            return null;
        }
        return null;
    }

    static Double toDouble(Object value) {
        if (value instanceof Double) {
            return (Double) value;
        }
        if (value instanceof Number) {
            return Double.valueOf(((Number) value).doubleValue());
        }
        if (value instanceof String) {
            try {
                return Double.valueOf((String) value);
            } catch (NumberFormatException e) {
                return null;
            }
        }
        return null;
    }

    static Integer toInteger(Object value) {
        if (value instanceof Integer) {
            return (Integer) value;
        }
        if (value instanceof Number) {
            return Integer.valueOf(((Number) value).intValue());
        }
        if (value instanceof String) {
            try {
                return Integer.valueOf((int) Double.parseDouble((String) value));
            } catch (NumberFormatException e) {
                return null;
            }
        }
        return null;
    }

    static Long toLong(Object value) {
        if (value instanceof Long) {
            return (Long) value;
        }
        if (value instanceof Number) {
            return Long.valueOf(((Number) value).longValue());
        }
        if (value instanceof String) {
            try {
                return Long.valueOf((long) Double.parseDouble((String) value));
            } catch (NumberFormatException e) {
                return null;
            }
        }
        return null;
    }

    static String toString(Object value) {
        if (value instanceof String) {
            return (String) value;
        }
        if (value != null) {
            return String.valueOf(value);
        }
        return null;
    }

    static int[] toIntArray(Object value) {
        if (!(value instanceof JSONArray)) {
            return null;
        }
        JSONArray jsonArray = (JSONArray) value;
        int length = jsonArray.length();
        int[] intArray = new int[length];
        for (int i = 0; i < length; i++) {
            try {
                intArray[i] = jsonArray.getInt(i);
            } catch (JSONException e) {
                e.printStackTrace();
                return null;
            }
        }
        return intArray;
    }

    static ArrayList<Integer> toIntArrayList(Object value) {
        if (!(value instanceof JSONArray)) {
            return null;
        }
        JSONArray jsonArray = (JSONArray) value;
        int length = jsonArray.length();
        ArrayList<Integer> intList = new ArrayList<>();
        for (int i = 0; i < length; i++) {
            try {
                intList.add(Integer.valueOf(jsonArray.getInt(i)));
            } catch (JSONException e) {
                e.printStackTrace();
                return null;
            }
        }
        return intList;
    }

    static String[] toStringArray(Object value) {
        if (!(value instanceof JSONArray)) {
            return null;
        }
        JSONArray jsonArray = (JSONArray) value;
        int length = jsonArray.length();
        String[] StringArray = new String[length];
        for (int i = 0; i < length; i++) {
            try {
                StringArray[i] = jsonArray.getString(i);
            } catch (JSONException e) {
                e.printStackTrace();
                return null;
            }
        }
        return StringArray;
    }

    static ArrayList<String> toStringArrayList(Object value) {
        if (!(value instanceof JSONArray)) {
            return null;
        }
        JSONArray jsonArray = (JSONArray) value;
        int length = jsonArray.length();
        ArrayList<String> stringList = new ArrayList<>();
        for (int i = 0; i < length; i++) {
            try {
                stringList.add(jsonArray.getString(i));
            } catch (JSONException e) {
                e.printStackTrace();
                return null;
            }
        }
        return stringList;
    }

    static Map<String, Object>[] toMapArray(Object value) {
        if (!(value instanceof JSONArray)) {
            return null;
        }
        JSONArray jsonArray = (JSONArray) value;
        int length = jsonArray.length();
        Map<String, Object>[] mapArray = new Map[length];
        for (int i = 0; i < length; i++) {
            try {
                mapArray[i] = new HashMap();
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                Iterator<String> sIterator = jsonObject.keys();
                while (sIterator.hasNext()) {
                    String key = sIterator.next();
                    Object obj = jsonObject.get(key);
                    mapArray[i].put(key, obj);
                }
            } catch (JSONException e) {
                e.printStackTrace();
                return null;
            }
        }
        return mapArray;
    }

    static ArrayList<Map<String, Object>> toMapArrayList(Object value) {
        if (!(value instanceof JSONArray)) {
            return null;
        }
        JSONArray jsonArray = (JSONArray) value;
        int length = jsonArray.length();
        ArrayList<Map<String, Object>> mapList = new ArrayList<>();
        for (int i = 0; i < length; i++) {
            try {
                Map<String, Object> map = new HashMap<>();
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                Iterator<String> sIterator = jsonObject.keys();
                while (sIterator.hasNext()) {
                    String key = sIterator.next();
                    Object obj = jsonObject.get(key);
                    map.put(key, obj);
                }
                mapList.add(map);
            } catch (JSONException e) {
                e.printStackTrace();
                return null;
            }
        }
        return mapList;
    }

    static Map<String, Object> toMap(Object value) {
        if (!(value instanceof JSONObject)) {
            return null;
        }
        JSONObject jsonObject = (JSONObject) value;
        Map<String, Object> map = new HashMap<>();
        try {
            Iterator<String> sIterator = jsonObject.keys();
            while (sIterator.hasNext()) {
                String key = sIterator.next();
                Object obj = jsonObject.get(key);
                map.put(key, obj);
            }
            return map;
        } catch (JSONException e) {
            e.printStackTrace();
            return null;
        }
    }
}
