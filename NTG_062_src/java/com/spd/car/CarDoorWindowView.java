package com.spd.car;

import android.content.Context;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;
import android.provider.Settings;
import android.util.AttributeSet;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import com.spd.xhsntg.R;

/* JADX INFO: loaded from: classes.dex */
public class CarDoorWindowView extends FrameLayout {
    private static final String TAG = "CarDoorWindowView";
    private boolean mAttached;
    private int mBenzCarType;
    private int mCarBgId;
    private int mCarDoorFrontLeftOn;
    private int mCarDoorFrontRightOn;
    private int mCarDoorHoodOn;
    private int mCarDoorLeftOff;
    private int mCarDoorRearLeftOn;
    private int mCarDoorRearRightOn;
    private int mCarDoorRightOff;
    private int mCarDoorTrunkOn;
    private ContentObserver mContentObserver;
    private ImageView mDoorBgView;
    private View mDoorFrontLeftView;
    private View mDoorFrontRightView;
    private View mDoorHoodView;
    private View mDoorRearLeftView;
    private View mDoorRearRightView;
    private View mDoorTrunkView;
    private int mSingleDoorOpenIndex;
    private boolean prevIsLeftDoor;

    public CarDoorWindowView(@NonNull Context context) {
        this(context, null);
    }

    public CarDoorWindowView(@NonNull Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public CarDoorWindowView(@NonNull Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mContentObserver = new ContentObserver(new Handler()) { // from class: com.spd.car.CarDoorWindowView.1
            @Override // android.database.ContentObserver
            public void onChange(boolean selfChange) {
                super.onChange(selfChange);
                CarDoorWindowView.this.resetBenzCarDoorIcon();
            }
        };
        initView();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (!this.mAttached) {
            this.mAttached = true;
            Uri uri = Settings.System.getUriFor("SETTING_BENZ_CAR_TYPE");
            getContext().getContentResolver().registerContentObserver(uri, true, this.mContentObserver);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mAttached) {
            this.mAttached = false;
            getContext().getContentResolver().unregisterContentObserver(this.mContentObserver);
        }
    }

    public void initView() {
        this.mBenzCarType = -1;
        LayoutInflater.from(getContext()).inflate(R.layout.carinfo_benz_car_door_layout, this);
        this.mDoorBgView = (ImageView) findViewById(R.id.id_car_door_bg);
        this.mDoorHoodView = findViewById(R.id.id_car_door_hood);
        this.mDoorTrunkView = findViewById(R.id.id_car_door_trunk);
        this.mDoorFrontLeftView = findViewById(R.id.id_car_door_front_left);
        this.mDoorFrontRightView = findViewById(R.id.id_car_door_front_right);
        this.mDoorRearLeftView = findViewById(R.id.id_car_door_rear_left);
        this.mDoorRearRightView = findViewById(R.id.id_car_door_rear_right);
        resetBenzCarDoorIcon();
    }

    private int getDoorResourceId(String name) {
        String res = name + "_0" + this.mBenzCarType;
        return getResources().getIdentifier(res, "drawable", getContext().getPackageName());
    }

    private void updateResource(ImageView v, int id) {
        if (v != null) {
            if (id > 0) {
                v.setImageResource(id);
            } else {
                v.setVisibility(4);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void resetBenzCarDoorIcon() {
        int type = Settings.System.getInt(getContext().getContentResolver(), "SETTING_BENZ_CAR_TYPE", 0);
        Log.d(TAG, "resetBenzCarDoorIcon:" + type);
        if (type != this.mBenzCarType) {
            this.mBenzCarType = type;
            int frontLeftId = getDoorResourceId("carinfo_audi_car_door_front_left");
            int frontRightId = getDoorResourceId("carinfo_audi_car_door_front_right");
            int rearLeftId = getDoorResourceId("carinfo_audi_car_door_rear_left");
            int rearRightId = getDoorResourceId("carinfo_audi_car_door_rear_right");
            int hoodId = getDoorResourceId("carinfo_audi_car_door_hood");
            int trunkId = getDoorResourceId("carinfo_audi_car_door_trunk");
            this.mCarBgId = getDoorResourceId("carinfo_audi_car_door_bg");
            this.mCarDoorLeftOff = getDoorResourceId("carinfo_audi_car_door_left_off");
            this.mCarDoorFrontLeftOn = getDoorResourceId("carinfo_audi_car_door_left_front");
            this.mCarDoorFrontRightOn = getDoorResourceId("carinfo_audi_car_door_right_front");
            this.mCarDoorRightOff = getDoorResourceId("carinfo_audi_car_door_right_off");
            this.mCarDoorRearLeftOn = getDoorResourceId("carinfo_audi_car_door_left_rear");
            this.mCarDoorRearRightOn = getDoorResourceId("carinfo_audi_car_door_right_rear");
            this.mCarDoorHoodOn = getDoorResourceId("carinfo_audi_car_door_hood_on");
            this.mCarDoorTrunkOn = getDoorResourceId("carinfo_audi_car_door_trunk_on");
            updateResource((ImageView) this.mDoorHoodView, hoodId);
            updateResource((ImageView) this.mDoorTrunkView, trunkId);
            updateResource((ImageView) this.mDoorFrontLeftView, frontLeftId);
            updateResource((ImageView) this.mDoorFrontRightView, frontRightId);
            updateResource((ImageView) this.mDoorRearLeftView, rearLeftId);
            updateResource((ImageView) this.mDoorRearRightView, rearRightId);
            if (this.mSingleDoorOpenIndex == 1) {
                updateResource(this.mDoorBgView, this.mCarDoorHoodOn);
                return;
            }
            if (this.mSingleDoorOpenIndex == 2) {
                updateResource(this.mDoorBgView, this.mCarDoorTrunkOn);
                return;
            }
            if (this.mSingleDoorOpenIndex == 3) {
                updateResource(this.mDoorBgView, this.mCarDoorFrontLeftOn);
                return;
            }
            if (this.mSingleDoorOpenIndex == 4) {
                updateResource(this.mDoorBgView, this.mCarDoorFrontRightOn);
                return;
            }
            if (this.mSingleDoorOpenIndex == 5) {
                updateResource(this.mDoorBgView, this.mCarDoorRearLeftOn);
            } else if (this.mSingleDoorOpenIndex == 6) {
                updateResource(this.mDoorBgView, this.mCarDoorRearRightOn);
            } else {
                updateResource(this.mDoorBgView, this.mCarBgId);
            }
        }
    }

    public void updateBenzCarDoor(boolean z, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6) {
        int i = (z ? 1 : 0) + (z2 ? 1 : 0) + (z3 ? 1 : 0) + (z4 ? 1 : 0) + (z5 ? 1 : 0) + (z6 ? 1 : 0);
        if (i > 1) {
            this.mDoorHoodView.setVisibility(z ? 0 : 4);
            this.mDoorTrunkView.setVisibility(z2 ? 0 : 4);
            this.mDoorFrontLeftView.setVisibility(z3 ? 0 : 4);
            this.mDoorFrontRightView.setVisibility(z4 ? 0 : 4);
            this.mDoorRearLeftView.setVisibility(z5 ? 0 : 4);
            this.mDoorRearRightView.setVisibility(z6 ? 0 : 4);
            updateResource(this.mDoorBgView, this.mCarBgId);
            this.mDoorBgView.setVisibility(0);
            this.mSingleDoorOpenIndex = 0;
            return;
        }
        if (i == 1) {
            this.mDoorHoodView.setVisibility(4);
            this.mDoorTrunkView.setVisibility(4);
            this.mDoorFrontLeftView.setVisibility(4);
            this.mDoorFrontRightView.setVisibility(4);
            this.mDoorRearLeftView.setVisibility(4);
            this.mDoorRearRightView.setVisibility(4);
            if (z) {
                updateResource(this.mDoorBgView, this.mCarDoorHoodOn);
                this.mSingleDoorOpenIndex = 1;
            } else if (z2) {
                updateResource(this.mDoorBgView, this.mCarDoorTrunkOn);
                this.mSingleDoorOpenIndex = 2;
            } else if (z3) {
                updateResource(this.mDoorBgView, this.mCarDoorFrontLeftOn);
                this.mSingleDoorOpenIndex = 3;
                this.prevIsLeftDoor = true;
            } else if (z4) {
                updateResource(this.mDoorBgView, this.mCarDoorFrontRightOn);
                this.mSingleDoorOpenIndex = 4;
                this.prevIsLeftDoor = false;
            } else if (z5) {
                updateResource(this.mDoorBgView, this.mCarDoorRearLeftOn);
                this.mSingleDoorOpenIndex = 5;
                this.prevIsLeftDoor = true;
            } else if (z6) {
                updateResource(this.mDoorBgView, this.mCarDoorRearRightOn);
                this.mSingleDoorOpenIndex = 6;
                this.prevIsLeftDoor = false;
            }
            this.mDoorBgView.setVisibility(0);
            return;
        }
        this.mDoorHoodView.setVisibility(4);
        this.mDoorTrunkView.setVisibility(4);
        this.mDoorFrontLeftView.setVisibility(4);
        this.mDoorFrontRightView.setVisibility(4);
        this.mDoorRearLeftView.setVisibility(4);
        this.mDoorRearRightView.setVisibility(4);
        this.mSingleDoorOpenIndex = 0;
        updateResource(this.mDoorBgView, this.prevIsLeftDoor ? this.mCarDoorLeftOff : this.mCarDoorRightOff);
        this.mDoorBgView.setVisibility(0);
    }
}
