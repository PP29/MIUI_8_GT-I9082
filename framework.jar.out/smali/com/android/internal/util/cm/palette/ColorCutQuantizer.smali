.class final Lcom/android/internal/util/cm/palette/ColorCutQuantizer;
.super Ljava/lang/Object;
.source "ColorCutQuantizer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;
    }
.end annotation


# static fields
.field private static final COMPONENT_BLUE:I = -0x1

.field private static final COMPONENT_GREEN:I = -0x2

.field private static final COMPONENT_RED:I = -0x3

.field private static final LOG_TAG:Ljava/lang/String; = "ColorCutQuantizer"

.field private static final LOG_TIMINGS:Z = false

.field private static final QUANTIZE_WORD_MASK:I = 0x1f

.field private static final QUANTIZE_WORD_WIDTH:I = 0x5

.field private static final VBOX_COMPARATOR_VOLUME:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mColors:[I

.field final mFilters:[Lcom/android/internal/util/cm/palette/Palette$Filter;

.field final mHistogram:[I

.field final mQuantizedColors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/util/cm/palette/Palette$Swatch;",
            ">;"
        }
    .end annotation
.end field

.field private final mTempHsl:[F

.field final mTimingLogger:Landroid/util/TimingLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 453
    new-instance v0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer$1;

    invoke-direct {v0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer$1;-><init>()V

    sput-object v0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->VBOX_COMPARATOR_VOLUME:Ljava/util/Comparator;

    return-void
.end method

.method constructor <init>([II[Lcom/android/internal/util/cm/palette/Palette$Filter;)V
    .locals 17
    .param p1, "pixels"    # [I
    .param p2, "maxColors"    # I
    .param p3, "filters"    # [Lcom/android/internal/util/cm/palette/Palette$Filter;

    .prologue
    .line 72
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 63
    const/4 v13, 0x3

    new-array v13, v13, [F

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mTempHsl:[F

    .line 73
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mTimingLogger:Landroid/util/TimingLogger;

    .line 74
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mFilters:[Lcom/android/internal/util/cm/palette/Palette$Filter;

    .line 76
    const v13, 0x8000

    new-array v8, v13, [I

    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mHistogram:[I

    .line 77
    .local v8, "hist":[I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    move-object/from16 v0, p1

    array-length v13, v0

    if-ge v9, v13, :cond_0

    .line 78
    aget v13, p1, v9

    invoke-static {v13}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->quantizeFromRgb888(I)I

    move-result v12

    .line 80
    .local v12, "quantizedColor":I
    aput v12, p1, v9

    .line 82
    aget v13, v8, v12

    add-int/lit8 v13, v13, 0x1

    aput v13, v8, v12

    .line 77
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 90
    .end local v12    # "quantizedColor":I
    :cond_0
    const/4 v5, 0x0

    .line 91
    .local v5, "distinctColorCount":I
    const/4 v3, 0x0

    .local v3, "color":I
    :goto_1
    array-length v13, v8

    if-ge v3, v13, :cond_3

    .line 92
    aget v13, v8, v3

    if-lez v13, :cond_1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->shouldIgnoreColor(I)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 94
    const/4 v13, 0x0

    aput v13, v8, v3

    .line 96
    :cond_1
    aget v13, v8, v3

    if-lez v13, :cond_2

    .line 98
    add-int/lit8 v5, v5, 0x1

    .line 91
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 107
    :cond_3
    new-array v4, v5, [I

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mColors:[I

    .line 108
    .local v4, "colors":[I
    const/4 v6, 0x0

    .line 109
    .local v6, "distinctColorIndex":I
    const/4 v3, 0x0

    :goto_2
    array-length v13, v8

    if-ge v3, v13, :cond_5

    .line 110
    aget v13, v8, v3

    if-lez v13, :cond_4

    .line 111
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "distinctColorIndex":I
    .local v7, "distinctColorIndex":I
    aput v3, v4, v6

    move v6, v7

    .line 109
    .end local v7    # "distinctColorIndex":I
    .restart local v6    # "distinctColorIndex":I
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 119
    :cond_5
    move/from16 v0, p2

    if-gt v5, v0, :cond_6

    .line 121
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mQuantizedColors:Ljava/util/List;

    .line 122
    move-object v2, v4

    .local v2, "arr$":[I
    array-length v11, v2

    .local v11, "len$":I
    const/4 v10, 0x0

    .local v10, "i$":I
    :goto_3
    if-ge v10, v11, :cond_7

    aget v3, v2, v10

    .line 123
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mQuantizedColors:Ljava/util/List;

    new-instance v14, Lcom/android/internal/util/cm/palette/Palette$Swatch;

    invoke-static {v3}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->approximateToRgb888(I)I

    move-result v15

    aget v16, v8, v3

    invoke-direct/range {v14 .. v16}, Lcom/android/internal/util/cm/palette/Palette$Swatch;-><init>(II)V

    invoke-interface {v13, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 132
    .end local v2    # "arr$":[I
    .end local v10    # "i$":I
    .end local v11    # "len$":I
    :cond_6
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->quantizePixels(I)Ljava/util/List;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mQuantizedColors:Ljava/util/List;

    .line 139
    :cond_7
    return-void
.end method

.method static synthetic access$000(I)I
    .locals 1
    .param p0, "x0"    # I

    .prologue
    .line 45
    invoke-static {p0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->quantizedRed(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$100(I)I
    .locals 1
    .param p0, "x0"    # I

    .prologue
    .line 45
    invoke-static {p0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->quantizedGreen(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(I)I
    .locals 1
    .param p0, "x0"    # I

    .prologue
    .line 45
    invoke-static {p0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->quantizedBlue(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$300([IIII)V
    .locals 0
    .param p0, "x0"    # [I
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .prologue
    .line 45
    invoke-static {p0, p1, p2, p3}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->modifySignificantOctet([IIII)V

    return-void
.end method

.method static synthetic access$400(III)I
    .locals 1
    .param p0, "x0"    # I
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 45
    invoke-static {p0, p1, p2}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->approximateToRgb888(III)I

    move-result v0

    return v0
.end method

.method private static approximateToRgb888(I)I
    .locals 3
    .param p0, "color"    # I

    .prologue
    .line 480
    invoke-static {p0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->quantizedRed(I)I

    move-result v0

    invoke-static {p0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->quantizedGreen(I)I

    move-result v1

    invoke-static {p0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->quantizedBlue(I)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->approximateToRgb888(III)I

    move-result v0

    return v0
.end method

.method private static approximateToRgb888(III)I
    .locals 4
    .param p0, "r"    # I
    .param p1, "g"    # I
    .param p2, "b"    # I

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x5

    .line 474
    invoke-static {p0, v2, v3}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->modifyWordWidth(III)I

    move-result v0

    invoke-static {p1, v2, v3}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->modifyWordWidth(III)I

    move-result v1

    invoke-static {p2, v2, v3}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->modifyWordWidth(III)I

    move-result v2

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    return v0
.end method

.method private generateAverageColors(Ljava/util/Collection;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/util/cm/palette/Palette$Swatch;",
            ">;"
        }
    .end annotation

    .prologue
    .line 197
    .local p1, "vboxes":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v4

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 198
    .local v0, "colors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/util/cm/palette/Palette$Swatch;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;

    .line 199
    .local v3, "vbox":Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;
    invoke-virtual {v3}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;->getAverageColor()Lcom/android/internal/util/cm/palette/Palette$Swatch;

    move-result-object v2

    .line 200
    .local v2, "swatch":Lcom/android/internal/util/cm/palette/Palette$Swatch;
    invoke-direct {p0, v2}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->shouldIgnoreColor(Lcom/android/internal/util/cm/palette/Palette$Swatch;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 203
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 206
    .end local v2    # "swatch":Lcom/android/internal/util/cm/palette/Palette$Swatch;
    .end local v3    # "vbox":Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;
    :cond_1
    return-object v0
.end method

.method private static modifySignificantOctet([IIII)V
    .locals 4
    .param p0, "a"    # [I
    .param p1, "dimension"    # I
    .param p2, "lower"    # I
    .param p3, "upper"    # I

    .prologue
    .line 404
    packed-switch p1, :pswitch_data_0

    .line 427
    :cond_0
    :pswitch_0
    return-void

    .line 410
    :pswitch_1
    move v1, p2

    .local v1, "i":I
    :goto_0
    if-gt v1, p3, :cond_0

    .line 411
    aget v0, p0, v1

    .line 412
    .local v0, "color":I
    invoke-static {v0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->quantizedGreen(I)I

    move-result v2

    shl-int/lit8 v2, v2, 0xa

    invoke-static {v0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->quantizedRed(I)I

    move-result v3

    shl-int/lit8 v3, v3, 0x5

    or-int/2addr v2, v3

    invoke-static {v0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->quantizedBlue(I)I

    move-result v3

    or-int/2addr v2, v3

    aput v2, p0, v1

    .line 410
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 419
    .end local v0    # "color":I
    .end local v1    # "i":I
    :pswitch_2
    move v1, p2

    .restart local v1    # "i":I
    :goto_1
    if-gt v1, p3, :cond_0

    .line 420
    aget v0, p0, v1

    .line 421
    .restart local v0    # "color":I
    invoke-static {v0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->quantizedBlue(I)I

    move-result v2

    shl-int/lit8 v2, v2, 0xa

    invoke-static {v0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->quantizedGreen(I)I

    move-result v3

    shl-int/lit8 v3, v3, 0x5

    or-int/2addr v2, v3

    invoke-static {v0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->quantizedRed(I)I

    move-result v3

    or-int/2addr v2, v3

    aput v2, p0, v1

    .line 419
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 404
    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private static modifyWordWidth(III)I
    .locals 2
    .param p0, "value"    # I
    .param p1, "currentWidth"    # I
    .param p2, "targetWidth"    # I

    .prologue
    .line 506
    if-le p2, p1, :cond_0

    .line 508
    sub-int v1, p2, p1

    shl-int v0, p0, v1

    .line 513
    .local v0, "newValue":I
    :goto_0
    const/4 v1, 0x1

    shl-int/2addr v1, p2

    add-int/lit8 v1, v1, -0x1

    and-int/2addr v1, v0

    return v1

    .line 511
    .end local v0    # "newValue":I
    :cond_0
    sub-int v1, p1, p2

    shr-int v0, p0, v1

    .restart local v0    # "newValue":I
    goto :goto_0
.end method

.method private static quantizeFromRgb888(I)I
    .locals 6
    .param p0, "color"    # I

    .prologue
    const/16 v5, 0x8

    const/4 v4, 0x5

    .line 464
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v3

    invoke-static {v3, v5, v4}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->modifyWordWidth(III)I

    move-result v2

    .line 465
    .local v2, "r":I
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static {v3, v5, v4}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->modifyWordWidth(III)I

    move-result v1

    .line 466
    .local v1, "g":I
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    invoke-static {v3, v5, v4}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->modifyWordWidth(III)I

    move-result v0

    .line 467
    .local v0, "b":I
    shl-int/lit8 v3, v2, 0xa

    shl-int/lit8 v4, v1, 0x5

    or-int/2addr v3, v4

    or-int/2addr v3, v0

    return v3
.end method

.method private quantizePixels(I)Ljava/util/List;
    .locals 4
    .param p1, "maxColors"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/util/cm/palette/Palette$Swatch;",
            ">;"
        }
    .end annotation

    .prologue
    .line 151
    new-instance v0, Ljava/util/PriorityQueue;

    sget-object v1, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->VBOX_COMPARATOR_VOLUME:Ljava/util/Comparator;

    invoke-direct {v0, p1, v1}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    .line 154
    .local v0, "pq":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;>;"
    new-instance v1, Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mColors:[I

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    invoke-direct {v1, p0, v2, v3}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;-><init>(Lcom/android/internal/util/cm/palette/ColorCutQuantizer;II)V

    invoke-virtual {v0, v1}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    .line 158
    invoke-direct {p0, v0, p1}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->splitBoxes(Ljava/util/PriorityQueue;I)V

    .line 161
    invoke-direct {p0, v0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->generateAverageColors(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method private static quantizedBlue(I)I
    .locals 1
    .param p0, "color"    # I

    .prologue
    .line 501
    and-int/lit8 v0, p0, 0x1f

    return v0
.end method

.method private static quantizedGreen(I)I
    .locals 1
    .param p0, "color"    # I

    .prologue
    .line 494
    shr-int/lit8 v0, p0, 0x5

    and-int/lit8 v0, v0, 0x1f

    return v0
.end method

.method private static quantizedRed(I)I
    .locals 1
    .param p0, "color"    # I

    .prologue
    .line 487
    shr-int/lit8 v0, p0, 0xa

    and-int/lit8 v0, v0, 0x1f

    return v0
.end method

.method private shouldIgnoreColor(I)Z
    .locals 2
    .param p1, "color565"    # I

    .prologue
    .line 430
    invoke-static {p1}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->approximateToRgb888(I)I

    move-result v0

    .line 431
    .local v0, "rgb":I
    iget-object v1, p0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mTempHsl:[F

    invoke-static {v0, v1}, Lcom/android/internal/util/cm/palette/ColorUtils;->colorToHSL(I[F)V

    .line 432
    iget-object v1, p0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mTempHsl:[F

    invoke-direct {p0, v0, v1}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->shouldIgnoreColor(I[F)Z

    move-result v1

    return v1
.end method

.method private shouldIgnoreColor(I[F)Z
    .locals 3
    .param p1, "rgb"    # I
    .param p2, "hsl"    # [F

    .prologue
    .line 440
    iget-object v2, p0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mFilters:[Lcom/android/internal/util/cm/palette/Palette$Filter;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mFilters:[Lcom/android/internal/util/cm/palette/Palette$Filter;

    array-length v2, v2

    if-lez v2, :cond_1

    .line 441
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v2, p0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mFilters:[Lcom/android/internal/util/cm/palette/Palette$Filter;

    array-length v0, v2

    .local v0, "count":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 442
    iget-object v2, p0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mFilters:[Lcom/android/internal/util/cm/palette/Palette$Filter;

    aget-object v2, v2, v1

    invoke-interface {v2, p1, p2}, Lcom/android/internal/util/cm/palette/Palette$Filter;->isAllowed(I[F)Z

    move-result v2

    if-nez v2, :cond_0

    .line 443
    const/4 v2, 0x1

    .line 447
    .end local v0    # "count":I
    .end local v1    # "i":I
    :goto_1
    return v2

    .line 441
    .restart local v0    # "count":I
    .restart local v1    # "i":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 447
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private shouldIgnoreColor(Lcom/android/internal/util/cm/palette/Palette$Swatch;)Z
    .locals 2
    .param p1, "color"    # Lcom/android/internal/util/cm/palette/Palette$Swatch;

    .prologue
    .line 436
    invoke-virtual {p1}, Lcom/android/internal/util/cm/palette/Palette$Swatch;->getRgb()I

    move-result v0

    invoke-virtual {p1}, Lcom/android/internal/util/cm/palette/Palette$Swatch;->getHsl()[F

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->shouldIgnoreColor(I[F)Z

    move-result v0

    return v0
.end method

.method private splitBoxes(Ljava/util/PriorityQueue;I)V
    .locals 2
    .param p2, "maxSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/PriorityQueue",
            "<",
            "Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 174
    .local p1, "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;>;"
    :goto_0
    invoke-virtual {p1}, Ljava/util/PriorityQueue;->size()I

    move-result v1

    if-ge v1, p2, :cond_0

    .line 175
    invoke-virtual {p1}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;

    .line 177
    .local v0, "vbox":Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;->canSplit()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 179
    invoke-virtual {v0}, Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;->splitBox()Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    .line 185
    invoke-virtual {p1, v0}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    goto :goto_0

    .line 194
    .end local v0    # "vbox":Lcom/android/internal/util/cm/palette/ColorCutQuantizer$Vbox;
    :cond_0
    return-void
.end method


# virtual methods
.method getQuantizedColors()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/util/cm/palette/Palette$Swatch;",
            ">;"
        }
    .end annotation

    .prologue
    .line 145
    iget-object v0, p0, Lcom/android/internal/util/cm/palette/ColorCutQuantizer;->mQuantizedColors:Ljava/util/List;

    return-object v0
.end method
