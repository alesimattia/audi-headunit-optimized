package com.tencent.taes.remote.api.operate.bean;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class SceneStatusBannerInfo implements Parcelable {
    public static final Parcelable.Creator<SceneStatusBannerInfo> CREATOR = new Parcelable.Creator<SceneStatusBannerInfo>() { // from class: com.tencent.taes.remote.api.operate.bean.SceneStatusBannerInfo.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SceneStatusBannerInfo createFromParcel(Parcel source) {
            return new SceneStatusBannerInfo(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SceneStatusBannerInfo[] newArray(int size) {
            return new SceneStatusBannerInfo[size];
        }
    };
    private List<ActionsBean> activeActions;
    private List<ActionsBean> deactiveActions;
    private boolean enable;
    private boolean firstOverviewCity;
    private String handerType;
    private String statusBarIconDay;
    private String statusBarIconNight;
    private String statusBarSwitchIconDay;
    private String statusBarSwitchIconNight;
    private String statusBarSwitchIconSelectedDay;
    private String statusBarSwitchIconSelectedNight;
    private String subKey;
    private String title;
    private String uuid;
    private long validEndTime;
    private long validStartTime;

    public String getSubKey() {
        return this.subKey;
    }

    public void setSubKey(String subKey) {
        this.subKey = subKey;
    }

    public String getUuid() {
        return this.uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public boolean isEnable() {
        return this.enable;
    }

    public void setEnable(boolean enable) {
        this.enable = enable;
    }

    public boolean isFirstOverviewCity() {
        return this.firstOverviewCity;
    }

    public void setFirstOverviewCity(boolean firstOverviewCity) {
        this.firstOverviewCity = firstOverviewCity;
    }

    public long getValidStartTime() {
        return this.validStartTime;
    }

    public void setValidStartTime(long validStartTime) {
        this.validStartTime = validStartTime;
    }

    public long getValidEndTime() {
        return this.validEndTime;
    }

    public void setValidEndTime(long validEndTime) {
        this.validEndTime = validEndTime;
    }

    public String getStatusBarIconDay() {
        return this.statusBarIconDay;
    }

    public void setStatusBarIconDay(String statusBarIconDay) {
        this.statusBarIconDay = statusBarIconDay;
    }

    public String getStatusBarIconNight() {
        return this.statusBarIconNight;
    }

    public void setStatusBarIconNight(String statusBarIconNight) {
        this.statusBarIconNight = statusBarIconNight;
    }

    public String getStatusBarSwitchIconDay() {
        return this.statusBarSwitchIconDay;
    }

    public void setStatusBarSwitchIconDay(String statusBarSwitchIconDay) {
        this.statusBarSwitchIconDay = statusBarSwitchIconDay;
    }

    public String getStatusBarSwitchIconNight() {
        return this.statusBarSwitchIconNight;
    }

    public void setStatusBarSwitchIconNight(String statusBarSwitchIconNight) {
        this.statusBarSwitchIconNight = statusBarSwitchIconNight;
    }

    public String getStatusBarSwitchIconSelectedDay() {
        return this.statusBarSwitchIconSelectedDay;
    }

    public void setStatusBarSwitchIconSelectedDay(String statusBarSwitchIconSelectedDay) {
        this.statusBarSwitchIconSelectedDay = statusBarSwitchIconSelectedDay;
    }

    public String getStatusBarSwitchIconSelectedNight() {
        return this.statusBarSwitchIconSelectedNight;
    }

    public void setStatusBarSwitchIconSelectedNight(String statusBarSwitchIconSelectedNight) {
        this.statusBarSwitchIconSelectedNight = statusBarSwitchIconSelectedNight;
    }

    public String getHanderType() {
        return this.handerType;
    }

    public void setHanderType(String handerType) {
        this.handerType = handerType;
    }

    public List<ActionsBean> getActiveActions() {
        return this.activeActions;
    }

    public void setActiveActions(List<ActionsBean> activeActions) {
        this.activeActions = activeActions;
    }

    public List<ActionsBean> getDeactiveActions() {
        return this.deactiveActions;
    }

    public void setDeactiveActions(List<ActionsBean> deactiveActions) {
        this.deactiveActions = deactiveActions;
    }

    public static class ActionsBean implements Parcelable {
        public static final Parcelable.Creator<ActionsBean> CREATOR = new Parcelable.Creator<ActionsBean>() { // from class: com.tencent.taes.remote.api.operate.bean.SceneStatusBannerInfo.ActionsBean.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public ActionsBean createFromParcel(Parcel source) {
                return new ActionsBean(source);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public ActionsBean[] newArray(int size) {
                return new ActionsBean[size];
            }
        };
        private String actionName;
        private String app;
        private String data;

        public String getApp() {
            return this.app;
        }

        public void setApp(String app) {
            this.app = app;
        }

        public String getActionName() {
            return this.actionName;
        }

        public void setActionName(String actionName) {
            this.actionName = actionName;
        }

        public String getData() {
            return this.data;
        }

        public void setData(String data) {
            this.data = data;
        }

        public String toString() {
            return "ActionsBean{app='" + this.app + "', actionName='" + this.actionName + "', data='" + this.data + "'}";
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeString(this.app);
            dest.writeString(this.actionName);
            dest.writeString(this.data);
        }

        public ActionsBean() {
        }

        protected ActionsBean(Parcel in) {
            this.app = in.readString();
            this.actionName = in.readString();
            this.data = in.readString();
        }
    }

    public String toString() {
        return "SceneStatusBannerInfo{subKey='" + this.subKey + "', uuid='" + this.uuid + "', title='" + this.title + "', enable=" + this.enable + ", firstOverviewCity=" + this.firstOverviewCity + ", validStartTime=" + this.validStartTime + ", validEndTime=" + this.validEndTime + ", statusBarIconDay='" + this.statusBarIconDay + "', statusBarIconNight='" + this.statusBarIconNight + "', statusBarSwitchIconDay='" + this.statusBarSwitchIconDay + "', statusBarSwitchIconNight='" + this.statusBarSwitchIconNight + "', statusBarSwitchIconSelectedDay='" + this.statusBarSwitchIconSelectedDay + "', statusBarSwitchIconSelectedNight='" + this.statusBarSwitchIconSelectedNight + "', handerType='" + this.handerType + "', activeActions=" + this.activeActions + ", deactiveActions=" + this.deactiveActions + '}';
    }

    public SceneStatusBannerInfo() {
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.subKey);
        parcel.writeString(this.uuid);
        parcel.writeString(this.title);
        parcel.writeByte(this.enable ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.firstOverviewCity ? (byte) 1 : (byte) 0);
        parcel.writeLong(this.validStartTime);
        parcel.writeLong(this.validEndTime);
        parcel.writeString(this.statusBarIconDay);
        parcel.writeString(this.statusBarIconNight);
        parcel.writeString(this.statusBarSwitchIconDay);
        parcel.writeString(this.statusBarSwitchIconNight);
        parcel.writeString(this.statusBarSwitchIconSelectedDay);
        parcel.writeString(this.statusBarSwitchIconSelectedNight);
        parcel.writeString(this.handerType);
        parcel.writeTypedList(this.activeActions);
        parcel.writeTypedList(this.deactiveActions);
    }

    protected SceneStatusBannerInfo(Parcel in) {
        this.subKey = in.readString();
        this.uuid = in.readString();
        this.title = in.readString();
        this.enable = in.readByte() != 0;
        this.firstOverviewCity = in.readByte() != 0;
        this.validStartTime = in.readLong();
        this.validEndTime = in.readLong();
        this.statusBarIconDay = in.readString();
        this.statusBarIconNight = in.readString();
        this.statusBarSwitchIconDay = in.readString();
        this.statusBarSwitchIconNight = in.readString();
        this.statusBarSwitchIconSelectedDay = in.readString();
        this.statusBarSwitchIconSelectedNight = in.readString();
        this.handerType = in.readString();
        this.activeActions = in.createTypedArrayList(ActionsBean.CREATOR);
        this.deactiveActions = in.createTypedArrayList(ActionsBean.CREATOR);
    }
}
