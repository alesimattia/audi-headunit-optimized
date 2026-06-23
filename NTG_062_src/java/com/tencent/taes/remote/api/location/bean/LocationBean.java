package com.tencent.taes.remote.api.location.bean;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public class LocationBean implements Parcelable, Cloneable {
    public static final int COORDINATE_TYPE_GCJ02 = 1;
    public static final int COORDINATE_TYPE_WGS84 = 2;
    public static final Parcelable.Creator<LocationBean> CREATOR = new Parcelable.Creator<LocationBean>() { // from class: com.tencent.taes.remote.api.location.bean.LocationBean.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public LocationBean createFromParcel(Parcel source) {
            return new LocationBean(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public LocationBean[] newArray(int size) {
            return new LocationBean[size];
        }
    };
    public static final double LOCDEFAULT = Double.MIN_VALUE;
    public static final int LOC_TYPE_NETWORK = 1;
    public static final int LOC_TYPE_NMEA = 3;
    public static final int LOC_TYPE_SYSTEM = 2;
    public static final int LOC_TYPE_UNKNOWN = 0;
    public float accuracy;
    public double altitude;
    public double azimuth;
    public String city;
    public float direction;
    public String district;
    public double elevation;
    public int fixmode;
    public int gpsQuality;
    public double hdop;
    public int inPark;
    public int loctype;
    public double pdop;
    public double phonedir;
    public String provider;
    public String province;
    public int satellitesNum;
    public float speed;
    public String street;
    public long time;
    public int type;
    public double vdop;
    public double latitude = Double.MIN_VALUE;
    public double longitude = Double.MIN_VALUE;
    public boolean isSimulateLoc = false;

    public boolean isValid() {
        return (isFloatEqual(this.longitude, Double.MIN_VALUE) || isFloatEqual(this.latitude, Double.MIN_VALUE)) ? false : true;
    }

    private boolean isFloatEqual(double f1, double f2) {
        return Math.abs(f1 - f2) < 1.0E-5d;
    }

    public LatLng toGeoPoint() {
        LatLng latLng = new LatLng(this.latitude, this.longitude);
        return latLng;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeDouble(this.latitude);
        parcel.writeDouble(this.longitude);
        parcel.writeFloat(this.speed);
        parcel.writeFloat(this.direction);
        parcel.writeFloat(this.accuracy);
        parcel.writeInt(this.satellitesNum);
        parcel.writeDouble(this.altitude);
        parcel.writeInt(this.type);
        parcel.writeLong(this.time);
        parcel.writeInt(this.gpsQuality);
        parcel.writeInt(this.loctype);
        parcel.writeByte(this.isSimulateLoc ? (byte) 1 : (byte) 0);
        parcel.writeString(this.provider);
        parcel.writeInt(this.inPark);
        parcel.writeInt(this.fixmode);
        parcel.writeDouble(this.hdop);
        parcel.writeDouble(this.vdop);
        parcel.writeDouble(this.pdop);
        parcel.writeDouble(this.phonedir);
        parcel.writeDouble(this.azimuth);
        parcel.writeDouble(this.elevation);
        parcel.writeString(this.province);
        parcel.writeString(this.city);
        parcel.writeString(this.district);
        parcel.writeString(this.street);
    }

    public void readFromParcel(Parcel in) {
        this.latitude = in.readDouble();
        this.longitude = in.readDouble();
        this.speed = in.readFloat();
        this.direction = in.readFloat();
        this.accuracy = in.readFloat();
        this.satellitesNum = in.readInt();
        this.altitude = in.readDouble();
        this.type = in.readInt();
        this.time = in.readLong();
        this.gpsQuality = in.readInt();
        this.loctype = in.readInt();
        this.isSimulateLoc = in.readByte() != 0;
        this.provider = in.readString();
        this.inPark = in.readInt();
        this.fixmode = in.readInt();
        this.hdop = in.readDouble();
        this.vdop = in.readDouble();
        this.pdop = in.readDouble();
        this.phonedir = in.readDouble();
        this.azimuth = in.readDouble();
        this.elevation = in.readDouble();
        this.province = in.readString();
        this.city = in.readString();
        this.district = in.readString();
        this.street = in.readString();
    }

    public LocationBean() {
    }

    protected LocationBean(Parcel in) {
        readFromParcel(in);
    }

    public String toString() {
        return "LocationBean{latitude=" + this.latitude + ", longitude=" + this.longitude + ", speed=" + this.speed + ", direction=" + this.direction + ", accuracy=" + this.accuracy + ", satellitesNum=" + this.satellitesNum + ", altitude=" + this.altitude + ", type=" + this.type + ", time=" + this.time + ", gpsQuality=" + this.gpsQuality + ", loctype=" + this.loctype + ", isSimulateLoc=" + this.isSimulateLoc + ", provider='" + this.provider + "', inPark=" + this.inPark + ", fixmode=" + this.fixmode + ", hdop=" + this.hdop + ", vdop=" + this.vdop + ", hdop=" + this.hdop + ", phonedir=" + this.phonedir + ", azimuth=" + this.azimuth + ", elevation=" + this.elevation + ", province=" + this.province + ", city=" + this.city + ", district=" + this.district + ", street=" + this.street + '}';
    }

    /* JADX INFO: renamed from: clone, reason: merged with bridge method [inline-methods] */
    public LocationBean m5clone() {
        LocationBean newLoc = new LocationBean();
        synchronized (this) {
            newLoc.latitude = this.latitude;
            newLoc.longitude = this.longitude;
            newLoc.speed = this.speed;
            newLoc.direction = this.direction;
            newLoc.accuracy = this.accuracy;
            newLoc.satellitesNum = this.satellitesNum;
            newLoc.altitude = this.altitude;
            newLoc.type = this.type;
            newLoc.time = this.time;
            newLoc.gpsQuality = this.gpsQuality;
            newLoc.loctype = this.loctype;
            newLoc.isSimulateLoc = this.isSimulateLoc;
            newLoc.provider = this.provider;
            newLoc.inPark = this.inPark;
            newLoc.fixmode = this.fixmode;
            newLoc.hdop = this.hdop;
            newLoc.vdop = this.vdop;
            newLoc.pdop = this.pdop;
            newLoc.phonedir = this.phonedir;
            newLoc.azimuth = this.azimuth;
            newLoc.elevation = this.elevation;
            newLoc.province = this.province;
            newLoc.city = this.city;
            newLoc.district = this.district;
            newLoc.street = this.street;
        }
        return newLoc;
    }
}
