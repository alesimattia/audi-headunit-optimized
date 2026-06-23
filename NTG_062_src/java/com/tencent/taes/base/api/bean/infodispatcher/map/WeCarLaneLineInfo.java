package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class WeCarLaneLineInfo extends WeCarBaseBean {
    public String arrow;
    public String flag;
    public boolean isShow;
    public String property;

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof WeCarLaneLineInfo)) {
            return false;
        }
        WeCarLaneLineInfo that = (WeCarLaneLineInfo) o;
        return this.isShow == that.isShow && equals(this.arrow, that.arrow) && equals(this.flag, that.flag) && equals(this.property, that.property);
    }

    public int hashCode() {
        return Objects.hash(Boolean.valueOf(this.isShow), this.arrow, this.flag, this.property);
    }
}
