.class public interface abstract Lcom/spd/dvr/aidl/ICarModelPayCallback;
.super Ljava/lang/Object;
.source "ICarModelPayCallback.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/spd/dvr/aidl/ICarModelPayCallback$Stub;
    }
.end annotation


# virtual methods
.method public abstract onModelStatusChanged(ILandroid/os/Bundle;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
