package com.tencent.taes.base.api.bean.infodispatcher.map;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class WeCarRoutePoiNode extends WeCarBaseBean {
    public double latitude;
    public double longitude;
    public String name = "";
    public String address = "";
    public String id = "";
    public String type = "";

    public WeCarRoutePoiNode(double latitude, double longitude) {
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public WeCarRoutePoiNode() {
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof WeCarRoutePoiNode)) {
            return false;
        }
        WeCarRoutePoiNode that = (WeCarRoutePoiNode) o;
        return Double.compare(that.latitude, this.latitude) == 0 && Double.compare(that.longitude, this.longitude) == 0 && equals(this.name, that.name) && equals(this.id, that.id) && equals(this.address, that.address) && equals(this.type, that.type);
    }

    public int hashCode() {
        return Objects.hash(Double.valueOf(this.latitude), Double.valueOf(this.longitude), this.name, this.id, this.type, this.address);
    }

    public String toString() {
        return "WeCarRoutePoiNode{latitude=" + this.latitude + ", longitude=" + this.longitude + ", name='" + this.name + "', address='" + this.address + "', id='" + this.id + "', type='" + this.type + "'}";
    }
}
