package com.tencent.taes.remote.api.location.nmea;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import com.tencent.taes.remote.api.location.nmea.GnssStatus;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class NmeaParser {
    private static final int GPS_FIXED = 3;
    private static final int GPS_NONE = 0;
    private static final int GPS_NOTIFY = 4;
    private static final String TAG = "NMEA";
    private GnssStatus mGnssStatus;
    private GnssStatus.Listener mGpsStatusListener;
    private Handler mHandler;
    private NmeaLocationListener mLocationListener;
    private int mCurrentGpsStatus = 0;
    private ArrayList<Integer> activeSatellites = new ArrayList<>();
    private TextUtils.SimpleStringSplitter mNmeaSplitter = new TextUtils.SimpleStringSplitter(',');
    private boolean mShouldParseStatellite = true;
    private NmeaParserUtil mParserUtil = new NmeaParserUtil();

    public void start() {
        HandlerThread handlerThread = new HandlerThread(TAG);
        handlerThread.start();
        Looper looper = handlerThread.getLooper();
        if (looper == null) {
            Log.e(TAG, "nmea handler looper create fail");
            looper = Looper.getMainLooper();
        }
        start(looper);
    }

    public void start(Looper looper) {
        this.mGnssStatus = new GnssStatus();
        this.mGnssStatus.setShouldCopySatelliteList(this.mShouldParseStatellite);
        this.mHandler = new Handler(looper) { // from class: com.tencent.taes.remote.api.location.nmea.NmeaParser.1
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                NmeaParser.this.parse((String) msg.obj);
            }
        };
    }

    public void close() {
        Looper looper;
        if (this.mHandler != null && (looper = this.mHandler.getLooper()) != null && looper != Looper.getMainLooper()) {
            looper.quit();
        }
    }

    public void parseNmea(String nmea) {
        Message message = this.mHandler.obtainMessage();
        message.obj = nmea;
        this.mHandler.sendMessage(message);
    }

    public void setLocationListener(NmeaLocationListener locationListener) {
        this.mLocationListener = locationListener;
    }

    public void setGnssStatusListener(GnssStatus.Listener statusListener) {
        this.mGpsStatusListener = statusListener;
    }

    public void setParseStatellite(final boolean parseStatellite) {
        if (this.mHandler != null) {
            this.mHandler.post(new Runnable() { // from class: com.tencent.taes.remote.api.location.nmea.NmeaParser.2
                @Override // java.lang.Runnable
                public void run() {
                    NmeaParser.this.mShouldParseStatellite = parseStatellite;
                    if (NmeaParser.this.mGnssStatus != null) {
                        NmeaParser.this.mGnssStatus.setShouldCopySatelliteList(parseStatellite);
                    }
                }
            });
            return;
        }
        this.mShouldParseStatellite = parseStatellite;
        if (this.mGnssStatus != null) {
            this.mGnssStatus.setShouldCopySatelliteList(parseStatellite);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void parse(String nmea) {
        if (nmea == null || nmea.length() < 6) {
            return;
        }
        String shortCmd = nmea.substring(3, 6);
        byte b = -1;
        int iHashCode = shortCmd.hashCode();
        if (iHashCode != 70497) {
            if (iHashCode != 70869) {
                if (iHashCode != 70890) {
                    if (iHashCode == 81256 && shortCmd.equals("RMC")) {
                        b = 1;
                    }
                } else if (shortCmd.equals("GSV")) {
                    b = 3;
                }
            } else if (shortCmd.equals("GSA")) {
                b = 2;
            }
        } else if (shortCmd.equals("GGA")) {
            b = 0;
        }
        switch (b) {
            case 0:
                this.mNmeaSplitter.setString(nmea.substring(7, nmea.lastIndexOf("*")));
                if (parseGGA()) {
                    this.mCurrentGpsStatus = 3;
                } else {
                    this.mCurrentGpsStatus = 4;
                }
                this.mGnssStatus.copySatellite();
                if (this.mGpsStatusListener != null) {
                    try {
                        this.mGpsStatusListener.onGnssStatusChanged(4, this.mGnssStatus);
                    } catch (Throwable e) {
                        e.printStackTrace();
                    }
                }
                this.mGnssStatus.clearSatellitesList();
                this.mGnssStatus.clearUsedSatellite();
                break;
            case 1:
                this.mNmeaSplitter.setString(nmea.substring(7, nmea.lastIndexOf("*")));
                if (parseRMC()) {
                    this.mCurrentGpsStatus = 3;
                    if (this.mLocationListener != null) {
                        this.mLocationListener.onNmeaLocationChanged(this.mGnssStatus.getFixLocation(), this.mGnssStatus);
                    }
                    this.mGnssStatus.setFixed(true);
                } else {
                    this.mCurrentGpsStatus = 3;
                    if (this.mLocationListener != null) {
                        this.mLocationListener.onNmeaLocationChanged(this.mGnssStatus.getEmptyLocation(), this.mGnssStatus);
                    }
                    this.mGnssStatus.setFixed(true);
                }
                break;
            case 2:
                this.mNmeaSplitter.setString(nmea.substring(7, nmea.lastIndexOf("*")));
                parseGSA(nmea.substring(1, 3));
                break;
            case 3:
                this.mNmeaSplitter.setString(nmea.substring(7, nmea.lastIndexOf("*")));
                parseGSV(nmea.substring(1, 3));
                break;
        }
    }

    public boolean hasGPSFixed() {
        return this.mCurrentGpsStatus == 3;
    }

    public GnssStatus getGnssStatus() {
        return this.mGnssStatus;
    }

    private boolean parseGGA() {
        this.mNmeaSplitter.next();
        String lat = this.mNmeaSplitter.next();
        String latDir = this.mNmeaSplitter.next();
        String lon = this.mNmeaSplitter.next();
        String lonDir = this.mNmeaSplitter.next();
        String quality = this.mNmeaSplitter.next();
        String nbSat = this.mNmeaSplitter.next();
        String hdop = this.mNmeaSplitter.next();
        String alt = this.mNmeaSplitter.next();
        String altUnit = this.mNmeaSplitter.next();
        String geoAlt = this.mNmeaSplitter.next();
        this.mNmeaSplitter.next();
        if (quality == null || "".equals(quality) || "0".equals(quality)) {
            return "0".equals(quality) ? false : false;
        }
        this.mGnssStatus.setQuality(this.mParserUtil.parseNmeaInt(quality));
        if (lat != null && !"".equals(lat)) {
            this.mGnssStatus.setLatitude(this.mParserUtil.parseNmeaLatitude(lat, latDir));
        }
        if (lon != null && !"".equals(lon)) {
            this.mGnssStatus.setLongitude(this.mParserUtil.parseNmeaLongitude(lon, lonDir));
        }
        if (hdop != null && !"".equals(hdop)) {
            this.mGnssStatus.setHDOP(this.mParserUtil.parseNmeaFloat(hdop));
        }
        if (alt != null && !"".equals(alt)) {
            this.mGnssStatus.setAltitude(this.mParserUtil.parseNmeaAlt(alt, altUnit).doubleValue());
        }
        if (nbSat != null && !"".equals(nbSat)) {
            this.mGnssStatus.setNbSat(this.mParserUtil.parseNmeaInt(nbSat));
        }
        if (geoAlt != null && !"".equals(geoAlt)) {
            this.mGnssStatus.setHeight(this.mParserUtil.parseNmeaFloat(geoAlt));
            return true;
        }
        return true;
    }

    private boolean parseRMC() {
        String time = this.mNmeaSplitter.next();
        String status = this.mNmeaSplitter.next();
        String lat = this.mNmeaSplitter.next();
        String latDir = this.mNmeaSplitter.next();
        String lon = this.mNmeaSplitter.next();
        String lonDir = this.mNmeaSplitter.next();
        String speed = this.mNmeaSplitter.next();
        String bearing = this.mNmeaSplitter.next();
        String date = this.mNmeaSplitter.next();
        this.mNmeaSplitter.next();
        this.mNmeaSplitter.next();
        this.mGnssStatus.setMode(status);
        long timestamp = this.mParserUtil.parseNmeaTime(date, time);
        this.mGnssStatus.setFixTimestamp(timestamp);
        if (status == null || "".equals(status) || !"A".equals(status)) {
            return "V".equals(status) ? false : false;
        }
        if (lat != null && !"".equals(lat)) {
            this.mGnssStatus.setLatitude(this.mParserUtil.parseNmeaLatitude(lat, latDir));
        }
        if (lon != null && !"".equals(lon)) {
            this.mGnssStatus.setLongitude(this.mParserUtil.parseNmeaLongitude(lon, lonDir));
        }
        if (speed != null && !"".equals(speed)) {
            this.mGnssStatus.setSpeed(this.mParserUtil.parseNmeaSpeed(speed, "N"));
        }
        if (bearing != null && !"".equals(bearing)) {
            this.mGnssStatus.setBearing(this.mParserUtil.parseNmeaFloat(bearing));
            return true;
        }
        return true;
    }

    private void parseGSA(String system) {
        String mode = this.mNmeaSplitter.next();
        this.mGnssStatus.setMode(mode);
        String fixType = this.mNmeaSplitter.next();
        if (!"1".equals(fixType)) {
            for (int i = 0; i < 12; i++) {
                String prn = this.mNmeaSplitter.next();
                if (prn != null && !"".equals(prn)) {
                    Pair<String, Integer> prnRst = parase(system, Integer.parseInt(prn));
                    this.mGnssStatus.addUsedSatellite(((Integer) prnRst.second).intValue());
                }
            }
            String pdop = this.mNmeaSplitter.next();
            String hdop = this.mNmeaSplitter.next();
            String vdop = this.mNmeaSplitter.next();
            this.mGnssStatus.setPDOP(Float.parseFloat(pdop));
            this.mGnssStatus.setHDOP(Float.parseFloat(hdop));
            this.mGnssStatus.setVDOP(Float.parseFloat(vdop));
        }
    }

    private void parseGSV(String system) {
        String totalGsvSentence;
        String currentGsvSentence;
        String satellitesInView;
        if (!this.mShouldParseStatellite) {
            return;
        }
        String totalGsvSentence2 = this.mNmeaSplitter.next();
        String currentGsvSentence2 = this.mNmeaSplitter.next();
        String satellitesInView2 = this.mNmeaSplitter.next();
        Integer numCurrentGsvSentence = Integer.valueOf(Integer.parseInt(currentGsvSentence2));
        Integer numTotalGsvSentence = Integer.valueOf(Integer.parseInt(totalGsvSentence2));
        Integer numSatellitesInView = Integer.valueOf(Integer.parseInt(satellitesInView2));
        if (numSatellitesInView.intValue() != 0) {
            int numRecord = 4;
            if (numCurrentGsvSentence.equals(numTotalGsvSentence) && (numRecord = numSatellitesInView.intValue() % 4) == 0) {
                numRecord = 4;
            }
            int i = 0;
            while (i < numRecord) {
                String prn = this.mNmeaSplitter.next();
                if (prn == null || "".equals(prn)) {
                    break;
                }
                String elevation = this.mNmeaSplitter.next();
                String azimuth = this.mNmeaSplitter.next();
                String snr = this.mNmeaSplitter.next();
                float nSnr = this.mParserUtil.parseNmeaFloat(snr);
                if (nSnr >= 65.0f) {
                    totalGsvSentence = totalGsvSentence2;
                    currentGsvSentence = currentGsvSentence2;
                    satellitesInView = satellitesInView2;
                } else {
                    totalGsvSentence = totalGsvSentence2;
                    Pair<String, Integer> prnRst = parase(system, Integer.parseInt(prn));
                    currentGsvSentence = currentGsvSentence2;
                    String decidedSystem = (String) prnRst.first;
                    satellitesInView = satellitesInView2;
                    int nprn = ((Integer) prnRst.second).intValue();
                    GnssSatellite sat = new GnssSatellite(decidedSystem, nprn);
                    sat.setStatus(this.mParserUtil.parseNmeaFloat(elevation), this.mParserUtil.parseNmeaFloat(azimuth), nSnr);
                    this.mGnssStatus.addSatellite(sat);
                    this.activeSatellites.add(Integer.valueOf(nprn));
                }
                i++;
                totalGsvSentence2 = totalGsvSentence;
                currentGsvSentence2 = currentGsvSentence;
                satellitesInView2 = satellitesInView;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0030  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private android.util.Pair<java.lang.String, java.lang.Integer> parase(java.lang.String r4, int r5) {
        /*
            r3 = this;
            r0 = r4
            int r1 = r4.hashCode()
            r2 = 2114(0x842, float:2.962E-42)
            if (r1 == r2) goto L26
            r2 = 2277(0x8e5, float:3.191E-42)
            if (r1 == r2) goto L1c
            r2 = 2281(0x8e9, float:3.196E-42)
            if (r1 == r2) goto L12
            goto L30
        L12:
            java.lang.String r1 = "GP"
            boolean r1 = r4.equals(r1)
            if (r1 == 0) goto L30
            r1 = 1
            goto L31
        L1c:
            java.lang.String r1 = "GL"
            boolean r1 = r4.equals(r1)
            if (r1 == 0) goto L30
            r1 = 0
            goto L31
        L26:
            java.lang.String r1 = "BD"
            boolean r1 = r4.equals(r1)
            if (r1 == 0) goto L30
            r1 = 2
            goto L31
        L30:
            r1 = -1
        L31:
            switch(r1) {
                case 0: goto L64;
                case 1: goto L3c;
                case 2: goto L35;
                default: goto L34;
            }
        L34:
            goto L6a
        L35:
            r1 = 16
            if (r5 >= r1) goto L6a
            int r5 = r5 + 200
            goto L6a
        L3c:
            r1 = 193(0xc1, float:2.7E-43)
            if (r5 != r1) goto L43
            java.lang.String r0 = "QZ"
            goto L6a
        L43:
            r1 = 200(0xc8, float:2.8E-43)
            if (r1 >= r5) goto L4e
            r1 = 211(0xd3, float:2.96E-43)
            if (r5 >= r1) goto L4e
            java.lang.String r0 = "BD"
            goto L6a
        L4e:
            r1 = 32
            if (r1 >= r5) goto L59
            r1 = 72
            if (r5 >= r1) goto L59
            java.lang.String r0 = "SB"
            goto L6a
        L59:
            r1 = 119(0x77, float:1.67E-43)
            if (r1 >= r5) goto L6a
            r1 = 139(0x8b, float:1.95E-43)
            if (r5 >= r1) goto L6a
            java.lang.String r0 = "SB"
            goto L6a
        L64:
            r1 = 64
            if (r5 >= r1) goto L6a
            java.lang.String r0 = "GL"
        L6a:
            android.util.Pair r1 = new android.util.Pair
            java.lang.Integer r2 = java.lang.Integer.valueOf(r5)
            r1.<init>(r0, r2)
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.taes.remote.api.location.nmea.NmeaParser.parase(java.lang.String, int):android.util.Pair");
    }
}
