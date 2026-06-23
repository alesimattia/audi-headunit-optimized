package com.spd.navi;

import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.provider.Settings;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.spd.carinfo.CarInfo;
import com.spd.xhsntg.R;
import com.tencent.taes.util.FileUtils;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: loaded from: classes.dex */
public class AmapAutoNaviFrameManager implements View.OnClickListener, View.OnTouchListener {
    private static final int OFFSET_X = 150;
    private static final int OFFSET_Y = 150;
    private int mDownX;
    private int mDownY;
    private boolean mIsOnClick;
    AssetManager m_assets;
    private Context m_context;
    private TextView m_cross_distance;
    private TextView m_cross_distance_extends;
    private TextView m_cross_name;
    private TextView m_cross_name_extends;
    private ImageView m_cross_type;
    private Bitmap m_current_bmp;
    private Bitmap m_default_bmp;
    private Intent m_intent;
    private FrameLayout m_root_view;
    public static String TAG = "NAVI-HOME";
    private static final String CLASS_TAG = "[" + AmapAutoNaviFrameManager.class.getSimpleName() + "] ";
    private Paint m_test_paint = new Paint();
    private Rect m_test_rect = new Rect();
    private BroadcastReceiver m_receiver = new BroadcastReceiver() { // from class: com.spd.navi.AmapAutoNaviFrameManager.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            Message c_msg = new Message();
            c_msg.what = 100;
            c_msg.obj = intent;
            AmapAutoNaviFrameManager.this.m_refresh_handler.sendMessage(c_msg);
        }
    };
    private final int MSG_GUIDE_INFO_UPDATE = 100;
    private final int MSG_RESET_NAVIGATION_INFO = 400;
    private Handler m_refresh_handler = new Handler() { // from class: com.spd.navi.AmapAutoNaviFrameManager.2
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            int i = msg.what;
            if (i == 100) {
                Intent intent = (Intent) msg.obj;
                AmapAutoNaviFrameManager.this.guideInfoUpdate(intent);
            } else if (i == 400) {
                AmapAutoNaviFrameManager.this.resetNavigationInfo();
            }
        }
    };
    private int m_current_img_id = 0;
    private boolean m_frame_init_flag = false;

    /* JADX INFO: Access modifiers changed from: private */
    public void guideInfoUpdate(Intent intent) {
        Bundle extras = intent.getExtras();
        extras.keySet();
        int c_key_set = extras.getInt("KEY_TYPE", 0);
        if (c_key_set != 10001) {
            if (c_key_set == 10008) {
                intent.getStringExtra("EXTRA_NAME");
                return;
            }
            if (c_key_set == 10019) {
                int type = intent.getIntExtra("EXTRA_STATE", 0);
                switch (type) {
                    case 2:
                        Log.i(TAG, CLASS_TAG + "导航状态: 运行结束，退出程序");
                        requestCurrentPosition();
                        resetNavigationInfoReq();
                        break;
                    case 3:
                        Log.i(TAG, CLASS_TAG + type + " 导航状态: 进入前台");
                        break;
                    case 4:
                        Log.i(TAG, CLASS_TAG + type + " 导航状态: 进入后台");
                        requestCurrentPosition();
                        break;
                    case 8:
                        Log.i(TAG, CLASS_TAG + type + " 导航状态: 导航");
                        break;
                    case 9:
                        Log.d("NAVI-1110", type + " 导航状态: 非导航");
                        requestCurrentPosition();
                        resetNavigationInfoReq();
                        break;
                }
                return;
            }
            return;
        }
        int c_cross_distance = intent.getIntExtra(GuideInfoExtraKey.SEG_REMAIN_DIS, 0);
        if (c_cross_distance < 1000) {
            this.m_cross_distance.setText(c_cross_distance + "");
            this.m_cross_distance_extends.setText(this.m_context.getResources().getString(R.string.distance_metre_after));
        } else {
            String c_distance = (c_cross_distance / 1000) + FileUtils.FILE_EXTENSION_SEPARATOR + ((c_cross_distance % 1000) / 100);
            this.m_cross_distance.setText(c_distance);
            this.m_cross_distance_extends.setText(this.m_context.getResources().getString(R.string.distance_kilometer_after));
        }
        int c_icon = intent.getIntExtra(GuideInfoExtraKey.ICON, 0);
        if (this.m_current_img_id != c_icon) {
            if (this.m_current_bmp != null && this.m_current_bmp != this.m_default_bmp) {
                this.m_current_bmp.recycle();
            }
            this.m_current_img_id = c_icon;
            this.m_current_bmp = getNaviIcon(c_icon);
            if (this.m_current_bmp == null) {
                this.m_current_bmp = this.m_default_bmp;
                this.m_cross_type.setVisibility(4);
            } else {
                this.m_cross_type.setVisibility(0);
                this.m_cross_type.setImageBitmap(this.m_current_bmp);
            }
        }
        intent.getStringExtra(GuideInfoExtraKey.CUR_ROAD_NAME);
        String c_next_road_name = intent.getStringExtra(GuideInfoExtraKey.NEXT_ROAD_NAME);
        if (c_next_road_name != null) {
            this.m_cross_name_extends.setText(this.m_context.getResources().getString(R.string.enter));
            this.m_cross_name_extends.setVisibility(0);
            this.m_cross_name.setVisibility(0);
            this.m_test_paint.getTextBounds(c_next_road_name, 0, c_next_road_name.length(), this.m_test_rect);
            if (this.m_test_rect.width() > 321.0f) {
                this.m_cross_name.setTextSize(23.0f);
                this.m_cross_name.setText(c_next_road_name);
                this.m_cross_name.setLines(2);
                return;
            } else {
                this.m_cross_name.setTextSize(36.0f);
                this.m_cross_name.setText(c_next_road_name);
                this.m_cross_name.setLines(1);
                return;
            }
        }
        this.m_cross_name_extends.setVisibility(4);
        this.m_cross_name.setVisibility(4);
    }

    public AmapAutoNaviFrameManager(Context c_context) {
        this.m_assets = null;
        this.m_context = c_context;
        this.m_test_paint.setTextSize(36.0f);
        this.m_assets = c_context.getAssets();
        this.m_context = c_context;
        this.m_default_bmp = getNaviIcon(0);
    }

    public void setFrameLayout(FrameLayout c_root_view) {
        this.m_root_view = c_root_view;
        this.m_cross_type = (ImageView) c_root_view.findViewById(R.id.id_text_navi_cross_icon);
        this.m_cross_distance = (TextView) c_root_view.findViewById(R.id.id_text_navi_cross_distance);
        this.m_cross_distance_extends = (TextView) c_root_view.findViewById(R.id.id_text_navi_cross_distance_extends);
        this.m_cross_name = (TextView) c_root_view.findViewById(R.id.id_text_navi_cross_name);
        this.m_cross_name_extends = (TextView) c_root_view.findViewById(R.id.id_text_navi_cross_name_extends);
        resetNavigationInfoReq();
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (!this.mIsOnClick) {
            return;
        }
        ContentResolver cv = this.m_context.getContentResolver();
        String c_app_componet_name = Settings.System.getString(cv, "SETTING_NAVI_APP");
        if (c_app_componet_name != null) {
            String c_app_componet_name2 = c_app_componet_name.trim();
            PackageManager manager = this.m_context.getPackageManager();
            this.m_intent = manager.getLaunchIntentForPackage(c_app_componet_name2);
            try {
                this.m_context.startActivity(this.m_intent);
            } catch (Exception e) {
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View v, MotionEvent event) {
        int action = event.getAction();
        switch (action) {
            case 0:
                this.mDownX = (int) event.getX();
                this.mDownY = (int) event.getY();
                this.mIsOnClick = false;
                return false;
            case 1:
                int downX = (int) event.getX();
                int downY = (int) event.getY();
                if (Math.abs(downX - this.mDownX) <= 150 && Math.abs(downY - this.mDownY) <= 150) {
                    this.mIsOnClick = true;
                }
                return false;
            default:
                return false;
        }
    }

    public void initFrameManager() {
        if (!this.m_frame_init_flag) {
            this.m_frame_init_flag = true;
            IntentFilter c_intent_filter = new IntentFilter();
            c_intent_filter.addAction("AUTONAVI_STANDARD_BROADCAST_SEND");
            this.m_context.registerReceiver(this.m_receiver, c_intent_filter);
            resetNavigationInfoReq();
            requestCurrentPosition();
            this.m_root_view.setOnClickListener(this);
            this.m_root_view.setOnTouchListener(this);
        }
    }

    public void uninitFrameManager() {
        if (this.m_frame_init_flag) {
            this.m_frame_init_flag = false;
            this.m_context.unregisterReceiver(this.m_receiver);
            this.m_root_view.setOnClickListener(null);
        }
    }

    private Bitmap getNaviIcon(int c_navi_icon_id) {
        Log.d("SimonCheck002", "getNaviIcon: c_navi_icon_id=" + c_navi_icon_id);
        Bitmap c_result = null;
        try {
            InputStream c_input_stream = this.m_assets.open("a_map_auto_tip_" + c_navi_icon_id + ".png");
            c_result = BitmapFactory.decodeStream(c_input_stream);
            Log.d("SimonCheck002", "getNaviIcon: c_result=" + c_result);
            return c_result;
        } catch (IOException e) {
            e.printStackTrace();
            Log.d("SimonCheck002", "getNaviIcon: error=");
            return c_result;
        }
    }

    private void requestCurrentPosition() {
        Log.i(TAG, CLASS_TAG + "requestCurrentPosition");
        Intent intent = new Intent("AUTONAVI_STANDARD_BROADCAST_RECV");
        intent.putExtra("KEY_TYPE", CarInfo.General.UNIT_ELECTRIC_CONSUMPTION);
        intent.putExtra("EXTRA_SHOW_TYPE", 1);
        this.m_context.sendBroadcast(intent);
    }

    private void resetNavigationInfoReq() {
        this.m_refresh_handler.sendEmptyMessage(400);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void resetNavigationInfo() {
        if (this.m_cross_type != null) {
            this.m_cross_type.setVisibility(0);
        }
        if (this.m_cross_distance != null) {
            this.m_cross_distance.setText("");
        }
        if (this.m_cross_distance_extends != null) {
            this.m_cross_distance_extends.setText("");
        }
        if (this.m_cross_name != null) {
            this.m_cross_name.setText("");
        }
        if (this.m_cross_name_extends != null) {
            this.m_cross_name_extends.setText("");
        }
    }
}
