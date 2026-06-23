package com.tencent.taes.remote.api.infodispatcher.listener;

import com.tencent.taes.base.api.bean.infodispatcher.map.WeCarRoadsideCameraInfo;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface OnCameraInfoListener {
    void onRoadsideCameraInfoChanged(WeCarRoadsideCameraInfo weCarRoadsideCameraInfo, List<WeCarRoadsideCameraInfo> list);
}
