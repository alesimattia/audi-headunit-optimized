package com.spd.dvr.entity.aidl;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public class SettingInfo implements Parcelable {
    public static final Parcelable.Creator<SettingInfo> CREATOR = new Parcelable.Creator<SettingInfo>() { // from class: com.spd.dvr.entity.aidl.SettingInfo.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SettingInfo createFromParcel(Parcel in) {
            return new SettingInfo(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SettingInfo[] newArray(int size) {
            return new SettingInfo[size];
        }
    };
    private int audioRecord;
    private int autoRecoder;
    private int codecFormat;
    private int delayShutdown;
    private int fileFormat;
    private int gSensor;
    private int lowVoltage;
    private int mainStream;
    private int preViewCount;
    private int previewRatio;
    private int recoderCount;
    private int recoderRatio;
    private int recoderTime;
    private int remoteMonitor;
    private int savePath;
    private int segmentSize;
    private String selectedPath;
    private int subRatio;
    private int subRecoderSwitch;
    private int subStream;
    private int waterMask;

    public SettingInfo() {
    }

    protected SettingInfo(Parcel in) {
        this.previewRatio = in.readInt();
        this.preViewCount = in.readInt();
        this.recoderRatio = in.readInt();
        this.recoderCount = in.readInt();
        this.codecFormat = in.readInt();
        this.fileFormat = in.readInt();
        this.mainStream = in.readInt();
        this.subStream = in.readInt();
        this.subRatio = in.readInt();
        this.subRecoderSwitch = in.readInt();
        this.segmentSize = in.readInt();
        this.recoderTime = in.readInt();
        this.waterMask = in.readInt();
        this.remoteMonitor = in.readInt();
        this.audioRecord = in.readInt();
        this.gSensor = in.readInt();
        this.savePath = in.readInt();
        this.autoRecoder = in.readInt();
        this.selectedPath = in.readString();
        this.delayShutdown = in.readInt();
        this.lowVoltage = in.readInt();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.previewRatio);
        dest.writeInt(this.preViewCount);
        dest.writeInt(this.recoderRatio);
        dest.writeInt(this.recoderCount);
        dest.writeInt(this.codecFormat);
        dest.writeInt(this.fileFormat);
        dest.writeInt(this.mainStream);
        dest.writeInt(this.subStream);
        dest.writeInt(this.subRatio);
        dest.writeInt(this.subRecoderSwitch);
        dest.writeInt(this.segmentSize);
        dest.writeInt(this.recoderTime);
        dest.writeInt(this.waterMask);
        dest.writeInt(this.remoteMonitor);
        dest.writeInt(this.audioRecord);
        dest.writeInt(this.gSensor);
        dest.writeInt(this.savePath);
        dest.writeInt(this.autoRecoder);
        dest.writeString(this.selectedPath);
        dest.writeInt(this.delayShutdown);
        dest.writeInt(this.lowVoltage);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public int getPreviewRatio() {
        return this.previewRatio;
    }

    public void setPreviewRatio(int previewRatio) {
        this.previewRatio = previewRatio;
    }

    public int getPreViewCount() {
        return this.preViewCount;
    }

    public void setPreViewCount(int preViewCount) {
        this.preViewCount = preViewCount;
    }

    public int getRecoderRatio() {
        return this.recoderRatio;
    }

    public void setRecoderRatio(int recoderRatio) {
        this.recoderRatio = recoderRatio;
    }

    public int getRecoderCount() {
        return this.recoderCount;
    }

    public void setRecoderCount(int recoderCount) {
        this.recoderCount = recoderCount;
    }

    public int getCodecFormat() {
        return this.codecFormat;
    }

    public void setCodecFormat(int codecFormat) {
        this.codecFormat = codecFormat;
    }

    public int getFileFormat() {
        return this.fileFormat;
    }

    public void setFileFormat(int fileFormat) {
        this.fileFormat = fileFormat;
    }

    public int getMainStream() {
        return this.mainStream;
    }

    public void setMainStream(int mainStream) {
        this.mainStream = mainStream;
    }

    public int getSubStream() {
        return this.subStream;
    }

    public void setSubStream(int subStream) {
        this.subStream = subStream;
    }

    public int getSubRatio() {
        return this.subRatio;
    }

    public void setSubRatio(int subRatio) {
        this.subRatio = subRatio;
    }

    public int getSubRecoderSwitch() {
        return this.subRecoderSwitch;
    }

    public void setSubRecoderSwitch(int subRecoderSwitch) {
        this.subRecoderSwitch = subRecoderSwitch;
    }

    public int getSegmentSize() {
        return this.segmentSize;
    }

    public void setSegmentSize(int segmentSize) {
        this.segmentSize = segmentSize;
    }

    public int getWaterMask() {
        return this.waterMask;
    }

    public void setWaterMask(int waterMask) {
        this.waterMask = waterMask;
    }

    public int getSavePath() {
        return this.savePath;
    }

    public void setSavePath(int savePath) {
        this.savePath = savePath;
    }

    public int getRecoderTime() {
        return this.recoderTime;
    }

    public void setRecoderTime(int recoderTime) {
        this.recoderTime = recoderTime;
    }

    public int getAutoRecoder() {
        return this.autoRecoder;
    }

    public void setAutoRecoder(int autoRecoder) {
        this.autoRecoder = autoRecoder;
    }

    public int getRemoteMonitor() {
        return this.remoteMonitor;
    }

    public void setRemoteMonitor(int remoteMonitor) {
        this.remoteMonitor = remoteMonitor;
    }

    public int getAudioRecord() {
        return this.audioRecord;
    }

    public void setAudioRecord(int audioRecord) {
        this.audioRecord = audioRecord;
    }

    public int getgSensor() {
        return this.gSensor;
    }

    public void setgSensor(int gSensor) {
        this.gSensor = gSensor;
    }

    public String getSelectedPath() {
        return this.selectedPath;
    }

    public void setSelectedPath(String selectedPath) {
        this.selectedPath = selectedPath;
    }

    public int getDelayShutdown() {
        return this.delayShutdown;
    }

    public void setDelayShutdown(int delayShutdown) {
        this.delayShutdown = delayShutdown;
    }

    public int getLowVoltage() {
        return this.lowVoltage;
    }

    public void setLowVoltage(int lowVoltage) {
        this.lowVoltage = lowVoltage;
    }
}
