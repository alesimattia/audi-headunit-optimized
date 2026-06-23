.class Landroidx/media/MediaUtils2;
.super Ljava/lang/Object;
.source "MediaUtils2.java"


# static fields
.field static final TAG:Ljava/lang/String; = "MediaUtils2"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method static createBundle(Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 1
    .param p0, "bundle"    # Landroid/os/Bundle;

    .line 429
    if-nez p0, :cond_0

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0, p0}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    :goto_0
    return-object v0
.end method

.method static createMediaItem(Landroidx/media/MediaItem2;)Landroid/support/v4/media/MediaBrowserCompat$MediaItem;
    .locals 6
    .param p0, "item2"    # Landroidx/media/MediaItem2;

    .line 57
    if-nez p0, :cond_0

    .line 58
    const/4 v0, 0x0

    return-object v0

    .line 62
    :cond_0
    invoke-virtual {p0}, Landroidx/media/MediaItem2;->getMetadata()Landroidx/media/MediaMetadata2;

    move-result-object v0

    .line 63
    .local v0, "metadata":Landroidx/media/MediaMetadata2;
    if-nez v0, :cond_1

    .line 64
    new-instance v1, Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    invoke-direct {v1}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;-><init>()V

    .line 65
    invoke-virtual {p0}, Landroidx/media/MediaItem2;->getMediaId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setMediaId(Ljava/lang/String;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    move-result-object v1

    .line 66
    invoke-virtual {v1}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->build()Landroid/support/v4/media/MediaDescriptionCompat;

    move-result-object v1

    .local v1, "descCompat":Landroid/support/v4/media/MediaDescriptionCompat;
    goto :goto_1

    .line 68
    .end local v1    # "descCompat":Landroid/support/v4/media/MediaDescriptionCompat;
    :cond_1
    new-instance v1, Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    invoke-direct {v1}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;-><init>()V

    .line 69
    invoke-virtual {p0}, Landroidx/media/MediaItem2;->getMediaId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setMediaId(Ljava/lang/String;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    move-result-object v1

    const-string v2, "android.media.metadata.DISPLAY_SUBTITLE"

    .line 70
    invoke-virtual {v0, v2}, Landroidx/media/MediaMetadata2;->getText(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setSubtitle(Ljava/lang/CharSequence;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    move-result-object v1

    const-string v2, "android.media.metadata.DISPLAY_DESCRIPTION"

    .line 71
    invoke-virtual {v0, v2}, Landroidx/media/MediaMetadata2;->getText(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setDescription(Ljava/lang/CharSequence;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    move-result-object v1

    const-string v2, "android.media.metadata.DISPLAY_ICON"

    .line 72
    invoke-virtual {v0, v2}, Landroidx/media/MediaMetadata2;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setIconBitmap(Landroid/graphics/Bitmap;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    move-result-object v1

    .line 73
    invoke-virtual {v0}, Landroidx/media/MediaMetadata2;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setExtras(Landroid/os/Bundle;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    move-result-object v1

    .line 75
    .local v1, "builder":Landroid/support/v4/media/MediaDescriptionCompat$Builder;
    const-string v2, "android.media.metadata.TITLE"

    invoke-virtual {v0, v2}, Landroidx/media/MediaMetadata2;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 76
    .local v2, "title":Ljava/lang/String;
    if-eqz v2, :cond_2

    .line 77
    invoke-virtual {v1, v2}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    goto :goto_0

    .line 79
    :cond_2
    const-string v3, "android.media.metadata.DISPLAY_TITLE"

    invoke-virtual {v0, v3}, Landroidx/media/MediaMetadata2;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 82
    :goto_0
    const-string v3, "android.media.metadata.DISPLAY_ICON_URI"

    invoke-virtual {v0, v3}, Landroidx/media/MediaMetadata2;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 83
    .local v3, "displayIconUri":Ljava/lang/String;
    if-eqz v3, :cond_3

    .line 84
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setIconUri(Landroid/net/Uri;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 87
    :cond_3
    const-string v4, "android.media.metadata.MEDIA_URI"

    invoke-virtual {v0, v4}, Landroidx/media/MediaMetadata2;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 88
    .local v4, "mediaUri":Ljava/lang/String;
    if-eqz v4, :cond_4

    .line 89
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setMediaUri(Landroid/net/Uri;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 92
    :cond_4
    invoke-virtual {v1}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->build()Landroid/support/v4/media/MediaDescriptionCompat;

    move-result-object v1

    .line 94
    .end local v2    # "title":Ljava/lang/String;
    .end local v3    # "displayIconUri":Ljava/lang/String;
    .end local v4    # "mediaUri":Ljava/lang/String;
    .local v1, "descCompat":Landroid/support/v4/media/MediaDescriptionCompat;
    :goto_1
    new-instance v2, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    invoke-virtual {p0}, Landroidx/media/MediaItem2;->getFlags()I

    move-result v3

    invoke-direct {v2, v1, v3}, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;-><init>(Landroid/support/v4/media/MediaDescriptionCompat;I)V

    return-object v2
.end method

.method static createMediaItem2(Landroid/support/v4/media/MediaBrowserCompat$MediaItem;)Landroidx/media/MediaItem2;
    .locals 3
    .param p0, "item"    # Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    .line 104
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;->getMediaId()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 108
    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;->getDescription()Landroid/support/v4/media/MediaDescriptionCompat;

    move-result-object v0

    invoke-static {v0}, Landroidx/media/MediaUtils2;->createMediaMetadata2(Landroid/support/v4/media/MediaDescriptionCompat;)Landroidx/media/MediaMetadata2;

    move-result-object v0

    .line 109
    .local v0, "metadata2":Landroidx/media/MediaMetadata2;
    new-instance v1, Landroidx/media/MediaItem2$Builder;

    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;->getFlags()I

    move-result v2

    invoke-direct {v1, v2}, Landroidx/media/MediaItem2$Builder;-><init>(I)V

    .line 110
    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;->getMediaId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/media/MediaItem2$Builder;->setMediaId(Ljava/lang/String;)Landroidx/media/MediaItem2$Builder;

    move-result-object v1

    .line 111
    invoke-virtual {v1, v0}, Landroidx/media/MediaItem2$Builder;->setMetadata(Landroidx/media/MediaMetadata2;)Landroidx/media/MediaItem2$Builder;

    move-result-object v1

    .line 112
    invoke-virtual {v1}, Landroidx/media/MediaItem2$Builder;->build()Landroidx/media/MediaItem2;

    move-result-object v1

    return-object v1

    .line 105
    .end local v0    # "metadata2":Landroidx/media/MediaMetadata2;
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method static createMediaMetadata2(Landroid/support/v4/media/MediaDescriptionCompat;)Landroidx/media/MediaMetadata2;
    .locals 10
    .param p0, "descCompat"    # Landroid/support/v4/media/MediaDescriptionCompat;

    .line 144
    if-nez p0, :cond_0

    .line 145
    const/4 v0, 0x0

    return-object v0

    .line 148
    :cond_0
    new-instance v0, Landroidx/media/MediaMetadata2$Builder;

    invoke-direct {v0}, Landroidx/media/MediaMetadata2$Builder;-><init>()V

    .line 149
    .local v0, "metadata2Builder":Landroidx/media/MediaMetadata2$Builder;
    const-string v1, "android.media.metadata.MEDIA_ID"

    invoke-virtual {p0}, Landroid/support/v4/media/MediaDescriptionCompat;->getMediaId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroidx/media/MediaMetadata2$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroidx/media/MediaMetadata2$Builder;

    .line 151
    invoke-virtual {p0}, Landroid/support/v4/media/MediaDescriptionCompat;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    .line 152
    .local v1, "title":Ljava/lang/CharSequence;
    if-eqz v1, :cond_1

    .line 153
    const-string v2, "android.media.metadata.DISPLAY_TITLE"

    invoke-virtual {v0, v2, v1}, Landroidx/media/MediaMetadata2$Builder;->putText(Ljava/lang/String;Ljava/lang/CharSequence;)Landroidx/media/MediaMetadata2$Builder;

    .line 156
    :cond_1
    invoke-virtual {p0}, Landroid/support/v4/media/MediaDescriptionCompat;->getDescription()Ljava/lang/CharSequence;

    move-result-object v2

    .line 157
    .local v2, "description":Ljava/lang/CharSequence;
    if-eqz v2, :cond_2

    .line 158
    const-string v3, "android.media.metadata.DISPLAY_DESCRIPTION"

    invoke-virtual {p0}, Landroid/support/v4/media/MediaDescriptionCompat;->getDescription()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroidx/media/MediaMetadata2$Builder;->putText(Ljava/lang/String;Ljava/lang/CharSequence;)Landroidx/media/MediaMetadata2$Builder;

    .line 161
    :cond_2
    invoke-virtual {p0}, Landroid/support/v4/media/MediaDescriptionCompat;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v3

    .line 162
    .local v3, "subtitle":Ljava/lang/CharSequence;
    if-eqz v3, :cond_3

    .line 163
    const-string v4, "android.media.metadata.DISPLAY_SUBTITLE"

    invoke-virtual {v0, v4, v3}, Landroidx/media/MediaMetadata2$Builder;->putText(Ljava/lang/String;Ljava/lang/CharSequence;)Landroidx/media/MediaMetadata2$Builder;

    .line 166
    :cond_3
    invoke-virtual {p0}, Landroid/support/v4/media/MediaDescriptionCompat;->getIconBitmap()Landroid/graphics/Bitmap;

    move-result-object v4

    .line 167
    .local v4, "icon":Landroid/graphics/Bitmap;
    if-eqz v4, :cond_4

    .line 168
    const-string v5, "android.media.metadata.DISPLAY_ICON"

    invoke-virtual {v0, v5, v4}, Landroidx/media/MediaMetadata2$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroidx/media/MediaMetadata2$Builder;

    .line 171
    :cond_4
    invoke-virtual {p0}, Landroid/support/v4/media/MediaDescriptionCompat;->getIconUri()Landroid/net/Uri;

    move-result-object v5

    .line 172
    .local v5, "iconUri":Landroid/net/Uri;
    if-eqz v5, :cond_5

    .line 173
    const-string v6, "android.media.metadata.DISPLAY_ICON_URI"

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Landroidx/media/MediaMetadata2$Builder;->putText(Ljava/lang/String;Ljava/lang/CharSequence;)Landroidx/media/MediaMetadata2$Builder;

    .line 176
    :cond_5
    invoke-virtual {p0}, Landroid/support/v4/media/MediaDescriptionCompat;->getExtras()Landroid/os/Bundle;

    move-result-object v6

    .line 177
    .local v6, "bundle":Landroid/os/Bundle;
    if-eqz v6, :cond_6

    .line 178
    invoke-virtual {p0}, Landroid/support/v4/media/MediaDescriptionCompat;->getExtras()Landroid/os/Bundle;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroidx/media/MediaMetadata2$Builder;->setExtras(Landroid/os/Bundle;)Landroidx/media/MediaMetadata2$Builder;

    .line 181
    :cond_6
    invoke-virtual {p0}, Landroid/support/v4/media/MediaDescriptionCompat;->getMediaUri()Landroid/net/Uri;

    move-result-object v7

    .line 182
    .local v7, "mediaUri":Landroid/net/Uri;
    if-eqz v7, :cond_7

    .line 183
    const-string v8, "android.media.metadata.MEDIA_URI"

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v8, v9}, Landroidx/media/MediaMetadata2$Builder;->putText(Ljava/lang/String;Ljava/lang/CharSequence;)Landroidx/media/MediaMetadata2$Builder;

    .line 186
    :cond_7
    invoke-virtual {v0}, Landroidx/media/MediaMetadata2$Builder;->build()Landroidx/media/MediaMetadata2;

    move-result-object v8

    return-object v8
.end method

.method static createPlaybackStateCompatState(II)I
    .locals 2
    .param p0, "playerState"    # I
    .param p1, "bufferingState"    # I

    .line 384
    const/4 v0, 0x2

    const/4 v1, 0x7

    packed-switch p0, :pswitch_data_0

    .line 399
    return v1

    .line 396
    :pswitch_0
    return v1

    .line 386
    :pswitch_1
    if-eq p1, v0, :cond_0

    .line 390
    const/4 v0, 0x3

    return v0

    .line 388
    :cond_0
    const/4 v0, 0x6

    return v0

    .line 392
    :pswitch_2
    return v0

    .line 394
    :pswitch_3
    const/4 v0, 0x0

    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static fromCommandButtonParcelableArray([Landroid/os/Parcelable;)Ljava/util/List;
    .locals 3
    .param p0, "list"    # [Landroid/os/Parcelable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/os/Parcelable;",
            ")",
            "Ljava/util/List<",
            "Landroidx/media/MediaSession2$CommandButton;",
            ">;"
        }
    .end annotation

    .line 357
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 358
    .local v0, "layout":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaSession2$CommandButton;>;"
    nop

    .line 359
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_2

    .line 360
    aget-object v2, p0, v1

    instance-of v2, v2, Landroid/os/Bundle;

    if-nez v2, :cond_0

    .line 361
    goto :goto_1

    .line 363
    :cond_0
    aget-object v2, p0, v1

    check-cast v2, Landroid/os/Bundle;

    invoke-static {v2}, Landroidx/media/MediaSession2$CommandButton;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaSession2$CommandButton;

    move-result-object v2

    .line 364
    .local v2, "button":Landroidx/media/MediaSession2$CommandButton;
    if-eqz v2, :cond_1

    .line 365
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 359
    .end local v2    # "button":Landroidx/media/MediaSession2$CommandButton;
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 369
    .end local v1    # "i":I
    :cond_2
    return-object v0
.end method

.method static fromMediaItem2List(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;"
        }
    .end annotation

    .line 116
    .local p0, "items":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    if-nez p0, :cond_0

    .line 117
    const/4 v0, 0x0

    return-object v0

    .line 119
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/media/MediaBrowserCompat$MediaItem;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 121
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media/MediaItem2;

    invoke-static {v2}, Landroidx/media/MediaUtils2;->createMediaItem(Landroidx/media/MediaItem2;)Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 123
    .end local v1    # "i":I
    :cond_1
    return-object v0
.end method

.method static fromMediaItem2ParcelableArray([Landroid/os/Parcelable;)Ljava/util/List;
    .locals 3
    .param p0, "itemParcelableList"    # [Landroid/os/Parcelable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/os/Parcelable;",
            ")",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;"
        }
    .end annotation

    .line 327
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 328
    .local v0, "playlist":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    if-eqz p0, :cond_2

    .line 329
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_2

    .line 330
    aget-object v2, p0, v1

    instance-of v2, v2, Landroid/os/Bundle;

    if-nez v2, :cond_0

    .line 331
    goto :goto_1

    .line 333
    :cond_0
    aget-object v2, p0, v1

    check-cast v2, Landroid/os/Bundle;

    invoke-static {v2}, Landroidx/media/MediaItem2;->fromBundle(Landroid/os/Bundle;)Landroidx/media/MediaItem2;

    move-result-object v2

    .line 334
    .local v2, "item":Landroidx/media/MediaItem2;
    if-eqz v2, :cond_1

    .line 335
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 329
    .end local v2    # "item":Landroidx/media/MediaItem2;
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 339
    .end local v1    # "i":I
    :cond_2
    return-object v0
.end method

.method static isDefaultLibraryRootHint(Landroid/os/Bundle;)Z
    .locals 2
    .param p0, "bundle"    # Landroid/os/Bundle;

    .line 425
    const/4 v0, 0x0

    if-eqz p0, :cond_0

    const-string v1, "androidx.media.root_default_root"

    invoke-virtual {p0, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    nop

    :cond_0
    return v0
.end method

.method static toBundleList([Landroid/os/Parcelable;)Ljava/util/List;
    .locals 5
    .param p0, "array"    # [Landroid/os/Parcelable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/os/Parcelable;",
            ")",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation

    .line 373
    if-nez p0, :cond_0

    .line 374
    const/4 v0, 0x0

    return-object v0

    .line 376
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 377
    .local v0, "bundleList":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p0, v2

    .line 378
    .local v3, "p":Landroid/os/Parcelable;
    move-object v4, v3

    check-cast v4, Landroid/os/Bundle;

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 377
    .end local v3    # "p":Landroid/os/Parcelable;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 380
    :cond_1
    return-object v0
.end method

.method static toCommandButtonParcelableArray(Ljava/util/List;)[Landroid/os/Parcelable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media/MediaSession2$CommandButton;",
            ">;)[",
            "Landroid/os/Parcelable;"
        }
    .end annotation

    .line 343
    .local p0, "layout":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaSession2$CommandButton;>;"
    if-nez p0, :cond_0

    .line 344
    const/4 v0, 0x0

    return-object v0

    .line 346
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 347
    .local v0, "layoutBundles":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    const/4 v1, 0x0

    move v2, v1

    .local v2, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 348
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/media/MediaSession2$CommandButton;

    invoke-virtual {v3}, Landroidx/media/MediaSession2$CommandButton;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    .line 349
    .local v3, "bundle":Landroid/os/Bundle;
    if-eqz v3, :cond_1

    .line 350
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 347
    .end local v3    # "bundle":Landroid/os/Bundle;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 353
    .end local v2    # "i":I
    :cond_2
    new-array v1, v1, [Landroid/os/Parcelable;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/os/Parcelable;

    return-object v1
.end method

.method static toMediaItem2List(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;)",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;"
        }
    .end annotation

    .line 127
    .local p0, "items":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/media/MediaBrowserCompat$MediaItem;>;"
    if-nez p0, :cond_0

    .line 128
    const/4 v0, 0x0

    return-object v0

    .line 130
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 131
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 132
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    invoke-static {v2}, Landroidx/media/MediaUtils2;->createMediaItem2(Landroid/support/v4/media/MediaBrowserCompat$MediaItem;)Landroidx/media/MediaItem2;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 134
    .end local v1    # "i":I
    :cond_1
    return-object v0
.end method

.method static toMediaItem2ParcelableArray(Ljava/util/List;)[Landroid/os/Parcelable;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media/MediaItem2;",
            ">;)[",
            "Landroid/os/Parcelable;"
        }
    .end annotation

    .line 310
    .local p0, "playlist":Ljava/util/List;, "Ljava/util/List<Landroidx/media/MediaItem2;>;"
    if-nez p0, :cond_0

    .line 311
    const/4 v0, 0x0

    return-object v0

    .line 313
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 314
    .local v0, "parcelableList":Ljava/util/List;, "Ljava/util/List<Landroid/os/Parcelable;>;"
    const/4 v1, 0x0

    move v2, v1

    .local v2, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 315
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/media/MediaItem2;

    .line 316
    .local v3, "item":Landroidx/media/MediaItem2;
    if-eqz v3, :cond_1

    .line 317
    invoke-virtual {v3}, Landroidx/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object v4

    .line 318
    .local v4, "itemBundle":Landroid/os/Parcelable;
    if-eqz v4, :cond_1

    .line 319
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 314
    .end local v3    # "item":Landroidx/media/MediaItem2;
    .end local v4    # "itemBundle":Landroid/os/Parcelable;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 323
    .end local v2    # "i":I
    :cond_2
    new-array v1, v1, [Landroid/os/Parcelable;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/os/Parcelable;

    return-object v1
.end method

.method static toPlayerState(I)I
    .locals 1
    .param p0, "playbackStateCompatState"    # I

    .line 403
    const/4 v0, 0x3

    packed-switch p0, :pswitch_data_0

    .line 421
    return v0

    .line 405
    :pswitch_0
    return v0

    .line 419
    :pswitch_1
    const/4 v0, 0x2

    return v0

    .line 411
    :pswitch_2
    const/4 v0, 0x1

    return v0

    .line 407
    :pswitch_3
    const/4 v0, 0x0

    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method createMediaMetadata2(Landroid/support/v4/media/MediaMetadataCompat;)Landroidx/media/MediaMetadata2;
    .locals 2
    .param p1, "metadataCompat"    # Landroid/support/v4/media/MediaMetadataCompat;

    .line 196
    if-nez p1, :cond_0

    .line 197
    const/4 v0, 0x0

    return-object v0

    .line 199
    :cond_0
    new-instance v0, Landroidx/media/MediaMetadata2;

    invoke-virtual {p1}, Landroid/support/v4/media/MediaMetadataCompat;->getBundle()Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/media/MediaMetadata2;-><init>(Landroid/os/Bundle;)V

    return-object v0
.end method

.method createMediaMetadataCompat(Landroidx/media/MediaMetadata2;)Landroid/support/v4/media/MediaMetadataCompat;
    .locals 9
    .param p1, "metadata2"    # Landroidx/media/MediaMetadata2;

    .line 209
    if-nez p1, :cond_0

    .line 210
    const/4 v0, 0x0

    return-object v0

    .line 213
    :cond_0
    new-instance v0, Landroid/support/v4/media/MediaMetadataCompat$Builder;

    invoke-direct {v0}, Landroid/support/v4/media/MediaMetadataCompat$Builder;-><init>()V

    .line 215
    .local v0, "builder":Landroid/support/v4/media/MediaMetadataCompat$Builder;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 216
    .local v1, "skippedKeys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Landroidx/media/MediaMetadata2;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    .line 217
    .local v2, "bundle":Landroid/os/Bundle;
    invoke-virtual {v2}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 218
    .local v4, "key":Ljava/lang/String;
    invoke-virtual {v2, v4}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 219
    .local v5, "value":Ljava/lang/Object;
    instance-of v6, v5, Ljava/lang/CharSequence;

    if-eqz v6, :cond_1

    .line 220
    move-object v6, v5

    check-cast v6, Ljava/lang/CharSequence;

    invoke-virtual {v0, v4, v6}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putText(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    goto :goto_1

    .line 221
    :cond_1
    instance-of v6, v5, Landroidx/media/Rating2;

    if-eqz v6, :cond_2

    .line 222
    move-object v6, v5

    check-cast v6, Landroidx/media/Rating2;

    invoke-virtual {p0, v6}, Landroidx/media/MediaUtils2;->createRatingCompat(Landroidx/media/Rating2;)Landroid/support/v4/media/RatingCompat;

    move-result-object v6

    invoke-virtual {v0, v4, v6}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putRating(Ljava/lang/String;Landroid/support/v4/media/RatingCompat;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    goto :goto_1

    .line 223
    :cond_2
    instance-of v6, v5, Landroid/graphics/Bitmap;

    if-eqz v6, :cond_3

    .line 224
    move-object v6, v5

    check-cast v6, Landroid/graphics/Bitmap;

    invoke-virtual {v0, v4, v6}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    goto :goto_1

    .line 225
    :cond_3
    instance-of v6, v5, Ljava/lang/Long;

    if-eqz v6, :cond_4

    .line 226
    move-object v6, v5

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-virtual {v0, v4, v6, v7}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putLong(Ljava/lang/String;J)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    goto :goto_1

    .line 229
    :cond_4
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 231
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/Object;
    :goto_1
    goto :goto_0

    .line 233
    :cond_5
    invoke-virtual {v0}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->build()Landroid/support/v4/media/MediaMetadataCompat;

    move-result-object v3

    .line 234
    .local v3, "result":Landroid/support/v4/media/MediaMetadataCompat;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 235
    .local v5, "key":Ljava/lang/String;
    invoke-virtual {v2, v5}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 236
    .local v6, "value":Ljava/lang/Object;
    instance-of v7, v6, Ljava/lang/Float;

    if-eqz v7, :cond_6

    .line 238
    invoke-virtual {v3}, Landroid/support/v4/media/MediaMetadataCompat;->getBundle()Landroid/os/Bundle;

    move-result-object v7

    move-object v8, v6

    check-cast v8, Ljava/lang/Float;

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    invoke-virtual {v7, v5, v8}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    goto :goto_3

    .line 239
    :cond_6
    const-string v7, "android.media.metadata.EXTRAS"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 241
    invoke-virtual {v3}, Landroid/support/v4/media/MediaMetadataCompat;->getBundle()Landroid/os/Bundle;

    move-result-object v7

    move-object v8, v6

    check-cast v8, Landroid/os/Bundle;

    invoke-virtual {v7, v5, v8}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 243
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/Object;
    :cond_7
    :goto_3
    goto :goto_2

    .line 244
    :cond_8
    return-object v3
.end method

.method createRating2(Landroid/support/v4/media/RatingCompat;)Landroidx/media/Rating2;
    .locals 2
    .param p1, "ratingCompat"    # Landroid/support/v4/media/RatingCompat;

    .line 254
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 255
    return-object v0

    .line 257
    :cond_0
    invoke-virtual {p1}, Landroid/support/v4/media/RatingCompat;->isRated()Z

    move-result v1

    if-nez v1, :cond_1

    .line 258
    invoke-virtual {p1}, Landroid/support/v4/media/RatingCompat;->getRatingStyle()I

    move-result v0

    invoke-static {v0}, Landroidx/media/Rating2;->newUnratedRating(I)Landroidx/media/Rating2;

    move-result-object v0

    return-object v0

    .line 261
    :cond_1
    invoke-virtual {p1}, Landroid/support/v4/media/RatingCompat;->getRatingStyle()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 274
    return-object v0

    .line 272
    :pswitch_0
    invoke-virtual {p1}, Landroid/support/v4/media/RatingCompat;->getPercentRating()F

    move-result v0

    invoke-static {v0}, Landroidx/media/Rating2;->newPercentageRating(F)Landroidx/media/Rating2;

    move-result-object v0

    return-object v0

    .line 265
    :pswitch_1
    nop

    .line 266
    invoke-virtual {p1}, Landroid/support/v4/media/RatingCompat;->getRatingStyle()I

    move-result v0

    invoke-virtual {p1}, Landroid/support/v4/media/RatingCompat;->getStarRating()F

    move-result v1

    .line 265
    invoke-static {v0, v1}, Landroidx/media/Rating2;->newStarRating(IF)Landroidx/media/Rating2;

    move-result-object v0

    return-object v0

    .line 270
    :pswitch_2
    invoke-virtual {p1}, Landroid/support/v4/media/RatingCompat;->isThumbUp()Z

    move-result v0

    invoke-static {v0}, Landroidx/media/Rating2;->newThumbRating(Z)Landroidx/media/Rating2;

    move-result-object v0

    return-object v0

    .line 268
    :pswitch_3
    invoke-virtual {p1}, Landroid/support/v4/media/RatingCompat;->hasHeart()Z

    move-result v0

    invoke-static {v0}, Landroidx/media/Rating2;->newHeartRating(Z)Landroidx/media/Rating2;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method createRatingCompat(Landroidx/media/Rating2;)Landroid/support/v4/media/RatingCompat;
    .locals 2
    .param p1, "rating2"    # Landroidx/media/Rating2;

    .line 285
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 286
    return-object v0

    .line 288
    :cond_0
    invoke-virtual {p1}, Landroidx/media/Rating2;->isRated()Z

    move-result v1

    if-nez v1, :cond_1

    .line 289
    invoke-virtual {p1}, Landroidx/media/Rating2;->getRatingStyle()I

    move-result v0

    invoke-static {v0}, Landroid/support/v4/media/RatingCompat;->newUnratedRating(I)Landroid/support/v4/media/RatingCompat;

    move-result-object v0

    return-object v0

    .line 292
    :cond_1
    invoke-virtual {p1}, Landroidx/media/Rating2;->getRatingStyle()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 305
    return-object v0

    .line 303
    :pswitch_0
    invoke-virtual {p1}, Landroidx/media/Rating2;->getPercentRating()F

    move-result v0

    invoke-static {v0}, Landroid/support/v4/media/RatingCompat;->newPercentageRating(F)Landroid/support/v4/media/RatingCompat;

    move-result-object v0

    return-object v0

    .line 296
    :pswitch_1
    nop

    .line 297
    invoke-virtual {p1}, Landroidx/media/Rating2;->getRatingStyle()I

    move-result v0

    invoke-virtual {p1}, Landroidx/media/Rating2;->getStarRating()F

    move-result v1

    .line 296
    invoke-static {v0, v1}, Landroid/support/v4/media/RatingCompat;->newStarRating(IF)Landroid/support/v4/media/RatingCompat;

    move-result-object v0

    return-object v0

    .line 301
    :pswitch_2
    invoke-virtual {p1}, Landroidx/media/Rating2;->isThumbUp()Z

    move-result v0

    invoke-static {v0}, Landroid/support/v4/media/RatingCompat;->newThumbRating(Z)Landroid/support/v4/media/RatingCompat;

    move-result-object v0

    return-object v0

    .line 299
    :pswitch_3
    invoke-virtual {p1}, Landroidx/media/Rating2;->hasHeart()Z

    move-result v0

    invoke-static {v0}, Landroid/support/v4/media/RatingCompat;->newHeartRating(Z)Landroid/support/v4/media/RatingCompat;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
