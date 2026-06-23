package com.spd.xhsntg;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.provider.Settings;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.LinearLayout;
import androidx.media.MediaPlayer2;
import androidx.viewpager.widget.ViewPager;
import com.spd.system.service.SpdManager;
import com.spd.view.MyViewPageAdapter;
import com.spd.xhsntg.CarInfoManager;
import com.spd.xhsntg.DvrHelper;
import com.spd.xhsntg.ReverseBroadcast;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
public class FullscreenActivity extends Activity implements View.OnClickListener, DvrHelper.DvrHelperCallBack, CarInfoManager.Callback, ReverseBroadcast.Callback, View.OnTouchListener {
    private static final int HANDLE_LONG_CLICK = 1000;
    private static final int OFFSET_X = 80;
    private static final int OFFSET_Y = 80;
    private static final String TAG = "FullscreenActivity";
    private CarInfoManager mCarInfoManager;
    private int mDownX;
    private int mDownY;
    private Handler mHandler;
    private int mHasMediaSource;
    private boolean mIsAudioFocus;
    private int mMediaSource;
    private SharedPreferences mSharedPreferences;
    private SpdManager mSpdManager;
    private LinearLayout.LayoutParams m_preview_layout_para;
    private DvrPreviewSurfaceView m_preview_surface_view;
    private MyViewPageAdapter m_view_page_adapter;
    private int m_show_preview_mode = 0;
    private int mSurfaceWidth = 0;
    private int mSurfaceHeight = 0;
    private boolean m_resume_flag = false;
    private boolean m_service_connect_flag = false;
    private ViewPager.OnPageChangeListener mOnPageChangeListener = new ViewPager.OnPageChangeListener() { // from class: com.spd.xhsntg.FullscreenActivity.1
        @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
        public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
        }

        @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
        public void onPageSelected(int position) {
            FullscreenActivity.this.getPreferences().edit().putInt("page", position).apply();
        }

