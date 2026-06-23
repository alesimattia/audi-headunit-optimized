package com.spd.xhsntg;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import com.spd.carinfo.CarInfo;

/* JADX INFO: loaded from: classes.dex */
public class CarInfoManager implements CarInfo.Callback {
    public static final int AUDIO_MODE_CAR = 1;
    public static final int AUDIO_MODE_NAVI = 2;
    public static final int AUDIO_MODE_NAVI_AUDIO = 3;
    public static final String TAG = "CarInfoManager";
    public Callback mCallback;
    private boolean mIsConnected;
    private float mSpeed;
    private int mSpeedUnit;

    public interface Callback {
        void onUpdateConnected(boolean z);

        void onUpdateDoors(boolean z, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6);

        void onUpdateMediaSource(int i, int i2);

        void onUpdateSpeed(float f, int i);

        void onUpdateTotalMileage(int i, int i2);

        void updateCarModel(int i);
    }

    public void init(Context context) {
        CarInfo.instance().init(context, new String[]{CarInfo.Doors.CLASS_NAME, CarInfo.ReverseAndAVM.CLASS_NAME, CarInfo.General.CLASS_NAME, CarInfo.Instruments.CLASS_NAME, CarInfo.Vehicles.CLASS_NAME}, this);
    }

    public void unInit() {
        CarInfo.instance().uninit();
    }

    public void setAudioMode(int mode) {
        Bundle bundle = new Bundle();
        bundle.putInt("mode", mode);
        CarInfo.instance().set(CarInfo.Instruments.CURRENT_MODE, bundle, 0);
    }

    public void setKeyEvent(int keyCode, int action) {
        CarInfo.instance().set(CarInfo.General.KEYCODE_EVENT, Integer.valueOf(keyCode), action);
    }

    public boolean isConnected() {
        return this.mIsConnected;
    }

    @Override // com.spd.carinfo.CarInfo.Callback
    public void onCarInfoConnectedChanged(boolean b) {
        this.mIsConnected = b;
        updateConnected(b);
        if (b) {
            Bundle bundle = (Bundle) CarInfo.instance().get(CarInfo.Doors.OPENED, 0, new Bundle());
            boolean trunk = bundle.getInt(CarInfo.KEY_TRUNK, 0) == 1;
            boolean hood = bundle.getInt(CarInfo.KEY_HOOD, 0) == 1;
            boolean frontLeft = bundle.getInt(CarInfo.KEY_FRONT_LEFT, 0) == 1;
            boolean frontRight = bundle.getInt(CarInfo.KEY_FRONT_RIGHT, 0) == 1;
            boolean rearLeft = bundle.getInt(CarInfo.KEY_REAR_LEFT, 0) == 1;
            boolean rearRight = bundle.getInt(CarInfo.KEY_REAR_RIGHT, 0) == 1;
            updateDoors(hood, trunk, frontLeft, frontRight, rearLeft, rearRight);
            this.mSpeed = ((Float) CarInfo.instance().get(CarInfo.ReverseAndAVM.CURRENT_SPEED, 0, Float.valueOf(0.0f))).floatValue();
            this.mSpeedUnit = ((Integer) CarInfo.instance().get(CarInfo.General.UNIT_SPEED, 0, 0)).intValue();
            updateSpeed(this.mSpeed, this.mSpeedUnit);
            Bundle bundle2 = (Bundle) CarInfo.instance().get(CarInfo.Instruments.TOTAL_RECHARGE_MILEAGE, 0, new Bundle());
            int value = bundle2.getInt("value", 0);
            int unit = bundle2.getInt(CarInfo.KEY_UNIT, 0);
            updateTotalMileage(value, unit);
            int carModel = ((Integer) CarInfo.instance().get(CarInfo.Vehicles.CURRENT_MODEL, 0, 0)).intValue();
            updateCarModel(carModel);
            int source = ((Integer) CarInfo.instance().get(CarInfo.Instruments.MEDIA_SOURCE, 0, 0)).intValue();
            int newSource = source & 255;
            int hasSource = (source >> 16) & 255;
            updateMediaSource(newSource, hasSource);
        }
    }

