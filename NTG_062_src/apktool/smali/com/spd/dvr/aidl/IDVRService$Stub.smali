.class public abstract Lcom/spd/dvr/aidl/IDVRService$Stub;
.super Landroid/os/Binder;
.source "IDVRService.java"

# interfaces
.implements Lcom/spd/dvr/aidl/IDVRService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/dvr/aidl/IDVRService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/spd/dvr/aidl/IDVRService$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.spd.dvr.aidl.IDVRService"

.field static final TRANSACTION_dvrControlCmd:I = 0x5

.field static final TRANSACTION_enterSource:I = 0x3

.field static final TRANSACTION_exitSource:I = 0x4

.field static final TRANSACTION_getAvmConfigParam:I = 0xf

.field static final TRANSACTION_getCameraDeviceParam:I = 0x11

.field static final TRANSACTION_getCarModelPayStatus:I = 0x18

.field static final TRANSACTION_getDvrState:I = 0x6

.field static final TRANSACTION_getFileInfos:I = 0x8

.field static final TRANSACTION_getReverseInfo:I = 0x16

.field static final TRANSACTION_getSettingInfo:I = 0xc

.field static final TRANSACTION_operationFileList:I = 0x9

.field static final TRANSACTION_refreshFileInfo:I = 0x7

.field static final TRANSACTION_regCarModelPayCallback:I = 0x17

.field static final TRANSACTION_registerDVRServiceCallback:I = 0x1

.field static final TRANSACTION_registerDVRServiceRecordFilePathCallback:I = 0x1b

.field static final TRANSACTION_registerReverseInfoCallback:I = 0x14

.field static final TRANSACTION_sendCarModelPayCommand:I = 0x19

.field static final TRANSACTION_sendData:I = 0x13

.field static final TRANSACTION_sendSettingCommand:I = 0x12

.field static final TRANSACTION_setAvmConfigParam:I = 0xe

.field static final TRANSACTION_setCameraDeviceParam:I = 0x10

.field static final TRANSACTION_setDvrFileName:I = 0x1a

.field static final TRANSACTION_setPlaybackSurface:I = 0xb

.field static final TRANSACTION_setSettingInfo:I = 0xd

.field static final TRANSACTION_startPreviewByChannel:I = 0xa

.field static final TRANSACTION_unRegisterDVRCallback:I = 0x2

.field static final TRANSACTION_unRegisterDVRFilePathCallback:I = 0x1c

