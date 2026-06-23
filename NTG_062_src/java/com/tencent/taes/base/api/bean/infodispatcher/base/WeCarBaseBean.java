package com.tencent.taes.base.api.bean.infodispatcher.base;

import com.tencent.taes.base.api.INoProguard;

/* JADX INFO: loaded from: classes.dex */
public class WeCarBaseBean implements INoProguard {
    protected boolean equals(Object o1, Object o2) {
        if (o1 == o2) {
            return true;
        }
        if (o1 != null && o2 != null) {
            return o1.equals(o2);
        }
        return false;
    }
}
