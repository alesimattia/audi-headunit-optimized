.class public Lcom/spd/dvr/entity/aidl/SettingInfo;
.super Ljava/lang/Object;
.source "SettingInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/spd/dvr/entity/aidl/SettingInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private audioRecord:I

.field private autoRecoder:I

.field private codecFormat:I

.field private delayShutdown:I

.field private fileFormat:I

.field private gSensor:I

.field private lowVoltage:I

.field private mainStream:I

.field private preViewCount:I

.field private previewRatio:I

.field private recoderCount:I

.field private recoderRatio:I

.field private recoderTime:I

.field private remoteMonitor:I

.field private savePath:I

.field private segmentSize:I

.field private selectedPath:Ljava/lang/String;

.field private subRatio:I

.field private subRecoderSwitch:I

.field private subStream:I

.field private waterMask:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 93
    new-instance v0, Lcom/spd/dvr/entity/aidl/SettingInfo$1;

    invoke-direct {v0}, Lcom/spd/dvr/entity/aidl/SettingInfo$1;-><init>()V

    sput-object v0, Lcom/spd/dvr/entity/aidl/SettingInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->previewRatio:I

    .line 41
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->preViewCount:I

    .line 42
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->recoderRatio:I

    .line 43
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->recoderCount:I

    .line 44
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->codecFormat:I

    .line 45
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->fileFormat:I

    .line 46
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->mainStream:I

    .line 47
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->subStream:I

    .line 48
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->subRatio:I

    .line 49
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->subRecoderSwitch:I

    .line 50
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->segmentSize:I

    .line 51
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->recoderTime:I

    .line 52
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->waterMask:I

    .line 53
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->remoteMonitor:I

    .line 54
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->audioRecord:I

    .line 55
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->gSensor:I

    .line 56
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->savePath:I

    .line 57
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->autoRecoder:I

    .line 58
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->selectedPath:Ljava/lang/String;

    .line 59
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->delayShutdown:I

    .line 60
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->lowVoltage:I

    .line 61
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 90
    const/4 v0, 0x0

    return v0
.end method

.method public getAudioRecord()I
    .locals 1

    .line 234
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->audioRecord:I

    return v0
.end method

.method public getAutoRecoder()I
    .locals 1

    .line 218
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->autoRecoder:I

    return v0
.end method

.method public getCodecFormat()I
    .locals 1

    .line 138
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->codecFormat:I

    return v0
.end method

.method public getDelayShutdown()I
    .locals 1

    .line 258
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->delayShutdown:I

    return v0
.end method

.method public getFileFormat()I
    .locals 1

    .line 146
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->fileFormat:I

    return v0
.end method

.method public getLowVoltage()I
    .locals 1

    .line 266
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->lowVoltage:I

    return v0
.end method

.method public getMainStream()I
    .locals 1

    .line 154
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->mainStream:I

    return v0
.end method

.method public getPreViewCount()I
    .locals 1

    .line 114
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->preViewCount:I

    return v0
.end method

.method public getPreviewRatio()I
    .locals 1

    .line 106
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->previewRatio:I

    return v0
.end method

.method public getRecoderCount()I
    .locals 1

    .line 130
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->recoderCount:I

    return v0
.end method

.method public getRecoderRatio()I
    .locals 1

    .line 122
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->recoderRatio:I

    return v0
.end method

.method public getRecoderTime()I
    .locals 1

    .line 210
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->recoderTime:I

    return v0
.end method

.method public getRemoteMonitor()I
    .locals 1

    .line 226
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->remoteMonitor:I

    return v0
.end method

.method public getSavePath()I
    .locals 1

    .line 202
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->savePath:I

    return v0
.end method

.method public getSegmentSize()I
    .locals 1

    .line 186
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->segmentSize:I

    return v0
.end method

.method public getSelectedPath()Ljava/lang/String;
    .locals 1

    .line 250
    iget-object v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->selectedPath:Ljava/lang/String;

    return-object v0
.end method

.method public getSubRatio()I
    .locals 1

    .line 170
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->subRatio:I

    return v0
.end method

.method public getSubRecoderSwitch()I
    .locals 1

    .line 178
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->subRecoderSwitch:I

    return v0
.end method

.method public getSubStream()I
    .locals 1

    .line 162
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->subStream:I

    return v0
.end method

.method public getWaterMask()I
    .locals 1

    .line 194
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->waterMask:I

    return v0
.end method

.method public getgSensor()I
    .locals 1

    .line 242
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->gSensor:I

    return v0
.end method