.field static final TRANSACTION_unregisterReverseInfoCallback:I = 0x15


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 17
    const-string v0, "com.spd.dvr.aidl.IDVRService"

    invoke-virtual {p0, p0, v0}, Lcom/spd/dvr/aidl/IDVRService$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 18
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/spd/dvr/aidl/IDVRService;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .line 25
    if-nez p0, :cond_0

    .line 26
    const/4 v0, 0x0

    return-object v0

    .line 28
    :cond_0
    const-string v0, "com.spd.dvr.aidl.IDVRService"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 29
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/spd/dvr/aidl/IDVRService;

    if-eqz v1, :cond_1

    .line 30
    move-object v1, v0

    check-cast v1, Lcom/spd/dvr/aidl/IDVRService;

    return-object v1

    .line 32
    :cond_1
    new-instance v1, Lcom/spd/dvr/aidl/IDVRService$Stub$Proxy;

    invoke-direct {v1, p0}, Lcom/spd/dvr/aidl/IDVRService$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .line 36
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 6
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 40
    const-string v0, "com.spd.dvr.aidl.IDVRService"

    .line 41
    .local v0, "descriptor":Ljava/lang/String;
    const v1, 0x5f4e5446

    const/4 v2, 0x1

    if-eq p1, v1, :cond_6

    const/4 v1, 0x0

    const/4 v3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 385
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v1

    return v1

    .line 376
    :pswitch_0
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 378
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 379
    .local v1, "_arg0":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/spd/dvr/aidl/IDVRService$Stub;->unRegisterDVRFilePathCallback(Ljava/lang/String;)V

    .line 380
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 381
    return v2

    .line 365
    .end local v1    # "_arg0":Ljava/lang/String;
    :pswitch_1
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 367
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 369
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/spd/dvr/aidl/IDVRServiceFilePathCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/spd/dvr/aidl/IDVRServiceFilePathCallback;

    move-result-object v3

    .line 370
    .local v3, "_arg1":Lcom/spd/dvr/aidl/IDVRServiceFilePathCallback;
    invoke-virtual {p0, v1, v3}, Lcom/spd/dvr/aidl/IDVRService$Stub;->registerDVRServiceRecordFilePathCallback(Ljava/lang/String;Lcom/spd/dvr/aidl/IDVRServiceFilePathCallback;)V

    .line 371
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 372
    return v2

    .line 356
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v3    # "_arg1":Lcom/spd/dvr/aidl/IDVRServiceFilePathCallback;
    :pswitch_2
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 358
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 359
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/spd/dvr/aidl/IDVRService$Stub;->setDvrFileName(Ljava/lang/String;)V

    .line 360
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 361
    return v2

    .line 343
    .end local v1    # "_arg0":Ljava/lang/String;
    :pswitch_3
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 345
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 347
    .local v1, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 349
    .local v3, "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 350
    .local v4, "_arg2":I
    invoke-virtual {p0, v1, v3, v4}, Lcom/spd/dvr/aidl/IDVRService$Stub;->sendCarModelPayCommand(III)V

    .line 351
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 352
    return v2

    .line 333
    .end local v1    # "_arg0":I
    .end local v3    # "_arg1":I
    .end local v4    # "_arg2":I
    :pswitch_4
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 335
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 336
    .restart local v1    # "_arg0":I
    invoke-virtual {p0, v1}, Lcom/spd/dvr/aidl/IDVRService$Stub;->getCarModelPayStatus(I)I

    move-result v3

    .line 337
    .local v3, "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 338
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 339
    return v2

    .line 322
    .end local v1    # "_arg0":I
    .end local v3    # "_result":I
    :pswitch_5
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 324
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 326
    .local v1, "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/spd/dvr/aidl/ICarModelPayCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/spd/dvr/aidl/ICarModelPayCallback;

    move-result-object v3

    .line 327
    .local v3, "_arg1":Lcom/spd/dvr/aidl/ICarModelPayCallback;
    invoke-virtual {p0, v1, v3}, Lcom/spd/dvr/aidl/IDVRService$Stub;->regCarModelPayCallback(Ljava/lang/String;Lcom/spd/dvr/aidl/ICarModelPayCallback;)V

    .line 328
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 329
    return v2

    .line 308
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v3    # "_arg1":Lcom/spd/dvr/aidl/ICarModelPayCallback;
    :pswitch_6
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 309
    invoke-virtual {p0}, Lcom/spd/dvr/aidl/IDVRService$Stub;->getReverseInfo()Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;

    move-result-object v3

    .line 310
    .local v3, "_result":Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 311
    if-eqz v3, :cond_0

    .line 312
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 313
    invoke-virtual {v3, p3, v2}, Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_0

    .line 316
    :cond_0
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 318
    :goto_0
    return v2

    .line 299
    .end local v3    # "_result":Lcom/spd/dvr/entity/aidl/ReverseAVMInfo;
    :pswitch_7
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 301
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 302
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/spd/dvr/aidl/IDVRService$Stub;->unregisterReverseInfoCallback(Ljava/lang/String;)V

    .line 303
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 304
    return v2

    .line 288
    .end local v1    # "_arg0":Ljava/lang/String;
    :pswitch_8
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 290
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 292
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/spd/dvr/aidl/IReverseInfoCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/spd/dvr/aidl/IReverseInfoCallback;

    move-result-object v3

    .line 293
    .local v3, "_arg1":Lcom/spd/dvr/aidl/IReverseInfoCallback;
    invoke-virtual {p0, v1, v3}, Lcom/spd/dvr/aidl/IDVRService$Stub;->registerReverseInfoCallback(Ljava/lang/String;Lcom/spd/dvr/aidl/IReverseInfoCallback;)V

    .line 294
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 295
    return v2

    .line 270
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v3    # "_arg1":Lcom/spd/dvr/aidl/IReverseInfoCallback;
    :pswitch_9
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 272
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 274
    .local v1, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_1

    .line 275
    sget-object v3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Bundle;

    .local v3, "_arg1":Landroid/os/Bundle;
    goto :goto_1

    .line 278
    .end local v3    # "_arg1":Landroid/os/Bundle;
    :cond_1
    nop

    .line 281
    .restart local v3    # "_arg1":Landroid/os/Bundle;
    :goto_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 282
    .restart local v4    # "_arg2":I
    invoke-virtual {p0, v1, v3, v4}, Lcom/spd/dvr/aidl/IDVRService$Stub;->sendData(ILandroid/os/Bundle;I)V

    .line 283
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 284
    return v2

    .line 257
    .end local v1    # "_arg0":I
    .end local v3    # "_arg1":Landroid/os/Bundle;
    .end local v4    # "_arg2":I
    :pswitch_a
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 259
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 261
    .restart local v1    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 263
    .local v3, "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 264
    .restart local v4    # "_arg2":I
    invoke-virtual {p0, v1, v3, v4}, Lcom/spd/dvr/aidl/IDVRService$Stub;->sendSettingCommand(III)V

    .line 265
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 266
    return v2

    .line 243
    .end local v1    # "_arg0":I
    .end local v3    # "_arg1":I
    .end local v4    # "_arg2":I
    :pswitch_b
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 245
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 247
    .restart local v1    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 249
    .restart local v3    # "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 250
    .restart local v4    # "_arg2":I
    invoke-virtual {p0, v1, v3, v4}, Lcom/spd/dvr/aidl/IDVRService$Stub;->getCameraDeviceParam(III)I

    move-result v5

    .line 251
    .local v5, "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 252
    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 253
    return v2

    .line 228
    .end local v1    # "_arg0":I
    .end local v3    # "_arg1":I
    .end local v4    # "_arg2":I
    .end local v5    # "_result":I
    :pswitch_c
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 230
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 232
    .restart local v1    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 234
    .restart local v3    # "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 236
    .restart local v4    # "_arg2":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 237
    .local v5, "_arg3":I
    invoke-virtual {p0, v1, v3, v4, v5}, Lcom/spd/dvr/aidl/IDVRService$Stub;->setCameraDeviceParam(IIII)V

    .line 238
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 239
    return v2

    .line 216
    .end local v1    # "_arg0":I
    .end local v3    # "_arg1":I
    .end local v4    # "_arg2":I
    .end local v5    # "_arg3":I
    :pswitch_d
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 218
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 220
    .local v1, "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 221
    .restart local v3    # "_arg1":I
    invoke-virtual {p0, v1, v3}, Lcom/spd/dvr/aidl/IDVRService$Stub;->getAvmConfigParam(Ljava/lang/String;I)I

    move-result v4

    .line 222
    .local v4, "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 223
    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 224
    return v2

    .line 205
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v3    # "_arg1":I
    .end local v4    # "_result":I
    :pswitch_e
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 207
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 209
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 210
    .restart local v3    # "_arg1":I
    invoke-virtual {p0, v1, v3}, Lcom/spd/dvr/aidl/IDVRService$Stub;->setAvmConfigParam(Ljava/lang/String;I)V

    .line 211
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 212
    return v2

    .line 191
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v3    # "_arg1":I
    :pswitch_f
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 193
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_2

    .line 194
    sget-object v1, Lcom/spd/dvr/entity/aidl/SettingInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lcom/spd/dvr/entity/aidl/SettingInfo;

    .local v3, "_arg0":Lcom/spd/dvr/entity/aidl/SettingInfo;
    goto :goto_2

    .line 197
    .end local v3    # "_arg0":Lcom/spd/dvr/entity/aidl/SettingInfo;
    :cond_2
    nop

    .restart local v3    # "_arg0":Lcom/spd/dvr/entity/aidl/SettingInfo;
    :goto_2
    move-object v1, v3

    .line 199
    .end local v3    # "_arg0":Lcom/spd/dvr/entity/aidl/SettingInfo;
    .local v1, "_arg0":Lcom/spd/dvr/entity/aidl/SettingInfo;
    invoke-virtual {p0, v1}, Lcom/spd/dvr/aidl/IDVRService$Stub;->setSettingInfo(Lcom/spd/dvr/entity/aidl/SettingInfo;)V

    .line 200
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 201
    return v2

    .line 177
    .end local v1    # "_arg0":Lcom/spd/dvr/entity/aidl/SettingInfo;
    :pswitch_10
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 178
    invoke-virtual {p0}, Lcom/spd/dvr/aidl/IDVRService$Stub;->getSettingInfo()Lcom/spd/dvr/entity/aidl/SettingInfo;

    move-result-object v3

    .line 179
    .local v3, "_result":Lcom/spd/dvr/entity/aidl/SettingInfo;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 180
    if-eqz v3, :cond_3

    .line 181
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 182
    invoke-virtual {v3, p3, v2}, Lcom/spd/dvr/entity/aidl/SettingInfo;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_3

    .line 185
    :cond_3
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 187
    :goto_3
    return v2

    .line 163
    .end local v3    # "_result":Lcom/spd/dvr/entity/aidl/SettingInfo;
    :pswitch_11
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 165
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_4

    .line 166
    sget-object v1, Landroid/view/Surface;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/view/Surface;

    .local v3, "_arg0":Landroid/view/Surface;
    goto :goto_4

    .line 169
    .end local v3    # "_arg0":Landroid/view/Surface;
    :cond_4
    nop

    .restart local v3    # "_arg0":Landroid/view/Surface;
    :goto_4
    move-object v1, v3

    .line 171
    .end local v3    # "_arg0":Landroid/view/Surface;
    .local v1, "_arg0":Landroid/view/Surface;
    invoke-virtual {p0, v1}, Lcom/spd/dvr/aidl/IDVRService$Stub;->setPlaybackSurface(Landroid/view/Surface;)V

    .line 172
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 173
    return v2

    .line 147
    .end local v1    # "_arg0":Landroid/view/Surface;
    :pswitch_12
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 149
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 151
    .local v1, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_5

    .line 152
    sget-object v3, Landroid/view/Surface;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/Surface;

    .local v3, "_arg1":Landroid/view/Surface;
    goto :goto_5

    .line 155
    .end local v3    # "_arg1":Landroid/view/Surface;
    :cond_5
    nop

    .line 157
    .restart local v3    # "_arg1":Landroid/view/Surface;
    :goto_5
    invoke-virtual {p0, v1, v3}, Lcom/spd/dvr/aidl/IDVRService$Stub;->startPreviewByChannel(ILandroid/view/Surface;)V

    .line 158
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 159
    return v2

    .line 134
    .end local v1    # "_arg0":I
    .end local v3    # "_arg1":Landroid/view/Surface;
    :pswitch_13
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 136
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 138
    .restart local v1    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v3

    .line 140
    .local v3, "_arg1":[I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 141
    .local v4, "_arg2":I
    invoke-virtual {p0, v1, v3, v4}, Lcom/spd/dvr/aidl/IDVRService$Stub;->operationFileList(I[II)V

    .line 142
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 143
    return v2

    .line 120
    .end local v1    # "_arg0":I
    .end local v3    # "_arg1":[I
    .end local v4    # "_arg2":I
    :pswitch_14
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 122
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 124
    .restart local v1    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 126
    .local v3, "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 127
    .restart local v4    # "_arg2":I
    invoke-virtual {p0, v1, v3, v4}, Lcom/spd/dvr/aidl/IDVRService$Stub;->getFileInfos(III)Ljava/util/List;

    move-result-object v5

    .line 128
    .local v5, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/spd/dvr/entity/aidl/FileInfo;>;"
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 129
    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 130
    return v2

    .line 111
    .end local v1    # "_arg0":I
    .end local v3    # "_arg1":I
    .end local v4    # "_arg2":I
    .end local v5    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/spd/dvr/entity/aidl/FileInfo;>;"
    :pswitch_15
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 113
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 114
    .restart local v1    # "_arg0":I
    invoke-virtual {p0, v1}, Lcom/spd/dvr/aidl/IDVRService$Stub;->refreshFileInfo(I)V

    .line 115
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 116
    return v2

    .line 101
    .end local v1    # "_arg0":I
    :pswitch_16
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 103
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 104
    .restart local v1    # "_arg0":I
    invoke-virtual {p0, v1}, Lcom/spd/dvr/aidl/IDVRService$Stub;->getDvrState(I)I

    move-result v3

    .line 105
    .local v3, "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 106
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 107
    return v2

    .line 88
    .end local v1    # "_arg0":I
    .end local v3    # "_result":I
    :pswitch_17
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 90
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 92
    .restart local v1    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 94
    .local v3, "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 95
    .restart local v4    # "_arg2":I
    invoke-virtual {p0, v1, v3, v4}, Lcom/spd/dvr/aidl/IDVRService$Stub;->dvrControlCmd(III)V

    .line 96
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 97
    return v2

    .line 79
    .end local v1    # "_arg0":I
    .end local v3    # "_arg1":I
    .end local v4    # "_arg2":I
    :pswitch_18
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 81
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 82
    .local v1, "_arg0":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/spd/dvr/aidl/IDVRService$Stub;->exitSource(Ljava/lang/String;)V

    .line 83
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 84
    return v2

    .line 70
    .end local v1    # "_arg0":Ljava/lang/String;
    :pswitch_19
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 72
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 73
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/spd/dvr/aidl/IDVRService$Stub;->enterSource(Ljava/lang/String;)V

    .line 74
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 75
    return v2

    .line 61
    .end local v1    # "_arg0":Ljava/lang/String;
    :pswitch_1a
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 63
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 64
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/spd/dvr/aidl/IDVRService$Stub;->unRegisterDVRCallback(Ljava/lang/String;)V

    .line 65
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 66
    return v2

    .line 50
    .end local v1    # "_arg0":Ljava/lang/String;
    :pswitch_1b
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 52
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 54
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/spd/dvr/aidl/IDVRServiceCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/spd/dvr/aidl/IDVRServiceCallback;

    move-result-object v3

    .line 55
    .local v3, "_arg1":Lcom/spd/dvr/aidl/IDVRServiceCallback;
    invoke-virtual {p0, v1, v3}, Lcom/spd/dvr/aidl/IDVRService$Stub;->registerDVRServiceCallback(Ljava/lang/String;Lcom/spd/dvr/aidl/IDVRServiceCallback;)V

    .line 56
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 57
    return v2

    .line 45
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v3    # "_arg1":Lcom/spd/dvr/aidl/IDVRServiceCallback;
    :cond_6
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 46
    return v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
