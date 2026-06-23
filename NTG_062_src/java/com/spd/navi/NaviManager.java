package com.spd.navi;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.ContentObserver;
import android.provider.Settings;
import android.util.Log;
import android.view.View;
import android.widget.FrameLayout;
import com.tencent.taes.TaesSDKHelper;

/* JADX INFO: loaded from: classes.dex */
public class NaviManager {
    private AmapAutoNaviFrameManager m_a_map_auto_navi_frame_manager;
    private Context m_context;
    private FrameLayout m_navi_frame;
    private WeCarNaviFrameManager m_we_car_navi_frame_manager;
    private ContentObserver naviAppSettingsObserver = new ContentObserver(null) { // from class: com.spd.navi.NaviManager.2
        @Override // android.database.ContentObserver
        public void onChange(boolean selfChange) {
            NaviManager.this.naviAppUpdate();
        }
    };
    public static String TAG = "NAVI-HOME";
    private static final String CLASS_TAG = "[" + NaviManager.class.getSimpleName() + "] ";
    private static String SETTING_NAVI_APP = "SETTING_NAVI_APP";

    public NaviManager(Context context) {
        this.m_context = context;
        this.m_a_map_auto_navi_frame_manager = new AmapAutoNaviFrameManager(context.getApplicationContext());
        this.m_we_car_navi_frame_manager = new WeCarNaviFrameManager(context.getApplicationContext());
    }

    public void setFrameLayout(FrameLayout c_root_view) {
        this.m_navi_frame = c_root_view;
        this.m_a_map_auto_navi_frame_manager.setFrameLayout(c_root_view);
        this.m_we_car_navi_frame_manager.setFrameLayout(c_root_view);
        this.m_navi_frame.setOnClickListener(new View.OnClickListener() { // from class: com.spd.navi.NaviManager.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ContentResolver cv = NaviManager.this.m_context.getContentResolver();
                String c_app_componet_name = Settings.System.getString(cv, "SETTING_NAVI_APP");
                if (c_app_componet_name != null) {
                    String c_app_componet_name2 = c_app_componet_name.trim();
                    PackageManager manager = NaviManager.this.m_context.getPackageManager();
                    try {
                        NaviManager.this.m_context.startActivity(manager.getLaunchIntentForPackage(c_app_componet_name2));
                    } catch (Exception e) {
                        Intent c_intent = new Intent("com.spd.action.settingui");
                        c_intent.putExtra("index", 10000);
                        c_intent.setFlags(270532608);
                        try {
                            NaviManager.this.m_context.startActivity(c_intent);
                        } catch (Exception e2) {
                        }
                    }
                }
            }
        });
    }

    public void initFrameManager() {
        naviAppUpdate();
        this.m_context.getContentResolver().registerContentObserver(Settings.System.getUriFor(SETTING_NAVI_APP), true, this.naviAppSettingsObserver);
    }

    public void uninitFrameManager() {
        this.m_context.getContentResolver().unregisterContentObserver(this.naviAppSettingsObserver);
        this.m_a_map_auto_navi_frame_manager.uninitFrameManager();
        this.m_we_car_navi_frame_manager.uninitFrameManager();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void naviAppUpdate() {
        ContentResolver cv = this.m_context.getContentResolver();
        String c_app_componet_name = Settings.System.getString(cv, "SETTING_NAVI_APP");
        if (c_app_componet_name != null) {
            String c_app_componet_name2 = c_app_componet_name.trim();
            if (c_app_componet_name2.equals("com.autonavi.amapauto")) {
                Log.i(TAG, CLASS_TAG + "naviAppUpdate: amapauto");
                this.m_we_car_navi_frame_manager.uninitFrameManager();
                this.m_a_map_auto_navi_frame_manager.initFrameManager();
                return;
            }
            if (c_app_componet_name2.equals(TaesSDKHelper.WECAR_NAVI_PACKAGE_NAME)) {
                Log.i(TAG, CLASS_TAG + "naviAppUpdate: wecarnavi");
                this.m_a_map_auto_navi_frame_manager.uninitFrameManager();
                this.m_we_car_navi_frame_manager.initFrameManager();
            }
        }
    }
}
