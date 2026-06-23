.class public final Landroidx/media/SessionToken2;
.super Ljava/lang/Object;
.source "SessionToken2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/SessionToken2$TokenType;
    }
.end annotation


# static fields
.field private static final KEY_ID:Ljava/lang/String; = "android.media.token.id"

.field private static final KEY_PACKAGE_NAME:Ljava/lang/String; = "android.media.token.package_name"

.field private static final KEY_SERVICE_NAME:Ljava/lang/String; = "android.media.token.service_name"

.field private static final KEY_SESSION_TOKEN:Ljava/lang/String; = "android.media.token.session_token"

.field private static final KEY_TYPE:Ljava/lang/String; = "android.media.token.type"

.field private static final KEY_UID:Ljava/lang/String; = "android.media.token.uid"

.field public static final TYPE_LIBRARY_SERVICE:I = 0x2

.field public static final TYPE_SESSION:I = 0x0

.field public static final TYPE_SESSION_SERVICE:I = 0x1

.field private static final UID_UNKNOWN:I = -0x1


# instance fields
.field private final mComponentName:Landroid/content/ComponentName;

.field private final mId:Ljava/lang/String;

.field private final mPackageName:Ljava/lang/String;

.field private final mServiceName:Ljava/lang/String;

.field private final mSessionCompatToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

.field private final mType:I

.field private final mUid:I


