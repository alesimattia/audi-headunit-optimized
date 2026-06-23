package com.tencent.taes.remote.api.location.nmea;

import android.text.TextUtils;
import java.text.SimpleDateFormat;
import java.util.TimeZone;

/* JADX INFO: loaded from: classes.dex */
public class NmeaParserUtil {
    private SimpleDateFormat mTimeFormat = new SimpleDateFormat("ddMMyy HHmmss.SSS");

    public NmeaParserUtil() {
        this.mTimeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
    }

    public double parseNmeaLatitude(String lat, String orientation) {
        if (lat == null || orientation == null || lat.equals("") || orientation.equals("")) {
            return 0.0d;
        }
        double temp1 = Double.parseDouble(lat);
        double temp2 = Math.floor(temp1 / 100.0d);
        double temp3 = ((temp1 / 100.0d) - temp2) / 0.6d;
        if (orientation.equals("S")) {
            double latitude = -(temp2 + temp3);
            return latitude;
        }
        if (!orientation.equals("N")) {
            return 0.0d;
        }
        double latitude2 = temp2 + temp3;
        return latitude2;
    }

    public double parseNmeaLongitude(String lon, String orientation) {
        if (lon == null || orientation == null || lon.equals("") || orientation.equals("")) {
            return 0.0d;
        }
        double temp1 = Double.parseDouble(lon);
        double temp2 = Math.floor(temp1 / 100.0d);
        double temp3 = ((temp1 / 100.0d) - temp2) / 0.6d;
        if (orientation.equals("W")) {
            double longitude = -(temp2 + temp3);
            return longitude;
        }
        if (!orientation.equals("E")) {
            return 0.0d;
        }
        double longitude2 = temp2 + temp3;
        return longitude2;
    }

    public float parseNmeaSpeed(String speed, String metric) {
        if (speed == null || metric == null || speed.equals("") || metric.equals("")) {
            return 0.0f;
        }
        float temp1 = Float.parseFloat(speed) / 3.6f;
        if (metric.equals("K")) {
            return temp1;
        }
        if (!metric.equals("N")) {
            return 0.0f;
        }
        float meterSpeed = temp1 * 1.852f;
        return meterSpeed;
    }

    public long parseNmeaTime(String date, String time) {
        if (TextUtils.isEmpty(date) || TextUtils.isEmpty(time)) {
            return System.currentTimeMillis();
        }
        try {
            long timestamp = this.mTimeFormat.parse(date + " " + time).getTime();
            return timestamp;
        } catch (Throwable th) {
            return 0L;
        }
    }

    public Double parseNmeaAlt(String s, String u) {
        if (s != null && u != null && !s.equals("") && !u.equals("")) {
            if (u.equals("M") || u.equals("m")) {
                return Double.valueOf(Double.parseDouble(s));
            }
            if (u.equals("KM") || u.equals("km")) {
                return Double.valueOf(Double.parseDouble(s) * 1000.0d);
            }
            return Double.valueOf(Double.parseDouble(s));
        }
        return Double.valueOf(Double.NaN);
    }

    public float parseNmeaFloat(String s) {
        if (s != null && !s.equals("")) {
            return Float.parseFloat(s);
        }
        return Float.NaN;
    }

    public int parseNmeaInt(String s) {
        if (s != null && !s.equals("")) {
            return Integer.parseInt(s);
        }
        return 0;
    }
}
