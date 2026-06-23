package com.tencent.taes.api.scene.bean;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public class SceneInfo implements Parcelable {
    public static final Parcelable.Creator<SceneInfo> CREATOR = new Parcelable.Creator<SceneInfo>() { // from class: com.tencent.taes.api.scene.bean.SceneInfo.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SceneInfo createFromParcel(Parcel source) {
            return new SceneInfo(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SceneInfo[] newArray(int size) {
            return new SceneInfo[size];
        }
    };
    private String bgImage;
    private boolean closable;
    private Bundle extData;
    private String icon;
    private String iconText;
    private String subTitle;
    private String title;
    private String uuid;
    private int validEndTime;
    private int validStartTime;
    private int vanishTime;

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

    public Bundle getExtData() {
        return this.extData;
    }

    public void setExtData(Bundle bundle) {
        this.extData = bundle;
    }

    public String toString() {
        return "SceneInfo{uuid='" + this.uuid + "', icon='" + this.icon + "', iconText='" + this.iconText + "', title='" + this.title + "', subTitle='" + this.subTitle + "', bgImage='" + this.bgImage + "', validStartTime=" + this.validStartTime + ", validEndTime=" + this.validEndTime + ", vanishTime=" + this.vanishTime + ", closable=" + this.closable + ", extData=" + this.extData + '}';
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
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
        parcel.writeBundle(this.extData);
    }

    public SceneInfo() {
    }

    protected SceneInfo(Parcel in) {
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
        this.extData = in.readBundle();
    }
}
