.class public final enum Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;
.super Ljava/lang/Enum;
.source "CarrierAppUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/CarrierAppUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CARRIER"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;

.field public static final enum TELEPHONY_CARRIER_ONE:Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 47
    new-instance v0, Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;

    const-string v1, "TELEPHONY_CARRIER_ONE"

    invoke-direct {v0, v1, v2}, Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;->TELEPHONY_CARRIER_ONE:Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;

    .line 46
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;

    sget-object v1, Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;->TELEPHONY_CARRIER_ONE:Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;

    aput-object v1, v0, v2

    sput-object v0, Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;->$VALUES:[Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 46
    const-class v0, Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;

    return-object v0
.end method

.method public static values()[Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;->$VALUES:[Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;

    invoke-virtual {v0}, [Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/internal/telephony/CarrierAppUtils$CARRIER;

    return-object v0
.end method
