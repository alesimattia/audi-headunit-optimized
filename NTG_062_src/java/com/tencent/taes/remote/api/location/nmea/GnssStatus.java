package com.tencent.taes.remote.api.location.nmea;

import android.location.Location;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;
import android.util.SparseIntArray;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class GnssStatus {
    static final int GPS_EVENT_FIRST_FIX = 3;
    static final int GPS_EVENT_SATELLITE_STATUS = 4;
    static final int GPS_EVENT_STARTED = 1;
    static final int GPS_EVENT_STOPPED = 2;
    public static final int SIGNAL_LEVEL_1 = 1;
    public static final int SIGNAL_LEVEL_2 = 2;
    public static final int SIGNAL_LEVEL_3 = 3;
    public static final int SIGNAL_LEVEL_4 = 4;
    public static final int SIGNAL_LEVEL_5 = 5;
    private float HDOP;
    private float PDOP;
    private float VDOP;
    private double altitude;
    private float angle;
    private int fixMode;
    private long fixTimestamp;
    private double height;
    private double latitude;
    private double longitude;
    private int mUsedSatelliteNum;
    private String mode;
    private int nbsat;
    private int numSatellites;
    private float precision;
    private int quality;
    private float speed;
    private long startTimestamp;
    private long timestamp;
    private long firstFixTimestamp = 0;
    private boolean mShouldCopySatelliteList = true;
    private SparseIntArray mUsedSatelliteArray = new SparseIntArray();
    private List<GnssSatellite> mCurrentGnssSatelliteList = new ArrayList();
    private List<GnssSatellite> mGnssSatelliteListCopy = new ArrayList();
    private boolean hasFixed = false;

    public interface Listener {
        void onGnssStatusChanged(int i, GnssStatus gnssStatus);
    }

    void addUsedSatellite(int rpn) {
        this.mUsedSatelliteArray.put(rpn, rpn);
    }

    void clearUsedSatellite() {
        Log.e("GSA", "clearUsedSatellite");
        this.mUsedSatelliteArray.clear();
    }

    synchronized void setShouldCopySatelliteList(boolean shouldCopySatelliteList) {
        this.mShouldCopySatelliteList = shouldCopySatelliteList;
        if (!shouldCopySatelliteList) {
            this.mCurrentGnssSatelliteList.clear();
            this.mGnssSatelliteListCopy.clear();
        }
    }

    void addSatellite(GnssSatellite sat) {
        this.mCurrentGnssSatelliteList.add(sat);
    }

    void clearSatellitesList() {
        this.mCurrentGnssSatelliteList.clear();
    }

    public synchronized int getFixSatelliteCount() {
        return this.mUsedSatelliteNum;
    }

    public synchronized List<GnssSatellite> getSatellites() {
        List<GnssSatellite> gnssSatelliteList;
        try {
            gnssSatelliteList = new ArrayList<>(this.mGnssSatelliteListCopy.size());
            for (int i = 0; i < this.mGnssSatelliteListCopy.size(); i++) {
                gnssSatelliteList.add(this.mGnssSatelliteListCopy.get(i).copy());
            }
        } catch (Throwable th) {
            return new ArrayList();
        }
        return gnssSatelliteList;
    }

    synchronized GnssStatus copySatellite() {
        this.mUsedSatelliteNum = this.mUsedSatelliteArray.size();
        if (this.mShouldCopySatelliteList) {
            this.mGnssSatelliteListCopy.clear();
            for (int i = 0; i < this.mCurrentGnssSatelliteList.size(); i++) {
                GnssSatellite satellite = this.mCurrentGnssSatelliteList.get(i);
                boolean usedInFix = this.mUsedSatelliteArray.indexOfKey(satellite.getPrn()) >= 0;
                satellite.setUsedInFix(usedInFix);
                this.mGnssSatelliteListCopy.add(satellite);
            }
            Collections.sort(this.mGnssSatelliteListCopy, new Comparator<GnssSatellite>() { // from class: com.tencent.taes.remote.api.location.nmea.GnssStatus.1
                @Override // java.util.Comparator
                public int compare(GnssSatellite lhs, GnssSatellite rhs) {
                    return lhs.getPrn() - rhs.getPrn();
                }
            });
        }
        return this;
    }

    void clearTTFF() {
        this.firstFixTimestamp = 0L;
    }

    long getTTFF() {
        if (this.firstFixTimestamp == 0 || this.startTimestamp == 0 || this.firstFixTimestamp < this.startTimestamp) {
            return 0L;
        }
        return this.firstFixTimestamp - this.startTimestamp;
    }

    long getFixTimestamp() {
        return this.fixTimestamp;
    }

    void setFixTimestamp(long timestamp) {
        this.timestamp = timestamp;
        this.fixTimestamp = timestamp;
        if (this.firstFixTimestamp == 0) {
            this.firstFixTimestamp = timestamp;
        }
    }

    void setTimestamp(long timestamp) {
        if (this.startTimestamp == 0) {
            this.startTimestamp = timestamp;
        }
        if (this.timestamp != timestamp) {
            this.numSatellites = 0;
        }
        this.timestamp = timestamp;
    }

    long getTimestamp() {
        return this.timestamp;
    }

    public boolean hasFixed() {
        return this.hasFixed;
    }

    void setFixed(boolean fixed) {
        this.hasFixed = fixed;
    }

    void clear() {
        clearTTFF();
        clearSatellitesList();
        this.timestamp = 0L;
        this.startTimestamp = 0L;
        this.fixTimestamp = 0L;
        this.precision = 10.0f;
        this.PDOP = 0.0f;
        this.HDOP = 0.0f;
        this.VDOP = 0.0f;
        this.latitude = 0.0d;
        this.longitude = 0.0d;
        this.altitude = 0.0d;
        this.height = 0.0d;
        this.speed = 0.0f;
        this.angle = 0.0f;
        this.nbsat = 0;
        this.numSatellites = 0;
        this.fixMode = 0;
        this.quality = 0;
        this.mode = "N";
    }

    Location getFixLocation() {
        Location fix = new Location("gps");
        if (Build.VERSION.SDK_INT >= 17) {
            fix.setElapsedRealtimeNanos(SystemClock.elapsedRealtimeNanos());
        }
        fix.setLatitude(this.latitude);
        fix.setLongitude(this.longitude);
        fix.setAccuracy(this.HDOP * 5.0f);
        fix.setTime(this.fixTimestamp);
        fix.setAltitude(this.altitude);
        Bundle extras = new Bundle();
        extras.putInt("satellites", this.nbsat);
        fix.setExtras(extras);
        fix.setBearing(this.angle);
        fix.setSpeed(this.speed);
        return fix;
    }

    double getLatitude() {
        return this.latitude;
    }

    void setLatitude(double lat) {
        this.latitude = lat;
    }

    double getLongitude() {
        return this.longitude;
    }

    void setLongitude(double lon) {
        this.longitude = lon;
    }

    double getAltitude() {
        return this.altitude;
    }

    void setAltitude(double alt) {
        this.altitude = alt;
    }

    float getPrecision() {
        return this.precision;
    }

    void setPrecision(float p) {
        this.precision = p;
    }

    public double getPDOP() {
        return this.PDOP;
    }

    void setPDOP(float dop) {
        this.PDOP = dop;
    }

    public double getHDOP() {
        return this.HDOP;
    }

    void setHDOP(float dop) {
        this.HDOP = dop;
    }

    public double getVDOP() {
        return this.VDOP;
    }

    void setVDOP(float dop) {
        this.VDOP = dop;
    }

    double getHeight() {
        return this.height;
    }

    void setHeight(double height) {
        this.height = height;
    }

    float getSpeed() {
        return this.speed;
    }

    void setSpeed(float speed) {
        this.speed = speed;
    }

    double getBearing() {
        return this.angle;
    }

    void setBearing(float angle) {
        this.angle = angle;
    }

    int getQuality() {
        return this.quality;
    }

    void setQuality(int q) {
        this.quality = q;
    }

    int getNbSat() {
        return this.nbsat;
    }

    void setNbSat(int sat) {
        this.nbsat = sat;
    }

    String getMode() {
        return this.mode;
    }

    void setMode(String mode) {
        this.mode = mode;
    }

    int getNumSatellites() {
        return this.numSatellites;
    }

    void setNumSatellites(int num) {
        this.numSatellites = num;
    }

    void addNumSatellites(int num) {
        this.numSatellites += num;
    }

    int getFixMode() {
        return this.fixMode;
    }

    void setFixMode(int mode) {
        this.fixMode = mode;
    }

    public synchronized int getSignalLevel() {
        int count45 = 0;
        int count40 = 0;
        int count35 = 0;
        int count30 = 0;
        for (int i = 0; i < this.mGnssSatelliteListCopy.size(); i++) {
            GnssSatellite satellite = this.mGnssSatelliteListCopy.get(i);
            float snr = satellite.getSnr();
            if (snr >= 45.0f) {
                count45++;
            }
            if (snr >= 40.0f) {
                count40++;
            }
            if (snr >= 35.0f) {
                count35++;
            }
            if (snr >= 30.0f) {
                count30++;
            }
        }
        if (count45 >= 3) {
            return 1;
        }
        if (count40 >= 2) {
            return 2;
        }
        if (count35 >= 2) {
            return 3;
        }
        if (count30 >= 2) {
            return 4;
        }
        return 5;
    }

    Location getEmptyLocation() {
        Location fix = new Location("gps");
        if (Build.VERSION.SDK_INT >= 17) {
            fix.setElapsedRealtimeNanos(SystemClock.elapsedRealtimeNanos());
        }
        fix.setLatitude(0.0d);
        fix.setLongitude(0.0d);
        fix.setAccuracy(0.0f);
        fix.setTime(0L);
        fix.setAltitude(0.0d);
        Bundle extras = new Bundle();
        extras.putInt("satellites", 0);
        fix.setExtras(extras);
        fix.setBearing(0.0f);
        fix.setSpeed(0.0f);
        return fix;
    }
}
