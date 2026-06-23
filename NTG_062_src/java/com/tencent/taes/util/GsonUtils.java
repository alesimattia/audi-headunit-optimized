package com.tencent.taes.util;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import java.lang.reflect.Type;

/* JADX INFO: loaded from: classes.dex */
public class GsonUtils {
    private static Gson mGson = new Gson();

    public static String toJson(Object entity) {
        return mGson.toJson(entity);
    }

    public static <T> T fromJson(String str, Class<T> cls) {
        return (T) mGson.fromJson(str, (Class) cls);
    }

    public static <T> T fromJson(String str, Type type) {
        return (T) mGson.fromJson(str, type);
    }

    public static <T> T fromJson(JsonElement jsonElement, Type type) {
        return (T) mGson.fromJson(jsonElement, type);
    }
}
