.class public abstract Lcom/android/ims/internal/IImsRegistrationListener$Stub;
.super Landroid/os/Binder;
.source "IImsRegistrationListener.java"

# interfaces
.implements Lcom/android/ims/internal/IImsRegistrationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/ims/internal/IImsRegistrationListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/ims/internal/IImsRegistrationListener$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.android.ims.internal.IImsRegistrationListener"

.field static final TRANSACTION_registrationConnected_0:I = 0x1

.field static final TRANSACTION_registrationConnected_8:I = 0x9

.field static final TRANSACTION_registrationDisconnected:I = 0x3

.field static final TRANSACTION_registrationFeatureCapabilityChanged:I = 0x7

.field static final TRANSACTION_registrationProgressing:I = 0x2

.field static final TRANSACTION_registrationProgressing_9:I = 0xa

.field static final TRANSACTION_registrationResumed:I = 0x4

.field static final TRANSACTION_registrationServiceCapabilityChanged:I = 0x6

.field static final TRANSACTION_registrationSuspended:I = 0x5

.field static final TRANSACTION_voiceMessageCountUpdate:I = 0x8


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 21
    const-string v0, "com.android.ims.internal.IImsRegistrationListener"

    invoke-virtual {p0, p0, v0}, Lcom/android/ims/internal/IImsRegistrationListener$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 22
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/android/ims/internal/IImsRegistrationListener;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .prologue
    .line 29
    if-nez p0, :cond_0

    .line 30
    const/4 v0, 0x0

    .line 36
    :goto_0
    return-object v0

    .line 32
    :cond_0
    const-string v1, "com.android.ims.internal.IImsRegistrationListener"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 33
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/android/ims/internal/IImsRegistrationListener;

    if-eqz v1, :cond_1

    .line 34
    check-cast v0, Lcom/android/ims/internal/IImsRegistrationListener;

    goto :goto_0

    .line 36
    :cond_1
    new-instance v0, Lcom/android/ims/internal/IImsRegistrationListener$Stub$Proxy;

    .end local v0    # "iin":Landroid/os/IInterface;
    invoke-direct {v0, p0}, Lcom/android/ims/internal/IImsRegistrationListener$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    goto :goto_0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .prologue
    .line 40
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

    .line 44
    sparse-switch p1, :sswitch_data_0

    .line 145
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v3

    :goto_0
    return v3

    .line 48
    :sswitch_0
    const-string v4, "com.android.ims.internal.IImsRegistrationListener"

    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_0

    .line 53
    :sswitch_1
    const-string v4, "com.android.ims.internal.IImsRegistrationListener"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 55
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 56
    .local v0, "_arg0":I
    invoke-virtual {p0, v0}, Lcom/android/ims/internal/IImsRegistrationListener$Stub;->registrationConnected(I)V

    .line 57
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 62
    .end local v0    # "_arg0":I
    :sswitch_2
    const-string v4, "com.android.ims.internal.IImsRegistrationListener"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 64
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 65
    .restart local v0    # "_arg0":I
    invoke-virtual {p0, v0}, Lcom/android/ims/internal/IImsRegistrationListener$Stub;->registrationProgressing(I)V

    .line 66
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 71
    .end local v0    # "_arg0":I
    :sswitch_3
    const-string v4, "com.android.ims.internal.IImsRegistrationListener"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 73
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_0

    .line 74
    sget-object v4, Lcom/android/ims/ImsReasonInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/ims/ImsReasonInfo;

    .line 79
    .local v0, "_arg0":Lcom/android/ims/ImsReasonInfo;
    :goto_1
    invoke-virtual {p0, v0}, Lcom/android/ims/internal/IImsRegistrationListener$Stub;->registrationDisconnected(Lcom/android/ims/ImsReasonInfo;)V

    .line 80
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 77
    .end local v0    # "_arg0":Lcom/android/ims/ImsReasonInfo;
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Lcom/android/ims/ImsReasonInfo;
    goto :goto_1

    .line 85
    .end local v0    # "_arg0":Lcom/android/ims/ImsReasonInfo;
    :sswitch_4
    const-string v4, "com.android.ims.internal.IImsRegistrationListener"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 86
    invoke-virtual {p0}, Lcom/android/ims/internal/IImsRegistrationListener$Stub;->registrationResumed()V

    .line 87
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 92
    :sswitch_5
    const-string v4, "com.android.ims.internal.IImsRegistrationListener"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 93
    invoke-virtual {p0}, Lcom/android/ims/internal/IImsRegistrationListener$Stub;->registrationSuspended()V

    .line 94
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 99
    :sswitch_6
    const-string v4, "com.android.ims.internal.IImsRegistrationListener"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 101
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 103
    .local v0, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 104
    .local v1, "_arg1":I
    invoke-virtual {p0, v0, v1}, Lcom/android/ims/internal/IImsRegistrationListener$Stub;->registrationServiceCapabilityChanged(II)V

    .line 105
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 110
    .end local v0    # "_arg0":I
    .end local v1    # "_arg1":I
    :sswitch_7
    const-string v4, "com.android.ims.internal.IImsRegistrationListener"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 112
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 114
    .restart local v0    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v1

    .line 116
    .local v1, "_arg1":[I
    invoke-virtual {p2}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v2

    .line 117
    .local v2, "_arg2":[I
    invoke-virtual {p0, v0, v1, v2}, Lcom/android/ims/internal/IImsRegistrationListener$Stub;->registrationFeatureCapabilityChanged(I[I[I)V

    .line 118
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 123
    .end local v0    # "_arg0":I
    .end local v1    # "_arg1":[I
    .end local v2    # "_arg2":[I
    :sswitch_8
    const-string v4, "com.android.ims.internal.IImsRegistrationListener"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 125
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 126
    .restart local v0    # "_arg0":I
    invoke-virtual {p0, v0}, Lcom/android/ims/internal/IImsRegistrationListener$Stub;->voiceMessageCountUpdate(I)V

    .line 127
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 132
    .end local v0    # "_arg0":I
    :sswitch_9
    const-string v4, "com.android.ims.internal.IImsRegistrationListener"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 133
    invoke-virtual {p0}, Lcom/android/ims/internal/IImsRegistrationListener$Stub;->registrationConnected()V

    .line 134
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 139
    :sswitch_a
    const-string v4, "com.android.ims.internal.IImsRegistrationListener"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 140
    invoke-virtual {p0}, Lcom/android/ims/internal/IImsRegistrationListener$Stub;->registrationProgressing()V

    .line 141
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 44
    nop

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
        0xa -> :sswitch_a
        0x5f4e5446 -> :sswitch_0
    .end sparse-switch
.end method
