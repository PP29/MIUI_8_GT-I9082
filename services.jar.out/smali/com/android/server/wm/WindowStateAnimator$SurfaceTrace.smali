.class Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;
.super Landroid/view/SurfaceControl;
.source "WindowStateAnimator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/wm/WindowStateAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SurfaceTrace"
.end annotation


# static fields
.field private static final SURFACE_TAG:Ljava/lang/String; = "SurfaceTrace"

.field private static final logSurfaceTrace:Z

.field static final sSurfaces:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mDsdx:F

.field private mDsdy:F

.field private mDtdx:F

.field private mDtdy:F

.field private mIsOpaque:Z

.field private mLayer:I

.field private mLayerStack:I

.field private final mName:Ljava/lang/String;

.field private final mPosition:Landroid/graphics/PointF;

.field private mShown:Z

.field private final mSize:Landroid/graphics/Point;

.field private mSurfaceTraceAlpha:F

.field private final mWindowCrop:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 568
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->sSurfaces:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/view/SurfaceSession;Ljava/lang/String;IIII)V
    .locals 3
    .param p1, "s"    # Landroid/view/SurfaceSession;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "w"    # I
    .param p4, "h"    # I
    .param p5, "format"    # I
    .param p6, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/view/Surface$OutOfResourcesException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 584
    invoke-direct/range {p0 .. p6}, Landroid/view/SurfaceControl;-><init>(Landroid/view/SurfaceSession;Ljava/lang/String;IIII)V

    .line 570
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mSurfaceTraceAlpha:F

    .line 572
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mPosition:Landroid/graphics/PointF;

    .line 573
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mSize:Landroid/graphics/Point;

    .line 574
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mWindowCrop:Landroid/graphics/Rect;

    .line 575
    iput-boolean v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mShown:Z

    .line 585
    if-eqz p2, :cond_0

    .end local p2    # "name":Ljava/lang/String;
    :goto_0
    iput-object p2, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mName:Ljava/lang/String;

    .line 586
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mSize:Landroid/graphics/Point;

    invoke-virtual {v0, p3, p4}, Landroid/graphics/Point;->set(II)V

    .line 589
    sget-object v1, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->sSurfaces:Ljava/util/ArrayList;

    monitor-enter v1

    .line 590
    :try_start_0
    sget-object v0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->sSurfaces:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 591
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 592
    return-void

    .line 585
    .restart local p2    # "name":Ljava/lang/String;
    :cond_0
    const-string p2, "Not named"

    goto :goto_0

    .line 591
    .end local p2    # "name":Ljava/lang/String;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method static dumpAllSurfaces(Ljava/io/PrintWriter;Ljava/lang/String;)V
    .locals 5
    .param p0, "pw"    # Ljava/io/PrintWriter;
    .param p1, "header"    # Ljava/lang/String;

    .prologue
    .line 739
    sget-object v4, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->sSurfaces:Ljava/util/ArrayList;

    monitor-enter v4

    .line 740
    :try_start_0
    sget-object v3, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->sSurfaces:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 741
    .local v0, "N":I
    if-gtz v0, :cond_0

    .line 742
    monitor-exit v4

    .line 768
    :goto_0
    return-void

    .line 744
    :cond_0
    if-eqz p1, :cond_1

    .line 745
    invoke-virtual {p0, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 747
    :cond_1
    const-string v3, "WINDOW MANAGER SURFACES (dumpsys window surfaces)"

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 748
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v0, :cond_2

    .line 749
    sget-object v3, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->sSurfaces:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;

    .line 750
    .local v2, "s":Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;
    const-string v3, "  Surface #"

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Ljava/io/PrintWriter;->print(I)V

    const-string v3, ": #"

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 751
    invoke-static {v2}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 752
    const-string v3, " "

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v3, v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mName:Ljava/lang/String;

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 753
    const-string v3, "    mLayerStack="

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v3, v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mLayerStack:I

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(I)V

    .line 754
    const-string v3, " mLayer="

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v3, v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mLayer:I

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->println(I)V

    .line 755
    const-string v3, "    mShown="

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v3, v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mShown:Z

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Z)V

    const-string v3, " mAlpha="

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 756
    iget v3, v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mSurfaceTraceAlpha:F

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(F)V

    const-string v3, " mIsOpaque="

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 757
    iget-boolean v3, v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mIsOpaque:Z

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->println(Z)V

    .line 758
    const-string v3, "    mPosition="

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v3, v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mPosition:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(F)V

    const-string v3, ","

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 759
    iget-object v3, v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mPosition:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(F)V

    .line 760
    const-string v3, " mSize="

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v3, v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mSize:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->x:I

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(I)V

    const-string v3, "x"

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 761
    iget-object v3, v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mSize:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->y:I

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->println(I)V

    .line 762
    const-string v3, "    mCrop="

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v3, v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mWindowCrop:Landroid/graphics/Rect;

    invoke-virtual {v3, p0}, Landroid/graphics/Rect;->printShortString(Ljava/io/PrintWriter;)V

    invoke-virtual {p0}, Ljava/io/PrintWriter;->println()V

    .line 763
    const-string v3, "    Transform: ("

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v3, v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDsdx:F

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(F)V

    const-string v3, ", "

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 764
    iget v3, v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDtdx:F

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(F)V

    const-string v3, ", "

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v3, v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDsdy:F

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(F)V

    .line 765
    const-string v3, ", "

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v3, v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDtdy:F

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->print(F)V

    const-string v3, ")"

    invoke-virtual {p0, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 748
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_1

    .line 767
    .end local v2    # "s":Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;
    :cond_2
    monitor-exit v4

    goto/16 :goto_0

    .end local v0    # "N":I
    .end local v1    # "i":I
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .prologue
    .line 720
    invoke-super {p0}, Landroid/view/SurfaceControl;->destroy()V

    .line 723
    sget-object v1, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->sSurfaces:Ljava/util/ArrayList;

    monitor-enter v1

    .line 724
    :try_start_0
    sget-object v0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->sSurfaces:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 725
    monitor-exit v1

    .line 726
    return-void

    .line 725
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public hide()V
    .locals 1

    .prologue
    .line 700
    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mShown:Z

    if-eqz v0, :cond_0

    .line 703
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mShown:Z

    .line 705
    :cond_0
    invoke-super {p0}, Landroid/view/SurfaceControl;->hide()V

    .line 706
    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    .line 730
    invoke-super {p0}, Landroid/view/SurfaceControl;->release()V

    .line 733
    sget-object v1, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->sSurfaces:Ljava/util/ArrayList;

    monitor-enter v1

    .line 734
    :try_start_0
    sget-object v0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->sSurfaces:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 735
    monitor-exit v1

    .line 736
    return-void

    .line 735
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setAlpha(F)V
    .locals 1
    .param p1, "alpha"    # F

    .prologue
    .line 596
    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mSurfaceTraceAlpha:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 599
    iput p1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mSurfaceTraceAlpha:F

    .line 601
    :cond_0
    invoke-super {p0, p1}, Landroid/view/SurfaceControl;->setAlpha(F)V

    .line 602
    return-void
.end method

.method public setLayer(I)V
    .locals 5
    .param p1, "zorder"    # I

    .prologue
    .line 606
    iget v2, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mLayer:I

    if-eq p1, v2, :cond_0

    .line 609
    iput p1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mLayer:I

    .line 611
    :cond_0
    invoke-super {p0, p1}, Landroid/view/SurfaceControl;->setLayer(I)V

    .line 613
    sget-object v3, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->sSurfaces:Ljava/util/ArrayList;

    monitor-enter v3

    .line 614
    :try_start_0
    sget-object v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->sSurfaces:Ljava/util/ArrayList;

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 616
    sget-object v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->sSurfaces:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 617
    sget-object v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->sSurfaces:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;

    .line 618
    .local v1, "s":Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;
    iget v2, v1, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mLayer:I

    if-ge v2, p1, :cond_2

    .line 622
    .end local v1    # "s":Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;
    :cond_1
    sget-object v2, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->sSurfaces:Ljava/util/ArrayList;

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v2, v4, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 623
    monitor-exit v3

    .line 624
    return-void

    .line 616
    .restart local v1    # "s":Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;
    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 623
    .end local v0    # "i":I
    .end local v1    # "s":Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public setLayerStack(I)V
    .locals 1
    .param p1, "layerStack"    # I

    .prologue
    .line 661
    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mLayerStack:I

    if-eq p1, v0, :cond_0

    .line 664
    iput p1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mLayerStack:I

    .line 666
    :cond_0
    invoke-super {p0, p1}, Landroid/view/SurfaceControl;->setLayerStack(I)V

    .line 667
    return-void
.end method

.method public setMatrix(FFFF)V
    .locals 1
    .param p1, "dsdx"    # F
    .param p2, "dtdx"    # F
    .param p3, "dsdy"    # F
    .param p4, "dtdy"    # F

    .prologue
    .line 686
    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDsdx:F

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDtdx:F

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDsdy:F

    cmpl-float v0, p3, v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDtdy:F

    cmpl-float v0, p4, v0

    if-eqz v0, :cond_1

    .line 690
    :cond_0
    iput p1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDsdx:F

    .line 691
    iput p2, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDtdx:F

    .line 692
    iput p3, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDsdy:F

    .line 693
    iput p4, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDtdy:F

    .line 695
    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/SurfaceControl;->setMatrix(FFFF)V

    .line 696
    return-void
.end method

.method public setOpaque(Z)V
    .locals 1
    .param p1, "isOpaque"    # Z

    .prologue
    .line 671
    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mIsOpaque:Z

    if-eq p1, v0, :cond_0

    .line 674
    iput-boolean p1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mIsOpaque:Z

    .line 676
    :cond_0
    invoke-super {p0, p1}, Landroid/view/SurfaceControl;->setOpaque(Z)V

    .line 677
    return-void
.end method

.method public setPosition(FF)V
    .locals 1
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 628
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mPosition:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mPosition:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    cmpl-float v0, p2, v0

    if-eqz v0, :cond_1

    .line 631
    :cond_0
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mPosition:Landroid/graphics/PointF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    .line 633
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/view/SurfaceControl;->setPosition(FF)V

    .line 634
    return-void
.end method

.method public setSecure(Z)V
    .locals 0
    .param p1, "isSecure"    # Z

    .prologue
    .line 681
    invoke-super {p0, p1}, Landroid/view/SurfaceControl;->setSecure(Z)V

    .line 682
    return-void
.end method

.method public setSize(II)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 638
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mSize:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->x:I

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mSize:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->y:I

    if-eq p2, v0, :cond_1

    .line 641
    :cond_0
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mSize:Landroid/graphics/Point;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Point;->set(II)V

    .line 643
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/view/SurfaceControl;->setSize(II)V

    .line 644
    return-void
.end method

.method public setWindowCrop(Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "crop"    # Landroid/graphics/Rect;

    .prologue
    .line 648
    if-eqz p1, :cond_0

    .line 649
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mWindowCrop:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 653
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mWindowCrop:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 656
    :cond_0
    invoke-super {p0, p1}, Landroid/view/SurfaceControl;->setWindowCrop(Landroid/graphics/Rect;)V

    .line 657
    return-void
.end method

.method public show()V
    .locals 1

    .prologue
    .line 710
    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mShown:Z

    if-nez v0, :cond_0

    .line 713
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mShown:Z

    .line 715
    :cond_0
    invoke-super {p0}, Landroid/view/SurfaceControl;->show()V

    .line 716
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 772
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Surface "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mLayerStack:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "): shown="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mShown:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " layer="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mLayer:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " alpha="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mSurfaceTraceAlpha:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mPosition:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mPosition:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mSize:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->x:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mSize:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->y:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " crop="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mWindowCrop:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->toShortString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " opaque="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mIsOpaque:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDsdx:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDtdx:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDsdy:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;->mDtdy:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
