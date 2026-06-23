package com.tencent.taes.remote.api.location.nmea;

/* JADX INFO: loaded from: classes.dex */
public class GnssSatellite implements Comparable<GnssSatellite> {
    public float azimuth;
    public float elevation;
    private boolean mUsedInFix;
    private int prn;
    public float snr;
    private SatelliteSystem system;

    private enum SatelliteSystem {
        GPS,
        GLONASS,
        GALILEO,
        QZSS,
        IRNASS,
        BEIDOU,
        SBS,
        UNKNOWN
    }

    @Override // java.lang.Comparable
    public int compareTo(GnssSatellite another) {
        return (int) (another.snr - this.snr);
    }

    private GnssSatellite() {
    }

    public GnssSatellite copy() {
        GnssSatellite gnssSatellite = new GnssSatellite();
        gnssSatellite.azimuth = this.azimuth;
        gnssSatellite.elevation = this.elevation;
        gnssSatellite.snr = this.snr;
        gnssSatellite.prn = this.prn;
        gnssSatellite.mUsedInFix = this.mUsedInFix;
        gnssSatellite.system = this.system;
        return gnssSatellite;
    }

    GnssSatellite(String systemid, int prn) {
        this.prn = prn;
        setSystem(systemid);
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0059  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void setSystem(java.lang.String r3) {
        /*
            r2 = this;
            int r0 = r3.hashCode()
            r1 = 2114(0x842, float:2.962E-42)
            if (r0 == r1) goto L4f
            r1 = 2266(0x8da, float:3.175E-42)
            if (r0 == r1) goto L45
            r1 = 2277(0x8e5, float:3.191E-42)
            if (r0 == r1) goto L3b
            r1 = 2281(0x8e9, float:3.196E-42)
            if (r0 == r1) goto L31
            r1 = 2601(0xa29, float:3.645E-42)
            if (r0 == r1) goto L27
            r1 = 2639(0xa4f, float:3.698E-42)
            if (r0 == r1) goto L1d
            goto L59
        L1d:
            java.lang.String r0 = "SB"
            boolean r0 = r3.equals(r0)
            if (r0 == 0) goto L59
            r0 = 4
            goto L5a
        L27:
            java.lang.String r0 = "QZ"
            boolean r0 = r3.equals(r0)
            if (r0 == 0) goto L59
            r0 = 2
            goto L5a
        L31:
            java.lang.String r0 = "GP"
            boolean r0 = r3.equals(r0)
            if (r0 == 0) goto L59
            r0 = 0
            goto L5a
        L3b:
            java.lang.String r0 = "GL"
            boolean r0 = r3.equals(r0)
            if (r0 == 0) goto L59
            r0 = 1
            goto L5a
        L45:
            java.lang.String r0 = "GA"
            boolean r0 = r3.equals(r0)
            if (r0 == 0) goto L59
            r0 = 3
            goto L5a
        L4f:
            java.lang.String r0 = "BD"
            boolean r0 = r3.equals(r0)
            if (r0 == 0) goto L59
            r0 = 5
            goto L5a
        L59:
            r0 = -1
        L5a:
            switch(r0) {
                case 0: goto L7b;
                case 1: goto L76;
                case 2: goto L71;
                case 3: goto L6c;
                case 4: goto L67;
                case 5: goto L62;
                default: goto L5d;
            }
        L5d:
            com.tencent.taes.remote.api.location.nmea.GnssSatellite$SatelliteSystem r0 = com.tencent.taes.remote.api.location.nmea.GnssSatellite.SatelliteSystem.UNKNOWN
            r2.system = r0
            goto L80
        L62:
            com.tencent.taes.remote.api.location.nmea.GnssSatellite$SatelliteSystem r0 = com.tencent.taes.remote.api.location.nmea.GnssSatellite.SatelliteSystem.BEIDOU
            r2.system = r0
            goto L80
        L67:
            com.tencent.taes.remote.api.location.nmea.GnssSatellite$SatelliteSystem r0 = com.tencent.taes.remote.api.location.nmea.GnssSatellite.SatelliteSystem.SBS
            r2.system = r0
            goto L80
        L6c:
            com.tencent.taes.remote.api.location.nmea.GnssSatellite$SatelliteSystem r0 = com.tencent.taes.remote.api.location.nmea.GnssSatellite.SatelliteSystem.GALILEO
            r2.system = r0
            goto L80
        L71:
            com.tencent.taes.remote.api.location.nmea.GnssSatellite$SatelliteSystem r0 = com.tencent.taes.remote.api.location.nmea.GnssSatellite.SatelliteSystem.QZSS
            r2.system = r0
            goto L80
        L76:
            com.tencent.taes.remote.api.location.nmea.GnssSatellite$SatelliteSystem r0 = com.tencent.taes.remote.api.location.nmea.GnssSatellite.SatelliteSystem.GLONASS
            r2.system = r0
            goto L80
        L7b:
            com.tencent.taes.remote.api.location.nmea.GnssSatellite$SatelliteSystem r0 = com.tencent.taes.remote.api.location.nmea.GnssSatellite.SatelliteSystem.GPS
            r2.system = r0
        L80:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.taes.remote.api.location.nmea.GnssSatellite.setSystem(java.lang.String):void");
    }

    public int getPrn() {
        return this.prn;
    }

    boolean isprn(int n) {
        return n == this.prn;
    }

    public int hashCode() {
        return this.prn + (this.system.ordinal() * 1000);
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof GnssSatellite)) {
            return false;
        }
        GnssSatellite sat = (GnssSatellite) o;
        return sat.getPrn() == this.prn && sat.getSystemPrefix().equals(getSystemPrefix());
    }

    void setStatus(float elevation, float azimuth, float snr) {
        if (elevation < 0.0f) {
            this.elevation = 0.0f;
        } else if (elevation > 90.0f) {
            this.elevation = 90.0f;
        } else {
            this.elevation = elevation;
        }
        if (azimuth < 0.0f || azimuth > 360.0f) {
            this.azimuth = 0.0f;
        } else {
            this.azimuth = azimuth;
        }
        if (snr < 0.0f) {
            this.snr = 0.0f;
        } else if (snr > 99.0f) {
            this.snr = 99.0f;
        } else {
            this.snr = snr;
        }
    }

    public String getSystemPrefix() {
        return getSystemPrefix(2);
    }

    public String getSystemPrefix(int len) {
        if (len == 2) {
            switch (this.system) {
                case GPS:
                    return "GP";
                case GLONASS:
                    return "GL";
                case QZSS:
                    return "QZ";
                case GALILEO:
                    return "GA";
                case BEIDOU:
                    return "BD";
                case SBS:
                    return "SB";
                default:
                    return "UN";
            }
        }
        if (len == 1) {
            switch (this.system) {
                case GPS:
                    return "G";
                case GLONASS:
                    return "L";
                case QZSS:
                    return "Q";
                case GALILEO:
                    return "E";
                case BEIDOU:
                    return "B";
                case SBS:
                    return "S";
                default:
                    return "U";
            }
        }
        return "";
    }

    public String getName() {
        int satnum;
        int i = AnonymousClass1.$SwitchMap$com$tencent$taes$remote$api$location$nmea$GnssSatellite$SatelliteSystem[this.system.ordinal()];
        if (i != 5) {
            switch (i) {
                case 2:
                    int satnum2 = this.prn;
                    satnum = satnum2 - 64;
                    break;
                case 3:
                    satnum = this.prn - 192;
                    break;
                default:
                    satnum = this.prn;
                    break;
            }
        } else {
            int satnum3 = this.prn;
            satnum = satnum3 - 200;
        }
        return getSystemPrefix(1) + Integer.toString(satnum);
    }

    public float getElevation() {
        return this.elevation;
    }

    void setElevation(float ele) {
        this.elevation = ele;
    }

    public float getAzimuth() {
        return this.azimuth;
    }

    void setAzimuth(float azi) {
        this.azimuth = azi;
    }

    public float getSnr() {
        return this.snr;
    }

    void setSnr(float snr) {
        this.snr = snr;
    }

    public boolean isQzss() {
        return this.system == SatelliteSystem.QZSS;
    }

    public boolean isGlonass() {
        return this.system == SatelliteSystem.GLONASS;
    }

    public boolean isGalileo() {
        return this.system == SatelliteSystem.GALILEO;
    }

    public boolean isGps() {
        return this.system == SatelliteSystem.GPS;
    }

    public boolean isSBS() {
        return this.system == SatelliteSystem.SBS;
    }

    public boolean isBeidou() {
        return this.system == SatelliteSystem.BEIDOU;
    }

    public boolean usedInFix() {
        return this.mUsedInFix;
    }

    public void setUsedInFix(boolean usedInFix) {
        this.mUsedInFix = usedInFix;
    }

    public String toString() {
        return "[system:" + this.system + ",prn:" + this.prn + ",snr:" + this.snr + ",elevation:" + this.elevation + ",azimuth:" + this.azimuth + "]";
    }
}
