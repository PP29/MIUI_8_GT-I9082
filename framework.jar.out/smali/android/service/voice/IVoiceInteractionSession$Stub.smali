.class public abstract Landroid/service/voice/IVoiceInteractionSession$Stub;
.super Landroid/os/Binder;
.source "IVoiceInteractionSession.java"

# interfaces
.implements Landroid/service/voice/IVoiceInteractionSession;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/service/voice/IVoiceInteractionSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/service/voice/IVoiceInteractionSession$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "android.service.voice.IVoiceInteractionSession"

.field static final TRANSACTION_closeSystemDialogs:I = 0x7

.field static final TRANSACTION_destroy:I = 0x9

.field static final TRANSACTION_handleAssist:I = 0x3

.field static final TRANSACTION_handleScreenshot:I = 0x4

.field static final TRANSACTION_hide:I = 0x2

.field static final TRANSACTION_onLockscreenShown:I = 0x8

.field static final TRANSACTION_show:I = 0x1

.field static final TRANSACTION_taskFinished:I = 0x6

.field static final TRANSACTION_taskStarted:I = 0x5


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 18
    const-string v0, "android.service.voice.IVoiceInteractionSession"

    invoke-virtual {p0, p0, v0}, Landroid/service/voice/IVoiceInteractionSession$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 19
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Landroid/service/voice/IVoiceInteractionSession;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .prologue
    .line 26
    if-nez p0, :cond_0

    .line 27
    const/4 v0, 0x0

    .line 33
    :goto_0
    return-object v0

    .line 29
    :cond_0
    const-string v1, "android.service.voice.IVoiceInteractionSession"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 30
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/service/voice/IVoiceInteractionSession;

    if-eqz v1, :cond_1

    .line 31
    check-cast v0, Landroid/service/voice/IVoiceInteractionSession;

    goto :goto_0

    .line 33
    :cond_1
    new-instance v0, Landroid/service/voice/IVoiceInteractionSession$Stub$Proxy;

    .end local v0    # "iin":Landroid/os/IInterface;
    invoke-direct {v0, p0}, Landroid/service/voice/IVoiceInteractionSession$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    goto :goto_0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .prologue
    .line 37
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 5
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 41
    sparse-switch p1, :sswitch_data_0

    .line 160
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v3

    :goto_0
    return v3

    .line 45
    :sswitch_0
    const-string v4, "android.service.voice.IVoiceInteractionSession"

    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_0

    .line 50
    :sswitch_1
    const-string v4, "android.service.voice.IVoiceInteractionSession"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 52
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_0

    .line 53
    sget-object v4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    .line 59
    .local v0, "_arg0":Landroid/os/Bundle;
    :goto_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 61
    .local v1, "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/app/IVoiceInteractionSessionShowCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/app/IVoiceInteractionSessionShowCallback;

    move-result-object v2

    .line 62
    .local v2, "_arg2":Lcom/android/internal/app/IVoiceInteractionSessionShowCallback;
    invoke-virtual {p0, v0, v1, v2}, Landroid/service/voice/IVoiceInteractionSession$Stub;->show(Landroid/os/Bundle;ILcom/android/internal/app/IVoiceInteractionSessionShowCallback;)V

    goto :goto_0

    .line 56
    .end local v0    # "_arg0":Landroid/os/Bundle;
    .end local v1    # "_arg1":I
    .end local v2    # "_arg2":Lcom/android/internal/app/IVoiceInteractionSessionShowCallback;
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Landroid/os/Bundle;
    goto :goto_1

    .line 67
    .end local v0    # "_arg0":Landroid/os/Bundle;
    :sswitch_2
    const-string v4, "android.service.voice.IVoiceInteractionSession"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 68
    invoke-virtual {p0}, Landroid/service/voice/IVoiceInteractionSession$Stub;->hide()V

    goto :goto_0

    .line 73
    :sswitch_3
    const-string v4, "android.service.voice.IVoiceInteractionSession"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 75
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_1

    .line 76
    sget-object v4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    .line 82
    .restart local v0    # "_arg0":Landroid/os/Bundle;
    :goto_2
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_2

    .line 83
    sget-object v4, Landroid/app/assist/AssistStructure;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/assist/AssistStructure;

    .line 89
    .local v1, "_arg1":Landroid/app/assist/AssistStructure;
    :goto_3
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_3

    .line 90
    sget-object v4, Landroid/app/assist/AssistContent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/assist/AssistContent;

    .line 95
    .local v2, "_arg2":Landroid/app/assist/AssistContent;
    :goto_4
    invoke-virtual {p0, v0, v1, v2}, Landroid/service/voice/IVoiceInteractionSession$Stub;->handleAssist(Landroid/os/Bundle;Landroid/app/assist/AssistStructure;Landroid/app/assist/AssistContent;)V

    goto :goto_0

    .line 79
    .end local v0    # "_arg0":Landroid/os/Bundle;
    .end local v1    # "_arg1":Landroid/app/assist/AssistStructure;
    .end local v2    # "_arg2":Landroid/app/assist/AssistContent;
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Landroid/os/Bundle;
    goto :goto_2

    .line 86
    :cond_2
    const/4 v1, 0x0

    .restart local v1    # "_arg1":Landroid/app/assist/AssistStructure;
    goto :goto_3

    .line 93
    :cond_3
    const/4 v2, 0x0

    .restart local v2    # "_arg2":Landroid/app/assist/AssistContent;
    goto :goto_4

    .line 100
    .end local v0    # "_arg0":Landroid/os/Bundle;
    .end local v1    # "_arg1":Landroid/app/assist/AssistStructure;
    .end local v2    # "_arg2":Landroid/app/assist/AssistContent;
    :sswitch_4
    const-string v4, "android.service.voice.IVoiceInteractionSession"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 102
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_4

    .line 103
    sget-object v4, Landroid/graphics/Bitmap;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 108
    .local v0, "_arg0":Landroid/graphics/Bitmap;
    :goto_5
    invoke-virtual {p0, v0}, Landroid/service/voice/IVoiceInteractionSession$Stub;->handleScreenshot(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 106
    .end local v0    # "_arg0":Landroid/graphics/Bitmap;
    :cond_4
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Landroid/graphics/Bitmap;
    goto :goto_5

    .line 113
    .end local v0    # "_arg0":Landroid/graphics/Bitmap;
    :sswitch_5
    const-string v4, "android.service.voice.IVoiceInteractionSession"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 115
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_5

    .line 116
    sget-object v4, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    .line 122
    .local v0, "_arg0":Landroid/content/Intent;
    :goto_6
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 123
    .local v1, "_arg1":I
    invoke-virtual {p0, v0, v1}, Landroid/service/voice/IVoiceInteractionSession$Stub;->taskStarted(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 119
    .end local v0    # "_arg0":Landroid/content/Intent;
    .end local v1    # "_arg1":I
    :cond_5
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Landroid/content/Intent;
    goto :goto_6

    .line 128
    .end local v0    # "_arg0":Landroid/content/Intent;
    :sswitch_6
    const-string v4, "android.service.voice.IVoiceInteractionSession"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 130
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_6

    .line 131
    sget-object v4, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    .line 137
    .restart local v0    # "_arg0":Landroid/content/Intent;
    :goto_7
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 138
    .restart local v1    # "_arg1":I
    invoke-virtual {p0, v0, v1}, Landroid/service/voice/IVoiceInteractionSession$Stub;->taskFinished(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 134
    .end local v0    # "_arg0":Landroid/content/Intent;
    .end local v1    # "_arg1":I
    :cond_6
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Landroid/content/Intent;
    goto :goto_7

    .line 143
    .end local v0    # "_arg0":Landroid/content/Intent;
    :sswitch_7
    const-string v4, "android.service.voice.IVoiceInteractionSession"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 144
    invoke-virtual {p0}, Landroid/service/voice/IVoiceInteractionSession$Stub;->closeSystemDialogs()V

    goto/16 :goto_0

    .line 149
    :sswitch_8
    const-string v4, "android.service.voice.IVoiceInteractionSession"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 150
    invoke-virtual {p0}, Landroid/service/voice/IVoiceInteractionSession$Stub;->onLockscreenShown()V

    goto/16 :goto_0

    .line 155
    :sswitch_9
    const-string v4, "android.service.voice.IVoiceInteractionSession"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 156
    invoke-virtual {p0}, Landroid/service/voice/IVoiceInteractionSession$Stub;->destroy()V

    goto/16 :goto_0

    .line 41
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x5 -> :sswitch_5
        0x6 -> :sswitch_6
        0x7 -> :sswitch_7
        0x8 -> :sswitch_8
        0x9 -> :sswitch_9
        0x5f4e5446 -> :sswitch_0
    .end sparse-switch
.end method
