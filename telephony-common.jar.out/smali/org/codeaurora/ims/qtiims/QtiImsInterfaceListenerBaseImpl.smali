.class public Lorg/codeaurora/ims/qtiims/QtiImsInterfaceListenerBaseImpl;
.super Lorg/codeaurora/ims/qtiims/IQtiImsInterfaceListener$Stub;
.source "QtiImsInterfaceListenerBaseImpl.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/codeaurora/ims/qtiims/IQtiImsInterfaceListener$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public notifyRefreshViceInfo(Lorg/codeaurora/ims/qtiims/QtiViceInfo;)V
    .locals 0
    .param p1, "viceInfo"    # Lorg/codeaurora/ims/qtiims/QtiViceInfo;

    .prologue
    .line 64
    return-void
.end method

.method public notifySsacStatus(Z)V
    .locals 0
    .param p1, "ssacStatusResponse"    # Z

    .prologue
    .line 76
    return-void
.end method

.method public notifyVopsStatus(Z)V
    .locals 0
    .param p1, "vopsStatus"    # Z

    .prologue
    .line 72
    return-void
.end method

.method public onGetCallForwardUncondTimer(IIIIIILjava/lang/String;I)V
    .locals 0
    .param p1, "startHour"    # I
    .param p2, "endHour"    # I
    .param p3, "startMinute"    # I
    .param p4, "endMinute"    # I
    .param p5, "reason"    # I
    .param p6, "status"    # I
    .param p7, "number"    # Ljava/lang/String;
    .param p8, "service"    # I

    .prologue
    .line 44
    return-void
.end method

.method public onGetPacketCount(IJ)V
    .locals 0
    .param p1, "status"    # I
    .param p2, "packetCount"    # J

    .prologue
    .line 52
    return-void
.end method

.method public onGetPacketErrorCount(IJ)V
    .locals 0
    .param p1, "status"    # I
    .param p2, "packetErrorCount"    # J

    .prologue
    .line 56
    return-void
.end method

.method public onSetCallForwardUncondTimer(I)V
    .locals 0
    .param p1, "status"    # I

    .prologue
    .line 39
    return-void
.end method

.method public onUTReqFailed(ILjava/lang/String;)V
    .locals 0
    .param p1, "errCode"    # I
    .param p2, "errString"    # Ljava/lang/String;

    .prologue
    .line 48
    return-void
.end method

.method public receiveCallDeflectResponse(I)V
    .locals 0
    .param p1, "result"    # I

    .prologue
    .line 60
    return-void
.end method

.method public receiveCallTransferResponse(I)V
    .locals 0
    .param p1, "result"    # I

    .prologue
    .line 68
    return-void
.end method
