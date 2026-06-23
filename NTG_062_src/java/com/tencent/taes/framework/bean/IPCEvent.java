package com.tencent.taes.framework.bean;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.app.NotificationCompat;
import com.tencent.taes.framework.parser.ConfigConstant;

/* JADX INFO: loaded from: classes.dex */
public class IPCEvent implements Parcelable {
    public static final Parcelable.Creator<IPCEvent> CREATOR = new Parcelable.Creator<IPCEvent>() { // from class: com.tencent.taes.framework.bean.IPCEvent.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public IPCEvent createFromParcel(Parcel source) {
            return new IPCEvent(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public IPCEvent[] newArray(int size) {
            return new IPCEvent[size];
        }
    };
    public static final String EVENT_APP_BACKGROUND = "EVENT_APP_BACKGROUND";
    public static final String EVENT_APP_FOREGROUND = "EVENT_APP_FOREGROUND";
    public static final String EVENT_FRAME_WORK_BINDER_CONNECT = "EVENT_FRAME_WORK_BINDER_CONNECT";
    public static final String EVENT_FRAME_WORK_BINDER_DISCONNECT = "EVENT_FRAME_WORK_BINDER_DISCONNECT";
    public Bundle data;
    public String msg;
    public final String name;

    public IPCEvent(String name) {
        this.name = name;
    }

    public IPCEvent(String name, String msg) {
        this.name = name;
        this.msg = msg;
    }

    public IPCEvent(String name, Bundle data) {
        this.name = name;
        this.data = data;
    }

    public IPCEvent(Bundle bundle) {
        this.name = bundle.getString(ConfigConstant.CONFIG_KEY_NAME);
        this.msg = bundle.getString(NotificationCompat.CATEGORY_MESSAGE);
        this.data = bundle.getBundle("data");
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putString(ConfigConstant.CONFIG_KEY_NAME, this.name);
        bundle.putString(NotificationCompat.CATEGORY_MESSAGE, this.msg);
        bundle.putBundle("data", this.data);
        return bundle;
    }

    public String toString() {
        return "EventInfo { name=" + this.name + " msg=" + this.msg + "}";
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.name);
        dest.writeString(this.msg);
        dest.writeBundle(this.data);
    }

    protected IPCEvent(Parcel in) {
        this.name = in.readString();
        this.msg = in.readString();
        this.data = in.readBundle();
    }
}