# direct methods
.method constructor <init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/support/v4/media/session/MediaSessionCompat$Token;)V
    .locals 1
    .param p1, "uid"    # I
    .param p2, "type"    # I
    .param p3, "packageName"    # Ljava/lang/String;
    .param p4, "serviceName"    # Ljava/lang/String;
    .param p5, "id"    # Ljava/lang/String;
    .param p6, "sessionCompatToken"    # Landroid/support/v4/media/session/MediaSessionCompat$Token;
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 162
    iput p1, p0, Landroidx/media/SessionToken2;->mUid:I

    .line 163
    iput p2, p0, Landroidx/media/SessionToken2;->mType:I

    .line 164
    iput-object p3, p0, Landroidx/media/SessionToken2;->mPackageName:Ljava/lang/String;

    .line 165
    iput-object p4, p0, Landroidx/media/SessionToken2;->mServiceName:Ljava/lang/String;

    .line 166
    iget v0, p0, Landroidx/media/SessionToken2;->mType:I

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/content/ComponentName;

    invoke-direct {v0, p3, p4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iput-object v0, p0, Landroidx/media/SessionToken2;->mComponentName:Landroid/content/ComponentName;

    .line 168
    iput-object p5, p0, Landroidx/media/SessionToken2;->mId:Ljava/lang/String;

    .line 169
    iput-object p6, p0, Landroidx/media/SessionToken2;->mSessionCompatToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 170
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/content/ComponentName;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "serviceComponent"    # Landroid/content/ComponentName;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 105
    const/4 v0, -0x1

    invoke-direct {p0, p1, p2, v0}, Landroidx/media/SessionToken2;-><init>(Landroid/content/Context;Landroid/content/ComponentName;I)V

    .line 106
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/content/ComponentName;I)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "serviceComponent"    # Landroid/content/ComponentName;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "uid"    # I
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    if-eqz p2, :cond_3

    .line 123
    iput-object p2, p0, Landroidx/media/SessionToken2;->mComponentName:Landroid/content/ComponentName;

    .line 124
    invoke-virtual {p2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroidx/media/SessionToken2;->mPackageName:Ljava/lang/String;

    .line 125
    invoke-virtual {p2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroidx/media/SessionToken2;->mServiceName:Ljava/lang/String;

    .line 127
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 128
    .local v0, "manager":Landroid/content/pm/PackageManager;
    if-gez p3, :cond_0

    .line 130
    :try_start_0
    iget-object v1, p0, Landroidx/media/SessionToken2;->mPackageName:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move p3, v1

    .line 133
    goto :goto_0

    .line 131
    :catch_0
    move-exception v1

    .line 132
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot find package "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Landroidx/media/SessionToken2;->mPackageName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 135
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_0
    :goto_0
    iput p3, p0, Landroidx/media/SessionToken2;->mUid:I

    .line 138
    const-string v1, "android.media.MediaLibraryService2"

    invoke-static {v0, v1, p2}, Landroidx/media/SessionToken2;->getSessionIdFromService(Landroid/content/pm/PackageManager;Ljava/lang/String;Landroid/content/ComponentName;)Ljava/lang/String;

    move-result-object v1

    .line 140
    .local v1, "id":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 141
    iput-object v1, p0, Landroidx/media/SessionToken2;->mId:Ljava/lang/String;

    .line 142
    const/4 v2, 0x2

    iput v2, p0, Landroidx/media/SessionToken2;->mType:I

    goto :goto_1

    .line 145
    :cond_1
    const-string v2, "android.media.MediaSessionService2"

    invoke-static {v0, v2, p2}, Landroidx/media/SessionToken2;->getSessionIdFromService(Landroid/content/pm/PackageManager;Ljava/lang/String;Landroid/content/ComponentName;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Landroidx/media/SessionToken2;->mId:Ljava/lang/String;

    .line 147
    const/4 v2, 0x1

    iput v2, p0, Landroidx/media/SessionToken2;->mType:I

    .line 149
    :goto_1
    iget-object v2, p0, Landroidx/media/SessionToken2;->mId:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 153
    const/4 v2, 0x0

    iput-object v2, p0, Landroidx/media/SessionToken2;->mSessionCompatToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 154
    return-void

    .line 150
    :cond_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "service "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Landroidx/media/SessionToken2;->mServiceName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " doesn\'t implement"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " session service nor library service. Use service\'s full name."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 121
    .end local v0    # "manager":Landroid/content/pm/PackageManager;
    .end local v1    # "id":Ljava/lang/String;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "serviceComponent shouldn\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static fromBundle(Landroid/os/Bundle;)Landroidx/media/SessionToken2;
    .locals 14
    .param p0, "bundle"    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 255
    if-nez p0, :cond_0

    .line 256
    const/4 v0, 0x0

    return-object v0

    .line 258
    :cond_0
    const-string v0, "android.media.token.uid"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 259
    .local v0, "uid":I
    const-string v1, "android.media.token.type"

    const/4 v2, -0x1

    invoke-virtual {p0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v8

    .line 260
    .local v8, "type":I
    const-string v1, "android.media.token.package_name"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 261
    .local v9, "packageName":Ljava/lang/String;
    const-string v1, "android.media.token.service_name"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 262
    .local v10, "serviceName":Ljava/lang/String;
    const-string v1, "android.media.token.id"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 263
    .local v11, "id":Ljava/lang/String;
    const-string v1, "android.media.token.session_token"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 266
    .local v12, "token":Landroid/support/v4/media/session/MediaSessionCompat$Token;
    packed-switch v8, :pswitch_data_0

    .line 280
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid type"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 275
    :pswitch_0
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 276
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Session service needs service name"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 268
    :pswitch_1
    if-eqz v12, :cond_3

    .line 282
    :goto_0
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    if-eqz v11, :cond_2

    .line 285
    new-instance v13, Landroidx/media/SessionToken2;

    move-object v1, v13

    move v2, v0

    move v3, v8

    move-object v4, v9

    move-object v5, v10

    move-object v6, v11

    move-object v7, v12

    invoke-direct/range {v1 .. v7}, Landroidx/media/SessionToken2;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    return-object v13

    .line 283
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Package name nor ID cannot be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 269
    :cond_3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected token for session, SessionCompat.Token="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static getSessionId(Landroid/content/pm/ResolveInfo;)Ljava/lang/String;
    .locals 3
    .param p0, "resolveInfo"    # Landroid/content/pm/ResolveInfo;
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 308
    if-eqz p0, :cond_2

    iget-object v0, p0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    if-nez v0, :cond_0

    goto :goto_0

    .line 310
    :cond_0
    iget-object v0, p0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v0, v0, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    if-nez v0, :cond_1

    .line 311
    const-string v0, ""

    return-object v0

    .line 313
    :cond_1
    iget-object v0, p0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v0, v0, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "android.media.session"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 309
    :cond_2
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private static getSessionIdFromService(Landroid/content/pm/PackageManager;Ljava/lang/String;Landroid/content/ComponentName;)Ljava/lang/String;
    .locals 6
    .param p0, "manager"    # Landroid/content/pm/PackageManager;
    .param p1, "serviceInterface"    # Ljava/lang/String;
    .param p2, "serviceComponent"    # Landroid/content/ComponentName;

    .line 324
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 328
    .local v0, "serviceIntent":Landroid/content/Intent;
    invoke-virtual {p2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 330
    const/16 v1, 0x80

    invoke-virtual {p0, v0, v1}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 332
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v1, :cond_2

    .line 333
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 334
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ResolveInfo;

    .line 335
    .local v3, "resolveInfo":Landroid/content/pm/ResolveInfo;
    if-eqz v3, :cond_1

    iget-object v4, v3, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    if-nez v4, :cond_0

    .line 336
    goto :goto_1

    .line 338
    :cond_0
    iget-object v4, v3, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v4, v4, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    .line 339
    invoke-virtual {p2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v5

    .line 338
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 340
    invoke-static {v3}, Landroidx/media/SessionToken2;->getSessionId(Landroid/content/pm/ResolveInfo;)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 333
    .end local v3    # "resolveInfo":Landroid/content/pm/ResolveInfo;
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 344
    .end local v2    # "i":I
    :cond_2
    const/4 v2, 0x0

    return-object v2
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .line 184
    instance-of v0, p1, Landroidx/media/SessionToken2;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 185
    return v1

    .line 187
    :cond_0
    move-object v0, p1

    check-cast v0, Landroidx/media/SessionToken2;

    .line 188
    .local v0, "other":Landroidx/media/SessionToken2;
    iget v2, p0, Landroidx/media/SessionToken2;->mUid:I

    iget v3, v0, Landroidx/media/SessionToken2;->mUid:I

    if-ne v2, v3, :cond_1

    iget-object v2, p0, Landroidx/media/SessionToken2;->mPackageName:Ljava/lang/String;

    iget-object v3, v0, Landroidx/media/SessionToken2;->mPackageName:Ljava/lang/String;

    .line 189
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Landroidx/media/SessionToken2;->mServiceName:Ljava/lang/String;

    iget-object v3, v0, Landroidx/media/SessionToken2;->mServiceName:Ljava/lang/String;

    .line 190
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Landroidx/media/SessionToken2;->mId:Ljava/lang/String;

    iget-object v3, v0, Landroidx/media/SessionToken2;->mId:Ljava/lang/String;

    .line 191
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget v2, p0, Landroidx/media/SessionToken2;->mType:I

    iget v3, v0, Landroidx/media/SessionToken2;->mType:I

    if-ne v2, v3, :cond_1

    const/4 v1, 0x1

    nop

    :cond_1
    return v1
.end method

.method public getComponentName()Landroid/content/ComponentName;
    .locals 1
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 228
    iget-object v0, p0, Landroidx/media/SessionToken2;->mComponentName:Landroid/content/ComponentName;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 235
    iget-object v0, p0, Landroidx/media/SessionToken2;->mId:Ljava/lang/String;

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 212
    iget-object v0, p0, Landroidx/media/SessionToken2;->mPackageName:Ljava/lang/String;

    return-object v0
.end method

.method public getServiceName()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 219
    iget-object v0, p0, Landroidx/media/SessionToken2;->mServiceName:Ljava/lang/String;

    return-object v0
.end method

.method getSessionCompatToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;
    .locals 1

    .line 319
    iget-object v0, p0, Landroidx/media/SessionToken2;->mSessionCompatToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .line 245
    iget v0, p0, Landroidx/media/SessionToken2;->mType:I

    return v0
.end method

.method public getUid()I
    .locals 1

    .line 205
    iget v0, p0, Landroidx/media/SessionToken2;->mUid:I

    return v0
.end method

.method public hashCode()I
    .locals 7

    .line 174
    const/16 v0, 0x1f

    .line 175
    .local v0, "prime":I
    iget v1, p0, Landroidx/media/SessionToken2;->mType:I

    iget v2, p0, Landroidx/media/SessionToken2;->mUid:I

    iget-object v3, p0, Landroidx/media/SessionToken2;->mPackageName:Ljava/lang/String;

    .line 177
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    iget-object v4, p0, Landroidx/media/SessionToken2;->mId:Ljava/lang/String;

    .line 178
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v4

    iget-object v5, p0, Landroidx/media/SessionToken2;->mServiceName:Ljava/lang/String;

    if-eqz v5, :cond_0

    iget-object v5, p0, Landroidx/media/SessionToken2;->mServiceName:Ljava/lang/String;

    .line 179
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v5

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    const/16 v6, 0x1f

    mul-int/2addr v5, v6

    add-int/2addr v4, v5

    mul-int/2addr v4, v6

    add-int/2addr v3, v4

    mul-int/2addr v3, v6

    add-int/2addr v2, v3

    mul-int/2addr v6, v2

    add-int/2addr v1, v6

    return v1
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 3

    .line 293
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 294
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "android.media.token.uid"

    iget v2, p0, Landroidx/media/SessionToken2;->mUid:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 295
    const-string v1, "android.media.token.package_name"

    iget-object v2, p0, Landroidx/media/SessionToken2;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    const-string v1, "android.media.token.service_name"

    iget-object v2, p0, Landroidx/media/SessionToken2;->mServiceName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    const-string v1, "android.media.token.id"

    iget-object v2, p0, Landroidx/media/SessionToken2;->mId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    const-string v1, "android.media.token.type"

    iget v2, p0, Landroidx/media/SessionToken2;->mType:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 299
    const-string v1, "android.media.token.session_token"

    iget-object v2, p0, Landroidx/media/SessionToken2;->mSessionCompatToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 300
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 197
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SessionToken {pkg="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/media/SessionToken2;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/media/SessionToken2;->mId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/media/SessionToken2;->mType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " service="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/media/SessionToken2;->mServiceName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " sessionCompatToken="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/media/SessionToken2;->mSessionCompatToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
