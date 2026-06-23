package com.tencent.taes.remote.api.operate.bean;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class SceneBannerInfo implements Parcelable {
    public static final Parcelable.Creator<SceneBannerInfo> CREATOR = new Parcelable.Creator<SceneBannerInfo>() { // from class: com.tencent.taes.remote.api.operate.bean.SceneBannerInfo.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SceneBannerInfo createFromParcel(Parcel source) {
            return new SceneBannerInfo(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SceneBannerInfo[] newArray(int size) {
            return new SceneBannerInfo[size];
        }
    };
    private List<ActionsBean> actions;
    private String bgImage;
    private boolean closable;
    private String handerType;
    private String icon;
    private String iconText;
    private String subKey;
    private String subTitle;
    private String title;
    private String uuid;
    private int validEndTime;
    private int validStartTime;
    private int vanishTime;

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

    public String getIcon() {
        return this.icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getIconText() {
        return this.iconText;
    }

    public void setIconText(String iconText) {
        this.iconText = iconText;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubTitle() {
        return this.subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    public String getBgImage() {
        return this.bgImage;
    }

    public void setBgImage(String bgImage) {
        this.bgImage = bgImage;
    }

    public int getValidStartTime() {
        return this.validStartTime;
    }

    public void setValidStartTime(int validStartTime) {
        this.validStartTime = validStartTime;
    }

    public int getValidEndTime() {
        return this.validEndTime;
    }

    public void setValidEndTime(int validEndTime) {
        this.validEndTime = validEndTime;
    }

    public int getVanishTime() {
        return this.vanishTime;
    }

    public void setVanishTime(int vanishTime) {
        this.vanishTime = vanishTime;
    }

    public boolean isClosable() {
        return this.closable;
    }

    public void setClosable(boolean closable) {
        this.closable = closable;
    }

    public String getHanderType() {
        return this.handerType;
    }

    public void setHanderType(String handerType) {
        this.handerType = handerType;
    }

    public List<ActionsBean> getActions() {
        return this.actions;
    }

    public void setActions(List<ActionsBean> actions) {
        this.actions = actions;
    }

    public static class ActionsBean implements Parcelable {
        public static final Parcelable.Creator<ActionsBean> CREATOR = new Parcelable.Creator<ActionsBean>() { // from class: com.tencent.taes.remote.api.operate.bean.SceneBannerInfo.ActionsBean.1
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
        return "SceneBannerInfo{subKey='" + this.subKey + "', uuid='" + this.uuid + "', icon='" + this.icon + "', iconText='" + this.iconText + "', title='" + this.title + "', subTitle='" + this.subTitle + "', bgImage='" + this.bgImage + "', validStartTime=" + this.validStartTime + ", validEndTime=" + this.validEndTime + ", vanishTime=" + this.vanishTime + ", closable=" + this.closable + ", handerType='" + this.handerType + "', actions=" + this.actions + '}';
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.subKey);
        parcel.writeString(this.uuid);
        parcel.writeString(this.icon);
        parcel.writeString(this.iconText);
        parcel.writeString(this.title);
        parcel.writeString(this.subTitle);
        parcel.writeString(this.bgImage);
        parcel.writeInt(this.validStartTime);
        parcel.writeInt(this.validEndTime);
        parcel.writeInt(this.vanishTime);
        parcel.writeByte(this.closable ? (byte) 1 : (byte) 0);
        parcel.writeString(this.handerType);
        parcel.writeList(this.actions);
    }

    public SceneBannerInfo() {
    }

    protected SceneBannerInfo(Parcel in) {
        this.subKey = in.readString();
        this.uuid = in.readString();
        this.icon = in.readString();
        this.iconText = in.readString();
        this.title = in.readString();
        this.subTitle = in.readString();
        this.bgImage = in.readString();
        this.validStartTime = in.readInt();
        this.validEndTime = in.readInt();
        this.vanishTime = in.readInt();
        this.closable = in.readByte() != 0;
        this.handerType = in.readString();
        this.actions = new ArrayList();
        in.readList(this.actions, ActionsBean.class.getClassLoader());
    }
}
