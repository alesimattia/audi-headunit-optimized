.class public Lcom/spd/dvr/entity/aidl/FileInfo;
.super Ljava/lang/Object;
.source "FileInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/spd/dvr/entity/aidl/FileInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field fileName:Ljava/lang/String;

.field filePath:Ljava/lang/String;

.field lock:I

.field tempTime:J

.field type:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    new-instance v0, Lcom/spd/dvr/entity/aidl/FileInfo$1;

    invoke-direct {v0}, Lcom/spd/dvr/entity/aidl/FileInfo$1;-><init>()V

    sput-object v0, Lcom/spd/dvr/entity/aidl/FileInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->fileName:Ljava/lang/String;

    .line 25
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->filePath:Ljava/lang/String;

    .line 26
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->type:I

    .line 27
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->lock:I

    .line 28
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->tempTime:J

    .line 29
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 43
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .line 100
    instance-of v0, p1, Lcom/spd/dvr/entity/aidl/FileInfo;

    if-eqz v0, :cond_0

    .line 101
    move-object v0, p1

    check-cast v0, Lcom/spd/dvr/entity/aidl/FileInfo;

    .line 102
    .local v0, "fileInfo":Lcom/spd/dvr/entity/aidl/FileInfo;
    iget-object v1, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->fileName:Ljava/lang/String;

    iget-object v2, v0, Lcom/spd/dvr/entity/aidl/FileInfo;->fileName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->filePath:Ljava/lang/String;

    iget-object v2, v0, Lcom/spd/dvr/entity/aidl/FileInfo;->filePath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 103
    const/4 v1, 0x1

    return v1

    .line 106
    .end local v0    # "fileInfo":Lcom/spd/dvr/entity/aidl/FileInfo;
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public getFilePath()Ljava/lang/String;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->filePath:Ljava/lang/String;

    return-object v0
.end method

.method public getLock()I
    .locals 1

    .line 83
    iget v0, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->lock:I

    return v0
.end method

.method public getTempTime()J
    .locals 2

    .line 91
    iget-wide v0, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->tempTime:J

    return-wide v0
.end method

.method public getType()I
    .locals 1

    .line 75
    iget v0, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->type:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 111
    const/16 v0, 0x11

    .line 112
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->fileName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    .line 113
    .end local v0    # "result":I
    .local v1, "result":I
    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->filePath:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    .line 114
    .end local v1    # "result":I
    .restart local v0    # "result":I
    return v0
.end method

.method public setFileName(Ljava/lang/String;)V
    .locals 0
    .param p1, "fileName"    # Ljava/lang/String;

    .line 63
    iput-object p1, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->fileName:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public setFilePath(Ljava/lang/String;)V
    .locals 0
    .param p1, "filePath"    # Ljava/lang/String;

    .line 71
    iput-object p1, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->filePath:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public setLock(I)V
    .locals 0
    .param p1, "lock"    # I

    .line 87
    iput p1, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->lock:I

    .line 88
    return-void
.end method

.method public setTempTime(J)V
    .locals 0
    .param p1, "tempTime"    # J

    .line 95
    iput-wide p1, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->tempTime:J

    .line 96
    return-void
.end method

.method public setType(I)V
    .locals 0
    .param p1, "type"    # I

    .line 79
    iput p1, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->type:I

    .line 80
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FileInfo{fileName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->fileName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", filePath=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->filePath:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ", type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->type:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", lock="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->lock:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", tempTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->tempTime:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 34
    iget-object v0, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->fileName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 35
    iget-object v0, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->filePath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 36
    iget v0, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->type:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 37
    iget v0, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->lock:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 38
    iget-wide v0, p0, Lcom/spd/dvr/entity/aidl/FileInfo;->tempTime:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 39
    return-void
.end method
