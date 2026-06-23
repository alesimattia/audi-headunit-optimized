.class public interface abstract Lcom/spd/dvr/aidl/IDVRServiceCallback;
.super Ljava/lang/Object;
.source "IDVRServiceCallback.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/spd/dvr/aidl/IDVRServiceCallback$Stub;
    }
.end annotation


# virtual methods
.method public abstract onDvrStateChanged(II)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract onFileInfoChanged(II)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
