package com.tencent.taes.framework.parser;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import java.util.List;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class ComponentConfigInfo implements Parcelable {
    public static final Parcelable.Creator<ComponentConfigInfo> CREATOR = new Parcelable.Creator<ComponentConfigInfo>() { // from class: com.tencent.taes.framework.parser.ComponentConfigInfo.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public ComponentConfigInfo createFromParcel(Parcel source) {
            return new ComponentConfigInfo(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public ComponentConfigInfo[] newArray(int size) {
            return new ComponentConfigInfo[size];
        }
    };
    public static final String TYPE_LOCAL = "local";
    public static final String TYPE_SERVER = "server";
    public static final String TYPE_SPECIAL = "special";
    private String actionName;
    private String applicationApiImplCls;
    private boolean bootCompleteLoad;
    private String[] connectPriorityPkgNames;
    private String desc;
    private String lifecycleImpCls;
    private String name;
    private boolean necessaryLoad;
    private boolean parallelLoad;
    private boolean persistent;
    private List<SupportFeaturesBean> supportFeatures;
    private String type;

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return this.desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLifecycleImpCls() {
        return this.lifecycleImpCls;
    }

    public void setLifecycleImpCls(String lifecycleImpCls) {
        this.lifecycleImpCls = lifecycleImpCls;
    }

    public String getApplicationApiImplCls() {
        return this.applicationApiImplCls;
    }

    public void setApplicationApiImplCls(String applicationApiImplCls) {
        this.applicationApiImplCls = applicationApiImplCls;
    }

    public boolean isBootCompleteLoad() {
        return this.bootCompleteLoad;
    }

    public void setBootCompleteLoad(boolean bootCompleteLoad) {
        this.bootCompleteLoad = bootCompleteLoad;
    }

    public boolean isNecessaryLoad() {
        return this.necessaryLoad;
    }

    public void setNecessaryLoad(boolean necessaryLoad) {
        this.necessaryLoad = necessaryLoad;
    }

    public boolean isPersistent() {
        return this.persistent;
    }

    public void setPersistent(boolean persistent) {
        this.persistent = persistent;
    }

    public boolean isParallelLoad() {
        return this.parallelLoad;
    }

    public void setParallelLoad(boolean parallelLoad) {
        this.parallelLoad = parallelLoad;
    }

    public String getActionName() {
        return this.actionName;
    }

    public void setActionName(String actionName) {
        this.actionName = actionName;
    }

    public String[] getConnectPriorityPkgNames() {
        return this.connectPriorityPkgNames;
    }

    public void setConnectPriorityPkgNames(String[] connectPriorityPkgNames) {
        this.connectPriorityPkgNames = connectPriorityPkgNames;
    }

    public List<SupportFeaturesBean> getSupportFeatures() {
        return this.supportFeatures;
    }

    public void setSupportFeatures(List<SupportFeaturesBean> supportFeatures) {
        this.supportFeatures = supportFeatures;
    }

    public static class SupportFeaturesBean implements Parcelable {
        public static final Parcelable.Creator<SupportFeaturesBean> CREATOR = new Parcelable.Creator<SupportFeaturesBean>() { // from class: com.tencent.taes.framework.parser.ComponentConfigInfo.SupportFeaturesBean.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SupportFeaturesBean createFromParcel(Parcel source) {
                return new SupportFeaturesBean(source);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SupportFeaturesBean[] newArray(int size) {
                return new SupportFeaturesBean[size];
            }
        };
        private String api;
        private String apiImpl;
        private String binderName;

        public String getApi() {
            return this.api;
        }

        public void setApi(String api) {
            this.api = api;
        }

        public String getApiImpl() {
            return this.apiImpl;
        }

        public void setApiImpl(String apiImpl) {
            this.apiImpl = apiImpl;
        }

        public String getBinderName() {
            return this.binderName;
        }

        public void setBinderName(String binderName) {
            this.binderName = binderName;
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeString(this.api);
            dest.writeString(this.apiImpl);
            dest.writeString(this.binderName);
        }

        public SupportFeaturesBean() {
        }

        protected SupportFeaturesBean(Parcel in) {
            this.api = in.readString();
            this.apiImpl = in.readString();
            this.binderName = in.readString();
        }

        public String toString() {
            return "SupportFeaturesBean{api='" + this.api + "', apiImpl='" + this.apiImpl + "', binderName='" + this.binderName + "'}";
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o == null || getClass() != o.getClass()) {
                return false;
            }
            SupportFeaturesBean that = (SupportFeaturesBean) o;
            if (Objects.equals(this.api, that.api) && Objects.equals(this.apiImpl, that.apiImpl) && Objects.equals(this.binderName, that.binderName)) {
                return true;
            }
            return false;
        }

        public int hashCode() {
            return Objects.hash(this.api, this.apiImpl, this.binderName);
        }
    }

    public ComponentConfigInfo() {
    }

    public boolean equals(@Nullable Object obj) {
        if (!(obj instanceof ComponentConfigInfo)) {
            return false;
        }
        ComponentConfigInfo config = (ComponentConfigInfo) obj;
        return this.name.equals(config.getName()) && this.type.equals(config.getType()) && this.supportFeatures.containsAll(config.getSupportFeatures()) && this.actionName.equals(config.getActionName());
    }

    public boolean isServerComponent() {
        return TYPE_SERVER.equals(this.type) || TYPE_SPECIAL.equals(this.type);
    }

    public boolean isLocalComponent() {
        return TYPE_LOCAL.equals(this.type);
    }

    public boolean isSpecialComponent() {
        return TYPE_SPECIAL.equals(this.type);
    }

    public SupportFeaturesBean getFeaturesBean(String key) {
        for (SupportFeaturesBean bean : this.supportFeatures) {
            if (bean.getApi().equals(key)) {
                return bean;
            }
        }
        return null;
    }

    public String toString() {
        return "ComponentConfigInfo{name='" + this.name + "', type='" + this.type + "', actionName='" + this.actionName + "', connectPriorityPkgNames=" + this.connectPriorityPkgNames + ", supportFeatures=" + this.supportFeatures + '}';
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.name);
        parcel.writeString(this.desc);
        parcel.writeString(this.type);
        parcel.writeString(this.lifecycleImpCls);
        parcel.writeString(this.applicationApiImplCls);
        parcel.writeByte(this.bootCompleteLoad ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.necessaryLoad ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.persistent ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.parallelLoad ? (byte) 1 : (byte) 0);
        parcel.writeString(this.actionName);
        parcel.writeStringArray(this.connectPriorityPkgNames);
        parcel.writeTypedList(this.supportFeatures);
    }

    protected ComponentConfigInfo(Parcel in) {
        this.name = in.readString();
        this.desc = in.readString();
        this.type = in.readString();
        this.lifecycleImpCls = in.readString();
        this.applicationApiImplCls = in.readString();
        this.bootCompleteLoad = in.readByte() != 0;
        this.necessaryLoad = in.readByte() != 0;
        this.persistent = in.readByte() != 0;
        this.parallelLoad = in.readByte() != 0;
        this.actionName = in.readString();
        this.connectPriorityPkgNames = in.createStringArray();
        this.supportFeatures = in.createTypedArrayList(SupportFeaturesBean.CREATOR);
    }
}
