.class Lcom/android/internal/app/PlatLogoActivity$5;
.super Ljava/lang/Object;
.source "PlatLogoActivity.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/app/PlatLogoActivity;->onAttachedToWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/app/PlatLogoActivity;

.field final synthetic val$im:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/internal/app/PlatLogoActivity;Landroid/view/View;)V
    .locals 0

    .prologue
    .line 178
    iput-object p1, p0, Lcom/android/internal/app/PlatLogoActivity$5;->this$0:Lcom/android/internal/app/PlatLogoActivity;

    iput-object p2, p0, Lcom/android/internal/app/PlatLogoActivity$5;->val$im:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 181
    const/4 v0, 0x4

    if-eq p2, v0, :cond_3

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_3

    .line 182
    iget-object v0, p0, Lcom/android/internal/app/PlatLogoActivity$5;->this$0:Lcom/android/internal/app/PlatLogoActivity;

    iget v0, v0, Lcom/android/internal/app/PlatLogoActivity;->mKeyCount:I

    if-nez v0, :cond_0

    .line 183
    iget-object v0, p0, Lcom/android/internal/app/PlatLogoActivity$5;->this$0:Lcom/android/internal/app/PlatLogoActivity;

    iget-object v1, p0, Lcom/android/internal/app/PlatLogoActivity$5;->val$im:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/android/internal/app/PlatLogoActivity;->showMarshmallow(Landroid/view/View;)V

    .line 185
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/PlatLogoActivity$5;->this$0:Lcom/android/internal/app/PlatLogoActivity;

    iget v1, v0, Lcom/android/internal/app/PlatLogoActivity;->mKeyCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/android/internal/app/PlatLogoActivity;->mKeyCount:I

    .line 186
    iget-object v0, p0, Lcom/android/internal/app/PlatLogoActivity$5;->this$0:Lcom/android/internal/app/PlatLogoActivity;

    iget v0, v0, Lcom/android/internal/app/PlatLogoActivity;->mKeyCount:I

    const/4 v1, 0x2

    if-le v0, v1, :cond_1

    .line 187
    iget-object v0, p0, Lcom/android/internal/app/PlatLogoActivity$5;->this$0:Lcom/android/internal/app/PlatLogoActivity;

    iget v0, v0, Lcom/android/internal/app/PlatLogoActivity;->mTapCount:I

    const/4 v1, 0x5

    if-le v0, v1, :cond_2

    .line 188
    iget-object v0, p0, Lcom/android/internal/app/PlatLogoActivity$5;->val$im:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->performLongClick()Z

    .line 193
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 195
    :goto_1
    return v0

    .line 190
    :cond_2
    iget-object v0, p0, Lcom/android/internal/app/PlatLogoActivity$5;->val$im:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->performClick()Z

    goto :goto_0

    .line 195
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method
