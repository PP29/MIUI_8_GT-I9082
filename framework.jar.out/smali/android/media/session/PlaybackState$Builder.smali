.class public final Landroid/media/session/PlaybackState$Builder;
.super Ljava/lang/Object;
.source "PlaybackState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/media/session/PlaybackState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private mActions:J

.field private mActiveItemId:J

.field private mBufferedPosition:J

.field private final mCustomActions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/media/session/PlaybackState$CustomAction;",
            ">;"
        }
    .end annotation
.end field

.field private mErrorMessage:Ljava/lang/CharSequence;

.field private mExtras:Landroid/os/Bundle;

.field private mPosition:J

.field private mSpeed:F

.field private mState:I

.field private mUpdateTime:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 769
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 754
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/media/session/PlaybackState$Builder;->mCustomActions:Ljava/util/List;

    .line 763
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroid/media/session/PlaybackState$Builder;->mActiveItemId:J

    .line 770
    return-void
.end method

.method public constructor <init>(Landroid/media/session/PlaybackState;)V
    .locals 2
    .param p1, "from"    # Landroid/media/session/PlaybackState;

    .prologue
    .line 778
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 754
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/media/session/PlaybackState$Builder;->mCustomActions:Ljava/util/List;

    .line 763
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroid/media/session/PlaybackState$Builder;->mActiveItemId:J

    .line 779
    if-nez p1, :cond_0

    .line 794
    :goto_0
    return-void

    .line 782
    :cond_0
    # getter for: Landroid/media/session/PlaybackState;->mState:I
    invoke-static {p1}, Landroid/media/session/PlaybackState;->access$300(Landroid/media/session/PlaybackState;)I

    move-result v0

    iput v0, p0, Landroid/media/session/PlaybackState$Builder;->mState:I

    .line 783
    # getter for: Landroid/media/session/PlaybackState;->mPosition:J
    invoke-static {p1}, Landroid/media/session/PlaybackState;->access$400(Landroid/media/session/PlaybackState;)J

    move-result-wide v0

    iput-wide v0, p0, Landroid/media/session/PlaybackState$Builder;->mPosition:J

    .line 784
    # getter for: Landroid/media/session/PlaybackState;->mBufferedPosition:J
    invoke-static {p1}, Landroid/media/session/PlaybackState;->access$500(Landroid/media/session/PlaybackState;)J

    move-result-wide v0

    iput-wide v0, p0, Landroid/media/session/PlaybackState$Builder;->mBufferedPosition:J

    .line 785
    # getter for: Landroid/media/session/PlaybackState;->mSpeed:F
    invoke-static {p1}, Landroid/media/session/PlaybackState;->access$600(Landroid/media/session/PlaybackState;)F

    move-result v0

    iput v0, p0, Landroid/media/session/PlaybackState$Builder;->mSpeed:F

    .line 786
    # getter for: Landroid/media/session/PlaybackState;->mActions:J
    invoke-static {p1}, Landroid/media/session/PlaybackState;->access$700(Landroid/media/session/PlaybackState;)J

    move-result-wide v0

    iput-wide v0, p0, Landroid/media/session/PlaybackState$Builder;->mActions:J

    .line 787
    # getter for: Landroid/media/session/PlaybackState;->mCustomActions:Ljava/util/List;
    invoke-static {p1}, Landroid/media/session/PlaybackState;->access$800(Landroid/media/session/PlaybackState;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 788
    iget-object v0, p0, Landroid/media/session/PlaybackState$Builder;->mCustomActions:Ljava/util/List;

    # getter for: Landroid/media/session/PlaybackState;->mCustomActions:Ljava/util/List;
    invoke-static {p1}, Landroid/media/session/PlaybackState;->access$800(Landroid/media/session/PlaybackState;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 790
    :cond_1
    # getter for: Landroid/media/session/PlaybackState;->mErrorMessage:Ljava/lang/CharSequence;
    invoke-static {p1}, Landroid/media/session/PlaybackState;->access$900(Landroid/media/session/PlaybackState;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Landroid/media/session/PlaybackState$Builder;->mErrorMessage:Ljava/lang/CharSequence;

    .line 791
    # getter for: Landroid/media/session/PlaybackState;->mUpdateTime:J
    invoke-static {p1}, Landroid/media/session/PlaybackState;->access$1000(Landroid/media/session/PlaybackState;)J

    move-result-wide v0

    iput-wide v0, p0, Landroid/media/session/PlaybackState$Builder;->mUpdateTime:J

    .line 792
    # getter for: Landroid/media/session/PlaybackState;->mActiveItemId:J
    invoke-static {p1}, Landroid/media/session/PlaybackState;->access$1100(Landroid/media/session/PlaybackState;)J

    move-result-wide v0

    iput-wide v0, p0, Landroid/media/session/PlaybackState$Builder;->mActiveItemId:J

    .line 793
    # getter for: Landroid/media/session/PlaybackState;->mExtras:Landroid/os/Bundle;
    invoke-static {p1}, Landroid/media/session/PlaybackState;->access$1200(Landroid/media/session/PlaybackState;)Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Landroid/media/session/PlaybackState$Builder;->mExtras:Landroid/os/Bundle;

    goto :goto_0
.end method


# virtual methods
.method public addCustomAction(Landroid/media/session/PlaybackState$CustomAction;)Landroid/media/session/PlaybackState$Builder;
    .locals 2
    .param p1, "customAction"    # Landroid/media/session/PlaybackState$CustomAction;

    .prologue
    .line 934
    if-nez p1, :cond_0

    .line 935
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You may not add a null CustomAction to PlaybackState."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 938
    :cond_0
    iget-object v0, p0, Landroid/media/session/PlaybackState$Builder;->mCustomActions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 939
    return-object p0
.end method

.method public addCustomAction(Ljava/lang/String;Ljava/lang/String;I)Landroid/media/session/PlaybackState$Builder;
    .locals 6
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "icon"    # I

    .prologue
    const/4 v4, 0x0

    .line 919
    new-instance v0, Landroid/media/session/PlaybackState$CustomAction;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Landroid/media/session/PlaybackState$CustomAction;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;ILandroid/os/Bundle;Landroid/media/session/PlaybackState$1;)V

    invoke-virtual {p0, v0}, Landroid/media/session/PlaybackState$Builder;->addCustomAction(Landroid/media/session/PlaybackState$CustomAction;)Landroid/media/session/PlaybackState$Builder;

    move-result-object v0

    return-object v0
.end method

.method public build()Landroid/media/session/PlaybackState;
    .locals 19

    .prologue
    .line 998
    new-instance v2, Landroid/media/session/PlaybackState;

    move-object/from16 v0, p0

    iget v3, v0, Landroid/media/session/PlaybackState$Builder;->mState:I

    move-object/from16 v0, p0

    iget-wide v4, v0, Landroid/media/session/PlaybackState$Builder;->mPosition:J

    move-object/from16 v0, p0

    iget-wide v6, v0, Landroid/media/session/PlaybackState$Builder;->mUpdateTime:J

    move-object/from16 v0, p0

    iget v8, v0, Landroid/media/session/PlaybackState$Builder;->mSpeed:F

    move-object/from16 v0, p0

    iget-wide v9, v0, Landroid/media/session/PlaybackState$Builder;->mBufferedPosition:J

    move-object/from16 v0, p0

    iget-wide v11, v0, Landroid/media/session/PlaybackState$Builder;->mActions:J

    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/media/session/PlaybackState$Builder;->mCustomActions:Ljava/util/List;

    move-object/from16 v0, p0

    iget-wide v14, v0, Landroid/media/session/PlaybackState$Builder;->mActiveItemId:J

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/session/PlaybackState$Builder;->mErrorMessage:Ljava/lang/CharSequence;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/session/PlaybackState$Builder;->mExtras:Landroid/os/Bundle;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-direct/range {v2 .. v18}, Landroid/media/session/PlaybackState;-><init>(IJJFJJLjava/util/List;JLjava/lang/CharSequence;Landroid/os/Bundle;Landroid/media/session/PlaybackState$1;)V

    return-object v2
.end method

.method public setActions(J)Landroid/media/session/PlaybackState$Builder;
    .locals 1
    .param p1, "actions"    # J

    .prologue
    .line 894
    iput-wide p1, p0, Landroid/media/session/PlaybackState$Builder;->mActions:J

    .line 895
    return-object p0
.end method

.method public setActiveQueueItemId(J)Landroid/media/session/PlaybackState$Builder;
    .locals 1
    .param p1, "id"    # J

    .prologue
    .line 964
    iput-wide p1, p0, Landroid/media/session/PlaybackState$Builder;->mActiveItemId:J

    .line 965
    return-object p0
.end method

.method public setBufferedPosition(J)Landroid/media/session/PlaybackState$Builder;
    .locals 1
    .param p1, "bufferedPosition"    # J

    .prologue
    .line 952
    iput-wide p1, p0, Landroid/media/session/PlaybackState$Builder;->mBufferedPosition:J

    .line 953
    return-object p0
.end method

.method public setErrorMessage(Ljava/lang/CharSequence;)Landroid/media/session/PlaybackState$Builder;
    .locals 0
    .param p1, "error"    # Ljava/lang/CharSequence;

    .prologue
    .line 976
    iput-object p1, p0, Landroid/media/session/PlaybackState$Builder;->mErrorMessage:Ljava/lang/CharSequence;

    .line 977
    return-object p0
.end method

.method public setExtras(Landroid/os/Bundle;)Landroid/media/session/PlaybackState$Builder;
    .locals 0
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 987
    iput-object p1, p0, Landroid/media/session/PlaybackState$Builder;->mExtras:Landroid/os/Bundle;

    .line 988
    return-object p0
.end method

.method public setState(IJF)Landroid/media/session/PlaybackState$Builder;
    .locals 8
    .param p1, "state"    # I
    .param p2, "position"    # J
    .param p4, "playbackSpeed"    # F

    .prologue
    .line 867
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move v4, p4

    invoke-virtual/range {v0 .. v6}, Landroid/media/session/PlaybackState$Builder;->setState(IJFJ)Landroid/media/session/PlaybackState$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setState(IJFJ)Landroid/media/session/PlaybackState$Builder;
    .locals 0
    .param p1, "state"    # I
    .param p2, "position"    # J
    .param p4, "playbackSpeed"    # F
    .param p5, "updateTime"    # J

    .prologue
    .line 830
    iput p1, p0, Landroid/media/session/PlaybackState$Builder;->mState:I

    .line 831
    iput-wide p2, p0, Landroid/media/session/PlaybackState$Builder;->mPosition:J

    .line 832
    iput-wide p5, p0, Landroid/media/session/PlaybackState$Builder;->mUpdateTime:J

    .line 833
    iput p4, p0, Landroid/media/session/PlaybackState$Builder;->mSpeed:F

    .line 834
    return-object p0
.end method
