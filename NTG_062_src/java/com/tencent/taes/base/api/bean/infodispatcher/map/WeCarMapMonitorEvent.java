package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;

/* JADX INFO: loaded from: classes.dex */
public class WeCarMapMonitorEvent extends WeCarBaseBean {
    public int taskType;

    public WeCarMapMonitorEvent(int taskType) {
        this.taskType = taskType;
    }
}
