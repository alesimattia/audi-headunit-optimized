package com.tencent.taes.util;

/* JADX INFO: loaded from: classes.dex */
public class ArrayUtils {
    private ArrayUtils() {
        throw new AssertionError();
    }

    public static <V> boolean isEmpty(V[] sourceArray) {
        return sourceArray == null || sourceArray.length == 0;
    }

    public static <V> V getLast(V[] sourceArray, V value, V defaultValue, boolean isCircle) {
        if (isEmpty(sourceArray)) {
            return defaultValue;
        }
        int currentPosition = -1;
        int i = 0;
        while (true) {
            if (i >= sourceArray.length) {
                break;
            }
            if (!ObjectUtils.isEquals(value, sourceArray[i])) {
                i++;
            } else {
                currentPosition = i;
                break;
            }
        }
        if (currentPosition == -1) {
            return defaultValue;
        }
        if (currentPosition == 0) {
            return isCircle ? sourceArray[sourceArray.length - 1] : defaultValue;
        }
        return sourceArray[currentPosition - 1];
    }

    public static <V> V getNext(V[] sourceArray, V value, V defaultValue, boolean isCircle) {
        if (isEmpty(sourceArray)) {
            return defaultValue;
        }
        int currentPosition = -1;
        int i = 0;
        while (true) {
            if (i >= sourceArray.length) {
                break;
            }
            if (!ObjectUtils.isEquals(value, sourceArray[i])) {
                i++;
            } else {
                currentPosition = i;
                break;
            }
        }
        if (currentPosition == -1) {
            return defaultValue;
        }
        if (currentPosition == sourceArray.length - 1) {
            return isCircle ? sourceArray[0] : defaultValue;
        }
        return sourceArray[currentPosition + 1];
    }

    public static <V> V getLast(V[] vArr, V v, boolean z) {
        return (V) getLast(vArr, v, (Object) null, z);
    }

    public static <V> V getNext(V[] vArr, V v, boolean z) {
        return (V) getNext(vArr, v, (Object) null, z);
    }

    public static long getLast(long[] sourceArray, long value, long defaultValue, boolean isCircle) {
        if (sourceArray.length == 0) {
            throw new IllegalArgumentException("The length of source array must be greater than 0.");
        }
        Long[] array = ObjectUtils.transformLongArray(sourceArray);
        return ((Long) getLast(array, Long.valueOf(value), Long.valueOf(defaultValue), isCircle)).longValue();
    }

    public static long getNext(long[] sourceArray, long value, long defaultValue, boolean isCircle) {
        if (sourceArray.length == 0) {
            throw new IllegalArgumentException("The length of source array must be greater than 0.");
        }
        Long[] array = ObjectUtils.transformLongArray(sourceArray);
        return ((Long) getNext(array, Long.valueOf(value), Long.valueOf(defaultValue), isCircle)).longValue();
    }

    public static int getLast(int[] sourceArray, int value, int defaultValue, boolean isCircle) {
        if (sourceArray.length == 0) {
            throw new IllegalArgumentException("The length of source array must be greater than 0.");
        }
        Integer[] array = ObjectUtils.transformIntArray(sourceArray);
        return ((Integer) getLast(array, Integer.valueOf(value), Integer.valueOf(defaultValue), isCircle)).intValue();
    }

    public static int getNext(int[] sourceArray, int value, int defaultValue, boolean isCircle) {
        if (sourceArray.length == 0) {
            throw new IllegalArgumentException("The length of source array must be greater than 0.");
        }
        Integer[] array = ObjectUtils.transformIntArray(sourceArray);
        return ((Integer) getNext(array, Integer.valueOf(value), Integer.valueOf(defaultValue), isCircle)).intValue();
    }
}
