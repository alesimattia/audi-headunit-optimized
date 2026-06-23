package com.spd.view;

import android.content.Context;
import android.provider.Settings;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import androidx.annotation.Nullable;
import com.spd.xhsntg.R;

/* JADX INFO: loaded from: classes.dex */
public class LvdsTestView extends LinearLayout implements View.OnClickListener {
    private static final String TAG = "LvdsTestView";
    private EditText mBriET;
    private int mBriValue;
    private EditText mContET;
    private int mContValue;
    private EditText mHiET;
    private int mHiValue;
    private EditText mLowET;
    private int mLowValue;

    public LvdsTestView(Context context) {
        this(context, null);
    }

    public LvdsTestView(Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public LvdsTestView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initView();
    }

    private void initView() {
        View.inflate(getContext(), R.layout.test_layout, this);
        this.mHiET = (EditText) findViewById(R.id.edit_hi_number);
        this.mLowET = (EditText) findViewById(R.id.edit_low_number);
        this.mBriET = (EditText) findViewById(R.id.edit_bri_number);
        this.mContET = (EditText) findViewById(R.id.edit_cons_number);
        findViewById(R.id.button_hi_m).setOnClickListener(this);
        findViewById(R.id.button_hi_p).setOnClickListener(this);
        findViewById(R.id.button_low_m).setOnClickListener(this);
        findViewById(R.id.button_low_p).setOnClickListener(this);
        findViewById(R.id.button_low_reset).setOnClickListener(this);
        findViewById(R.id.button_hi_reset).setOnClickListener(this);
        findViewById(R.id.button_bri_m).setOnClickListener(this);
        findViewById(R.id.button_bri_p).setOnClickListener(this);
        findViewById(R.id.button_cons_m).setOnClickListener(this);
        findViewById(R.id.button_cons_p).setOnClickListener(this);
        findViewById(R.id.button_bri_reset).setOnClickListener(this);
        findViewById(R.id.button_cons_reset).setOnClickListener(this);
        findViewById(R.id.button_close).setOnClickListener(this);
        this.mHiValue = getPkgDelayHi();
        this.mLowValue = getPkgDelayLow();
        setPkgDelay(this.mHiET, this.mHiValue);
        setPkgDelay(this.mLowET, this.mLowValue);
        this.mBriValue = getLvdsBrightness();
        this.mContValue = getLvdsContrast();
        setPkgDelay(this.mBriET, this.mBriValue);
        setPkgDelay(this.mContET, this.mContValue);
        this.mHiET.addTextChangedListener(new TextWatcher() { // from class: com.spd.view.LvdsTestView.1
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
                Log.d(LvdsTestView.TAG, "afterTextChanged hi:" + s.toString());
                try {
                    int i = Integer.parseInt(s.toString());
                    if (i < -1) {
                        LvdsTestView.this.setPkgDelay(LvdsTestView.this.mHiET, -1);
                        i = -1;
                    } else if (i > 255) {
                        i = 255;
                        LvdsTestView.this.setPkgDelay(LvdsTestView.this.mHiET, 255);
                    }
                    LvdsTestView.this.setPkgDelayHi(i);
                    LvdsTestView.this.mHiET.setSelection(LvdsTestView.this.mHiET.getText().toString().length());
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    LvdsTestView.this.setPkgDelay(LvdsTestView.this.mHiET, 0);
                }
            }
        });
        this.mLowET.addTextChangedListener(new TextWatcher() { // from class: com.spd.view.LvdsTestView.2
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
                Log.d(LvdsTestView.TAG, "afterTextChanged low:" + s.toString());
                try {
                    int i = Integer.parseInt(s.toString());
                    if (i < -1) {
                        LvdsTestView.this.setPkgDelay(LvdsTestView.this.mLowET, -1);
                        i = -1;
                    } else if (i > 255) {
                        i = 255;
                        LvdsTestView.this.setPkgDelay(LvdsTestView.this.mLowET, 255);
                    }
                    LvdsTestView.this.setPkgDelayLow(i);
                    LvdsTestView.this.mLowET.setSelection(LvdsTestView.this.mLowET.getText().toString().length());
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    LvdsTestView.this.setPkgDelay(LvdsTestView.this.mLowET, 0);
                }
            }
        });
        this.mBriET.addTextChangedListener(new TextWatcher() { // from class: com.spd.view.LvdsTestView.3
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
                Log.d(LvdsTestView.TAG, "afterTextChanged bri:" + s.toString());
                try {
                    int i = Integer.parseInt(s.toString());
                    if (i < 0) {
                        LvdsTestView.this.setPkgDelay(LvdsTestView.this.mBriET, 0);
                        i = 0;
                    } else if (i > 255) {
                        i = 255;
                        LvdsTestView.this.setPkgDelay(LvdsTestView.this.mBriET, 255);
                    }
                    LvdsTestView.this.setLvdsBrightness(i);
                    LvdsTestView.this.mBriET.setSelection(LvdsTestView.this.mBriET.getText().toString().length());
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    LvdsTestView.this.setPkgDelay(LvdsTestView.this.mBriET, 128);
                }
            }
        });
        this.mContET.addTextChangedListener(new TextWatcher() { // from class: com.spd.view.LvdsTestView.4
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
                Log.d(LvdsTestView.TAG, "afterTextChanged cont:" + s.toString());
                try {
                    int i = Integer.parseInt(s.toString());
                    if (i < -100) {
                        LvdsTestView.this.setPkgDelay(LvdsTestView.this.mContET, -100);
                        i = -100;
                    } else if (i > 100) {
                        i = 100;
                        LvdsTestView.this.setPkgDelay(LvdsTestView.this.mContET, 100);
                    }
                    LvdsTestView.this.setLvdsContrast(i);
                    LvdsTestView.this.mContET.setSelection(LvdsTestView.this.mContET.getText().toString().length());
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    LvdsTestView.this.setPkgDelay(LvdsTestView.this.mContET, 0);
                }
            }
        });
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.button_bri_m /* 2131034122 */:
                int value = getPkgDelay(this.mBriET);
                setLvdsBrightness(value - 1);
                break;
            case R.id.button_bri_p /* 2131034123 */:
                int value2 = getPkgDelay(this.mBriET);
                setLvdsBrightness(value2 + 1);
                break;
            case R.id.button_bri_reset /* 2131034124 */:
                resetLvdsBrightness();
                break;
            case R.id.button_close /* 2131034125 */:
                setVisibility(8);
                break;
            case R.id.button_cons_m /* 2131034126 */:
                int value3 = getPkgDelay(this.mContET);
                setLvdsContrast(value3 - 1);
                break;
            case R.id.button_cons_p /* 2131034127 */:
                int value4 = getPkgDelay(this.mContET);
                setLvdsContrast(value4 + 1);
                break;
            case R.id.button_cons_reset /* 2131034128 */:
                resetLvdsContrast();
                break;
            case R.id.button_hi_m /* 2131034129 */:
                int value5 = getPkgDelay(this.mHiET);
                setPkgDelayHi(value5 - 1);
                break;
            case R.id.button_hi_p /* 2131034130 */:
                int value6 = getPkgDelay(this.mHiET);
                setPkgDelayHi(value6 + 1);
                break;
            case R.id.button_hi_reset /* 2131034131 */:
                resetPkgDelayHi();
                break;
            case R.id.button_low_m /* 2131034132 */:
                int value7 = getPkgDelay(this.mLowET);
                setPkgDelayLow(value7 - 1);
                break;
            case R.id.button_low_p /* 2131034133 */:
                int value8 = getPkgDelay(this.mLowET);
                setPkgDelayLow(value8 + 1);
                break;
            case R.id.button_low_reset /* 2131034134 */:
                resetPkgDelayLow();
                break;
        }
    }

    private int getPkgDelay(EditText editText) {
        if (editText == null) {
            return 0;
        }
        String str = editText.getText().toString();
        if (TextUtils.isEmpty(str)) {
            return 0;
        }
        return Integer.parseInt(str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setPkgDelay(EditText editText, int value) {
        if (editText == null) {
            return;
        }
        editText.setText(value + "");
    }

    private int formatValue(int value) {
        if (value < -1) {
            return -1;
        }
        if (value > 255) {
            return 255;
        }
        return value;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setPkgDelayLow(int value) {
        Log.d(TAG, "setPkgDelayLow:" + value);
        int value2 = formatValue(value);
        if (this.mLowValue != value2) {
            this.mLowValue = value2;
            Settings.System.putInt(getContext().getContentResolver(), "SETTING_PKT_DELAY_LOW", value2);
            setPkgDelay(this.mLowET, value2);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setPkgDelayHi(int value) {
        Log.d(TAG, "setPkgDelayHi:" + value);
        int value2 = formatValue(value);
        if (this.mHiValue != value2) {
            this.mHiValue = value2;
            Settings.System.putInt(getContext().getContentResolver(), "SETTING_PKT_DELAY_HI", value2);
            setPkgDelay(this.mHiET, value2);
        }
    }

    private void resetPkgDelayLow() {
        this.mLowValue = -1;
        Settings.System.putInt(getContext().getContentResolver(), "SETTING_PKT_DELAY_LOW", -1);
        setPkgDelay(this.mLowET, this.mLowValue);
    }

    private void resetPkgDelayHi() {
        this.mHiValue = -1;
        Settings.System.putInt(getContext().getContentResolver(), "SETTING_PKT_DELAY_HI", -1);
        setPkgDelay(this.mHiET, this.mHiValue);
    }

    private int getPkgDelayLow() {
        return Settings.System.getInt(getContext().getContentResolver(), "SETTING_PKT_DELAY_LOW", -1);
    }

    private int getPkgDelayHi() {
        return Settings.System.getInt(getContext().getContentResolver(), "SETTING_PKT_DELAY_HI", -1);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setLvdsBrightness(int value) {
        Log.d(TAG, "setLvdsBrightness:" + value);
        if (value < 0) {
            value = 0;
        } else if (value > 255) {
            value = 255;
        }
        if (this.mBriValue != value) {
            this.mBriValue = value;
            Settings.System.putInt(getContext().getContentResolver(), "SETTING_AVM_LVDS_BRIGHTNESS", value);
            setPkgDelay(this.mBriET, value);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setLvdsContrast(int value) {
        Log.d(TAG, "setLvdsContrast:" + value);
        if (value < -100) {
            value = -100;
        } else if (value > 100) {
            value = 100;
        }
        if (this.mContValue != value) {
            this.mContValue = value;
            Settings.System.putInt(getContext().getContentResolver(), "SETTING_AVM_LVDS_CONTRAST", value);
            setPkgDelay(this.mContET, value);
        }
    }

    private void resetLvdsBrightness() {
        this.mBriValue = 128;
        Settings.System.putInt(getContext().getContentResolver(), "SETTING_AVM_LVDS_BRIGHTNESS", this.mBriValue);
        setPkgDelay(this.mBriET, this.mBriValue);
    }

    private void resetLvdsContrast() {
        this.mContValue = 0;
        Settings.System.putInt(getContext().getContentResolver(), "SETTING_AVM_LVDS_CONTRAST", this.mContValue);
        setPkgDelay(this.mContET, this.mContValue);
    }

    private int getLvdsBrightness() {
        return Settings.System.getInt(getContext().getContentResolver(), "SETTING_AVM_LVDS_BRIGHTNESS", 128);
    }

    private int getLvdsContrast() {
        return Settings.System.getInt(getContext().getContentResolver(), "SETTING_AVM_LVDS_CONTRAST", 0);
    }
}