.method public setAudioRecord(I)V
    .locals 0
    .param p1, "audioRecord"    # I

    .line 238
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->audioRecord:I

    .line 239
    return-void
.end method

.method public setAutoRecoder(I)V
    .locals 0
    .param p1, "autoRecoder"    # I

    .line 222
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->autoRecoder:I

    .line 223
    return-void
.end method

.method public setCodecFormat(I)V
    .locals 0
    .param p1, "codecFormat"    # I

    .line 142
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->codecFormat:I

    .line 143
    return-void
.end method

.method public setDelayShutdown(I)V
    .locals 0
    .param p1, "delayShutdown"    # I

    .line 262
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->delayShutdown:I

    .line 263
    return-void
.end method

.method public setFileFormat(I)V
    .locals 0
    .param p1, "fileFormat"    # I

    .line 150
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->fileFormat:I

    .line 151
    return-void
.end method

.method public setLowVoltage(I)V
    .locals 0
    .param p1, "lowVoltage"    # I

    .line 270
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->lowVoltage:I

    .line 271
    return-void
.end method

.method public setMainStream(I)V
    .locals 0
    .param p1, "mainStream"    # I

    .line 158
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->mainStream:I

    .line 159
    return-void
.end method

.method public setPreViewCount(I)V
    .locals 0
    .param p1, "preViewCount"    # I

    .line 118
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->preViewCount:I

    .line 119
    return-void
.end method

.method public setPreviewRatio(I)V
    .locals 0
    .param p1, "previewRatio"    # I

    .line 110
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->previewRatio:I

    .line 111
    return-void
.end method

.method public setRecoderCount(I)V
    .locals 0
    .param p1, "recoderCount"    # I

    .line 134
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->recoderCount:I

    .line 135
    return-void
.end method

.method public setRecoderRatio(I)V
    .locals 0
    .param p1, "recoderRatio"    # I

    .line 126
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->recoderRatio:I

    .line 127
    return-void
.end method

.method public setRecoderTime(I)V
    .locals 0
    .param p1, "recoderTime"    # I

    .line 214
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->recoderTime:I

    .line 215
    return-void
.end method

.method public setRemoteMonitor(I)V
    .locals 0
    .param p1, "remoteMonitor"    # I

    .line 230
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->remoteMonitor:I

    .line 231
    return-void
.end method

.method public setSavePath(I)V
    .locals 0
    .param p1, "savePath"    # I

    .line 206
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->savePath:I

    .line 207
    return-void
.end method

.method public setSegmentSize(I)V
    .locals 0
    .param p1, "segmentSize"    # I

    .line 190
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->segmentSize:I

    .line 191
    return-void
.end method

.method public setSelectedPath(Ljava/lang/String;)V
    .locals 0
    .param p1, "selectedPath"    # Ljava/lang/String;

    .line 254
    iput-object p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->selectedPath:Ljava/lang/String;

    .line 255
    return-void
.end method

.method public setSubRatio(I)V
    .locals 0
    .param p1, "subRatio"    # I

    .line 174
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->subRatio:I

    .line 175
    return-void
.end method

.method public setSubRecoderSwitch(I)V
    .locals 0
    .param p1, "subRecoderSwitch"    # I

    .line 182
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->subRecoderSwitch:I

    .line 183
    return-void
.end method

.method public setSubStream(I)V
    .locals 0
    .param p1, "subStream"    # I

    .line 166
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->subStream:I

    .line 167
    return-void
.end method

.method public setWaterMask(I)V
    .locals 0
    .param p1, "waterMask"    # I

    .line 198
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->waterMask:I

    .line 199
    return-void
.end method

.method public setgSensor(I)V
    .locals 0
    .param p1, "gSensor"    # I

    .line 246
    iput p1, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->gSensor:I

    .line 247
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 65
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->previewRatio:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 66
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->preViewCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 67
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->recoderRatio:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 68
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->recoderCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 69
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->codecFormat:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 70
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->fileFormat:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 71
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->mainStream:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 72
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->subStream:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 73
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->subRatio:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 74
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->subRecoderSwitch:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 75
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->segmentSize:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 76
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->recoderTime:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 77
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->waterMask:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 78
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->remoteMonitor:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 79
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->audioRecord:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 80
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->gSensor:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 81
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->savePath:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 82
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->autoRecoder:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 83
    iget-object v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->selectedPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 84
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->delayShutdown:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 85
    iget v0, p0, Lcom/spd/dvr/entity/aidl/SettingInfo;->lowVoltage:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 86
    return-void
.end method
