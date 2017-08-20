.class Landroid/telecom/RemoteConnectionService$1;
.super Ljava/lang/Object;
.source "RemoteConnectionService.java"

# interfaces
.implements Lcom/android/internal/telecom/IConnectionServiceAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/telecom/RemoteConnectionService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/telecom/RemoteConnectionService;


# direct methods
.method constructor <init>(Landroid/telecom/RemoteConnectionService;)V
    .locals 0

    .prologue
    .line 52
    iput-object p1, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addConferenceCall(Ljava/lang/String;Landroid/telecom/ParcelableConference;)V
    .locals 5
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "parcel"    # Landroid/telecom/ParcelableConference;

    .prologue
    .line 202
    new-instance v1, Landroid/telecom/RemoteConference;

    iget-object v4, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mOutgoingConnectionServiceRpc:Lcom/android/internal/telecom/IConnectionService;
    invoke-static {v4}, Landroid/telecom/RemoteConnectionService;->access$600(Landroid/telecom/RemoteConnectionService;)Lcom/android/internal/telecom/IConnectionService;

    move-result-object v4

    invoke-direct {v1, p1, v4}, Landroid/telecom/RemoteConference;-><init>(Ljava/lang/String;Lcom/android/internal/telecom/IConnectionService;)V

    .line 205
    .local v1, "conference":Landroid/telecom/RemoteConference;
    invoke-virtual {p2}, Landroid/telecom/ParcelableConference;->getConnectionIds()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 206
    .local v3, "id":Ljava/lang/String;
    iget-object v4, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mConnectionById:Ljava/util/Map;
    invoke-static {v4}, Landroid/telecom/RemoteConnectionService;->access$300(Landroid/telecom/RemoteConnectionService;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telecom/RemoteConnection;

    .line 207
    .local v0, "c":Landroid/telecom/RemoteConnection;
    if-eqz v0, :cond_0

    .line 208
    invoke-virtual {v1, v0}, Landroid/telecom/RemoteConference;->addConnection(Landroid/telecom/RemoteConnection;)V

    goto :goto_0

    .line 212
    .end local v0    # "c":Landroid/telecom/RemoteConnection;
    .end local v3    # "id":Ljava/lang/String;
    :cond_1
    invoke-virtual {v1}, Landroid/telecom/RemoteConference;->getConnections()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_2

    .line 232
    :goto_1
    return-void

    .line 219
    :cond_2
    invoke-virtual {p2}, Landroid/telecom/ParcelableConference;->getState()I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/telecom/RemoteConference;->setState(I)V

    .line 220
    invoke-virtual {p2}, Landroid/telecom/ParcelableConference;->getConnectionCapabilities()I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/telecom/RemoteConference;->setConnectionCapabilities(I)V

    .line 221
    invoke-virtual {p2}, Landroid/telecom/ParcelableConference;->getConnectionProperties()I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/telecom/RemoteConference;->setConnectionProperties(I)V

    .line 222
    iget-object v4, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mConferenceById:Ljava/util/Map;
    invoke-static {v4}, Landroid/telecom/RemoteConnectionService;->access$700(Landroid/telecom/RemoteConnectionService;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    new-instance v4, Landroid/telecom/RemoteConnectionService$1$1;

    invoke-direct {v4, p0, p1}, Landroid/telecom/RemoteConnectionService$1$1;-><init>(Landroid/telecom/RemoteConnectionService$1;Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Landroid/telecom/RemoteConference;->registerCallback(Landroid/telecom/RemoteConference$Callback;)V

    .line 231
    iget-object v4, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mOurConnectionServiceImpl:Landroid/telecom/ConnectionService;
    invoke-static {v4}, Landroid/telecom/RemoteConnectionService;->access$900(Landroid/telecom/RemoteConnectionService;)Landroid/telecom/ConnectionService;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/telecom/ConnectionService;->addRemoteConference(Landroid/telecom/RemoteConference;)V

    goto :goto_1
.end method

.method public addExistingConnection(Ljava/lang/String;Landroid/telecom/ParcelableConnection;)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "connection"    # Landroid/telecom/ParcelableConnection;

    .prologue
    .line 330
    new-instance v0, Landroid/telecom/RemoteConnection;

    iget-object v1, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mOutgoingConnectionServiceRpc:Lcom/android/internal/telecom/IConnectionService;
    invoke-static {v1}, Landroid/telecom/RemoteConnectionService;->access$600(Landroid/telecom/RemoteConnectionService;)Lcom/android/internal/telecom/IConnectionService;

    move-result-object v1

    invoke-direct {v0, p1, v1, p2}, Landroid/telecom/RemoteConnection;-><init>(Ljava/lang/String;Lcom/android/internal/telecom/IConnectionService;Landroid/telecom/ParcelableConnection;)V

    .line 333
    .local v0, "remoteConnction":Landroid/telecom/RemoteConnection;
    iget-object v1, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mOurConnectionServiceImpl:Landroid/telecom/ConnectionService;
    invoke-static {v1}, Landroid/telecom/RemoteConnectionService;->access$900(Landroid/telecom/RemoteConnectionService;)Landroid/telecom/ConnectionService;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/telecom/ConnectionService;->addRemoteExistingConnection(Landroid/telecom/RemoteConnection;)V

    .line 334
    return-void
.end method

.method public asBinder()Landroid/os/IBinder;
    .locals 1

    .prologue
    .line 305
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public handleCreateConnectionComplete(Ljava/lang/String;Landroid/telecom/ConnectionRequest;Landroid/telecom/ParcelableConnection;)V
    .locals 7
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "request"    # Landroid/telecom/ConnectionRequest;
    .param p3, "parcel"    # Landroid/telecom/ParcelableConnection;

    .prologue
    const/4 v6, 0x6

    .line 58
    iget-object v4, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string v5, "handleCreateConnectionSuccessful"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v4, p1, v5}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v2

    .line 60
    .local v2, "connection":Landroid/telecom/RemoteConnection;
    # getter for: Landroid/telecom/RemoteConnectionService;->NULL_CONNECTION:Landroid/telecom/RemoteConnection;
    invoke-static {}, Landroid/telecom/RemoteConnectionService;->access$100()Landroid/telecom/RemoteConnection;

    move-result-object v4

    if-eq v2, v4, :cond_7

    iget-object v4, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mPendingConnections:Ljava/util/Set;
    invoke-static {v4}, Landroid/telecom/RemoteConnectionService;->access$200(Landroid/telecom/RemoteConnectionService;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 61
    iget-object v4, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mPendingConnections:Ljava/util/Set;
    invoke-static {v4}, Landroid/telecom/RemoteConnectionService;->access$200(Landroid/telecom/RemoteConnectionService;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 63
    invoke-virtual {p3}, Landroid/telecom/ParcelableConnection;->getConnectionCapabilities()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/telecom/RemoteConnection;->setConnectionCapabilities(I)V

    .line 64
    invoke-virtual {p3}, Landroid/telecom/ParcelableConnection;->getConnectionProperties()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/telecom/RemoteConnection;->setConnectionProperties(I)V

    .line 65
    invoke-virtual {p3}, Landroid/telecom/ParcelableConnection;->getHandle()Landroid/net/Uri;

    move-result-object v4

    if-nez v4, :cond_0

    invoke-virtual {p3}, Landroid/telecom/ParcelableConnection;->getState()I

    move-result v4

    if-eq v4, v6, :cond_1

    .line 67
    :cond_0
    invoke-virtual {p3}, Landroid/telecom/ParcelableConnection;->getHandle()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p3}, Landroid/telecom/ParcelableConnection;->getHandlePresentation()I

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/telecom/RemoteConnection;->setAddress(Landroid/net/Uri;I)V

    .line 69
    :cond_1
    invoke-virtual {p3}, Landroid/telecom/ParcelableConnection;->getCallerDisplayName()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_2

    invoke-virtual {p3}, Landroid/telecom/ParcelableConnection;->getState()I

    move-result v4

    if-eq v4, v6, :cond_3

    .line 71
    :cond_2
    invoke-virtual {p3}, Landroid/telecom/ParcelableConnection;->getCallerDisplayName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p3}, Landroid/telecom/ParcelableConnection;->getCallerDisplayNamePresentation()I

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/telecom/RemoteConnection;->setCallerDisplayName(Ljava/lang/String;I)V

    .line 76
    :cond_3
    invoke-virtual {p3}, Landroid/telecom/ParcelableConnection;->getState()I

    move-result v4

    if-ne v4, v6, :cond_5

    .line 77
    invoke-virtual {p3}, Landroid/telecom/ParcelableConnection;->getDisconnectCause()Landroid/telecom/DisconnectCause;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/telecom/RemoteConnection;->setDisconnected(Landroid/telecom/DisconnectCause;)V

    .line 81
    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .local v1, "conferenceable":Ljava/util/List;, "Ljava/util/List<Landroid/telecom/RemoteConnection;>;"
    invoke-virtual {p3}, Landroid/telecom/ParcelableConnection;->getConferenceableConnectionIds()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_4
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 83
    .local v0, "confId":Ljava/lang/String;
    iget-object v4, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mConnectionById:Ljava/util/Map;
    invoke-static {v4}, Landroid/telecom/RemoteConnectionService;->access$300(Landroid/telecom/RemoteConnectionService;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 84
    iget-object v4, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mConnectionById:Ljava/util/Map;
    invoke-static {v4}, Landroid/telecom/RemoteConnectionService;->access$300(Landroid/telecom/RemoteConnectionService;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 79
    .end local v0    # "confId":Ljava/lang/String;
    .end local v1    # "conferenceable":Ljava/util/List;, "Ljava/util/List<Landroid/telecom/RemoteConnection;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_5
    invoke-virtual {p3}, Landroid/telecom/ParcelableConnection;->getState()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/telecom/RemoteConnection;->setState(I)V

    goto :goto_0

    .line 87
    .restart local v1    # "conferenceable":Ljava/util/List;, "Ljava/util/List<Landroid/telecom/RemoteConnection;>;"
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_6
    invoke-virtual {v2, v1}, Landroid/telecom/RemoteConnection;->setConferenceableConnections(Ljava/util/List;)V

    .line 88
    invoke-virtual {p3}, Landroid/telecom/ParcelableConnection;->getVideoState()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/telecom/RemoteConnection;->setVideoState(I)V

    .line 89
    invoke-virtual {v2}, Landroid/telecom/RemoteConnection;->getState()I

    move-result v4

    if-ne v4, v6, :cond_7

    .line 92
    invoke-virtual {v2}, Landroid/telecom/RemoteConnection;->setDestroyed()V

    .line 95
    .end local v1    # "conferenceable":Ljava/util/List;, "Ljava/util/List<Landroid/telecom/RemoteConnection;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_7
    return-void
.end method

.method public onPostDialChar(Ljava/lang/String;C)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "nextChar"    # C

    .prologue
    .line 253
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "onPostDialChar"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/telecom/RemoteConnection;->onPostDialChar(C)V

    .line 255
    return-void
.end method

.method public onPostDialWait(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "remaining"    # Ljava/lang/String;

    .prologue
    .line 247
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "onPostDialWait"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/telecom/RemoteConnection;->setPostDialWait(Ljava/lang/String;)V

    .line 249
    return-void
.end method

.method public queryRemoteConnectionServices(Lcom/android/internal/telecom/RemoteServiceCallback;)V
    .locals 0
    .param p1, "callback"    # Lcom/android/internal/telecom/RemoteServiceCallback;

    .prologue
    .line 260
    return-void
.end method

.method public removeCall(Ljava/lang/String;)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;

    .prologue
    .line 236
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mConnectionById:Ljava/util/Map;
    invoke-static {v0}, Landroid/telecom/RemoteConnectionService;->access$300(Landroid/telecom/RemoteConnectionService;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 237
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "removeCall"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telecom/RemoteConnection;->setDestroyed()V

    .line 243
    :goto_0
    return-void

    .line 240
    :cond_0
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "removeCall"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConferenceForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$400(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telecom/RemoteConference;->setDestroyed()V

    goto :goto_0
.end method

.method public resetCdmaConnectionTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "callId"    # Ljava/lang/String;

    .prologue
    .line 349
    return-void
.end method

.method public setActive(Ljava/lang/String;)V
    .locals 3
    .param p1, "callId"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x4

    .line 99
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mConnectionById:Ljava/util/Map;
    invoke-static {v0}, Landroid/telecom/RemoteConnectionService;->access$300(Landroid/telecom/RemoteConnectionService;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 100
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setActive"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/telecom/RemoteConnection;->setState(I)V

    .line 106
    :goto_0
    return-void

    .line 103
    :cond_0
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setActive"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConferenceForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$400(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/telecom/RemoteConference;->setState(I)V

    goto :goto_0
.end method

.method public setAddress(Ljava/lang/String;Landroid/net/Uri;I)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "address"    # Landroid/net/Uri;
    .param p3, "presentation"    # I

    .prologue
    .line 292
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setAddress"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Landroid/telecom/RemoteConnection;->setAddress(Landroid/net/Uri;I)V

    .line 294
    return-void
.end method

.method public setCallerDisplayName(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "callerDisplayName"    # Ljava/lang/String;
    .param p3, "presentation"    # I

    .prologue
    .line 299
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setCallerDisplayName"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Landroid/telecom/RemoteConnection;->setCallerDisplayName(Ljava/lang/String;I)V

    .line 301
    return-void
.end method

.method public setConferenceMergeFailed(Ljava/lang/String;)V
    .locals 0
    .param p1, "callId"    # Ljava/lang/String;

    .prologue
    .line 196
    return-void
.end method

.method public final setConferenceableConnections(Ljava/lang/String;Ljava/util/List;)V
    .locals 5
    .param p1, "callId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 311
    .local p2, "conferenceableConnectionIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 312
    .local v0, "conferenceable":Ljava/util/List;, "Ljava/util/List<Landroid/telecom/RemoteConnection;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 313
    .local v2, "id":Ljava/lang/String;
    iget-object v3, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mConnectionById:Ljava/util/Map;
    invoke-static {v3}, Landroid/telecom/RemoteConnectionService;->access$300(Landroid/telecom/RemoteConnectionService;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 314
    iget-object v3, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mConnectionById:Ljava/util/Map;
    invoke-static {v3}, Landroid/telecom/RemoteConnectionService;->access$300(Landroid/telecom/RemoteConnectionService;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 318
    .end local v2    # "id":Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # invokes: Landroid/telecom/RemoteConnectionService;->hasConnection(Ljava/lang/String;)Z
    invoke-static {v3, p1}, Landroid/telecom/RemoteConnectionService;->access$1000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 319
    iget-object v3, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v4, "setConferenceableConnections"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v3, p1, v4}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/telecom/RemoteConnection;->setConferenceableConnections(Ljava/util/List;)V

    .line 325
    :goto_1
    return-void

    .line 322
    :cond_2
    iget-object v3, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v4, "setConferenceableConnections"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConferenceForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;
    invoke-static {v3, p1, v4}, Landroid/telecom/RemoteConnectionService;->access$400(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/telecom/RemoteConference;->setConferenceableConnections(Ljava/util/List;)V

    goto :goto_1
.end method

.method public setConnectionCapabilities(Ljava/lang/String;I)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "connectionCapabilities"    # I

    .prologue
    .line 150
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mConnectionById:Ljava/util/Map;
    invoke-static {v0}, Landroid/telecom/RemoteConnectionService;->access$300(Landroid/telecom/RemoteConnectionService;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setConnectionCapabilities"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/telecom/RemoteConnection;->setConnectionCapabilities(I)V

    .line 157
    :goto_0
    return-void

    .line 154
    :cond_0
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setConnectionCapabilities"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConferenceForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$400(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/telecom/RemoteConference;->setConnectionCapabilities(I)V

    goto :goto_0
.end method

.method public setConnectionProperties(Ljava/lang/String;I)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "connectionProperties"    # I

    .prologue
    .line 161
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mConnectionById:Ljava/util/Map;
    invoke-static {v0}, Landroid/telecom/RemoteConnectionService;->access$300(Landroid/telecom/RemoteConnectionService;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 162
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setConnectionProperties"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/telecom/RemoteConnection;->setConnectionProperties(I)V

    .line 168
    :goto_0
    return-void

    .line 165
    :cond_0
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setConnectionProperties"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConferenceForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$400(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/telecom/RemoteConference;->setConnectionProperties(I)V

    goto :goto_0
.end method

.method public setDialing(Ljava/lang/String;)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;

    .prologue
    .line 116
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setDialing"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/telecom/RemoteConnection;->setState(I)V

    .line 118
    return-void
.end method

.method public setDisconnected(Ljava/lang/String;Landroid/telecom/DisconnectCause;)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "disconnectCause"    # Landroid/telecom/DisconnectCause;

    .prologue
    .line 122
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mConnectionById:Ljava/util/Map;
    invoke-static {v0}, Landroid/telecom/RemoteConnectionService;->access$300(Landroid/telecom/RemoteConnectionService;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setDisconnected"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/telecom/RemoteConnection;->setDisconnected(Landroid/telecom/DisconnectCause;)V

    .line 129
    :goto_0
    return-void

    .line 126
    :cond_0
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setDisconnected"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConferenceForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$400(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/telecom/RemoteConference;->setDisconnected(Landroid/telecom/DisconnectCause;)V

    goto :goto_0
.end method

.method public setExtras(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 338
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mConnectionById:Ljava/util/Map;
    invoke-static {v0}, Landroid/telecom/RemoteConnectionService;->access$300(Landroid/telecom/RemoteConnectionService;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 339
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setExtras"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/telecom/RemoteConnection;->setExtras(Landroid/os/Bundle;)V

    .line 345
    :goto_0
    return-void

    .line 342
    :cond_0
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setExtras"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConferenceForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$400(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/telecom/RemoteConference;->setExtras(Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method public setIsConferenced(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "conferenceCallId"    # Ljava/lang/String;

    .prologue
    .line 173
    iget-object v2, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v3, "setIsConferenced"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v2, p1, v3}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v1

    .line 175
    .local v1, "connection":Landroid/telecom/RemoteConnection;
    # getter for: Landroid/telecom/RemoteConnectionService;->NULL_CONNECTION:Landroid/telecom/RemoteConnection;
    invoke-static {}, Landroid/telecom/RemoteConnectionService;->access$100()Landroid/telecom/RemoteConnection;

    move-result-object v2

    if-eq v1, v2, :cond_0

    .line 176
    if-nez p2, :cond_1

    .line 178
    invoke-virtual {v1}, Landroid/telecom/RemoteConnection;->getConference()Landroid/telecom/RemoteConference;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 179
    invoke-virtual {v1}, Landroid/telecom/RemoteConnection;->getConference()Landroid/telecom/RemoteConference;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/telecom/RemoteConference;->removeConnection(Landroid/telecom/RemoteConnection;)V

    .line 189
    :cond_0
    :goto_0
    return-void

    .line 182
    :cond_1
    iget-object v2, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v3, "setIsConferenced"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConferenceForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;
    invoke-static {v2, p2, v3}, Landroid/telecom/RemoteConnectionService;->access$400(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;

    move-result-object v0

    .line 184
    .local v0, "conference":Landroid/telecom/RemoteConference;
    # getter for: Landroid/telecom/RemoteConnectionService;->NULL_CONFERENCE:Landroid/telecom/RemoteConference;
    invoke-static {}, Landroid/telecom/RemoteConnectionService;->access$500()Landroid/telecom/RemoteConference;

    move-result-object v2

    if-eq v0, v2, :cond_0

    .line 185
    invoke-virtual {v0, v1}, Landroid/telecom/RemoteConference;->addConnection(Landroid/telecom/RemoteConnection;)V

    goto :goto_0
.end method

.method public setIsVoipAudioMode(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "isVoip"    # Z

    .prologue
    .line 280
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setIsVoipAudioMode"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/telecom/RemoteConnection;->setIsVoipAudioMode(Z)V

    .line 282
    return-void
.end method

.method public setOnHold(Ljava/lang/String;)V
    .locals 3
    .param p1, "callId"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x5

    .line 133
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    # getter for: Landroid/telecom/RemoteConnectionService;->mConnectionById:Ljava/util/Map;
    invoke-static {v0}, Landroid/telecom/RemoteConnectionService;->access$300(Landroid/telecom/RemoteConnectionService;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setOnHold"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/telecom/RemoteConnection;->setState(I)V

    .line 140
    :goto_0
    return-void

    .line 137
    :cond_0
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setOnHold"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConferenceForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$400(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConference;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/telecom/RemoteConference;->setState(I)V

    goto :goto_0
.end method

.method public setRingbackRequested(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "ringing"    # Z

    .prologue
    .line 144
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setRingbackRequested"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/telecom/RemoteConnection;->setRingbackRequested(Z)V

    .line 146
    return-void
.end method

.method public setRinging(Ljava/lang/String;)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;

    .prologue
    .line 110
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setRinging"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/telecom/RemoteConnection;->setState(I)V

    .line 112
    return-void
.end method

.method public setStatusHints(Ljava/lang/String;Landroid/telecom/StatusHints;)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "statusHints"    # Landroid/telecom/StatusHints;

    .prologue
    .line 286
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setStatusHints"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/telecom/RemoteConnection;->setStatusHints(Landroid/telecom/StatusHints;)V

    .line 288
    return-void
.end method

.method public setVideoProvider(Ljava/lang/String;Lcom/android/internal/telecom/IVideoProvider;)V
    .locals 3
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "videoProvider"    # Lcom/android/internal/telecom/IVideoProvider;

    .prologue
    .line 264
    const/4 v0, 0x0

    .line 265
    .local v0, "remoteVideoProvider":Landroid/telecom/RemoteConnection$VideoProvider;
    if-eqz p2, :cond_0

    .line 266
    new-instance v0, Landroid/telecom/RemoteConnection$VideoProvider;

    .end local v0    # "remoteVideoProvider":Landroid/telecom/RemoteConnection$VideoProvider;
    invoke-direct {v0, p2}, Landroid/telecom/RemoteConnection$VideoProvider;-><init>(Lcom/android/internal/telecom/IVideoProvider;)V

    .line 268
    .restart local v0    # "remoteVideoProvider":Landroid/telecom/RemoteConnection$VideoProvider;
    :cond_0
    iget-object v1, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v2, "setVideoProvider"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v1, p1, v2}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/telecom/RemoteConnection;->setVideoProvider(Landroid/telecom/RemoteConnection$VideoProvider;)V

    .line 270
    return-void
.end method

.method public setVideoState(Ljava/lang/String;I)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "videoState"    # I

    .prologue
    .line 274
    iget-object v0, p0, Landroid/telecom/RemoteConnectionService$1;->this$0:Landroid/telecom/RemoteConnectionService;

    const-string/jumbo v1, "setVideoState"

    # invokes: Landroid/telecom/RemoteConnectionService;->findConnectionForAction(Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;
    invoke-static {v0, p1, v1}, Landroid/telecom/RemoteConnectionService;->access$000(Landroid/telecom/RemoteConnectionService;Ljava/lang/String;Ljava/lang/String;)Landroid/telecom/RemoteConnection;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/telecom/RemoteConnection;->setVideoState(I)V

    .line 276
    return-void
.end method
