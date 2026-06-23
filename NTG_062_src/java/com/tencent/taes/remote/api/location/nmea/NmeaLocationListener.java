package com.tencent.taes.remote.api.location.nmea;

import android.location.Location;

/* JADX INFO: loaded from: classes.dex */
public interface NmeaLocationListener {
    void onNmeaLocationChanged(Location location, GnssStatus gnssStatus);
}
