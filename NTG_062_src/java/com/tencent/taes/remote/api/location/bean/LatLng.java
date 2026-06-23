package com.tencent.taes.remote.api.location.bean;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class LatLng implements Parcelable {
    public static final Parcelable.Creator<LatLng> CREATOR = new Parcelable.Creator<LatLng>() { // from class: com.tencent.taes.remote.api.location.bean.LatLng.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public LatLng createFromParcel(Parcel source) {
            return new LatLng(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public LatLng[] newArray(int size) {
            return new LatLng[size];
        }
    };
    public static final double INVALID_VALUE = Double.MIN_VALUE;
    public static final String KEY_LATITUDE = "latitude";
    public static final String KEY_LONGTITUDE = "longtitude";
    public double latitude;
    public double longitude;
    protected Bundle mExtBundle;

    public Bundle getExtBundle() {
        return this.mExtBundle;
    }

    public void setExtBundle(Bundle extBundle) {
        this.mExtBundle = this.mExtBundle;
    }

    public LatLng() {
        this.longitude = 0.0d;
        this.latitude = 0.0d;
    }

    public LatLng(LatLng latLng) {
        if (latLng != null) {
            this.longitude = latLng.getLongitude();
            this.latitude = latLng.getLatitude();
            this.mExtBundle = latLng.getExtBundle();
        }
    }

    public LatLng(double lat, double lng) {
        this.longitude = lng;
        this.latitude = lat;
    }

    public LatLng(double lat, double lng, Bundle mExtBundle) {
        this.longitude = lng;
        this.latitude = lat;
        this.mExtBundle = mExtBundle;
    }

    public double getLatitude() {
        return this.latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return this.longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public int getLatitudeE6() {
        return (int) (this.latitude * 1000000.0d);
    }

    public int getLongitudeE6() {
        return (int) (this.longitude * 1000000.0d);
    }

    public void setLatitudeE6(int lat) {
        this.latitude = ((double) lat) / 1000000.0d;
    }

    public void setLongitudeE6(int longitudeE6) {
        this.longitude = ((double) longitudeE6) / 1000000.0d;
    }

    public boolean isValid() {
        if (this.latitude > 1.0d && this.latitude < 180.0d && this.longitude > 1.0d && this.longitude < 180.0d) {
            return true;
        }
        return false;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeDouble(this.latitude);
        dest.writeDouble(this.longitude);
        dest.writeBundle(this.mExtBundle);
    }

    protected LatLng(Parcel in) {
        this.latitude = in.readDouble();
        this.longitude = in.readDouble();
        this.mExtBundle = in.readBundle();
    }

    public JSONObject toJson() {
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put(KEY_LONGTITUDE, this.longitude);
            jsonObject.put(KEY_LATITUDE, this.latitude);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonObject;
    }

    public String toString() {
        return "LatLng{latitude=" + this.latitude + ", longitude=" + this.longitude + '}';
    }
}
