.class Lcom/android/server/audio/AudioService$SetModeDeathHandler;
.super Ljava/lang/Object;
.source "AudioService.java"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/audio/AudioService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetModeDeathHandler"
.end annotation


# instance fields
.field private mCb:Landroid/os/IBinder;

.field private mMode:I

.field private mPid:I

.field final synthetic this$0:Lcom/android/server/audio/AudioService;


# direct methods
.method constructor <init>(Lcom/android/server/audio/AudioService;Landroid/os/IBinder;I)V
    .locals 1
    .param p2, "cb"    # Landroid/os/IBinder;
    .param p3, "pid"    # I

    .prologue
    .line 2265
    iput-object p1, p0, Lcom/android/server/audio/AudioService$SetModeDeathHandler;->this$0:Lcom/android/server/audio/AudioService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2263
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/audio/AudioService$SetModeDeathHandler;->mMode:I

    .line 2266
    iput-object p2, p0, Lcom/android/server/audio/AudioService$SetModeDeathHandler;->mCb:Landroid/os/IBinder;

    .line 2267
    iput p3, p0, Lcom/android/server/audio/AudioService$SetModeDeathHandler;->mPid:I

    .line 2268
    return-void
.end method

.method static synthetic access$1600(Lcom/android/server/audio/AudioService$SetModeDeathHandler;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/server/audio/AudioService$SetModeDeathHandler;

    .prologue
    .line 2260
    iget v0, p0, Lcom/android/server/audio/AudioService$SetModeDeathHandler;->mPid:I

    return v0
.end method


# virtual methods
.method public binderDied()V
    .locals 10

    .prologue
    .line 2271
    const/4 v3, 0x0

    .line 2272
    .local v3, "newModeOwnerPid":I
    iget-object v4, p0, Lcom/android/server/audio/AudioService$SetModeDeathHandler;->this$0:Lcom/android/server/audio/AudioService;

    # getter for: Lcom/android/server/audio/AudioService;->mSetModeDeathHandlers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/android/server/audio/AudioService;->access$1300(Lcom/android/server/audio/AudioService;)Ljava/util/ArrayList;

    move-result-object v5

    monitor-enter v5

    .line 2273
    :try_start_0
    const-string v4, "AudioService"

    const-string v6, "setMode() client died"

    invoke-static {v4, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2274
    iget-object v4, p0, Lcom/android/server/audio/AudioService$SetModeDeathHandler;->this$0:Lcom/android/server/audio/AudioService;

    # getter for: Lcom/android/server/audio/AudioService;->mSetModeDeathHandlers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/android/server/audio/AudioService;->access$1300(Lcom/android/server/audio/AudioService;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    .line 2275
    .local v2, "index":I
    if-gez v2, :cond_1

    .line 2276
    const-string v4, "AudioService"

    const-string v6, "unregistered setMode() client died"

    invoke-static {v4, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2280
    :goto_0
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2283
    if-eqz v3, :cond_0

    .line 2284
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 2285
    .local v0, "ident":J
    iget-object v4, p0, Lcom/android/server/audio/AudioService$SetModeDeathHandler;->this$0:Lcom/android/server/audio/AudioService;

    # invokes: Lcom/android/server/audio/AudioService;->disconnectBluetoothSco(I)V
    invoke-static {v4, v3}, Lcom/android/server/audio/AudioService;->access$1500(Lcom/android/server/audio/AudioService;I)V

    .line 2286
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 2288
    .end local v0    # "ident":J
    :cond_0
    return-void

    .line 2278
    :cond_1
    :try_start_1
    iget-object v4, p0, Lcom/android/server/audio/AudioService$SetModeDeathHandler;->this$0:Lcom/android/server/audio/AudioService;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/android/server/audio/AudioService$SetModeDeathHandler;->mCb:Landroid/os/IBinder;

    iget v8, p0, Lcom/android/server/audio/AudioService$SetModeDeathHandler;->mPid:I

    const-string v9, "AudioService"

    # invokes: Lcom/android/server/audio/AudioService;->setModeInt(ILandroid/os/IBinder;ILjava/lang/String;)I
    invoke-static {v4, v6, v7, v8, v9}, Lcom/android/server/audio/AudioService;->access$1400(Lcom/android/server/audio/AudioService;ILandroid/os/IBinder;ILjava/lang/String;)I

    move-result v3

    goto :goto_0

    .line 2280
    .end local v2    # "index":I
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4
.end method

.method public getBinder()Landroid/os/IBinder;
    .locals 1

    .prologue
    .line 2303
    iget-object v0, p0, Lcom/android/server/audio/AudioService$SetModeDeathHandler;->mCb:Landroid/os/IBinder;

    return-object v0
.end method

.method public getMode()I
    .locals 1

    .prologue
    .line 2299
    iget v0, p0, Lcom/android/server/audio/AudioService$SetModeDeathHandler;->mMode:I

    return v0
.end method

.method public getPid()I
    .locals 1

    .prologue
    .line 2291
    iget v0, p0, Lcom/android/server/audio/AudioService$SetModeDeathHandler;->mPid:I

    return v0
.end method

.method public setMode(I)V
    .locals 0
    .param p1, "mode"    # I

    .prologue
    .line 2295
    iput p1, p0, Lcom/android/server/audio/AudioService$SetModeDeathHandler;->mMode:I

    .line 2296
    return-void
.end method
