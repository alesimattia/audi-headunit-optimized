package com.spd.dvr.utils;

import android.content.Context;
import android.os.storage.StorageManager;
import android.os.storage.StorageVolume;
import android.util.Log;
import com.spd.dvr.entity.aidl.FileInfo;
import java.util.ArrayList;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class ToolUtil {
    public static String formatTime(long milliseconds) {
        if (milliseconds <= 0 || milliseconds >= 86400000) {
            return "00:00";
        }
        long totalSeconds = milliseconds / 1000;
        long seconds = totalSeconds % 60;
        long minutes = (totalSeconds / 60) % 60;
        long hours = totalSeconds / 3600;
        StringBuilder stringBuilder = new StringBuilder();
        Formatter mFormatter = new Formatter(stringBuilder, Locale.getDefault());
        return hours > 0 ? mFormatter.format("%d:%02d:%02d", Long.valueOf(hours), Long.valueOf(minutes), Long.valueOf(seconds)).toString() : mFormatter.format("%02d:%02d", Long.valueOf(minutes), Long.valueOf(seconds)).toString();
    }

    public static void savePlayPosition(Context context, String url, int position) {
        context.getSharedPreferences("SPD_MEDIA_PALYER_PLAY_POSITION", 0).edit().putInt(url, position).apply();
    }

    public static int getSavedPlayPosition(Context context, String url) {
        return context.getSharedPreferences("SPD_MEDIA_PALYER_PLAY_POSITION", 0).getInt(url, 0);
    }

    public static class DefaultHashMap<K, V> extends HashMap<K, V> {
        private V mDefaultValue;

        public void putDefault(V defaultValue) {
            this.mDefaultValue = defaultValue;
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public V get(Object obj) {
            V v = (V) super.get(obj);
            return v == null ? this.mDefaultValue : v;
        }

        public K getKey(V toCheck) {
            for (K key : keySet()) {
                V val = get(key);
                if (val.equals(toCheck)) {
                    return key;
                }
            }
            return null;
        }
    }

    public static String getStoragePath(Context mContext, boolean is_removale) {
        StorageManager mStorageManager = (StorageManager) mContext.getSystemService("storage");
        List<StorageVolume> volumes = mStorageManager.getStorageVolumes();
        for (int i = 0; i < volumes.size(); i++) {
            StorageVolume storageVolumeElement = volumes.get(i);
            String path = storageVolumeElement.getPath();
            boolean removable = storageVolumeElement.isRemovable();
            LogUtil.DLOG("getStoragePath:" + path + " removable:" + removable);
            if (is_removale == removable) {
                LogUtil.DLOG("getStoragePath:" + path);
                return path;
            }
        }
        return mContext.getExternalFilesDir(null).getAbsolutePath();
    }

    public static List<String> getPaths(Context mContext, boolean is_removale) {
        List<String> paths = new ArrayList<>();
        StorageManager mStorageManager = (StorageManager) mContext.getSystemService("storage");
        List<StorageVolume> volumes = mStorageManager.getStorageVolumes();
        for (int i = 0; i < volumes.size(); i++) {
            StorageVolume storageVolumeElement = volumes.get(i);
            String path = storageVolumeElement.getPath();
            boolean removable = storageVolumeElement.isRemovable();
            if (is_removale == removable) {
                paths.add(path);
            }
        }
        return paths;
    }

    public static List<FileInfo> diffLists(List<FileInfo> curList, List<FileInfo> preList) {
        List<FileInfo> tempFiles = new ArrayList<>();
        Map<FileInfo, Integer> map = new HashMap<>();
        Iterator<FileInfo> it = curList.iterator();
        while (it.hasNext()) {
            map.put(it.next(), 1);
        }
        for (FileInfo fileInfo : preList) {
            if (map.get(fileInfo) != null) {
                map.put(fileInfo, 2);
            }
        }
        for (Map.Entry<FileInfo, Integer> entry : map.entrySet()) {
            if (entry.getValue().intValue() == 1) {
                tempFiles.add(entry.getKey());
            }
        }
        Log.i("DVR", "diffLists:" + tempFiles.size());
        return tempFiles;
    }

    public static List<FileInfo> sameLists(List<FileInfo> curList, List<FileInfo> preList) {
        List<FileInfo> tempFiles = new ArrayList<>();
        Map<FileInfo, Integer> map = new HashMap<>();
        Iterator<FileInfo> it = curList.iterator();
        while (it.hasNext()) {
            map.put(it.next(), 1);
        }
        for (FileInfo fileInfo : preList) {
            if (map.get(fileInfo) != null) {
                map.put(fileInfo, 2);
                tempFiles.add(fileInfo);
            }
        }
        for (Map.Entry<FileInfo, Integer> entry : map.entrySet()) {
            if (entry.getValue().intValue() == 1) {
                tempFiles.add(entry.getKey());
            }
        }
        Log.i("DVR", "sameLists:" + tempFiles.size());
        return tempFiles;
    }
}
