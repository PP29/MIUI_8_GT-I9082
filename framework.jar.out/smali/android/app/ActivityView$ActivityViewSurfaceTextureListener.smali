.class Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;
.super Ljava/lang/Object;
.source "ActivityView.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/app/ActivityView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ActivityViewSurfaceTextureListener"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/app/ActivityView;


# direct methods
.method private constructor <init>(Landroid/app/ActivityView;)V
    .locals 0

    .prologue
    .line 362
    iput-object p1, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/app/ActivityView;Landroid/app/ActivityView$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/app/ActivityView;
    .param p2, "x1"    # Landroid/app/ActivityView$1;

    .prologue
    .line 362
    invoke-direct {p0, p1}, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;-><init>(Landroid/app/ActivityView;)V

    return-void
.end method


# virtual methods
.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 6
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 366
    iget-object v0, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    # getter for: Landroid/app/ActivityView;->mActivityContainer:Landroid/app/ActivityView$ActivityContainerWrapper;
    invoke-static {v0}, Landroid/app/ActivityView;->access$400(Landroid/app/ActivityView;)Landroid/app/ActivityView$ActivityContainerWrapper;

    move-result-object v0

    if-nez v0, :cond_0

    .line 375
    :goto_0
    return-void

    .line 371
    :cond_0
    iget-object v0, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    # setter for: Landroid/app/ActivityView;->mWidth:I
    invoke-static {v0, p2}, Landroid/app/ActivityView;->access$602(Landroid/app/ActivityView;I)I

    .line 372
    iget-object v0, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    # setter for: Landroid/app/ActivityView;->mHeight:I
    invoke-static {v0, p3}, Landroid/app/ActivityView;->access$702(Landroid/app/ActivityView;I)I

    .line 373
    iget-object v0, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    new-instance v1, Landroid/view/Surface;

    invoke-direct {v1, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    # setter for: Landroid/app/ActivityView;->mSurface:Landroid/view/Surface;
    invoke-static {v0, v1}, Landroid/app/ActivityView;->access$802(Landroid/app/ActivityView;Landroid/view/Surface;)Landroid/view/Surface;

    .line 374
    iget-object v0, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    iget-object v1, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    # getter for: Landroid/app/ActivityView;->mSurface:Landroid/view/Surface;
    invoke-static {v1}, Landroid/app/ActivityView;->access$800(Landroid/app/ActivityView;)Landroid/view/Surface;

    move-result-object v1

    iget-object v2, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    # getter for: Landroid/app/ActivityView;->mWidth:I
    invoke-static {v2}, Landroid/app/ActivityView;->access$600(Landroid/app/ActivityView;)I

    move-result v2

    iget-object v3, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    # getter for: Landroid/app/ActivityView;->mHeight:I
    invoke-static {v3}, Landroid/app/ActivityView;->access$700(Landroid/app/ActivityView;)I

    move-result v3

    iget-object v4, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    # getter for: Landroid/app/ActivityView;->mDensityDpi:I
    invoke-static {v4}, Landroid/app/ActivityView;->access$900(Landroid/app/ActivityView;)I

    move-result v4

    const/4 v5, 0x1

    # invokes: Landroid/app/ActivityView;->setSurfaceAsync(Landroid/view/Surface;IIIZ)V
    invoke-static/range {v0 .. v5}, Landroid/app/ActivityView;->access$1000(Landroid/app/ActivityView;Landroid/view/Surface;IIIZ)V

    goto :goto_0
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 6
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    const/4 v1, 0x0

    const/4 v5, 0x1

    .line 388
    iget-object v0, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    # getter for: Landroid/app/ActivityView;->mActivityContainer:Landroid/app/ActivityView$ActivityContainerWrapper;
    invoke-static {v0}, Landroid/app/ActivityView;->access$400(Landroid/app/ActivityView;)Landroid/app/ActivityView$ActivityContainerWrapper;

    move-result-object v0

    if-nez v0, :cond_0

    .line 395
    :goto_0
    return v5

    .line 392
    :cond_0
    iget-object v0, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    # getter for: Landroid/app/ActivityView;->mSurface:Landroid/view/Surface;
    invoke-static {v0}, Landroid/app/ActivityView;->access$800(Landroid/app/ActivityView;)Landroid/view/Surface;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 393
    iget-object v0, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    # setter for: Landroid/app/ActivityView;->mSurface:Landroid/view/Surface;
    invoke-static {v0, v1}, Landroid/app/ActivityView;->access$802(Landroid/app/ActivityView;Landroid/view/Surface;)Landroid/view/Surface;

    .line 394
    iget-object v0, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    iget-object v2, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    # getter for: Landroid/app/ActivityView;->mWidth:I
    invoke-static {v2}, Landroid/app/ActivityView;->access$600(Landroid/app/ActivityView;)I

    move-result v2

    iget-object v3, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    # getter for: Landroid/app/ActivityView;->mHeight:I
    invoke-static {v3}, Landroid/app/ActivityView;->access$700(Landroid/app/ActivityView;)I

    move-result v3

    iget-object v4, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    # getter for: Landroid/app/ActivityView;->mDensityDpi:I
    invoke-static {v4}, Landroid/app/ActivityView;->access$900(Landroid/app/ActivityView;)I

    move-result v4

    # invokes: Landroid/app/ActivityView;->setSurfaceAsync(Landroid/view/Surface;IIIZ)V
    invoke-static/range {v0 .. v5}, Landroid/app/ActivityView;->access$1000(Landroid/app/ActivityView;Landroid/view/Surface;IIIZ)V

    goto :goto_0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 1
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 380
    iget-object v0, p0, Landroid/app/ActivityView$ActivityViewSurfaceTextureListener;->this$0:Landroid/app/ActivityView;

    # getter for: Landroid/app/ActivityView;->mActivityContainer:Landroid/app/ActivityView$ActivityContainerWrapper;
    invoke-static {v0}, Landroid/app/ActivityView;->access$400(Landroid/app/ActivityView;)Landroid/app/ActivityView$ActivityContainerWrapper;

    move-result-object v0

    if-nez v0, :cond_0

    .line 384
    :cond_0
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 401
    return-void
.end method
