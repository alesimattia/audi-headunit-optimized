package com.spd.view;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import androidx.annotation.NonNull;
import androidx.viewpager.widget.PagerAdapter;
import com.spd.car.CarDoorWindowView;
import com.spd.car.CarKeyView;
import com.spd.car.CarMileageSpeedView;
import com.spd.navi.NaviManager;
import com.spd.xhsntg.CarInfoManager;
import com.spd.xhsntg.R;

/* JADX INFO: loaded from: classes.dex */
public class MyViewPageAdapter extends PagerAdapter {
    private Context m_context;
    private FrameLayout m_navi_frame_layout;
    private NaviManager m_navi_manager;
    private CarDoorWindowView m_test_view_1;
    private CarMileageSpeedView m_test_view_2;
    private CarKeyView m_test_view_3;
    private View m_test_view_4;

    public MyViewPageAdapter(Context context) {
        this.m_context = context;
        this.m_navi_frame_layout = (FrameLayout) View.inflate(context, R.layout.navi_layout, null);
        this.m_test_view_1 = new CarDoorWindowView(context);
        this.m_test_view_2 = new CarMileageSpeedView(context);
        this.m_test_view_3 = new CarKeyView(context);
        this.m_navi_manager = new NaviManager(context);
        this.m_navi_manager.setFrameLayout(this.m_navi_frame_layout);
    }

    public void initManager() {
        this.m_navi_manager.initFrameManager();
    }

    public void uninitManager() {
        this.m_navi_manager.uninitFrameManager();
    }

    public void updateDoors(boolean hood, boolean trunk, boolean frontLeft, boolean frontRight, boolean rearLeft, boolean rearRight) {
        this.m_test_view_1.updateBenzCarDoor(hood, trunk, frontLeft, frontRight, rearLeft, rearRight);
    }

    public void updateSpeed(float speed, int unit) {
        this.m_test_view_2.updateSpeed(speed, unit);
    }

    public void updateMileage(int value, int unit) {
        this.m_test_view_2.updateMileage(value, unit);
    }

    public void setCarInfoManager(CarInfoManager manager) {
        this.m_test_view_3.setCarInfoManage(manager);
    }

    @Override // androidx.viewpager.widget.PagerAdapter
    public int getCount() {
        return 3;
    }

    @Override // androidx.viewpager.widget.PagerAdapter
    public boolean isViewFromObject(@NonNull View view, @NonNull Object object) {
        return view == object;
    }

    @Override // androidx.viewpager.widget.PagerAdapter
    @NonNull
    public Object instantiateItem(@NonNull ViewGroup container, int position) {
        View c_result = null;
        switch (position) {
            case 0:
                c_result = this.m_test_view_1;
                break;
            case 1:
                c_result = this.m_test_view_2;
                break;
            case 2:
                c_result = this.m_navi_frame_layout;
                break;
            case 3:
                c_result = this.m_test_view_3;
                break;
        }
        container.addView(c_result);
        return c_result;
    }

    @Override // androidx.viewpager.widget.PagerAdapter
    public void destroyItem(@NonNull ViewGroup container, int position, @NonNull Object object) {
        container.removeView((View) object);
    }
}
