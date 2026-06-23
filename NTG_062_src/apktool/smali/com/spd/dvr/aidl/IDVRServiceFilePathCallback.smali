.class public interface abstract Lcom/spd/dvr/aidl/IDVRServiceFilePathCallback;
.super Ljava/lang/Object;
.source "IDVRServiceFilePathCallback.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/spd/dvr/aidl/IDVRServiceFilePathCallback$Stub;
    }
.end annotation


# virtual methods
.method public abstract onRecordVieoFileChanged(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract onTakePictureChanged(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
