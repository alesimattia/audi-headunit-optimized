package com.spd.dvr.entity.aidl;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public class ReverseAVMInfo implements Parcelable {
    public static final Parcelable.Creator<ReverseAVMInfo> CREATOR = new Parcelable.Creator<ReverseAVMInfo>() { // from class: com.spd.dvr.entity.aidl.ReverseAVMInfo.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public ReverseAVMInfo createFromParcel(Parcel in) {
            return new ReverseAVMInfo(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public ReverseAVMInfo[] newArray(int size) {
            return new ReverseAVMInfo[size];
        }
    };
    public float angle;
    public int autoParkActive;
    public int autoParkHints;
    public int avmEnable;
    public int avmHwSupport;
    public long brightness;
    public boolean[] cameraExist;
    public int carInfoAvm;
    public long contrast;
    public int csi0Mode;
    public int csi1Mode;
    public int doorFrontLeft;
    public int doorFrontRight;
    public int doorHood;
    public int doorRearLeft;
    public int doorRearRight;
    public int doorTrunk;
    public int dynamicLine;
    public int frameRate30;
    public int frontCamera;
    public int frontRadarDispMode;
    public boolean frontRadarEnable;
    public int frontRadarMaxLevel;
    public int frontRadarNum;
    public int[] frontRadarValue;
    public long hue;
    public int leftRadarDispMode;
    public int leftRadarMaxLevel;
    public int leftRadarNum;
    public int[] leftRadarValue;
    public int lightState;
    public int lvds_brightness;
    public int lvds_contrast;
    public int lvds_mode;
    public int lvds_pkt_delay;
    public int lvds_switch;
    public int lvdsformat;
    public int mirror;
    public int parkingRadarUIEnable;
    public int reaarRadarDispMode;
    public boolean rearRadarEnable;
    public int rearRadarMaxLevel;
    public int rearRadarNum;
    public int[] rearRadarValue;
    public int reverse;
    public int reverseRadarUIEnable;
    public int rightRadarDispMode;
    public int rightRadarMaxLevel;
    public int rightRadarNum;
    public int[] rightRadarValue;
    public long saturation;
    public long sharp;
    public int sleepStatus;
    public float speed;
    public int staticLine;
    public int turnDirection;

    public ReverseAVMInfo() {
        this.frontRadarEnable = false;
        this.rearRadarEnable = true;
        this.cameraExist = new boolean[8];
        this.lvds_brightness = 128;
    }

    protected ReverseAVMInfo(Parcel in) {
        boolean z;
        this.frontRadarEnable = false;
        this.rearRadarEnable = true;
        this.cameraExist = in.createBooleanArray();
        this.avmEnable = in.readInt();
        this.avmHwSupport = in.readInt();
        this.csi0Mode = in.readInt();
        this.csi1Mode = in.readInt();
        this.reverse = in.readInt();
        this.frontCamera = in.readInt();
        this.turnDirection = in.readInt();
        this.staticLine = in.readInt();
        this.dynamicLine = in.readInt();
        this.reverseRadarUIEnable = in.readInt();
        this.parkingRadarUIEnable = in.readInt();
        this.brightness = in.readLong();
        this.contrast = in.readLong();
        this.saturation = in.readLong();
        this.hue = in.readLong();
        this.mirror = in.readInt();
        this.speed = in.readFloat();
        this.angle = in.readFloat();
        this.doorFrontLeft = in.readInt();
        this.doorFrontRight = in.readInt();
        this.doorRearLeft = in.readInt();
        this.doorRearRight = in.readInt();
        this.doorTrunk = in.readInt();
        this.doorHood = in.readInt();
        this.lightState = in.readInt();
        this.autoParkActive = in.readInt();
        this.autoParkHints = in.readInt();
        this.frontRadarDispMode = in.readInt();
        this.reaarRadarDispMode = in.readInt();
        this.leftRadarDispMode = in.readInt();
        this.rightRadarDispMode = in.readInt();
        this.frontRadarNum = in.readInt();
        this.rearRadarNum = in.readInt();
        this.leftRadarNum = in.readInt();
        this.rightRadarNum = in.readInt();
        this.frontRadarMaxLevel = in.readInt();
        this.rearRadarMaxLevel = in.readInt();
        this.leftRadarMaxLevel = in.readInt();
        this.rightRadarMaxLevel = in.readInt();
        this.frontRadarValue = in.createIntArray();
        this.rearRadarValue = in.createIntArray();
        this.leftRadarValue = in.createIntArray();
        this.rightRadarValue = in.createIntArray();
        if (in.readByte() == 0) {
            z = false;
        } else {
            z = true;
        }
        this.frontRadarEnable = z;
        this.rearRadarEnable = in.readByte() != 0;
        this.sleepStatus = in.readInt();
        this.frameRate30 = in.readInt();
        this.lvdsformat = in.readInt();
        this.lvds_pkt_delay = in.readInt();
        this.lvds_switch = in.readInt();
        this.lvds_brightness = in.readInt();
        this.lvds_contrast = in.readInt();
        this.carInfoAvm = in.readInt();
        this.sharp = in.readLong();
        this.lvds_mode = in.readInt();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeBooleanArray(this.cameraExist);
        parcel.writeInt(this.avmEnable);
        parcel.writeInt(this.avmHwSupport);
        parcel.writeInt(this.csi0Mode);
        parcel.writeInt(this.csi1Mode);
        parcel.writeInt(this.reverse);
        parcel.writeInt(this.frontCamera);
        parcel.writeInt(this.turnDirection);
        parcel.writeInt(this.staticLine);
        parcel.writeInt(this.dynamicLine);
        parcel.writeInt(this.reverseRadarUIEnable);
        parcel.writeInt(this.parkingRadarUIEnable);
        parcel.writeLong(this.brightness);
        parcel.writeLong(this.contrast);
        parcel.writeLong(this.saturation);
        parcel.writeLong(this.hue);
        parcel.writeInt(this.mirror);
        parcel.writeFloat(this.speed);
        parcel.writeFloat(this.angle);
        parcel.writeInt(this.doorFrontLeft);
        parcel.writeInt(this.doorFrontRight);
        parcel.writeInt(this.doorRearLeft);
        parcel.writeInt(this.doorRearRight);
        parcel.writeInt(this.doorTrunk);
        parcel.writeInt(this.doorHood);
        parcel.writeInt(this.lightState);
        parcel.writeInt(this.autoParkActive);
        parcel.writeInt(this.autoParkHints);
        parcel.writeInt(this.frontRadarDispMode);
        parcel.writeInt(this.reaarRadarDispMode);
        parcel.writeInt(this.leftRadarDispMode);
        parcel.writeInt(this.rightRadarDispMode);
        parcel.writeInt(this.frontRadarNum);
        parcel.writeInt(this.rearRadarNum);
        parcel.writeInt(this.leftRadarNum);
        parcel.writeInt(this.rightRadarNum);
        parcel.writeInt(this.frontRadarMaxLevel);
        parcel.writeInt(this.rearRadarMaxLevel);
        parcel.writeInt(this.leftRadarMaxLevel);
        parcel.writeInt(this.rightRadarMaxLevel);
        parcel.writeIntArray(this.frontRadarValue);
        parcel.writeIntArray(this.rearRadarValue);
        parcel.writeIntArray(this.leftRadarValue);
        parcel.writeIntArray(this.rightRadarValue);
        parcel.writeByte(this.frontRadarEnable ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.rearRadarEnable ? (byte) 1 : (byte) 0);
        parcel.writeInt(this.sleepStatus);
        parcel.writeInt(this.frameRate30);
        parcel.writeInt(this.lvdsformat);
        parcel.writeInt(this.lvds_pkt_delay);
        parcel.writeInt(this.lvds_switch);
        parcel.writeInt(this.lvds_brightness);
        parcel.writeInt(this.lvds_contrast);
        parcel.writeInt(this.carInfoAvm);
        parcel.writeLong(this.sharp);
        parcel.writeInt(this.lvds_mode);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }
}
