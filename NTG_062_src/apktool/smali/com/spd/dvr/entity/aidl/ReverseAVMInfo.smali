.class public Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;
.super Ljava/lang/Object;
.source "ReverseAVMInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public angle:F

.field public autoParkActive:I

.field public autoParkHints:I

.field public avmEnable:I

.field public avmHwSupport:I

.field public brightness:J

.field public cameraExist:[Z

.field public carInfoAvm:I

.field public contrast:J

.field public csi0Mode:I

.field public csi1Mode:I

.field public doorFrontLeft:I

.field public doorFrontRight:I

.field public doorHood:I

.field public doorRearLeft:I

.field public doorRearRight:I

.field public doorTrunk:I

.field public dynamicLine:I

.field public frameRate30:I

.field public frontCamera:I

.field public frontRadarDispMode:I

.field public frontRadarEnable:Z

.field public frontRadarMaxLevel:I

.field public frontRadarNum:I

.field public frontRadarValue:[I

.field public hue:J

.field public leftRadarDispMode:I

.field public leftRadarMaxLevel:I

.field public leftRadarNum:I

.field public leftRadarValue:[I

.field public lightState:I

.field public lvds_brightness:I

.field public lvds_contrast:I

.field public lvds_mode:I

.field public lvds_pkt_delay:I

.field public lvds_switch:I

.field public lvdsformat:I

.field public mirror:I

.field public parkingRadarUIEnable:I

.field public reaarRadarDispMode:I

.field public rearRadarEnable:Z

.field public rearRadarMaxLevel:I

.field public rearRadarNum:I

.field public rearRadarValue:[I

.field public reverse:I

.field public reverseRadarUIEnable:I

.field public rightRadarDispMode:I

.field public rightRadarMaxLevel:I

.field public rightRadarNum:I

.field public rightRadarValue:[I

.field public saturation:J

.field public sharp:J

.field public sleepStatus:I

.field public speed:F

.field public staticLine:I

.field public turnDirection:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 272
    new-instance v0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo$1;

    invoke-direct {v0}, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo$1;-><init>()V

    sput-object v0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frontRadarEnable:Z

    .line 131
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rearRadarEnable:Z

    .line 144
    const/16 v0, 0x8

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->cameraExist:[Z

    .line 145
    const/16 v0, 0x80

    iput v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->lvds_brightness:I

    .line 146
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 4
    .param p1, "in"    # Landroid/os/Parcel;

    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frontRadarEnable:Z

    .line 131
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rearRadarEnable:Z

    .line 149
    invoke-virtual {p1}, Landroid/os/Parcel;->createBooleanArray()[Z

    move-result-object v2

    iput-object v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->cameraExist:[Z

    .line 150
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->avmEnable:I

    .line 151
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->avmHwSupport:I

    .line 152
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->csi0Mode:I

    .line 153
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->csi1Mode:I

    .line 154
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->reverse:I

    .line 155
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frontCamera:I

    .line 156
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->turnDirection:I

    .line 157
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->staticLine:I

    .line 158
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->dynamicLine:I

    .line 159
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->reverseRadarUIEnable:I

    .line 160
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->parkingRadarUIEnable:I

    .line 161
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->brightness:J

    .line 162
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->contrast:J

    .line 163
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->saturation:J

    .line 164
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->hue:J

    .line 165
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->mirror:I

    .line 166
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->speed:F

    .line 167
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->angle:F

    .line 168
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->doorFrontLeft:I

    .line 169
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->doorFrontRight:I

    .line 170
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->doorRearLeft:I

    .line 171
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->doorRearRight:I

    .line 172
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->doorTrunk:I

    .line 173
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->doorHood:I

    .line 174
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->lightState:I

    .line 175
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->autoParkActive:I

    .line 176
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->autoParkHints:I

    .line 177
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frontRadarDispMode:I

    .line 178
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->reaarRadarDispMode:I

    .line 179
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->leftRadarDispMode:I

    .line 180
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rightRadarDispMode:I

    .line 181
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frontRadarNum:I

    .line 182
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rearRadarNum:I

    .line 183
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->leftRadarNum:I

    .line 184
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rightRadarNum:I

    .line 185
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frontRadarMaxLevel:I

    .line 186
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rearRadarMaxLevel:I

    .line 187
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->leftRadarMaxLevel:I

    .line 188
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rightRadarMaxLevel:I

    .line 189
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v2

    iput-object v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frontRadarValue:[I

    .line 190
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v2

    iput-object v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rearRadarValue:[I

    .line 191
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v2

    iput-object v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->leftRadarValue:[I

    .line 192
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v2

    iput-object v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rightRadarValue:[I

    .line 193
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v2

    if-eqz v2, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    move v2, v0

    :goto_0
    iput-boolean v2, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frontRadarEnable:Z

    .line 194
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    nop

    :cond_1
    iput-boolean v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rearRadarEnable:Z

    .line 195
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->sleepStatus:I

    .line 196
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frameRate30:I

    .line 197
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->lvdsformat:I

    .line 198
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->lvds_pkt_delay:I

    .line 199
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->lvds_switch:I

    .line 200
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->lvds_brightness:I

    .line 201
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->lvds_contrast:I

    .line 202
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->carInfoAvm:I

    .line 203
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->sharp:J

    .line 204
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->lvds_mode:I

    .line 205
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 269
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 209
    iget-object v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->cameraExist:[Z

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBooleanArray([Z)V

    .line 210
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->avmEnable:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 211
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->avmHwSupport:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 212
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->csi0Mode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 213
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->csi1Mode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 214
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->reverse:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 215
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frontCamera:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 216
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->turnDirection:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 217
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->staticLine:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 218
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->dynamicLine:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 219
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->reverseRadarUIEnable:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 220
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->parkingRadarUIEnable:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 221
    iget-wide v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->brightness:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 222
    iget-wide v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->contrast:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 223
    iget-wide v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->saturation:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 224
    iget-wide v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->hue:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 225
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->mirror:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 226
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->speed:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 227
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->angle:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 228
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->doorFrontLeft:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 229
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->doorFrontRight:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 230
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->doorRearLeft:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 231
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->doorRearRight:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 232
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->doorTrunk:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 233
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->doorHood:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 234
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->lightState:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 235
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->autoParkActive:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 236
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->autoParkHints:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 237
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frontRadarDispMode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 238
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->reaarRadarDispMode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 239
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->leftRadarDispMode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 240
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rightRadarDispMode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 241
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frontRadarNum:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 242
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rearRadarNum:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 243
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->leftRadarNum:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 244
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rightRadarNum:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 245
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frontRadarMaxLevel:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 246
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rearRadarMaxLevel:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 247
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->leftRadarMaxLevel:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 248
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rightRadarMaxLevel:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 249
    iget-object v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frontRadarValue:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 250
    iget-object v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rearRadarValue:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 251
    iget-object v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->leftRadarValue:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 252
    iget-object v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rightRadarValue:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 253
    iget-boolean v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frontRadarEnable:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 254
    iget-boolean v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->rearRadarEnable:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 255
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->sleepStatus:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 256
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->frameRate30:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 257
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->lvdsformat:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 258
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->lvds_pkt_delay:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 259
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->lvds_switch:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 260
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->lvds_brightness:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 261
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->lvds_contrast:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 262
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->carInfoAvm:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 263
    iget-wide v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->sharp:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 264
    iget v0, p0, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->lvds_mode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 265
    return-void
.end method
