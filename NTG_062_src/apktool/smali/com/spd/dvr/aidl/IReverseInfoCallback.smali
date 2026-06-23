.class public interface abstract Lcom/spd/dvr/aidl/IReverseInfoCallback;
.super Ljava/lang/Object;
.source "IReverseInfoCallback.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/spd/dvr/aidl/IReverseInfoCallback$Stub;
    }
.end annotation


# virtual methods
.method public abstract onReverseInfoChange(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
