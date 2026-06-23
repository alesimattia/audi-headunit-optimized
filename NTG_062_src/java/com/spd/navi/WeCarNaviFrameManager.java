package com.spd.navi;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.os.Message;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.media.MediaPlayer2;
import com.spd.xhsntg.R;
import com.tencent.taes.TaesSDK;
import com.tencent.taes.TaesSDKHelper;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarAppEvent;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarGuideInfo;
import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarStartStopEvent;
import com.tencent.taes.remote.api.infodispatcher.listener.OnAppEventListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnGuideInfoListener;
import com.tencent.taes.remote.api.infodispatcher.listener.OnStartStopEventListener;
import com.tencent.taes.util.FileUtils;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: loaded from: classes.dex */
public class WeCarNaviFrameManager implements View.OnClickListener, View.OnTouchListener {
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
    private TaesSDKInitListener m_init_listener;
    private Intent m_intent;
    private FrameLayout m_root_view;
    private boolean m_taes_init_flag;
    public static String TAG = "NAVI-HOME";
    private static final String CLASS_TAG = "[" + WeCarNaviFrameManager.class.getSimpleName() + "] ";
    private Paint m_test_paint = new Paint();
    private Rect m_test_rect = new Rect();
    private int m_current_img_id = 0;
    private OnGuideInfoListener m_guide_info_listener = new OnGuideInfoListener() { // from class: com.spd.navi.WeCarNaviFrameManager.1
        @Override // com.tencent.taes.remote.api.infodispatcher.listener.OnGuideInfoListener
        public void onGuideInfoChanged(WeCarGuideInfo weCarGuideInfo) {
            Message c_msg = new Message();
            c_msg.what = 100;
            c_msg.obj = weCarGuideInfo;
            WeCarNaviFrameManager.this.m_refresh_handler.sendMessage(c_msg);
        }
    };
    private OnStartStopEventListener startStopEventListener = new OnStartStopEventListener() { // from class: com.spd.navi.WeCarNaviFrameManager.2
        @Override // com.tencent.taes.remote.api.infodispatcher.listener.OnStartStopEventListener
        public void onStartStopEvent(WeCarStartStopEvent weCarStartStopEvent) {
            Message c_msg = new Message();
            c_msg.what = MediaPlayer2.MEDIA_ERROR_NOT_VALID_FOR_PROGRESSIVE_PLAYBACK;
            c_msg.obj = weCarStartStopEvent;
            WeCarNaviFrameManager.this.m_refresh_handler.sendMessage(c_msg);
        }
    };
    private OnAppEventListener appEventListener = new OnAppEventListener() { // from class: com.spd.navi.WeCarNaviFrameManager.3
        @Override // com.tencent.taes.remote.api.infodispatcher.listener.OnAppEventListener
        public void onAppEvent(WeCarAppEvent weCarAppEvent) {
            Message c_msg = new Message();
            c_msg.what = 300;
            c_msg.obj = weCarAppEvent;
            WeCarNaviFrameManager.this.m_refresh_handler.sendMessage(c_msg);
        }
    };
    private final int MSG_REGISTER_LISTENER = 50;
    private final int MSG_UNREGISTER_LISTENER = 55;
    private final int MSG_GUIDE_INFO_UPDATE = 100;
    private final int MSG_START_STOP_EVENT_UPDATE = MediaPlayer2.MEDIA_ERROR_NOT_VALID_FOR_PROGRESSIVE_PLAYBACK;
    private final int MSG_APP_EVENT_UPDATE = 300;
    private final int MSG_RESET_NAVIGATION_INFO = 400;
    private Handler m_refresh_handler = new Handler() { // from class: com.spd.navi.WeCarNaviFrameManager.4
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            if (TaesSDKHelper.getContext() == null) {
                return;
            }
            int i = msg.what;
            if (i == 50) {
                TaesSDK.getInfoDispatchApi().registerGuideInfoListener(WeCarNaviFrameManager.this.m_guide_info_listener);
                TaesSDK.getInfoDispatchApi().registerStartStopEventListener(WeCarNaviFrameManager.this.startStopEventListener);
                TaesSDK.getInfoDispatchApi().registerAppEventListener(WeCarNaviFrameManager.this.appEventListener);
                return;
            }
            if (i == 55) {
                TaesSDK.getInfoDispatchApi().unregisterGuideInfoListener(WeCarNaviFrameManager.this.m_guide_info_listener);
                TaesSDK.getInfoDispatchApi().unregisterStartStopEventListener(WeCarNaviFrameManager.this.startStopEventListener);
                TaesSDK.getInfoDispatchApi().unregisterAppEventListener(WeCarNaviFrameManager.this.appEventListener);
                WeCarNaviFrameManager.this.m_init_listener = null;
                Log.d(WeCarNaviFrameManager.TAG, "uninitFrameManager");
                TaesSDK.init(null, 0, null, null, null);
                return;
            }
            if (i == 100) {
                WeCarGuideInfo weCarGuideInfo = (WeCarGuideInfo) msg.obj;
                WeCarNaviFrameManager.this.guideInfoUpdate(weCarGuideInfo);
                return;
            }
            if (i == 200) {
                WeCarStartStopEvent weCarStartStopEvent = (WeCarStartStopEvent) msg.obj;
                WeCarNaviFrameManager.this.startStopEventUpdate(weCarStartStopEvent);
            } else if (i == 300) {
                WeCarAppEvent weCarAppEvent = (WeCarAppEvent) msg.obj;
                WeCarNaviFrameManager.this.appEventUpdate(weCarAppEvent);
            } else if (i == 400) {
                WeCarNaviFrameManager.this.resetNavigationInfo();
            }
        }
    };
    private boolean m_listener_init_flag = false;
    private boolean m_frame_init_flag = false;

    private class TaesSDKInitListener implements TaesSDK.InitListener {
        private TaesSDKInitListener() {
        }

        @Override // com.tencent.taes.TaesSDK.InitListener
        public void onInitSuccess() {
            Log.d(WeCarNaviFrameManager.TAG, WeCarNaviFrameManager.CLASS_TAG + "TaesSDK onInitSuccess");
            WeCarNaviFrameManager.this.m_taes_init_flag = true;
            WeCarNaviFrameManager.this.checkInitFrame();
        }

        @Override // com.tencent.taes.TaesSDK.InitListener
        public void onInitError(String s, int i) {
            Log.e(WeCarNaviFrameManager.TAG, WeCarNaviFrameManager.CLASS_TAG + "TaesSDK onInitError");
            WeCarNaviFrameManager.this.m_taes_init_flag = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void guideInfoUpdate(WeCarGuideInfo weCarGuideInfo) {
        if (weCarGuideInfo == null) {
            return;
        }
        int c_cross_distance = weCarGuideInfo.turnDis;
        if (c_cross_distance < 1000) {
            this.m_cross_distance.setText(c_cross_distance + "");
            this.m_cross_distance_extends.setText(this.m_context.getResources().getString(R.string.distance_metre_after));
        } else {
            String c_distance = (c_cross_distance / 1000) + FileUtils.FILE_EXTENSION_SEPARATOR + ((c_cross_distance % 1000) / 100);
            this.m_cross_distance.setText(c_distance);
            this.m_cross_distance_extends.setText(this.m_context.getResources().getString(R.string.distance_kilometer_after));
        }
        int c_icon = weCarGuideInfo.turnIconNum;
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
        String str = weCarGuideInfo.currentRoadName;
        String c_next_road_name = weCarGuideInfo.nextRoadName;
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

    /* JADX INFO: Access modifiers changed from: private */
    public void startStopEventUpdate(WeCarStartStopEvent weCarStartStopEvent) {
        if (weCarStartStopEvent == null) {
            return;
        }
        boolean isNaviMode = weCarStartStopEvent.mode == 1;
        Log.i(TAG, CLASS_TAG + "startStopEventUpdate: isNaviMode = " + isNaviMode + "(" + weCarStartStopEvent.mode + ")");
        if (weCarStartStopEvent.eventType == 1) {
            Log.i(TAG, CLASS_TAG + "startStopEventUpdate, eventType: 开始");
            return;
        }
        if (weCarStartStopEvent.eventType == 2) {
            Log.e(TAG, CLASS_TAG + "startStopEventUpdate, eventType: 结束");
            resetNavigationInfoReq();
            return;
        }
        if (weCarStartStopEvent.eventType == 3) {
            Log.i(TAG, CLASS_TAG + "startStopEventUpdate, eventType: 模拟导航暂停");
            return;
        }
        if (weCarStartStopEvent.eventType == 4) {
            Log.i(TAG, CLASS_TAG + "startStopEventUpdate, eventType: 模拟导航继续");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void appEventUpdate(WeCarAppEvent weCarAppEvent) {
        if (weCarAppEvent == null) {
            return;
        }
        if (weCarAppEvent.type == 1) {
            Log.i(TAG, CLASS_TAG + "appEventUpdate: 应用初始化完成");
            return;
        }
        if (weCarAppEvent.type == 2) {
            Log.e(TAG, CLASS_TAG + "appEventUpdate: 退出");
            resetNavigationInfoReq();
            return;
        }
        if (weCarAppEvent.type == 3) {
            Log.i(TAG, CLASS_TAG + "appEventUpdate: 进入前台");
            return;
        }
        if (weCarAppEvent.type == 4) {
            Log.d(TAG, CLASS_TAG + "appEventUpdate: 进入后台");
        }
    }

    public WeCarNaviFrameManager(Context c_context) {
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

    /* JADX INFO: Access modifiers changed from: private */
    public void checkInitFrame() {
        if (this.m_frame_init_flag && this.m_taes_init_flag && !this.m_listener_init_flag) {
            this.m_listener_init_flag = true;
            this.m_refresh_handler.sendEmptyMessage(50);
        }
    }

    public void initFrameManager() {
        if (!this.m_frame_init_flag) {
            resetNavigationInfoReq();
            this.m_frame_init_flag = true;
            if (this.m_init_listener == null) {
                this.m_init_listener = new TaesSDKInitListener();
                Log.d(TAG, "initFrameManager");
                TaesSDK.init(this.m_context.getApplicationContext(), !checkApkExist(this.m_context, TaesSDKHelper.WECAR_PACKAGE_NAME) ? 1 : 0, "510e04766feba836e6428b247663319ac1a2b45d", "Home", this.m_init_listener);
            }
            checkInitFrame();
            this.m_root_view.setOnClickListener(this);
            this.m_root_view.setOnTouchListener(this);
        }
    }

    public void uninitFrameManager() {
        if (this.m_frame_init_flag) {
            this.m_frame_init_flag = false;
            if (this.m_listener_init_flag) {
                this.m_listener_init_flag = false;
                this.m_refresh_handler.sendEmptyMessage(55);
            }
            this.m_root_view.setOnClickListener(null);
        }
    }

    private boolean checkApkExist(Context context, String packageName) {
        if (context == null || TextUtils.isEmpty(packageName)) {
            return false;
        }
        try {
            context.getPackageManager().getPackageInfo(packageName, 0);
            int i = Build.VERSION.SDK_INT;
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    private Bitmap getNaviIcon(int c_navi_icon_id) {
        try {
            InputStream c_input_stream = this.m_assets.open("cross_tip_" + c_navi_icon_id + ".png");
            Bitmap c_result = BitmapFactory.decodeStream(c_input_stream);
            return c_result;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
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
