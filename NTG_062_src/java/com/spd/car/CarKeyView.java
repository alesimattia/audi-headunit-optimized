package com.spd.car;

import android.content.Context;
import android.provider.Settings;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.media.subtitle.Cea708CCParser;
import com.spd.system.service.SpdManager;
import com.spd.xhsntg.CarInfoManager;
import com.spd.xhsntg.R;

/* JADX INFO: loaded from: classes.dex */
public class CarKeyView extends FrameLayout implements View.OnClickListener, View.OnTouchListener, View.OnLongClickListener {
    private static final String TAG = "CarKeyView";
    private int mBrightness;
    private CarInfoManager mCarInfoManager;
    private int mViewType;

    public CarKeyView(@NonNull Context context) {
        this(context, null);
    }

    public CarKeyView(@NonNull Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public CarKeyView(@NonNull Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mViewType = 0;
        initView();
    }

    private void initView() {
        View.inflate(getContext(), R.layout.key_one_layout, this);
        findViewById(R.id.car_up).setOnClickListener(this);
        findViewById(R.id.p_off).setOnClickListener(this);
        findViewById(R.id.sport_esp_off).setOnClickListener(this);
        findViewById(R.id.left_key).setOnClickListener(this);
        findViewById(R.id.right_key).setOnClickListener(this);
        findViewById(R.id.knob_left_l).setOnClickListener(this);
        findViewById(R.id.knob_left_r).setOnClickListener(this);
        findViewById(R.id.knob_right_l).setOnClickListener(this);
        findViewById(R.id.knob_right_r).setOnClickListener(this);
        findViewById(R.id.car_up).setOnTouchListener(this);
        findViewById(R.id.p_off).setOnTouchListener(this);
        findViewById(R.id.sport_esp_off).setOnTouchListener(this);
        findViewById(R.id.left_key).setOnTouchListener(this);
        findViewById(R.id.right_key).setOnTouchListener(this);
        updateViewType(0);
        setOnLongClickListener(this);
        this.mBrightness = getBrightness();
    }

    private void updateViewType(int type) {
        this.mViewType = type;
        ImageView view = (ImageView) findViewById(R.id.sport_esp_off);
        view.setImageResource(type == 1 ? R.drawable.icon_04 : R.drawable.icon_08);
        findViewById(R.id.sport_esp_off).setOnTouchListener(this);
        findViewById(R.id.left_key).setVisibility(type == 1 ? 0 : 8);
        findViewById(R.id.right_key).setVisibility(type == 1 ? 0 : 8);
    }

    public void setCarInfoManage(CarInfoManager manager) {
        this.mCarInfoManager = manager;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mBrightness = getBrightness();
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        Log.d(TAG, "onClick:" + v);
        switch (v.getId()) {
            case R.id.knob_left_l /* 2131034171 */:
                setKey(Cea708CCParser.Const.CODE_C1_CW1, 1);
                break;
            case R.id.knob_left_r /* 2131034172 */:
                setKey(Cea708CCParser.Const.CODE_C1_CW2, 1);
                break;
            case R.id.knob_right_l /* 2131034173 */:
                this.mBrightness -= 10;
                SpdManager.getInstance(getContext()).setSystemCmd(5, this.mBrightness, 1);
                break;
            case R.id.knob_right_r /* 2131034174 */:
                this.mBrightness += 10;
                SpdManager.getInstance(getContext()).setSystemCmd(5, this.mBrightness, 1);
                break;
        }
    }

    private int getBrightness() {
        return Settings.System.getInt(getContext().getContentResolver(), "screen_brightness", 0);
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View v, MotionEvent event) {
        int action;
        Log.d(TAG, "onTouch:" + event);
        int action2 = event.getAction();
        if (action2 == 0) {
            action = 1;
        } else {
            if (action2 != 1 && action2 != 3) {
                return false;
            }
            action = 0;
        }
        switch (v.getId()) {
            case R.id.car_up /* 2131034136 */:
                setKey(3, action);
                return false;
            case R.id.left_key /* 2131034177 */:
                setKey(5, action);
                return false;
            case R.id.p_off /* 2131034187 */:
                setKey(1, action);
                return false;
            case R.id.right_key /* 2131034190 */:
                setKey(6, action);
                return false;
            case R.id.sport_esp_off /* 2131034193 */:
                setKey(this.mViewType == 1 ? 4 : 2, action);
                return false;
            default:
                return false;
        }
    }

    private void setKey(int key, int action) {
        Log.d(TAG, "setKey:" + key + ",action:" + action);
        if (this.mCarInfoManager != null) {
            this.mCarInfoManager.setKeyEvent(key, action);
        }
    }

    @Override // android.view.View.OnLongClickListener
    public boolean onLongClick(View v) {
        Log.d(TAG, "onLongClick:" + v);
        updateViewType(this.mViewType == 1 ? 0 : 1);
        return true;
    }
}