        @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
        public void onPageScrollStateChanged(int state) {
        }
    };
    private BroadcastReceiver mReverseReceiver = new BroadcastReceiver() { // from class: com.spd.xhsntg.FullscreenActivity.2
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
        }
    };

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fullscreen);
        this.mHandler = new H(this, Looper.getMainLooper());
        DvrHelper.get().initDvrHelper(getApplicationContext());
        this.mCarInfoManager = new CarInfoManager();
        this.mCarInfoManager.init(this);
        this.mCarInfoManager.setCallback(this);
        this.m_preview_surface_view = (DvrPreviewSurfaceView) findViewById(R.id.id_preview_surface_view);
        this.m_preview_surface_view.setOnClickListener(this);
        this.m_preview_surface_view.setOnTouchListener(this);
        Object c_old_para = this.m_preview_surface_view.getLayoutParams();
        if (c_old_para != null && (c_old_para instanceof LinearLayout.LayoutParams)) {
            this.m_preview_layout_para = (LinearLayout.LayoutParams) c_old_para;
        } else {
            this.m_preview_layout_para = new LinearLayout.LayoutParams(-1, -1);
            this.m_preview_surface_view.setLayoutParams(this.m_preview_layout_para);
        }
        ContentResolver cv = getContentResolver();
        this.m_show_preview_mode = Settings.System.getInt(cv, "SETTING_NTG_FULL_SCREEN", 0);
        checkPreviewMode();
        this.m_view_page_adapter = new MyViewPageAdapter(this);
        this.m_view_page_adapter.setCarInfoManager(this.mCarInfoManager);
        ViewPager c_view_pager = (ViewPager) findViewById(R.id.id_view_page);
        c_view_pager.setAdapter(this.m_view_page_adapter);
        c_view_pager.addOnPageChangeListener(this.mOnPageChangeListener);
        int page = getPreferences().getInt("page", 0);
        c_view_pager.setCurrentItem(page);
        ReverseBroadcast.addCallback(this);
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        Log.d(TAG, "onDestroy");
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
            this.mHandler = null;
        }
        if (this.mCarInfoManager != null) {
            this.mCarInfoManager.setCallback(null);
            this.mCarInfoManager.unInit();
            this.mCarInfoManager = null;
        }
        ReverseBroadcast.removeCallback(this);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        Log.d(TAG, "onClick");
        if (!supportScreenTouch() && ReverseBroadcast.isReverse() == 0) {
            startHome();
        }
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View v, MotionEvent event) {
        if (supportScreenTouch()) {
            int x = (int) event.getX();
            int y = (int) event.getY();
            if (this.mSurfaceWidth == 0 || this.mSurfaceHeight == 0) {
                this.mSurfaceWidth = this.m_preview_surface_view.getWidth();
                this.mSurfaceHeight = this.m_preview_surface_view.getHeight();
            }
            if (this.mSurfaceWidth == 0 || this.mSurfaceHeight == 0) {
                return false;
            }
            int i = (x * 1280) / this.mSurfaceWidth;
            int x2 = y * 480;
            int i2 = x2 / this.mSurfaceHeight;
        }
        if (supportDebugLvds()) {
            int action = event.getAction();
            if (action == 0) {
                this.mDownX = (int) event.getX();
                this.mDownY = (int) event.getY();
                this.mHandler.sendEmptyMessageDelayed(1000, 5000L);
            } else if (action == 1 || action == 3) {
                if (this.mHandler.hasMessages(1000)) {
                    this.mHandler.removeMessages(1000);
                } else {
                    return true;
                }
            } else if (action == 2) {
                int x3 = (int) event.getX();
                int y2 = (int) event.getY();
                int dx = Math.abs(x3 - this.mDownX);
                int dy = Math.abs(y2 - this.mDownY);
                if ((dx > 80 || dy > 80) && this.mHandler.hasMessages(1000)) {
                    this.mHandler.removeMessages(1000);
                }
            }
        }
        return false;
    }

    private boolean supportScreenTouch() {
        return false;
    }

    private boolean supportDebugLvds() {
        return Settings.System.getInt(getContentResolver(), "SETTING_DEVELOPER_MODE", 0) == 1;
    }

    private void startHome() {
        Intent mHomeIntent = new Intent("android.intent.action.MAIN", (Uri) null);
        mHomeIntent.addCategory("android.intent.category.HOME");
        mHomeIntent.addFlags(270532608);
        startActivity(mHomeIntent);
    }

    private int getPreviewViewWidth() {
        DisplayMetrics metrics = getResources().getDisplayMetrics();
        int w = metrics.widthPixels;
        int h = metrics.heightPixels;
        if (w == 1280 && h == 480) {
            return MediaPlayer2.MEDIA_INFO_BAD_INTERLEAVING;
        }
        if (w == 1920 && h == 720) {
            return 1280;
        }
        if (w == 800 && h == 480) {
            findViewById(R.id.id_view_page).setVisibility(8);
            return -1;
        }
        if (w == 1024 && h == 600) {
            return 1024;
        }
        if (w != 1600 || h != 720) {
            return 1280;
        }
        return 1200;
    }

    private void checkPreviewMode() {
        int fullScreen = Settings.System.getInt(getContentResolver(), "SETTING_NTG_FULL_SCREEN", 0);
        Log.d(TAG, "checkPreviewMode:" + this.m_show_preview_mode + ",fullScreen:" + fullScreen);
        if (this.m_show_preview_mode == 1) {
            this.m_preview_layout_para.width = -1;
            this.m_preview_layout_para.height = -1;
            this.m_preview_surface_view.requestLayout();
        } else if (this.m_show_preview_mode == 0) {
            int width = getPreviewViewWidth();
            this.m_preview_layout_para.width = width;
            this.m_preview_layout_para.height = -1;
            this.m_preview_surface_view.requestLayout();
        }
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        Log.d(TAG, "onResume:" + this.mHasMediaSource);
        ReverseBroadcast.setTopActivity(true);
        this.m_resume_flag = true;
        setAudioMode();
        checkPreviewShow();
        if (this.mHasMediaSource == 1) {
            if (canRequestAudioFocus()) {
                requestAudioFocus();
            }
        } else if (this.mMediaSource != 16) {
            requestAudioFocus();
        }
        getSpdManager().enterSource("com.spd.xhsntg|com.spd.ntg.ACTION");
    }

    private int getReverseState(Intent intent) {
        int reverse = 0;
        if (intent != null) {
            reverse = intent.getIntExtra(ReverseBroadcast.KEY_REVERSE, 0);
        }
        Log.d(TAG, "getReverseState:" + reverse);
        return reverse;
    }

    @Override // android.app.Activity
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        Log.d(TAG, "onNewIntent" + intent);
    }

    private SpdManager getSpdManager() {
        if (this.mSpdManager == null) {
            this.mSpdManager = new SpdManager(getApplicationContext());
        }
        return this.mSpdManager;
    }

    @Override // android.app.Activity
    protected void onPause() {
        Log.d(TAG, "onPause");
        ReverseBroadcast.setTopActivity(false);
        this.m_resume_flag = false;
        setAudioMode();
        this.m_preview_surface_view.setDvrChannel(0, 0);
        super.onPause();
    }

    @Override // android.app.Activity
    protected void onStart() {
        super.onStart();
        Log.d(TAG, "onStart");
        DvrHelper.get().regsiterCallBack(this);
        this.m_view_page_adapter.initManager();
    }

    @Override // android.app.Activity
    protected void onStop() {
        Log.d(TAG, "onStop");
        this.m_view_page_adapter.uninitManager();
        DvrHelper.get().unregsiterCallBack(this);
        this.m_service_connect_flag = false;
        super.onStop();
    }

    private void checkPreviewShow() {
        Log.d(TAG, "checkPreviewShow m_resume_flag:" + this.m_resume_flag + ",m_service_connect_flag:" + this.m_service_connect_flag + ",this:" + this);
        if (this.m_resume_flag && this.m_service_connect_flag) {
            this.m_preview_surface_view.setDvrChannel(1, 0);
        }
    }

    @Override // com.spd.xhsntg.DvrHelper.DvrHelperCallBack
    public void onServiceConnected() {
        this.m_service_connect_flag = true;
        checkPreviewShow();
    }

    @Override // com.spd.xhsntg.DvrHelper.DvrHelperCallBack
    public void onServiceDisconnected() {
        this.m_service_connect_flag = false;
    }

    @Override // com.spd.xhsntg.DvrHelper.DvrHelperCallBack
    public void onDvrStateChanged(int msg, int args) {
    }

    @Override // com.spd.xhsntg.DvrHelper.DvrHelperCallBack
    public void onFileInfoChanged(int type, int count) {
    }

    @Override // com.spd.xhsntg.CarInfoManager.Callback
    public void onUpdateConnected(boolean connected) {
        if (connected) {
            setAudioMode();
        }
    }

    @Override // com.spd.xhsntg.CarInfoManager.Callback
    public void onUpdateDoors(boolean hood, boolean trunk, boolean frontLeft, boolean frontRight, boolean rearLeft, boolean rearRight) {
        this.m_view_page_adapter.updateDoors(hood, trunk, frontLeft, frontRight, rearLeft, rearRight);
    }

    @Override // com.spd.xhsntg.CarInfoManager.Callback
    public void updateCarModel(int o) {
    }

    @Override // com.spd.xhsntg.CarInfoManager.Callback
    public void onUpdateSpeed(float speed, int unit) {
        this.m_view_page_adapter.updateSpeed(speed, unit);
    }

    @Override // com.spd.xhsntg.CarInfoManager.Callback
    public void onUpdateTotalMileage(int mileage, int unit) {
        this.m_view_page_adapter.updateMileage(mileage, unit);
    }

    @Override // com.spd.xhsntg.CarInfoManager.Callback
    public void onUpdateMediaSource(int source, int hasSource) {
        Log.d(TAG, "onUpdateMediaSource:" + source + ",hasSource:" + hasSource);
        this.mMediaSource = source;
        this.mHasMediaSource = hasSource;
        if (this.mHasMediaSource == 1) {
            if (canRequestAudioFocus()) {
                requestAudioFocus();
                return;
            } else {
                releaseAudioFocus();
                return;
            }
        }
        if (!this.m_resume_flag && this.mMediaSource != 16) {
            releaseAudioFocus();
        }
    }

    private boolean canRequestAudioFocus() {
        Log.d(TAG, "canRequestAudioFocus:" + this.mMediaSource);
        return this.mMediaSource != 7;
    }

    private void requestAudioFocus() {
        Log.d(TAG, "requestAudioFocus:" + this.mIsAudioFocus);
        if (!this.mIsAudioFocus && ReverseBroadcast.isReverse() == 0) {
            this.mIsAudioFocus = true;
            getSpdManager().requestAudioFocus(getPackageName(), 3, 16);
        }
    }

    private void releaseAudioFocus() {
        Log.d(TAG, "releaseAudioFocus:" + this.mIsAudioFocus);
        if (!this.mIsAudioFocus) {
            return;
        }
        this.mIsAudioFocus = false;
        getSpdManager().releaseAudioFocus(getPackageName(), 3);
    }

    private void setAudioMode() {
        Log.d(TAG, "setAudioMode m_resume_flag:" + this.m_resume_flag + ",mCarInfoManager:" + this.mCarInfoManager);
        if (this.mCarInfoManager == null) {
            return;
        }
        if (this.m_resume_flag) {
            this.mCarInfoManager.setAudioMode(1);
        } else {
            this.mCarInfoManager.setAudioMode(2);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public SharedPreferences getPreferences() {
        if (this.mSharedPreferences == null) {
            this.mSharedPreferences = getSharedPreferences("save", 0);
        }
        return this.mSharedPreferences;
    }

    @Override // com.spd.xhsntg.ReverseBroadcast.Callback
    public void onReverseState(int reverse, boolean needExit) {
        Log.d(TAG, "onReverseState:" + reverse + ",needExit:" + needExit);
        if (needExit) {
            finish();
        }
    }

    public static class H extends Handler {
        private WeakReference<FullscreenActivity> mActivity;

        public H(FullscreenActivity activity, Looper looper) {
            super(looper);
            this.mActivity = new WeakReference<>(activity);
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            FullscreenActivity activity;
            super.handleMessage(msg);
            if (1000 == msg.what && (activity = this.mActivity.get()) != null) {
                activity.findViewById(R.id.ldvs_test_layout).setVisibility(0);
            }
        }
    }
}
