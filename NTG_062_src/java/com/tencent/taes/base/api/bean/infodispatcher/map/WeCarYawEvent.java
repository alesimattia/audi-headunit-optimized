package com.tencent.taes.base.api.bean.infodispatcher.map;

import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class WeCarYawEvent {
    public int eventType;

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof WeCarYawEvent)) {
            return false;
        }
        WeCarYawEvent weCarYawEvent = (WeCarYawEvent) o;
        return this.eventType == weCarYawEvent.eventType;
    }

    public int hashCode() {
        return Objects.hash(Integer.valueOf(this.eventType));
    }
}
