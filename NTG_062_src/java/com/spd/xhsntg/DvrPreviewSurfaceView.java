package com.spd.xhsntg;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

/* JADX INFO: loaded from: classes.dex */
public class DvrPreviewSurfaceView extends SurfaceView implements SurfaceHolder.Callback {
    public static final int MODE_FOR_CLOSE = 0;
    public static final int MODE_FOR_PLAY_BACK = 2;
    public static final int MODE_FOR_RECORD = 1;
    private String TAG;
    public int m_dvr_channel;
    public int m_dvr_video_mode;
    private SurfaceHolder m_surface_holder;
    private boolean m_view_show_flag;

    public DvrPreviewSurfaceView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.TAG = "DVR_PLAYBACK";
        this.m_dvr_channel = -1;
        this.m_dvr_video_mode = -1;
        this.m_view_show_flag = false;
        getHolder().addCallback(this);
        TypedArray array = context.getTheme().obtainStyledAttributes(attrs, R.styleable.DvrPreview, 0, 0);
        this.m_dvr_channel = array.getInt(0, -1);
        this.m_dvr_video_mode = array.getInt(1, 1);
        Log.d(this.TAG, hashCode() + " DvrPreviewSurfaceView m_dvr_channel:" + this.m_dvr_channel + "，m_dvr_video_mode:" + this.m_dvr_video_mode);
    }

    public void setDvrChannel(int c_video_mode, int c_channel) {
        Log.d(this.TAG, "setDvrChannel c_video_mode:" + c_video_mode + ",c_channel:" + c_channel);
        if (this.m_dvr_video_mode != c_video_mode || this.m_dvr_channel != c_channel) {
            if (this.m_dvr_video_mode == 2) {
                if (this.m_dvr_video_mode != c_video_mode && this.m_surface_holder != null && this.m_view_show_flag) {
                    this.m_view_show_flag = false;
                    Log.d(this.TAG, "setDvrChannel: dvrControlCmd ==0==");
                    DvrHelper.get().dvrControlCmd(1007, 0, this.m_dvr_channel);
                }
            } else if (this.m_dvr_video_mode == 1 && this.m_surface_holder != null && this.m_view_show_flag) {
                this.m_view_show_flag = false;
                Log.d(this.TAG, "setDvrChannel: dvrControlCmd ==1==");
                DvrHelper.get().dvrControlCmd(1001, 0, this.m_dvr_channel);
            }
            this.m_dvr_video_mode = c_video_mode;
            this.m_dvr_channel = c_channel;
            if (this.m_dvr_video_mode > 0) {
                checkDvrChannel(true);
            }
        }
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceCreated(SurfaceHolder surfaceHolder) {
        Log.d(this.TAG, "surfaceCreated:");
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i1, int i2) {
        Log.d(this.TAG, hashCode() + " surfaceChanged:" + surfaceHolder.getSurface());
        this.m_surface_holder = surfaceHolder;
        checkDvrChannel(true);
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        Log.d(this.TAG, hashCode() + " surfaceDestroyed: ");
        this.m_surface_holder = null;
        checkDvrChannel(false);
    }

    private void checkDvrChannel(boolean c_check) {
        Log.d(this.TAG, hashCode() + " checkDvrChannel m_dvr_video_mode: " + this.m_dvr_video_mode + ",m_view_show_flag:" + this.m_view_show_flag + ",c_check:" + c_check + ",m_dvr_channel:" + this.m_dvr_channel + ",m_surface_holder:" + this.m_surface_holder);
        if (this.m_dvr_video_mode == 2) {
            if (c_check) {
                if (this.m_surface_holder != null) {
                    if (!this.m_view_show_flag) {
                        Log.d("DVR_PLAYBACK", "checkDvrChannel  setPlaybackSurface ==0==");
                        DvrHelper.get().setPlaybackSurface(this.m_surface_holder.getSurface());
                        this.m_view_show_flag = true;
                    }
                    Log.d("DVR_PLAYBACK", "checkDvrChannel  DVR_PLAYSTATE_CMD ==1== " + this.m_dvr_channel);
                    DvrHelper.get().dvrControlCmd(1004, 1, this.m_dvr_channel);
                    return;
                }
                return;
            }
            if (this.m_view_show_flag) {
                this.m_view_show_flag = false;
                DvrHelper.get().dvrControlCmd(1007, 0, this.m_dvr_channel);
                return;
            }
            return;
        }
        if (this.m_dvr_video_mode == 1) {
            if (c_check) {
                if (this.m_surface_holder != null && !this.m_view_show_flag) {
                    Log.d(this.TAG, "checkDvrChannel startPreviewByChannel: ==1==" + this.m_surface_holder.getSurface());
                    DvrHelper.get().startPreviewByChannel(this.m_dvr_channel, this.m_surface_holder.getSurface());
                    this.m_view_show_flag = true;
                    return;
                }
                return;
            }
            if (this.m_view_show_flag) {
                this.m_view_show_flag = false;
                Log.d(this.TAG, "checkDvrChannel dvrControlCmd: DVR_PREVIEW_CMD m_dvr_channel:" + this.m_dvr_channel);
                DvrHelper.get().dvrControlCmd(1001, 0, this.m_dvr_channel);
            }
        }
    }
}
