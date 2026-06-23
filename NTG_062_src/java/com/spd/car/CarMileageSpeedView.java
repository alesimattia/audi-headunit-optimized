package com.spd.car;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.FrameLayout;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import com.spd.xhsntg.R;

/* JADX INFO: loaded from: classes.dex */
public class CarMileageSpeedView extends FrameLayout {
    private TextView mMileage;
    private TextView mSpeed;

    public CarMileageSpeedView(@NonNull Context context) {
        this(context, null);
    }

    public CarMileageSpeedView(@NonNull Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public CarMileageSpeedView(@NonNull Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initView();
    }

    private void initView() {
        LayoutInflater.from(getContext()).inflate(R.layout.mileage_layout, this);
        this.mMileage = (TextView) findViewById(R.id.mileage);
        this.mSpeed = (TextView) findViewById(R.id.speed);
    }

    public void updateSpeed(float speed, int unit) {
        TextView textView = this.mSpeed;
        StringBuilder sb = new StringBuilder();
        sb.append(speed);
        sb.append(" ");
        sb.append(unit == 1 ? "MPH" : "KM/H");
        textView.setText(sb.toString());
    }

    public void updateMileage(int value, int unit) {
        TextView textView = this.mMileage;
        StringBuilder sb = new StringBuilder();
        sb.append(value);
        sb.append(" ");
        sb.append(unit == 1 ? "MILE" : "KM");
        textView.setText(sb.toString());
    }
}
