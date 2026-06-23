.class public Landroidx/core/app/Person$Builder;
.super Ljava/lang/Object;
.source "Person.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/app/Person;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mIcon:Landroidx/core/graphics/drawable/IconCompat;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mIsBot:Z

.field private mIsImportant:Z

.field private mKey:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mName:Ljava/lang/CharSequence;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mUri:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private constructor <init>(Landroidx/core/app/Person;)V
    .locals 1
    .param p1, "person"    # Landroidx/core/app/Person;

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    invoke-static {p1}, Landroidx/core/app/Person;->access$700(Landroidx/core/app/Person;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Landroidx/core/app/Person$Builder;->mName:Ljava/lang/CharSequence;

    .line 210
    invoke-static {p1}, Landroidx/core/app/Person;->access$800(Landroidx/core/app/Person;)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object v0

    iput-object v0, p0, Landroidx/core/app/Person$Builder;->mIcon:Landroidx/core/graphics/drawable/IconCompat;

    .line 211
    invoke-static {p1}, Landroidx/core/app/Person;->access$900(Landroidx/core/app/Person;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroidx/core/app/Person$Builder;->mUri:Ljava/lang/String;

    .line 212
    invoke-static {p1}, Landroidx/core/app/Person;->access$1000(Landroidx/core/app/Person;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroidx/core/app/Person$Builder;->mKey:Ljava/lang/String;

    .line 213
    invoke-static {p1}, Landroidx/core/app/Person;->access$1100(Landroidx/core/app/Person;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/core/app/Person$Builder;->mIsBot:Z

    .line 214
    invoke-static {p1}, Landroidx/core/app/Person;->access$1200(Landroidx/core/app/Person;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/core/app/Person$Builder;->mIsImportant:Z

    .line 215
    return-void
.end method

.method synthetic constructor <init>(Landroidx/core/app/Person;Landroidx/core/app/Person$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/core/app/Person;
    .param p2, "x1"    # Landroidx/core/app/Person$1;

    .line 197
    invoke-direct {p0, p1}, Landroidx/core/app/Person$Builder;-><init>(Landroidx/core/app/Person;)V

    return-void
.end method

.method static synthetic access$000(Landroidx/core/app/Person$Builder;)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "x0"    # Landroidx/core/app/Person$Builder;

    .line 197
    iget-object v0, p0, Landroidx/core/app/Person$Builder;->mName:Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$100(Landroidx/core/app/Person$Builder;)Landroidx/core/graphics/drawable/IconCompat;
    .locals 1
    .param p0, "x0"    # Landroidx/core/app/Person$Builder;

    .line 197
    iget-object v0, p0, Landroidx/core/app/Person$Builder;->mIcon:Landroidx/core/graphics/drawable/IconCompat;

    return-object v0
.end method

.method static synthetic access$200(Landroidx/core/app/Person$Builder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Landroidx/core/app/Person$Builder;

    .line 197
    iget-object v0, p0, Landroidx/core/app/Person$Builder;->mUri:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Landroidx/core/app/Person$Builder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Landroidx/core/app/Person$Builder;

    .line 197
    iget-object v0, p0, Landroidx/core/app/Person$Builder;->mKey:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Landroidx/core/app/Person$Builder;)Z
    .locals 1
    .param p0, "x0"    # Landroidx/core/app/Person$Builder;

    .line 197
    iget-boolean v0, p0, Landroidx/core/app/Person$Builder;->mIsBot:Z

    return v0
.end method

.method static synthetic access$500(Landroidx/core/app/Person$Builder;)Z
    .locals 1
    .param p0, "x0"    # Landroidx/core/app/Person$Builder;

    .line 197
    iget-boolean v0, p0, Landroidx/core/app/Person$Builder;->mIsImportant:Z

    return v0
.end method


# virtual methods
.method public build()Landroidx/core/app/Person;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 293
    new-instance v0, Landroidx/core/app/Person;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/core/app/Person;-><init>(Landroidx/core/app/Person$Builder;Landroidx/core/app/Person$1;)V

    return-object v0
.end method

.method public setBot(Z)Landroidx/core/app/Person$Builder;
    .locals 0
    .param p1, "bot"    # Z
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 274
    iput-boolean p1, p0, Landroidx/core/app/Person$Builder;->mIsBot:Z

    .line 275
    return-object p0
.end method

.method public setIcon(Landroidx/core/graphics/drawable/IconCompat;)Landroidx/core/app/Person$Builder;
    .locals 0
    .param p1, "icon"    # Landroidx/core/graphics/drawable/IconCompat;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 235
    iput-object p1, p0, Landroidx/core/app/Person$Builder;->mIcon:Landroidx/core/graphics/drawable/IconCompat;

    .line 236
    return-object p0
.end method

.method public setImportant(Z)Landroidx/core/app/Person$Builder;
    .locals 0
    .param p1, "important"    # Z
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 286
    iput-boolean p1, p0, Landroidx/core/app/Person$Builder;->mIsImportant:Z

    .line 287
    return-object p0
.end method

.method public setKey(Ljava/lang/String;)Landroidx/core/app/Person$Builder;
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 264
    iput-object p1, p0, Landroidx/core/app/Person$Builder;->mKey:Ljava/lang/String;

    .line 265
    return-object p0
.end method

.method public setName(Ljava/lang/CharSequence;)Landroidx/core/app/Person$Builder;
    .locals 0
    .param p1, "name"    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 223
    iput-object p1, p0, Landroidx/core/app/Person$Builder;->mName:Ljava/lang/CharSequence;

    .line 224
    return-object p0
.end method

.method public setUri(Ljava/lang/String;)Landroidx/core/app/Person$Builder;
    .locals 0
    .param p1, "uri"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 253
    iput-object p1, p0, Landroidx/core/app/Person$Builder;->mUri:Ljava/lang/String;

    .line 254
    return-object p0
.end method
