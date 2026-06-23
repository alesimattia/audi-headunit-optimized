package com.spd.dvr.entity.aidl;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public class FileInfo implements Parcelable {
    public static final Parcelable.Creator<FileInfo> CREATOR = new Parcelable.Creator<FileInfo>() { // from class: com.spd.dvr.entity.aidl.FileInfo.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public FileInfo createFromParcel(Parcel in) {
            return new FileInfo(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public FileInfo[] newArray(int size) {
            return new FileInfo[size];
        }
    };
    String fileName;
    String filePath;
    int lock;
    long tempTime;
    int type;

    public FileInfo() {
    }

    protected FileInfo(Parcel in) {
        this.fileName = in.readString();
        this.filePath = in.readString();
        this.type = in.readInt();
        this.lock = in.readInt();
        this.tempTime = in.readLong();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.fileName);
        dest.writeString(this.filePath);
        dest.writeInt(this.type);
        dest.writeInt(this.lock);
        dest.writeLong(this.tempTime);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public String getFileName() {
        return this.fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return this.filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public int getType() {
        return this.type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getLock() {
        return this.lock;
    }

    public void setLock(int lock) {
        this.lock = lock;
    }

    public long getTempTime() {
        return this.tempTime;
    }

    public void setTempTime(long tempTime) {
        this.tempTime = tempTime;
    }

    public boolean equals(Object obj) {
        if (obj instanceof FileInfo) {
            FileInfo fileInfo = (FileInfo) obj;
            if (this.fileName.equals(fileInfo.fileName) && this.filePath.equals(fileInfo.filePath)) {
                return true;
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int result = (17 * 31) + this.fileName.hashCode();
        return (result * 31) + this.filePath.hashCode();
    }

    public String toString() {
        return "FileInfo{fileName='" + this.fileName + "', filePath='" + this.filePath + "', type=" + this.type + ", lock=" + this.lock + ", tempTime=" + this.tempTime + '}';
    }
}
