.class public Lcom/android/internal/telephony/WapPushOverSms;
.super Ljava/lang/Object;
.source "WapPushOverSms.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# static fields
.field private static final DBG:Z = false

.field private static final LOCATION_SELECTION:Ljava/lang/String; = "m_type=? AND ct_l =?"

.field private static final TAG:Ljava/lang/String; = "WAP PUSH"

.field private static final THREAD_ID_SELECTION:Ljava/lang/String; = "m_id=? AND m_type=?"


# instance fields
.field private final mContext:Landroid/content/Context;

.field mDeviceIdleController:Landroid/os/IDeviceIdleController;

.field private volatile mWapPushManager:Lcom/android/internal/telephony/IWapPushManager;

.field private mWapPushManagerPackage:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput-object p1, p0, Lcom/android/internal/telephony/WapPushOverSms;->mContext:Landroid/content/Context;

    .line 92
    const-string v2, "deviceidle"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/os/IDeviceIdleController$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IDeviceIdleController;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/telephony/WapPushOverSms;->mDeviceIdleController:Landroid/os/IDeviceIdleController;

    .line 94
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/android/internal/telephony/IWapPushManager;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 95
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->resolveSystemService(Landroid/content/pm/PackageManager;I)Landroid/content/ComponentName;

    move-result-object v0

    .line 96
    .local v0, "comp":Landroid/content/ComponentName;
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 97
    if-eqz v0, :cond_0

    const/4 v2, 0x1

    invoke-virtual {p1, v1, p0, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 98
    :cond_0
    const-string v2, "WAP PUSH"

    const-string v3, "bindService() for wappush manager failed"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    :goto_0
    return-void

    .line 100
    :cond_1
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/telephony/WapPushOverSms;->mWapPushManagerPackage:Ljava/lang/String;

    goto :goto_0
.end method

.method private static getDeliveryOrReadReportThreadId(Landroid/content/Context;Lcom/google/android/mms/pdu/GenericPdu;)J
    .locals 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "pdu"    # Lcom/google/android/mms/pdu/GenericPdu;

    .prologue
    const-wide/16 v10, -0x1

    .line 444
    instance-of v0, p1, Lcom/google/android/mms/pdu/DeliveryInd;

    if-eqz v0, :cond_1

    .line 445
    new-instance v9, Ljava/lang/String;

    check-cast p1, Lcom/google/android/mms/pdu/DeliveryInd;

    .end local p1    # "pdu":Lcom/google/android/mms/pdu/GenericPdu;
    invoke-virtual {p1}, Lcom/google/android/mms/pdu/DeliveryInd;->getMessageId()[B

    move-result-object v0

    invoke-direct {v9, v0}, Ljava/lang/String;-><init>([B)V

    .line 453
    .local v9, "messageId":Ljava/lang/String;
    :goto_0
    const/4 v7, 0x0

    .line 455
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/Telephony$Mms;->CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v4, "thread_id"

    aput-object v4, v3, v0

    const-string v4, "m_id=? AND m_type=?"

    const/4 v0, 0x2

    new-array v5, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {v9}, Landroid/database/DatabaseUtils;->sqlEscapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v0

    const/4 v0, 0x1

    const/16 v6, 0x80

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v0

    const/4 v6, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Landroid/database/sqlite/SqliteWrapper;->query(Landroid/content/Context;Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 466
    if-eqz v7, :cond_3

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 467
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v0

    .line 472
    if-eqz v7, :cond_0

    .line 473
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 476
    .end local v7    # "cursor":Landroid/database/Cursor;
    .end local v9    # "messageId":Ljava/lang/String;
    :cond_0
    :goto_1
    return-wide v0

    .line 446
    .restart local p1    # "pdu":Lcom/google/android/mms/pdu/GenericPdu;
    :cond_1
    instance-of v0, p1, Lcom/google/android/mms/pdu/ReadOrigInd;

    if-eqz v0, :cond_2

    .line 447
    new-instance v9, Ljava/lang/String;

    check-cast p1, Lcom/google/android/mms/pdu/ReadOrigInd;

    .end local p1    # "pdu":Lcom/google/android/mms/pdu/GenericPdu;
    invoke-virtual {p1}, Lcom/google/android/mms/pdu/ReadOrigInd;->getMessageId()[B

    move-result-object v0

    invoke-direct {v9, v0}, Ljava/lang/String;-><init>([B)V

    .restart local v9    # "messageId":Ljava/lang/String;
    goto :goto_0

    .line 449
    .end local v9    # "messageId":Ljava/lang/String;
    .restart local p1    # "pdu":Lcom/google/android/mms/pdu/GenericPdu;
    :cond_2
    const-string v0, "WAP PUSH"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "WAP Push data is neither delivery or read report type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-wide v0, v10

    .line 451
    goto :goto_1

    .line 472
    .end local p1    # "pdu":Lcom/google/android/mms/pdu/GenericPdu;
    .restart local v7    # "cursor":Landroid/database/Cursor;
    .restart local v9    # "messageId":Ljava/lang/String;
    :cond_3
    if-eqz v7, :cond_4

    .line 473
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_4
    :goto_2
    move-wide v0, v10

    .line 476
    goto :goto_1

    .line 469
    :catch_0
    move-exception v8

    .line 470
    .local v8, "e":Landroid/database/sqlite/SQLiteException;
    :try_start_1
    const-string v0, "WAP PUSH"

    const-string v1, "Failed to query delivery or read report thread id"

    invoke-static {v0, v1, v8}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 472
    if-eqz v7, :cond_4

    .line 473
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_2

    .line 472
    .end local v8    # "e":Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v0

    if-eqz v7, :cond_5

    .line 473
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_5
    throw v0
.end method

.method private static isDuplicateNotification(Landroid/content/Context;Lcom/google/android/mms/pdu/NotificationInd;)Z
    .locals 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "nInd"    # Lcom/google/android/mms/pdu/NotificationInd;

    .prologue
    const/4 v12, 0x1

    const/4 v13, 0x0

    .line 483
    invoke-virtual {p1}, Lcom/google/android/mms/pdu/NotificationInd;->getContentLocation()[B

    move-result-object v10

    .line 484
    .local v10, "rawLocation":[B
    if-eqz v10, :cond_2

    .line 485
    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, v10}, Ljava/lang/String;-><init>([B)V

    .line 486
    .local v9, "location":Ljava/lang/String;
    new-array v11, v12, [Ljava/lang/String;

    aput-object v9, v11, v13

    .line 487
    .local v11, "selectionArgs":[Ljava/lang/String;
    const/4 v7, 0x0

    .line 489
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/Telephony$Mms;->CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v4, "_id"

    aput-object v4, v3, v0

    const-string v4, "m_type=? AND ct_l =?"

    const/4 v0, 0x2

    new-array v5, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const/16 v6, 0x82

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v0

    const/4 v0, 0x1

    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v10}, Ljava/lang/String;-><init>([B)V

    aput-object v6, v5, v0

    const/4 v6, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Landroid/database/sqlite/SqliteWrapper;->query(Landroid/content/Context;Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 500
    if-eqz v7, :cond_1

    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-lez v0, :cond_1

    .line 507
    if-eqz v7, :cond_0

    .line 508
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_0
    move v0, v12

    .line 512
    .end local v7    # "cursor":Landroid/database/Cursor;
    .end local v9    # "location":Ljava/lang/String;
    .end local v11    # "selectionArgs":[Ljava/lang/String;
    :goto_0
    return v0

    .line 507
    .restart local v7    # "cursor":Landroid/database/Cursor;
    .restart local v9    # "location":Ljava/lang/String;
    .restart local v11    # "selectionArgs":[Ljava/lang/String;
    :cond_1
    if-eqz v7, :cond_2

    .line 508
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .end local v7    # "cursor":Landroid/database/Cursor;
    .end local v9    # "location":Ljava/lang/String;
    .end local v11    # "selectionArgs":[Ljava/lang/String;
    :cond_2
    :goto_1
    move v0, v13

    .line 512
    goto :goto_0

    .line 504
    .restart local v7    # "cursor":Landroid/database/Cursor;
    .restart local v9    # "location":Ljava/lang/String;
    .restart local v11    # "selectionArgs":[Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 505
    .local v8, "e":Landroid/database/sqlite/SQLiteException;
    :try_start_1
    const-string v0, "WAP PUSH"

    const-string v1, "failed to query existing notification ind"

    invoke-static {v0, v1, v8}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 507
    if-eqz v7, :cond_2

    .line 508
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 507
    .end local v8    # "e":Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v0

    if-eqz v7, :cond_3

    .line 508
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method private static shouldParseContentDisposition(I)Z
    .locals 3
    .param p0, "subId"    # I

    .prologue
    .line 344
    invoke-static {p0}, Landroid/telephony/SmsManager;->getSmsManagerForSubscriptionId(I)Landroid/telephony/SmsManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/SmsManager;->getCarrierConfigValues()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "supportMmsContentDisposition"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private writeInboxMessage(I[B)V
    .locals 23
    .param p1, "subId"    # I
    .param p2, "pushData"    # [B

    .prologue
    .line 351
    new-instance v4, Lcom/google/android/mms/pdu/PduParser;

    invoke-static/range {p1 .. p1}, Lcom/android/internal/telephony/WapPushOverSms;->shouldParseContentDisposition(I)Z

    move-result v5

    move-object/from16 v0, p2

    invoke-direct {v4, v0, v5}, Lcom/google/android/mms/pdu/PduParser;-><init>([BZ)V

    invoke-virtual {v4}, Lcom/google/android/mms/pdu/PduParser;->parse()Lcom/google/android/mms/pdu/GenericPdu;

    move-result-object v3

    .line 353
    .local v3, "pdu":Lcom/google/android/mms/pdu/GenericPdu;
    if-nez v3, :cond_0

    .line 354
    const-string v4, "WAP PUSH"

    const-string v5, "Invalid PUSH PDU"

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    :cond_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/WapPushOverSms;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/google/android/mms/pdu/PduPersister;->getPduPersister(Landroid/content/Context;)Lcom/google/android/mms/pdu/PduPersister;

    move-result-object v2

    .line 357
    .local v2, "persister":Lcom/google/android/mms/pdu/PduPersister;
    invoke-virtual {v3}, Lcom/google/android/mms/pdu/GenericPdu;->getMessageType()I

    move-result v22

    .line 359
    .local v22, "type":I
    sparse-switch v22, :sswitch_data_0

    .line 429
    :try_start_0
    const-string v4, "WAP PUSH"

    const-string v5, "Received unrecognized WAP Push PDU."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 437
    :cond_1
    :goto_0
    return-void

    .line 362
    :sswitch_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/WapPushOverSms;->mContext:Landroid/content/Context;

    invoke-static {v4, v3}, Lcom/android/internal/telephony/WapPushOverSms;->getDeliveryOrReadReportThreadId(Landroid/content/Context;Lcom/google/android/mms/pdu/GenericPdu;)J

    move-result-wide v20

    .line 363
    .local v20, "threadId":J
    const-wide/16 v4, -0x1

    cmp-long v4, v20, v4

    if-nez v4, :cond_2

    .line 366
    const-string v4, "WAP PUSH"

    const-string v5, "Failed to find delivery or read report\'s thread id"

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lcom/google/android/mms/MmsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 431
    .end local v20    # "threadId":J
    :catch_0
    move-exception v17

    .line 432
    .local v17, "e":Lcom/google/android/mms/MmsException;
    const-string v4, "WAP PUSH"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to save MMS WAP push data: type="

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v22

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v17

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 369
    .end local v17    # "e":Lcom/google/android/mms/MmsException;
    .restart local v20    # "threadId":J
    :cond_2
    :try_start_1
    sget-object v4, Landroid/provider/Telephony$Mms$Inbox;->CONTENT_URI:Landroid/net/Uri;

    const/4 v5, 0x1

    const/4 v6, 0x1

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/google/android/mms/pdu/PduPersister;->persist(Lcom/google/android/mms/pdu/GenericPdu;Landroid/net/Uri;ZZLjava/util/HashMap;)Landroid/net/Uri;

    move-result-object v6

    .line 375
    .local v6, "uri":Landroid/net/Uri;
    if-nez v6, :cond_3

    .line 376
    const-string v4, "WAP PUSH"

    const-string v5, "Failed to persist delivery or read report"

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lcom/google/android/mms/MmsException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 433
    .end local v6    # "uri":Landroid/net/Uri;
    .end local v20    # "threadId":J
    :catch_1
    move-exception v17

    .line 434
    .local v17, "e":Ljava/lang/RuntimeException;
    const-string v4, "WAP PUSH"

    const-string v5, "Unexpected RuntimeException in persisting MMS WAP push data"

    move-object/from16 v0, v17

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 380
    .end local v17    # "e":Ljava/lang/RuntimeException;
    .restart local v6    # "uri":Landroid/net/Uri;
    .restart local v20    # "threadId":J
    :cond_3
    :try_start_2
    new-instance v7, Landroid/content/ContentValues;

    const/4 v4, 0x1

    invoke-direct {v7, v4}, Landroid/content/ContentValues;-><init>(I)V

    .line 381
    .local v7, "values":Landroid/content/ContentValues;
    const-string v4, "thread_id"

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v7, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 382
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/WapPushOverSms;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/internal/telephony/WapPushOverSms;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v4 .. v9}, Landroid/database/sqlite/SqliteWrapper;->update(Landroid/content/Context;Landroid/content/ContentResolver;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_1

    .line 389
    const-string v4, "WAP PUSH"

    const-string v5, "Failed to update delivery or read report thread id"

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 394
    .end local v6    # "uri":Landroid/net/Uri;
    .end local v7    # "values":Landroid/content/ContentValues;
    .end local v20    # "threadId":J
    :sswitch_1
    move-object v0, v3

    check-cast v0, Lcom/google/android/mms/pdu/NotificationInd;

    move-object/from16 v18, v0

    .line 396
    .local v18, "nInd":Lcom/google/android/mms/pdu/NotificationInd;
    invoke-static/range {p1 .. p1}, Landroid/telephony/SmsManager;->getSmsManagerForSubscriptionId(I)Landroid/telephony/SmsManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/telephony/SmsManager;->getCarrierConfigValues()Landroid/os/Bundle;

    move-result-object v14

    .line 398
    .local v14, "configs":Landroid/os/Bundle;
    if-eqz v14, :cond_4

    const-string v4, "enabledTransID"

    const/4 v5, 0x0

    invoke-virtual {v14, v4, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 400
    invoke-virtual/range {v18 .. v18}, Lcom/google/android/mms/pdu/NotificationInd;->getContentLocation()[B

    move-result-object v15

    .line 401
    .local v15, "contentLocation":[B
    const/16 v4, 0x3d

    array-length v5, v15

    add-int/lit8 v5, v5, -0x1

    aget-byte v5, v15, v5

    if-ne v4, v5, :cond_4

    .line 402
    invoke-virtual/range {v18 .. v18}, Lcom/google/android/mms/pdu/NotificationInd;->getTransactionId()[B

    move-result-object v19

    .line 403
    .local v19, "transactionId":[B
    array-length v4, v15

    move-object/from16 v0, v19

    array-length v5, v0

    add-int/2addr v4, v5

    new-array v0, v4, [B

    move-object/from16 v16, v0

    .line 405
    .local v16, "contentLocationWithId":[B
    const/4 v4, 0x0

    const/4 v5, 0x0

    array-length v8, v15

    move-object/from16 v0, v16

    invoke-static {v15, v4, v0, v5, v8}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 407
    const/4 v4, 0x0

    array-length v5, v15

    move-object/from16 v0, v19

    array-length v8, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-static {v0, v4, v1, v5, v8}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 409
    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/NotificationInd;->setContentLocation([B)V

    .line 412
    .end local v15    # "contentLocation":[B
    .end local v16    # "contentLocationWithId":[B
    .end local v19    # "transactionId":[B
    :cond_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/WapPushOverSms;->mContext:Landroid/content/Context;

    move-object/from16 v0, v18

    invoke-static {v4, v0}, Lcom/android/internal/telephony/WapPushOverSms;->isDuplicateNotification(Landroid/content/Context;Lcom/google/android/mms/pdu/NotificationInd;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 413
    sget-object v10, Landroid/provider/Telephony$Mms$Inbox;->CONTENT_URI:Landroid/net/Uri;

    const/4 v11, 0x1

    const/4 v12, 0x1

    const/4 v13, 0x0

    move-object v8, v2

    move-object v9, v3

    invoke-virtual/range {v8 .. v13}, Lcom/google/android/mms/pdu/PduPersister;->persist(Lcom/google/android/mms/pdu/GenericPdu;Landroid/net/Uri;ZZLjava/util/HashMap;)Landroid/net/Uri;

    move-result-object v6

    .line 419
    .restart local v6    # "uri":Landroid/net/Uri;
    if-nez v6, :cond_1

    .line 420
    const-string v4, "WAP PUSH"

    const-string v5, "Failed to save MMS WAP push notification ind"

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 423
    .end local v6    # "uri":Landroid/net/Uri;
    :cond_5
    const-string v4, "WAP PUSH"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Skip storing duplicate MMS WAP push notification ind: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    new-instance v8, Ljava/lang/String;

    invoke-virtual/range {v18 .. v18}, Lcom/google/android/mms/pdu/NotificationInd;->getContentLocation()[B

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Lcom/google/android/mms/MmsException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    .line 359
    nop

    :sswitch_data_0
    .sparse-switch
        0x82 -> :sswitch_1
        0x86 -> :sswitch_0
        0x88 -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public dispatchWapPdu([BLandroid/content/BroadcastReceiver;Lcom/android/internal/telephony/InboundSmsHandler;Ljava/lang/String;)I
    .locals 40
    .param p1, "pdu"    # [B
    .param p2, "receiver"    # Landroid/content/BroadcastReceiver;
    .param p3, "handler"    # Lcom/android/internal/telephony/InboundSmsHandler;
    .param p4, "address"    # Ljava/lang/String;

    .prologue
    .line 130
    const/16 v24, 0x0

    .line 131
    .local v24, "index":I
    add-int/lit8 v25, v24, 0x1

    .end local v24    # "index":I
    .local v25, "index":I
    :try_start_0
    aget-byte v4, p1, v24
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_2

    and-int/lit16 v0, v4, 0xff

    move/from16 v35, v0

    .line 132
    .local v35, "transactionId":I
    add-int/lit8 v24, v25, 0x1

    .end local v25    # "index":I
    .restart local v24    # "index":I
    :try_start_1
    aget-byte v4, p1, v25

    and-int/lit16 v0, v4, 0xff

    move/from16 v29, v0

    .line 135
    .local v29, "pduType":I
    invoke-virtual/range {p3 .. p3}, Lcom/android/internal/telephony/InboundSmsHandler;->getPhone()Lcom/android/internal/telephony/PhoneBase;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v30

    .line 137
    .local v30, "phoneId":I
    const/4 v4, 0x6

    move/from16 v0, v29

    if-eq v0, v4, :cond_1

    const/4 v4, 0x7

    move/from16 v0, v29

    if-eq v0, v4, :cond_1

    .line 139
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/WapPushOverSms;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v9, 0x10e0097

    invoke-virtual {v4, v9}, Landroid/content/res/Resources;->getInteger(I)I
    :try_end_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v24

    .line 141
    const/4 v4, -0x1

    move/from16 v0, v24

    if-eq v0, v4, :cond_0

    .line 142
    add-int/lit8 v25, v24, 0x1

    .end local v24    # "index":I
    .restart local v25    # "index":I
    :try_start_2
    aget-byte v4, p1, v24
    :try_end_2
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_2

    and-int/lit16 v0, v4, 0xff

    move/from16 v35, v0

    .line 143
    add-int/lit8 v24, v25, 0x1

    .end local v25    # "index":I
    .restart local v24    # "index":I
    :try_start_3
    aget-byte v4, p1, v25

    and-int/lit16 v0, v4, 0xff

    move/from16 v29, v0

    .line 149
    const/4 v4, 0x6

    move/from16 v0, v29

    if-eq v0, v4, :cond_1

    const/4 v4, 0x7

    move/from16 v0, v29

    if-eq v0, v4, :cond_1

    .line 152
    const/4 v4, 0x1

    .line 339
    .end local v29    # "pduType":I
    .end local v30    # "phoneId":I
    .end local v35    # "transactionId":I
    :goto_0
    return v4

    .line 156
    .restart local v29    # "pduType":I
    .restart local v30    # "phoneId":I
    .restart local v35    # "transactionId":I
    :cond_0
    const/4 v4, 0x1

    goto :goto_0

    .line 160
    :cond_1
    new-instance v28, Lcom/android/internal/telephony/WspTypeDecoder;

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/WspTypeDecoder;-><init>([B)V

    .line 168
    .local v28, "pduDecoder":Lcom/android/internal/telephony/WspTypeDecoder;
    move-object/from16 v0, v28

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/WspTypeDecoder;->decodeUintvarInteger(I)Z

    move-result v4

    if-nez v4, :cond_2

    .line 170
    const/4 v4, 0x2

    goto :goto_0

    .line 172
    :cond_2
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/WspTypeDecoder;->getValue32()J

    move-result-wide v38

    move-wide/from16 v0, v38

    long-to-int v0, v0

    move/from16 v22, v0

    .line 173
    .local v22, "headerLength":I
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/WspTypeDecoder;->getDecodedDataLength()I

    move-result v4

    add-int v24, v24, v4

    .line 175
    move/from16 v23, v24

    .line 189
    .local v23, "headerStartIndex":I
    move-object/from16 v0, v28

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/WspTypeDecoder;->decodeContentType(I)Z

    move-result v4

    if-nez v4, :cond_3

    .line 191
    const/4 v4, 0x2

    goto :goto_0

    .line 194
    :cond_3
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/WspTypeDecoder;->getValueString()Ljava/lang/String;

    move-result-object v27

    .line 195
    .local v27, "mimeType":Ljava/lang/String;
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/WspTypeDecoder;->getValue32()J

    move-result-wide v12

    .line 196
    .local v12, "binaryContentType":J
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/WspTypeDecoder;->getDecodedDataLength()I

    move-result v4

    add-int v24, v24, v4

    .line 198
    move/from16 v0, v22

    new-array v0, v0, [B

    move-object/from16 v21, v0

    .line 199
    .local v21, "header":[B
    const/4 v4, 0x0

    move-object/from16 v0, v21

    array-length v9, v0

    move-object/from16 v0, p1

    move/from16 v1, v23

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2, v4, v9}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 203
    if-eqz v27, :cond_7

    const-string v4, "application/vnd.wap.coc"

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 204
    move-object/from16 v26, p1

    .line 211
    .local v26, "intentData":[B
    :goto_1
    invoke-static {}, Landroid/telephony/SmsManager;->getDefault()Landroid/telephony/SmsManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/telephony/SmsManager;->getAutoPersisting()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 213
    invoke-static/range {v30 .. v30}, Landroid/telephony/SubscriptionManager;->getSubId(I)[I

    move-result-object v34

    .line 216
    .local v34, "subIds":[I
    if-eqz v34, :cond_8

    move-object/from16 v0, v34

    array-length v4, v0

    if-lez v4, :cond_8

    const/4 v4, 0x0

    aget v33, v34, v4

    .line 218
    .local v33, "subId":I
    :goto_2
    move-object/from16 v0, p0

    move/from16 v1, v33

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lcom/android/internal/telephony/WapPushOverSms;->writeInboxMessage(I[B)V

    .line 227
    .end local v33    # "subId":I
    .end local v34    # "subIds":[I
    :cond_4
    add-int v4, v24, v22

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, v28

    move/from16 v1, v24

    invoke-virtual {v0, v1, v4}, Lcom/android/internal/telephony/WspTypeDecoder;->seekXWapApplicationId(II)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 228
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/WspTypeDecoder;->getValue32()J

    move-result-wide v38

    move-wide/from16 v0, v38

    long-to-int v0, v0

    move/from16 v24, v0

    .line 229
    move-object/from16 v0, v28

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/WspTypeDecoder;->decodeXWapApplicationId(I)Z

    .line 230
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/WspTypeDecoder;->getValueString()Ljava/lang/String;

    move-result-object v36

    .line 231
    .local v36, "wapAppId":Ljava/lang/String;
    if-nez v36, :cond_5

    .line 232
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/WspTypeDecoder;->getValue32()J

    move-result-wide v38

    move-wide/from16 v0, v38

    long-to-int v4, v0

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v36

    .line 235
    :cond_5
    if-nez v27, :cond_9

    invoke-static {v12, v13}, Ljava/lang/Long;->toString(J)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v16

    .line 240
    .local v16, "contentType":Ljava/lang/String;
    :goto_3
    const/16 v32, 0x1

    .line 241
    .local v32, "processFurther":Z
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/WapPushOverSms;->mWapPushManager:Lcom/android/internal/telephony/IWapPushManager;

    move-object/from16 v37, v0
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_4 .. :try_end_4} :catch_0

    .line 243
    .local v37, "wapPushMan":Lcom/android/internal/telephony/IWapPushManager;
    if-nez v37, :cond_a

    .line 268
    :cond_6
    :goto_4
    if-nez v32, :cond_c

    .line 269
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 206
    .end local v16    # "contentType":Ljava/lang/String;
    .end local v26    # "intentData":[B
    .end local v32    # "processFurther":Z
    .end local v36    # "wapAppId":Ljava/lang/String;
    .end local v37    # "wapPushMan":Lcom/android/internal/telephony/IWapPushManager;
    :cond_7
    add-int v17, v23, v22

    .line 207
    .local v17, "dataIndex":I
    :try_start_5
    move-object/from16 v0, p1

    array-length v4, v0

    sub-int v4, v4, v17

    new-array v0, v4, [B

    move-object/from16 v26, v0

    .line 208
    .restart local v26    # "intentData":[B
    const/4 v4, 0x0

    move-object/from16 v0, v26

    array-length v9, v0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move-object/from16 v2, v26

    invoke-static {v0, v1, v2, v4, v9}, Ljava/lang/System;->arraycopy([BI[BII)V
    :try_end_5
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_1

    .line 335
    .end local v12    # "binaryContentType":J
    .end local v17    # "dataIndex":I
    .end local v21    # "header":[B
    .end local v22    # "headerLength":I
    .end local v23    # "headerStartIndex":I
    .end local v26    # "intentData":[B
    .end local v27    # "mimeType":Ljava/lang/String;
    .end local v28    # "pduDecoder":Lcom/android/internal/telephony/WspTypeDecoder;
    .end local v29    # "pduType":I
    .end local v30    # "phoneId":I
    :catch_0
    move-exception v11

    .line 338
    .end local v35    # "transactionId":I
    .local v11, "aie":Ljava/lang/ArrayIndexOutOfBoundsException;
    :goto_5
    const-string v4, "WAP PUSH"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "ignoring dispatchWapPdu() array index exception: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v4, v9}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    const/4 v4, 0x2

    goto/16 :goto_0

    .line 216
    .end local v11    # "aie":Ljava/lang/ArrayIndexOutOfBoundsException;
    .restart local v12    # "binaryContentType":J
    .restart local v21    # "header":[B
    .restart local v22    # "headerLength":I
    .restart local v23    # "headerStartIndex":I
    .restart local v26    # "intentData":[B
    .restart local v27    # "mimeType":Ljava/lang/String;
    .restart local v28    # "pduDecoder":Lcom/android/internal/telephony/WspTypeDecoder;
    .restart local v29    # "pduType":I
    .restart local v30    # "phoneId":I
    .restart local v34    # "subIds":[I
    .restart local v35    # "transactionId":I
    :cond_8
    :try_start_6
    invoke-static {}, Landroid/telephony/SmsManager;->getDefaultSmsSubscriptionId()I
    :try_end_6
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_6 .. :try_end_6} :catch_0

    move-result v33

    goto/16 :goto_2

    .end local v34    # "subIds":[I
    .restart local v36    # "wapAppId":Ljava/lang/String;
    :cond_9
    move-object/from16 v16, v27

    .line 235
    goto :goto_3

    .line 246
    .restart local v16    # "contentType":Ljava/lang/String;
    .restart local v32    # "processFurther":Z
    .restart local v37    # "wapPushMan":Lcom/android/internal/telephony/IWapPushManager;
    :cond_a
    :try_start_7
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/WapPushOverSms;->mDeviceIdleController:Landroid/os/IDeviceIdleController;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/internal/telephony/WapPushOverSms;->mWapPushManagerPackage:Ljava/lang/String;

    const/4 v10, 0x0

    const-string v38, "mms-mgr"

    move-object/from16 v0, v38

    invoke-interface {v4, v9, v10, v0}, Landroid/os/IDeviceIdleController;->addPowerSaveTempWhitelistAppForMms(Ljava/lang/String;ILjava/lang/String;)J

    .line 249
    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    .line 250
    .local v5, "intent":Landroid/content/Intent;
    const-string v4, "transactionId"

    move/from16 v0, v35

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 251
    const-string v4, "pduType"

    move/from16 v0, v29

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 252
    const-string v4, "header"

    move-object/from16 v0, v21

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 253
    const-string v4, "data"

    move-object/from16 v0, v26

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 254
    const-string v4, "contentTypeParameters"

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/WspTypeDecoder;->getContentParameters()Ljava/util/HashMap;

    move-result-object v9

    invoke-virtual {v5, v4, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 256
    invoke-static/range {p4 .. p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_b

    .line 257
    const-string v4, "address"

    move-object/from16 v0, p4

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 259
    :cond_b
    move/from16 v0, v30

    invoke-static {v5, v0}, Landroid/telephony/SubscriptionManager;->putPhoneIdAndSubIdExtra(Landroid/content/Intent;I)V

    .line 261
    move-object/from16 v0, v37

    move-object/from16 v1, v36

    move-object/from16 v2, v16

    invoke-interface {v0, v1, v2, v5}, Lcom/android/internal/telephony/IWapPushManager;->processMessage(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)I
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_7 .. :try_end_7} :catch_0

    move-result v31

    .line 263
    .local v31, "procRet":I
    and-int/lit8 v4, v31, 0x1

    if-lez v4, :cond_6

    const v4, 0x8000

    and-int v4, v4, v31

    if-nez v4, :cond_6

    .line 265
    const/16 v32, 0x0

    goto/16 :goto_4

    .line 271
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v31    # "procRet":I
    .end local v37    # "wapPushMan":Lcom/android/internal/telephony/IWapPushManager;
    :catch_1
    move-exception v4

    .line 277
    .end local v16    # "contentType":Ljava/lang/String;
    .end local v32    # "processFurther":Z
    .end local v36    # "wapAppId":Ljava/lang/String;
    :cond_c
    if-nez v27, :cond_d

    .line 279
    const/4 v4, 0x2

    goto/16 :goto_0

    .line 285
    :cond_d
    :try_start_8
    const-string v4, "application/vnd.wap.mms-message"

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 286
    const-string v6, "android.permission.RECEIVE_MMS"

    .line 287
    .local v6, "permission":Ljava/lang/String;
    const/16 v7, 0x12

    .line 293
    .local v7, "appOp":I
    :goto_6
    new-instance v5, Landroid/content/Intent;

    const-string v4, "android.provider.Telephony.WAP_PUSH_DELIVER"

    invoke-direct {v5, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 294
    .restart local v5    # "intent":Landroid/content/Intent;
    move-object/from16 v0, v27

    invoke-virtual {v5, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 295
    const-string v4, "transactionId"

    move/from16 v0, v35

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 296
    const-string v4, "pduType"

    move/from16 v0, v29

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 297
    const-string v4, "header"

    move-object/from16 v0, v21

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 298
    const-string v4, "data"

    move-object/from16 v0, v26

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 299
    const-string v4, "contentTypeParameters"

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/WspTypeDecoder;->getContentParameters()Ljava/util/HashMap;

    move-result-object v9

    invoke-virtual {v5, v4, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 300
    invoke-static/range {p4 .. p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_e

    .line 301
    const-string v4, "address"

    move-object/from16 v0, p4

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 303
    :cond_e
    move/from16 v0, v30

    invoke-static {v5, v0}, Landroid/telephony/SubscriptionManager;->putPhoneIdAndSubIdExtra(Landroid/content/Intent;I)V

    .line 308
    const/4 v15, 0x0

    .line 309
    .local v15, "componentName":Landroid/content/ComponentName;
    new-instance v4, Lcom/android/internal/telephony/ConfigResourceUtil;

    invoke-direct {v4}, Lcom/android/internal/telephony/ConfigResourceUtil;-><init>()V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/WapPushOverSms;->mContext:Landroid/content/Context;

    const-string v9, "default_wap_push_handler"

    invoke-static {v4, v9}, Lcom/android/internal/telephony/ConfigResourceUtil;->getStringValue(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 310
    .local v20, "fqcn":Ljava/lang/String;
    const-string v4, "application/vnd.wap.mms-message"

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_f

    invoke-static/range {v20 .. v20}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_f

    .line 311
    invoke-static/range {v20 .. v20}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v15

    .line 313
    :cond_f
    if-nez v15, :cond_10

    .line 314
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/WapPushOverSms;->mContext:Landroid/content/Context;

    const/4 v9, 0x1

    invoke-static {v4, v9}, Lcom/android/internal/telephony/SmsApplication;->getDefaultMmsApplication(Landroid/content/Context;Z)Landroid/content/ComponentName;

    move-result-object v15

    .line 317
    :cond_10
    const/4 v8, 0x0

    .line 318
    .local v8, "options":Landroid/os/Bundle;
    if-eqz v15, :cond_11

    .line 320
    invoke-virtual {v5, v15}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;
    :try_end_8
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_8 .. :try_end_8} :catch_0

    .line 324
    :try_start_9
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/WapPushOverSms;->mDeviceIdleController:Landroid/os/IDeviceIdleController;

    invoke-virtual {v15}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    const-string v38, "mms-app"

    move-object/from16 v0, v38

    invoke-interface {v4, v9, v10, v0}, Landroid/os/IDeviceIdleController;->addPowerSaveTempWhitelistAppForMms(Ljava/lang/String;ILjava/lang/String;)J

    move-result-wide v18

    .line 326
    .local v18, "duration":J
    invoke-static {}, Landroid/app/BroadcastOptions;->makeBasic()Landroid/app/BroadcastOptions;

    move-result-object v14

    .line 327
    .local v14, "bopts":Landroid/app/BroadcastOptions;
    move-wide/from16 v0, v18

    invoke-virtual {v14, v0, v1}, Landroid/app/BroadcastOptions;->setTemporaryAppWhitelistDuration(J)V

    .line 328
    invoke-virtual {v14}, Landroid/app/BroadcastOptions;->toBundle()Landroid/os/Bundle;
    :try_end_9
    .catch Landroid/os/RemoteException; {:try_start_9 .. :try_end_9} :catch_3
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_9 .. :try_end_9} :catch_0

    move-result-object v8

    .line 333
    .end local v14    # "bopts":Landroid/app/BroadcastOptions;
    .end local v18    # "duration":J
    :cond_11
    :goto_7
    :try_start_a
    sget-object v10, Landroid/os/UserHandle;->OWNER:Landroid/os/UserHandle;

    move-object/from16 v4, p3

    move-object/from16 v9, p2

    invoke-virtual/range {v4 .. v10}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/os/Bundle;Landroid/content/BroadcastReceiver;Landroid/os/UserHandle;)V

    .line 334
    const/4 v4, -0x1

    goto/16 :goto_0

    .line 289
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v6    # "permission":Ljava/lang/String;
    .end local v7    # "appOp":I
    .end local v8    # "options":Landroid/os/Bundle;
    .end local v15    # "componentName":Landroid/content/ComponentName;
    .end local v20    # "fqcn":Ljava/lang/String;
    :cond_12
    const-string v6, "android.permission.RECEIVE_WAP_PUSH"
    :try_end_a
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_a .. :try_end_a} :catch_0

    .line 290
    .restart local v6    # "permission":Ljava/lang/String;
    const/16 v7, 0x13

    .restart local v7    # "appOp":I
    goto/16 :goto_6

    .line 335
    .end local v6    # "permission":Ljava/lang/String;
    .end local v7    # "appOp":I
    .end local v12    # "binaryContentType":J
    .end local v21    # "header":[B
    .end local v22    # "headerLength":I
    .end local v23    # "headerStartIndex":I
    .end local v24    # "index":I
    .end local v26    # "intentData":[B
    .end local v27    # "mimeType":Ljava/lang/String;
    .end local v28    # "pduDecoder":Lcom/android/internal/telephony/WspTypeDecoder;
    .end local v29    # "pduType":I
    .end local v30    # "phoneId":I
    .end local v35    # "transactionId":I
    .restart local v25    # "index":I
    :catch_2
    move-exception v11

    move/from16 v24, v25

    .end local v25    # "index":I
    .restart local v24    # "index":I
    goto/16 :goto_5

    .line 329
    .restart local v5    # "intent":Landroid/content/Intent;
    .restart local v6    # "permission":Ljava/lang/String;
    .restart local v7    # "appOp":I
    .restart local v8    # "options":Landroid/os/Bundle;
    .restart local v12    # "binaryContentType":J
    .restart local v15    # "componentName":Landroid/content/ComponentName;
    .restart local v20    # "fqcn":Ljava/lang/String;
    .restart local v21    # "header":[B
    .restart local v22    # "headerLength":I
    .restart local v23    # "headerStartIndex":I
    .restart local v26    # "intentData":[B
    .restart local v27    # "mimeType":Ljava/lang/String;
    .restart local v28    # "pduDecoder":Lcom/android/internal/telephony/WspTypeDecoder;
    .restart local v29    # "pduType":I
    .restart local v30    # "phoneId":I
    .restart local v35    # "transactionId":I
    :catch_3
    move-exception v4

    goto :goto_7
.end method

.method dispose()V
    .locals 2

    .prologue
    .line 106
    iget-object v0, p0, Lcom/android/internal/telephony/WapPushOverSms;->mWapPushManager:Lcom/android/internal/telephony/IWapPushManager;

    if-eqz v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/android/internal/telephony/WapPushOverSms;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 112
    :goto_0
    return-void

    .line 110
    :cond_0
    const-string v0, "WAP PUSH"

    const-string v1, "dispose: not bound to a wappush manager"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 80
    invoke-static {p2}, Lcom/android/internal/telephony/IWapPushManager$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/IWapPushManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/telephony/WapPushOverSms;->mWapPushManager:Lcom/android/internal/telephony/IWapPushManager;

    .line 82
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 86
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/telephony/WapPushOverSms;->mWapPushManager:Lcom/android/internal/telephony/IWapPushManager;

    .line 88
    return-void
.end method
