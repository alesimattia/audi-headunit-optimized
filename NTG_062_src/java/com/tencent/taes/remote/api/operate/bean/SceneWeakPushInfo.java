package com.tencent.taes.remote.api.operate.bean;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class SceneWeakPushInfo implements Parcelable {
    public static final Parcelable.Creator<SceneWeakPushInfo> CREATOR = new Parcelable.Creator<SceneWeakPushInfo>() { // from class: com.tencent.taes.remote.api.operate.bean.SceneWeakPushInfo.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SceneWeakPushInfo createFromParcel(Parcel source) {
            return new SceneWeakPushInfo(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SceneWeakPushInfo[] newArray(int size) {
            return new SceneWeakPushInfo[size];
        }
    };
    private String extraData;
    private OperationModeBean operationMode;
    private String uuid;

    public String getUuid() {
        return this.uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public OperationModeBean getOperationMode() {
        return this.operationMode;
    }

    public void setOperationMode(OperationModeBean operationMode) {
        this.operationMode = operationMode;
    }

    public String getExtraData() {
        return this.extraData;
    }

    public void setExtraData(String extraData) {
        this.extraData = extraData;
    }

    public static class OperationModeBean implements Parcelable {
        public static final Parcelable.Creator<OperationModeBean> CREATOR = new Parcelable.Creator<OperationModeBean>() { // from class: com.tencent.taes.remote.api.operate.bean.SceneWeakPushInfo.OperationModeBean.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public OperationModeBean createFromParcel(Parcel source) {
                return new OperationModeBean(source);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public OperationModeBean[] newArray(int size) {
                return new OperationModeBean[size];
            }
        };
        private String businessName;
        private String modeContainer;
        private String modeProperties;
        private List<ModeViewsBean> modeViews;

        public String getModeContainer() {
            return this.modeContainer;
        }

        public void setModeContainer(String modeContainer) {
            this.modeContainer = modeContainer;
        }

        public String getBusinessName() {
            return this.businessName;
        }

        public void setBusinessName(String businessName) {
            this.businessName = businessName;
        }

        public String getModeProperties() {
            return this.modeProperties;
        }

        public void setModeProperties(String modeProperties) {
            this.modeProperties = modeProperties;
        }

        public List<ModeViewsBean> getModeViews() {
            return this.modeViews;
        }

        public void setModeViews(List<ModeViewsBean> modeViews) {
            this.modeViews = modeViews;
        }

        public static class ModeViewsBean implements Parcelable {
            public static final Parcelable.Creator<ModeViewsBean> CREATOR = new Parcelable.Creator<ModeViewsBean>() { // from class: com.tencent.taes.remote.api.operate.bean.SceneWeakPushInfo.OperationModeBean.ModeViewsBean.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // android.os.Parcelable.Creator
                public ModeViewsBean createFromParcel(Parcel source) {
                    return new ModeViewsBean(source);
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // android.os.Parcelable.Creator
                public ModeViewsBean[] newArray(int size) {
                    return new ModeViewsBean[size];
                }
            };
            private String modeData;
            private int modeType;

            public int getModeType() {
                return this.modeType;
            }

            public void setModeType(int modeType) {
                this.modeType = modeType;
            }

            public String getModeData() {
                return this.modeData;
            }

            public void setModeData(String modeData) {
                this.modeData = modeData;
            }

            public String toString() {
                return "ModeViewsBean{modeType=" + this.modeType + ", modeData='" + this.modeData + "'}";
            }

            @Override // android.os.Parcelable
            public int describeContents() {
                return 0;
            }

            @Override // android.os.Parcelable
            public void writeToParcel(Parcel dest, int flags) {
                dest.writeInt(this.modeType);
                dest.writeString(this.modeData);
            }

            public ModeViewsBean() {
            }

            protected ModeViewsBean(Parcel in) {
                this.modeType = in.readInt();
                this.modeData = in.readString();
            }
        }

        public String toString() {
            return "OperationModeBean{modeContainer='" + this.modeContainer + "', businessName='" + this.businessName + "', modeProperties='" + this.modeProperties + "', modeViews=" + this.modeViews + '}';
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeString(this.modeContainer);
            dest.writeString(this.businessName);
            dest.writeString(this.modeProperties);
            dest.writeList(this.modeViews);
        }

        public OperationModeBean() {
        }

        protected OperationModeBean(Parcel in) {
            this.modeContainer = in.readString();
            this.businessName = in.readString();
            this.modeProperties = in.readString();
            this.modeViews = new ArrayList();
            in.readList(this.modeViews, ModeViewsBean.class.getClassLoader());
        }
    }

    public String toString() {
        return "SceneWeakPushInfo{uuid='" + this.uuid + "', operationMode=" + this.operationMode + ", extraData='" + this.extraData + "'}";
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.uuid);
        dest.writeParcelable(this.operationMode, flags);
        dest.writeString(this.extraData);
    }

    public SceneWeakPushInfo() {
    }

    protected SceneWeakPushInfo(Parcel in) {
        this.uuid = in.readString();
        this.operationMode = (OperationModeBean) in.readParcelable(OperationModeBean.class.getClassLoader());
        this.extraData = in.readString();
    }
}