    @Override // com.spd.carinfo.CarInfo.Callback
    public void onCarInfoDataChanged(int i, Object o, int i1) {
        switch (i) {
            case CarInfo.General.UNIT_SPEED /* 10006 */:
                this.mSpeedUnit = ((Integer) o).intValue();
                updateSpeed(this.mSpeed, this.mSpeedUnit);
                break;
            case CarInfo.Doors.OPENED /* 50001 */:
                Bundle bundle = (Bundle) o;
                if (bundle != null) {
                    boolean trunk = bundle.getInt(CarInfo.KEY_TRUNK, 0) == 1;
                    boolean hood = bundle.getInt(CarInfo.KEY_HOOD, 0) == 1;
                    boolean frontLeft = bundle.getInt(CarInfo.KEY_FRONT_LEFT, 0) == 1;
                    boolean frontRight = bundle.getInt(CarInfo.KEY_FRONT_RIGHT, 0) == 1;
                    boolean rearLeft = bundle.getInt(CarInfo.KEY_REAR_LEFT, 0) == 1;
                    boolean rearRight = bundle.getInt(CarInfo.KEY_REAR_RIGHT, 0) == 1;
                    updateDoors(hood, trunk, frontLeft, frontRight, rearLeft, rearRight);
                }
                break;
            case CarInfo.Instruments.TOTAL_RECHARGE_MILEAGE /* 100013 */:
                Bundle bundle2 = (Bundle) o;
                if (bundle2 != null) {
                    int value = bundle2.getInt("value", 0);
                    int unit = bundle2.getInt(CarInfo.KEY_UNIT, 0);
                    updateTotalMileage(value, unit);
                }
                break;
            case CarInfo.Instruments.MEDIA_SOURCE /* 100085 */:
                int source = ((Integer) o).intValue();
                int newSource = source & 255;
                int hasSource = (source >> 16) & 255;
                updateMediaSource(newSource, hasSource);
                break;
            case CarInfo.ReverseAndAVM.CURRENT_SPEED /* 140062 */:
                this.mSpeed = ((Float) o).floatValue();
                updateSpeed(this.mSpeed, this.mSpeedUnit);
                break;
            case CarInfo.Vehicles.CURRENT_MODEL /* 170004 */:
                updateCarModel(((Integer) o).intValue());
                break;
        }
    }

    private void updateConnected(boolean connected) {
        Log.d(TAG, "updateConnected:" + connected);
        if (this.mCallback != null) {
            this.mCallback.onUpdateConnected(connected);
        }
    }

    private void updateCarModel(int o) {
        if (this.mCallback != null) {
            this.mCallback.updateCarModel(o);
        }
    }

    private void updateDoors(boolean hood, boolean trunk, boolean frontLeft, boolean frontRight, boolean rearLeft, boolean rearRight) {
        if (this.mCallback != null) {
            this.mCallback.onUpdateDoors(hood, trunk, frontLeft, frontRight, rearLeft, rearRight);
        }
    }

    private void updateSpeed(float speed, int unit) {
        if (this.mCallback != null) {
            this.mCallback.onUpdateSpeed(speed, unit);
        }
    }

    private void updateTotalMileage(int mileage, int unit) {
        if (this.mCallback != null) {
            this.mCallback.onUpdateTotalMileage(mileage, unit);
        }
    }

    private void updateMediaSource(int source, int hasSource) {
        Log.d(TAG, "updateMediaSource:" + source + ",hasSource:" + hasSource);
        if (this.mCallback != null) {
            this.mCallback.onUpdateMediaSource(source, hasSource);
        }
    }

    public void setCallback(Callback cb) {
        this.mCallback = cb;
    }
}
