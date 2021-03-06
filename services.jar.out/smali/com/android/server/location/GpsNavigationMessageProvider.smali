.class public abstract Lcom/android/server/location/GpsNavigationMessageProvider;
.super Lcom/android/server/location/RemoteListenerHelper;
.source "GpsNavigationMessageProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/location/GpsNavigationMessageProvider$StatusChangedOperation;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/server/location/RemoteListenerHelper",
        "<",
        "Landroid/location/IGpsNavigationMessageListener;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "GpsNavigationMessageProvider"


# direct methods
.method protected constructor <init>(Landroid/os/Handler;)V
    .locals 1
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 37
    const-string v0, "GpsNavigationMessageProvider"

    invoke-direct {p0, p1, v0}, Lcom/android/server/location/RemoteListenerHelper;-><init>(Landroid/os/Handler;Ljava/lang/String;)V

    .line 38
    return-void
.end method


# virtual methods
.method protected getHandlerOperation(I)Lcom/android/server/location/RemoteListenerHelper$ListenerOperation;
    .locals 5
    .param p1, "result"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/android/server/location/RemoteListenerHelper$ListenerOperation",
            "<",
            "Landroid/location/IGpsNavigationMessageListener;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 66
    packed-switch p1, :pswitch_data_0

    .line 81
    const-string v2, "GpsNavigationMessageProvider"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unhandled addListener result: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    :goto_0
    :pswitch_0
    return-object v1

    .line 68
    :pswitch_1
    sget v0, Landroid/location/GpsNavigationMessageEvent;->STATUS_READY:I

    .line 84
    .local v0, "status":I
    :goto_1
    new-instance v1, Lcom/android/server/location/GpsNavigationMessageProvider$StatusChangedOperation;

    invoke-direct {v1, v0}, Lcom/android/server/location/GpsNavigationMessageProvider$StatusChangedOperation;-><init>(I)V

    goto :goto_0

    .line 73
    .end local v0    # "status":I
    :pswitch_2
    sget v0, Landroid/location/GpsNavigationMessageEvent;->STATUS_NOT_SUPPORTED:I

    .line 74
    .restart local v0    # "status":I
    goto :goto_1

    .line 76
    .end local v0    # "status":I
    :pswitch_3
    sget v0, Landroid/location/GpsNavigationMessageEvent;->STATUS_GPS_LOCATION_DISABLED:I

    .line 77
    .restart local v0    # "status":I
    goto :goto_1

    .line 66
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public onCapabilitiesUpdated(Z)V
    .locals 0
    .param p1, "isGpsNavigationMessageSupported"    # Z

    .prologue
    .line 53
    invoke-virtual {p0, p1}, Lcom/android/server/location/GpsNavigationMessageProvider;->setSupported(Z)V

    .line 54
    invoke-virtual {p0}, Lcom/android/server/location/GpsNavigationMessageProvider;->updateResult()V

    .line 55
    return-void
.end method

.method public onGpsEnabledChanged()V
    .locals 1

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/android/server/location/GpsNavigationMessageProvider;->tryUpdateRegistrationWithService()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 59
    invoke-virtual {p0}, Lcom/android/server/location/GpsNavigationMessageProvider;->updateResult()V

    .line 61
    :cond_0
    return-void
.end method

.method public onNavigationMessageAvailable(Landroid/location/GpsNavigationMessageEvent;)V
    .locals 1
    .param p1, "event"    # Landroid/location/GpsNavigationMessageEvent;

    .prologue
    .line 41
    new-instance v0, Lcom/android/server/location/GpsNavigationMessageProvider$1;

    invoke-direct {v0, p0, p1}, Lcom/android/server/location/GpsNavigationMessageProvider$1;-><init>(Lcom/android/server/location/GpsNavigationMessageProvider;Landroid/location/GpsNavigationMessageEvent;)V

    .line 49
    .local v0, "operation":Lcom/android/server/location/RemoteListenerHelper$ListenerOperation;, "Lcom/android/server/location/RemoteListenerHelper$ListenerOperation<Landroid/location/IGpsNavigationMessageListener;>;"
    invoke-virtual {p0, v0}, Lcom/android/server/location/GpsNavigationMessageProvider;->foreach(Lcom/android/server/location/RemoteListenerHelper$ListenerOperation;)V

    .line 50
    return-void
.end method
