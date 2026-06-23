package com.tencent.taes.remote.api.log.bean;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class LogConfiguration implements Parcelable {
    public static final Parcelable.Creator<LogConfiguration> CREATOR = new Parcelable.Creator<LogConfiguration>() { // from class: com.tencent.taes.remote.api.log.bean.LogConfiguration.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public LogConfiguration createFromParcel(Parcel source) {
            return new LogConfiguration(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public LogConfiguration[] newArray(int size) {
            return new LogConfiguration[size];
        }
    };
    public static final String KEY_CONSOLE = "console";
    public static final String KEY_EXPIRED_TIME = "expiredTime";
    public static final String KEY_LOCAL_STORAGE = "localStorage";
    public static final String KEY_LOG_LEVEL = "logLevel";
    public static final String KEY_LOG_SIZE = "logSize";
    public static final String KEY_MODULE_NAME = "moduleName";
    public boolean bConsole;
    public int expiredTime;
    public boolean localStorage;
    public String logLevel;
    public double logSize;
    protected Bundle mExtBundle;
    public String moduleName;

    public LogConfiguration() {
        this.moduleName = "logModule";
        this.logLevel = "ALL";
        this.logSize = 2.0d;
        this.bConsole = true;
        this.localStorage = false;
        this.expiredTime = 3;
    }

    public LogConfiguration(LogConfiguration logConfiguration) {
        if (logConfiguration != null) {
            this.moduleName = logConfiguration.moduleName;
            this.logLevel = logConfiguration.logLevel;
            this.logSize = logConfiguration.logSize;
            this.bConsole = logConfiguration.bConsole;
            this.localStorage = logConfiguration.localStorage;
            this.expiredTime = logConfiguration.expiredTime;
            this.mExtBundle = logConfiguration.mExtBundle;
        }
    }

    public LogConfiguration(String moduleName, String logLevel, int logSize, boolean bConsole, boolean localStorage, int expiredTime) {
        this.moduleName = moduleName;
        this.logLevel = logLevel;
        this.logSize = logSize;
        this.bConsole = bConsole;
        this.localStorage = localStorage;
        this.expiredTime = expiredTime;
    }

    public LogConfiguration(String moduleName, String logLevel, int logSize, boolean bConsole, boolean localStorage, int expiredTime, Bundle extBundle) {
        this.moduleName = moduleName;
        this.logLevel = logLevel;
        this.logSize = logSize;
        this.bConsole = bConsole;
        this.localStorage = localStorage;
        this.expiredTime = expiredTime;
        this.mExtBundle = extBundle;
    }

    public Bundle getConfigBundle() {
        Bundle bundle = new Bundle();
        bundle.putString(KEY_MODULE_NAME, this.moduleName);
        bundle.putString(KEY_LOG_LEVEL, this.logLevel);
        bundle.putDouble(KEY_LOG_SIZE, this.logSize);
        bundle.putBoolean(KEY_CONSOLE, this.bConsole);
        bundle.putBoolean(KEY_LOCAL_STORAGE, this.localStorage);
        bundle.putInt(KEY_EXPIRED_TIME, this.expiredTime);
        return bundle;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public void setLogLevel(String logLevel) {
        this.logLevel = logLevel;
    }

    public void setLogSize(double logSize) {
        this.logSize = logSize;
    }

    public void setConsole(boolean bConsole) {
        this.bConsole = bConsole;
    }

    public void setLocalStorage(boolean localStorage) {
        this.localStorage = localStorage;
    }

    public void setExpiredTime(int expiredTime) {
        this.expiredTime = expiredTime;
    }

    public void setExtBundle(Bundle mExtBundle) {
        this.mExtBundle = mExtBundle;
    }

    public String getModuleName() {
        return this.moduleName;
    }

    public String getLogLevel() {
        return this.logLevel;
    }

    public double getLogSize() {
        return this.logSize;
    }

    public boolean isConsole() {
        return this.bConsole;
    }

    public boolean isLocalStorage() {
        return this.localStorage;
    }

    public int getExpiredTime() {
        return this.expiredTime;
    }

    public Bundle getExtBundle() {
        return this.mExtBundle;
    }

    public JSONObject toJson() {
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put(KEY_MODULE_NAME, this.moduleName);
            jsonObject.put(KEY_LOG_LEVEL, this.logLevel);
            jsonObject.put(KEY_LOG_SIZE, this.logSize);
            jsonObject.put(KEY_CONSOLE, this.bConsole);
            jsonObject.put(KEY_LOCAL_STORAGE, this.localStorage);
            jsonObject.put(KEY_EXPIRED_TIME, this.expiredTime);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonObject;
    }

    public String toString() {
        return "LogConfiguration{moduleName=" + this.moduleName + ",logLevel=" + this.logLevel + ",logSize=" + this.logSize + ",bConsole=" + this.bConsole + ",localStorage=" + this.localStorage + ",expiredTime=" + this.expiredTime + "}";
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.moduleName);
        parcel.writeString(this.logLevel);
        parcel.writeDouble(this.logSize);
        parcel.writeByte(this.bConsole ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.localStorage ? (byte) 1 : (byte) 0);
        parcel.writeInt(this.expiredTime);
        parcel.writeBundle(this.mExtBundle);
    }

    protected LogConfiguration(Parcel in) {
        this.moduleName = in.readString();
        this.logLevel = in.readString();
        this.logSize = in.readDouble();
        this.bConsole = in.readByte() != 0;
        this.localStorage = in.readByte() != 0;
        this.expiredTime = in.readInt();
        this.mExtBundle = in.readBundle();
    }
}
