.class Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;
.super Ljava/lang/Object;
.source "OutputDeviceWatcher.java"


# static fields
.field private static final CHANGE_DETECTION_COOLDOWN_MS:J = 0x1f4L

.field private static final FIREOS_CAPABILITIES_SETTING:Ljava/lang/String; = "audio_platform_capabilities"

.field private static final HDMI_ENCODINGS_ATMOS_KEY:Ljava/lang/String; = "atmos"

.field private static final HDMI_ENCODINGS_PARAMETER:Ljava/lang/String; = "hdmi_encodings"

.field private static final NRDP_CAPABILITIES_SETTING:Ljava/lang/String; = "nrdp_audio_platform_capabilities"

.field private static final TYPE_REMOTE_SUBMIX_COMPAT:I = 0x19


# instance fields
.field private final mApplicationContext:Landroid/content/Context;

.field private mAudioCapabilitiesKey:Ljava/lang/String;

.field private mBasicDDPSupportsAtmos:Z

.field private mCurrentOutputDeviceAttributes:Lcom/amazon/digitalmusicplayback/OutputDeviceAttributes;

.field private final mDriverEventReporter:Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;

.field private mHDMISinkSecretlySupportsAtmos:Z

.field private mIgnoredSampleFormats:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet<",
            "Lcom/amazon/digitalmusicplayback/AudioSampleFormat;",
            ">;"
        }
    .end annotation
.end field

.field private mIsHiResOutputEnabled:Z

.field private mLastChangeDetectionTime:J

.field private mLastUsedCooldown:J

.field private final mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

.field private mOutputDeviceChanged:Z

.field private final mPlatformSystemInformation:Lcom/amazon/digitalmusicplayback/internal/PlatformSystemInformation;

.field private final mRunningOnAutomotive:Z

.field private mSupportedFormats:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/amazon/digitalmusicplayback/AudioFormat;",
            ">;"
        }
    .end annotation
.end field

.field private mWatchedAudioDevice:Landroid/media/AudioDeviceInfo;

.field private mWatchedDeviceSupportsIEC:Z


# direct methods
.method public constructor <init>(Lcom/amazon/digitalmusicplayback/internal/LoggingFacade;Landroid/content/Context;Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;Lcom/amazon/digitalmusicplayback/internal/PlatformSystemInformation;)V
    .registers 7
    .param p1    # Lcom/amazon/digitalmusicplayback/internal/LoggingFacade;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/amazon/digitalmusicplayback/internal/PlatformSystemInformation;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 507
    iput-boolean v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mBasicDDPSupportsAtmos:Z

    .line 508
    iput-boolean v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mHDMISinkSecretlySupportsAtmos:Z

    .line 509
    const-class v1, Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    invoke-static {v1}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v1

    iput-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mIgnoredSampleFormats:Ljava/util/EnumSet;

    .line 511
    iput-boolean v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mOutputDeviceChanged:Z

    .line 514
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mSupportedFormats:Ljava/util/ArrayList;

    .line 517
    const-string v1, ""

    iput-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mAudioCapabilitiesKey:Ljava/lang/String;

    .line 36
    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade;->currentSourceFileLog()Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    move-result-object p1

    iput-object p1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    .line 37
    iput-object p2, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mApplicationContext:Landroid/content/Context;

    .line 38
    iput-object p3, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mDriverEventReporter:Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;

    .line 39
    iput-object p4, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mPlatformSystemInformation:Lcom/amazon/digitalmusicplayback/internal/PlatformSystemInformation;

    .line 40
    invoke-virtual {p4}, Lcom/amazon/digitalmusicplayback/internal/PlatformSystemInformation;->isRunningOnAutomotive()Z

    move-result p2

    iput-boolean p2, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mRunningOnAutomotive:Z

    if-eqz p2, :cond_38

    .line 42
    const-string p2, "Running on Android Automotive OS"

    new-array p3, v0, [Ljava/lang/Object;

    invoke-virtual {p1, p2, p3}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 45
    :cond_38
    invoke-virtual {p4}, Lcom/amazon/digitalmusicplayback/internal/PlatformSystemInformation;->isRunningOnTV()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mIsHiResOutputEnabled:Z

    .line 51
    invoke-direct {p0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->registerForDeviceChanges()V

    .line 53
    invoke-direct {p0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->registerForOSCapabilityChanges()V

    .line 55
    new-instance p1, Lcom/amazon/digitalmusicplayback/OutputDevice;

    invoke-direct {p1, v1, v1, v0}, Lcom/amazon/digitalmusicplayback/OutputDevice;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 56
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 57
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    new-instance p3, Lcom/amazon/digitalmusicplayback/OutputDeviceAttributes;

    invoke-direct {p3, p2, p1, v0}, Lcom/amazon/digitalmusicplayback/OutputDeviceAttributes;-><init>(Ljava/util/ArrayList;Lcom/amazon/digitalmusicplayback/OutputDevice;Z)V

    iput-object p3, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mCurrentOutputDeviceAttributes:Lcom/amazon/digitalmusicplayback/OutputDeviceAttributes;

    const/4 p1, 0x0

    .line 60
    invoke-virtual {p0, p1}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->checkAudioTrack(Landroid/media/AudioTrack;)V

    .line 63
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLastChangeDetectionTime:J

    .line 64
    iput-wide p1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLastUsedCooldown:J

    return-void
.end method

.method static synthetic access$000(Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;)V
    .registers 1

    .line 34
    invoke-direct {p0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->readOSAudioCapabilitySettings()V

    return-void
.end method

.method static synthetic access$100(Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;)Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;
    .registers 1

    .line 34
    iget-object p0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    return-object p0
.end method

.method static synthetic access$200(Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;Z)V
    .registers 2

    .line 34
    invoke-direct {p0, p1}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->setOutputDeviceChanged(Z)V

    return-void
.end method

.method private static getMax([I)I
    .registers 5

    .line 69
    array-length v0, p0

    const/high16 v1, -0x80000000

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v0, :cond_e

    aget v3, p0, v2

    if-le v3, v1, :cond_b

    move v1, v3

    :cond_b
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_e
    return v1
.end method

.method private static hasBetterChannelConfig(Landroid/media/AudioDeviceInfo;Landroid/media/AudioDeviceInfo;)Z
    .registers 2
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x17
    .end annotation

    .line 79
    invoke-virtual {p1}, Landroid/media/AudioDeviceInfo;->getChannelCounts()[I

    move-result-object p1

    invoke-static {p1}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->getMax([I)I

    move-result p1

    invoke-virtual {p0}, Landroid/media/AudioDeviceInfo;->getChannelCounts()[I

    move-result-object p0

    invoke-static {p0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->getMax([I)I

    move-result p0

    if-le p1, p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method static intArrayContains([II)Z
    .registers 6

    .line 354
    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_3
    if-ge v2, v0, :cond_e

    aget v3, p0, v2

    if-ne v3, p1, :cond_b

    const/4 p0, 0x1

    return p0

    :cond_b
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_e
    return v1
.end method

.method private isBetterDevice(Landroid/media/AudioDeviceInfo;Landroid/media/AudioDeviceInfo;)Z
    .registers 4
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x17
    .end annotation

    .line 87
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mPlatformSystemInformation:Lcom/amazon/digitalmusicplayback/internal/PlatformSystemInformation;

    invoke-virtual {v0}, Lcom/amazon/digitalmusicplayback/internal/PlatformSystemInformation;->isRunningOnTV()Z

    move-result v0

    if-nez v0, :cond_1b

    iget-boolean p0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mRunningOnAutomotive:Z

    if-nez p0, :cond_1b

    .line 90
    invoke-static {p2}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->isBluetoothDevice(Landroid/media/AudioDeviceInfo;)Z

    move-result p0

    invoke-static {p1}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->isBluetoothDevice(Landroid/media/AudioDeviceInfo;)Z

    move-result v0

    if-eq p0, v0, :cond_1b

    .line 91
    invoke-static {p2}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->isBluetoothDevice(Landroid/media/AudioDeviceInfo;)Z

    move-result p0

    return p0

    .line 95
    :cond_1b
    invoke-virtual {p1}, Landroid/media/AudioDeviceInfo;->getEncodings()[I

    move-result-object p0

    array-length p0, p0

    invoke-virtual {p2}, Landroid/media/AudioDeviceInfo;->getEncodings()[I

    move-result-object v0

    array-length v0, v0

    if-lt p0, v0, :cond_30

    invoke-static {p1, p2}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->hasBetterChannelConfig(Landroid/media/AudioDeviceInfo;Landroid/media/AudioDeviceInfo;)Z

    move-result p0

    if-eqz p0, :cond_2e

    goto :goto_30

    :cond_2e
    const/4 p0, 0x0

    return p0

    :cond_30
    :goto_30
    const/4 p0, 0x1

    return p0
.end method

.method private static isBluetoothDevice(Landroid/media/AudioDeviceInfo;)Z
    .registers 2
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x17
    .end annotation

    .line 100
    invoke-virtual {p0}, Landroid/media/AudioDeviceInfo;->getType()I

    move-result p0

    const/16 v0, 0x8

    if-eq p0, v0, :cond_12

    const/16 v0, 0x1a

    if-eq p0, v0, :cond_12

    const/16 v0, 0x1b

    if-eq p0, v0, :cond_12

    const/4 p0, 0x0

    return p0

    :cond_12
    const/4 p0, 0x1

    return p0
.end method

.method private isCapabilitySettingPresent(Ljava/lang/String;)Z
    .registers 2

    .line 428
    iget-object p0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mApplicationContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {p0, p1}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method private isSupportedFormat(Lcom/amazon/digitalmusicplayback/AudioFormat;)Z
    .registers 8
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x17
    .end annotation

    .line 315
    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleFormat()Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    move-result-object v0

    sget-object v1, Lcom/amazon/digitalmusicplayback/AudioSampleFormat;->SAMPLEFORMATS16:Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_c

    move v0, v2

    goto :goto_d

    :cond_c
    move v0, v3

    :goto_d
    if-nez v0, :cond_1c

    .line 316
    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mIgnoredSampleFormats:Ljava/util/EnumSet;

    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleFormat()Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    return v3

    .line 320
    :cond_1c
    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleFormat()Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    move-result-object v1

    invoke-static {v1}, Lcom/amazon/digitalmusicplayback/internal/AudioFormats;->isPCM(Lcom/amazon/digitalmusicplayback/AudioSampleFormat;)Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 321
    iget-boolean v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mIsHiResOutputEnabled:Z

    if-nez v1, :cond_2d

    if-nez v0, :cond_2d

    return v3

    :cond_2d
    if-nez v1, :cond_48

    .line 324
    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleRate()J

    move-result-wide v0

    const-wide/32 v4, 0xbb80

    cmp-long v0, v0, v4

    if-lez v0, :cond_48

    return v3

    .line 328
    :cond_3b
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mPlatformSystemInformation:Lcom/amazon/digitalmusicplayback/internal/PlatformSystemInformation;

    invoke-virtual {v0}, Lcom/amazon/digitalmusicplayback/internal/PlatformSystemInformation;->isRunningOnTV()Z

    move-result v0

    if-nez v0, :cond_48

    iget-boolean v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mRunningOnAutomotive:Z

    if-nez v0, :cond_48

    return v3

    .line 332
    :cond_48
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mWatchedAudioDevice:Landroid/media/AudioDeviceInfo;

    invoke-virtual {v0}, Landroid/media/AudioDeviceInfo;->getEncodings()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleFormat()Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    move-result-object v1

    invoke-static {v1}, Lcom/amazon/digitalmusicplayback/internal/AudioFormats;->toAndroidEncoding(Lcom/amazon/digitalmusicplayback/AudioSampleFormat;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->intArrayContains([II)Z

    move-result v0

    if-nez v0, :cond_5d

    return v3

    .line 336
    :cond_5d
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mWatchedAudioDevice:Landroid/media/AudioDeviceInfo;

    invoke-virtual {v0}, Landroid/media/AudioDeviceInfo;->getSampleRates()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleRate()J

    move-result-wide v4

    long-to-int v1, v4

    invoke-static {v0, v1}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->intArrayContains([II)Z

    move-result v0

    if-nez v0, :cond_6f

    return v3

    .line 338
    :cond_6f
    iget-boolean v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mRunningOnAutomotive:Z

    if-eqz v0, :cond_74

    return v2

    .line 346
    :cond_74
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mWatchedAudioDevice:Landroid/media/AudioDeviceInfo;

    invoke-virtual {v0}, Landroid/media/AudioDeviceInfo;->getChannelMasks()[I

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_8c

    .line 347
    iget-object p0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mWatchedAudioDevice:Landroid/media/AudioDeviceInfo;

    invoke-virtual {p0}, Landroid/media/AudioDeviceInfo;->getChannelCounts()[I

    move-result-object p0

    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getChannelCount()I

    move-result p1

    invoke-static {p0, p1}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->intArrayContains([II)Z

    move-result p0

    return p0

    .line 349
    :cond_8c
    iget-object p0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mWatchedAudioDevice:Landroid/media/AudioDeviceInfo;

    invoke-virtual {p0}, Landroid/media/AudioDeviceInfo;->getChannelMasks()[I

    move-result-object p0

    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getChannelLayout()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/amazon/digitalmusicplayback/internal/AudioFormats;->toAndroidChannelMask(J)I

    move-result p1

    invoke-static {p0, p1}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->intArrayContains([II)Z

    move-result p0

    return p0
.end method

.method private notifyOutputDeviceChanged()V
    .registers 6

    .line 293
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mSupportedFormats:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_25

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/digitalmusicplayback/AudioFormat;

    .line 294
    invoke-virtual {v1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleFormat()Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    move-result-object v3

    sget-object v4, Lcom/amazon/digitalmusicplayback/AudioSampleFormat;->COMPRESSED_EAC3:Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    if-eq v3, v4, :cond_23

    invoke-virtual {v1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleFormat()Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    move-result-object v1

    sget-object v3, Lcom/amazon/digitalmusicplayback/AudioSampleFormat;->COMPRESSED_EAC3_JOC:Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    if-ne v1, v3, :cond_6

    :cond_23
    const/4 v0, 0x1

    goto :goto_26

    :cond_25
    move v0, v2

    .line 299
    :goto_26
    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mWatchedAudioDevice:Landroid/media/AudioDeviceInfo;

    const-string v3, ""

    if-eqz v1, :cond_35

    invoke-virtual {v1}, Landroid/media/AudioDeviceInfo;->getProductName()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_36

    :cond_35
    move-object v1, v3

    .line 300
    :goto_36
    iget-object v4, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mWatchedAudioDevice:Landroid/media/AudioDeviceInfo;

    if-eqz v4, :cond_42

    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    .line 301
    :cond_42
    new-instance v4, Lcom/amazon/digitalmusicplayback/OutputDevice;

    invoke-direct {v4, v1, v3, v0}, Lcom/amazon/digitalmusicplayback/OutputDevice;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 302
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 303
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 304
    new-instance v1, Lcom/amazon/digitalmusicplayback/OutputDeviceAttributes;

    invoke-direct {v1, v0, v4, v2}, Lcom/amazon/digitalmusicplayback/OutputDeviceAttributes;-><init>(Ljava/util/ArrayList;Lcom/amazon/digitalmusicplayback/OutputDevice;Z)V

    .line 305
    iput-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mCurrentOutputDeviceAttributes:Lcom/amazon/digitalmusicplayback/OutputDeviceAttributes;

    .line 306
    iget-object p0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mDriverEventReporter:Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;

    invoke-virtual {p0, v1}, Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;->asyncReportOutputDeviceChanged(Lcom/amazon/digitalmusicplayback/OutputDeviceAttributes;)V

    return-void
.end method

.method private declared-synchronized readHDMIExtraEncodingsLegacyWay()V
    .registers 6

    monitor-enter p0

    .line 433
    :try_start_1
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mApplicationContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_25

    if-nez v0, :cond_f

    .line 435
    monitor-exit p0

    return-void

    .line 437
    :cond_f
    :try_start_f
    iget-boolean v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mHDMISinkSecretlySupportsAtmos:Z

    .line 438
    const-string v2, "hdmi_encodings"

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getParameters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_27

    .line 439
    const-string v2, "atmos"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_27

    const/4 v2, 0x1

    .line 440
    iput-boolean v2, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mHDMISinkSecretlySupportsAtmos:Z

    goto :goto_2a

    :catchall_25
    move-exception v0

    goto :goto_41

    :cond_27
    const/4 v2, 0x0

    .line 442
    iput-boolean v2, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mHDMISinkSecretlySupportsAtmos:Z

    .line 444
    :goto_2a
    iget-boolean v2, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mHDMISinkSecretlySupportsAtmos:Z

    if-eq v1, v2, :cond_3f

    .line 445
    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string v3, "HDMI Atmos capability changes -> %s based on %s=%s"

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v4, "hdmi_encodings"

    filled-new-array {v2, v4, v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v1, v3, v0}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_3f
    .catchall {:try_start_f .. :try_end_3f} :catchall_25

    .line 447
    :cond_3f
    monitor-exit p0

    return-void

    :goto_41
    :try_start_41
    monitor-exit p0
    :try_end_42
    .catchall {:try_start_41 .. :try_end_42} :catchall_25

    throw v0
.end method

.method private declared-synchronized readOSAudioCapabilitySettings()V
    .registers 8

    monitor-enter p0

    .line 365
    :try_start_1
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mAudioCapabilitiesKey:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_20

    if-eqz v0, :cond_b

    .line 367
    monitor-exit p0

    return-void

    .line 369
    :cond_b
    :try_start_b
    iget-boolean v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mBasicDDPSupportsAtmos:Z
    :try_end_d
    .catchall {:try_start_b .. :try_end_d} :catchall_20

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 374
    :try_start_f
    iget-object v3, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mApplicationContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mAudioCapabilitiesKey:Ljava/lang/String;

    invoke-static {v3, v4}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_24

    .line 376
    iput-boolean v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mBasicDDPSupportsAtmos:Z

    goto :goto_54

    :catchall_20
    move-exception v0

    goto :goto_7f

    :catch_22
    move-exception v3

    goto :goto_3e

    .line 378
    :cond_24
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v4, "audiocaps"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 379
    const-string v4, "atmos"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 380
    const-string v4, "enabled"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mBasicDDPSupportsAtmos:Z
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_3d} :catch_22
    .catchall {:try_start_f .. :try_end_3d} :catchall_20

    goto :goto_54

    .line 383
    :goto_3e
    :try_start_3e
    iget-object v4, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string/jumbo v5, "readOSAudioCapability: %s"

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->warning(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 384
    iget-object v4, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mDriverEventReporter:Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;

    const-string/jumbo v5, "readOSAudioCapability"

    invoke-virtual {v4, v3, v5}, Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;->asyncMetricUnhandledException(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 385
    iput-boolean v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mBasicDDPSupportsAtmos:Z

    .line 387
    :goto_54
    iget-boolean v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mBasicDDPSupportsAtmos:Z

    if-eq v0, v1, :cond_6e

    .line 388
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string v3, "Android Atmos capability -> %s %s=%s"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-object v4, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mAudioCapabilitiesKey:Ljava/lang/String;

    filled-new-array {v1, v4, v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, 0x1

    .line 389
    invoke-direct {p0, v0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->setOutputDeviceChanged(Z)V

    goto :goto_7d

    .line 391
    :cond_6e
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string v2, "Android Atmos capability did not change. Atmos support remains: %s"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_7d
    .catchall {:try_start_3e .. :try_end_7d} :catchall_20

    .line 393
    :goto_7d
    monitor-exit p0

    return-void

    :goto_7f
    :try_start_7f
    monitor-exit p0
    :try_end_80
    .catchall {:try_start_7f .. :try_end_80} :catchall_20

    throw v0
.end method

.method private registerForDeviceChanges()V
    .registers 3

    .line 456
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mApplicationContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    if-nez v0, :cond_d

    return-void

    .line 460
    :cond_d
    new-instance v1, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher$2;

    invoke-direct {v1, p0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher$2;-><init>(Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;)V

    const/4 p0, 0x0

    invoke-virtual {v0, v1, p0}, Landroid/media/AudioManager;->registerAudioDeviceCallback(Landroid/media/AudioDeviceCallback;Landroid/os/Handler;)V

    return-void
.end method

.method private registerForOSCapabilityChanges()V
    .registers 6

    .line 396
    const-string v0, "audio_platform_capabilities"

    invoke-direct {p0, v0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->isCapabilitySettingPresent(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_c

    .line 399
    iput-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mAudioCapabilitiesKey:Ljava/lang/String;

    goto :goto_17

    .line 400
    :cond_c
    const-string/jumbo v0, "nrdp_audio_platform_capabilities"

    invoke-direct {p0, v0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->isCapabilitySettingPresent(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_54

    .line 404
    iput-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mAudioCapabilitiesKey:Ljava/lang/String;

    .line 409
    :goto_17
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mAudioCapabilitiesKey:Ljava/lang/String;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v3, "Will listen to changes in the global setting %s"

    invoke-virtual {v0, v3, v1}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 412
    :try_start_24
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mApplicationContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 413
    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mAudioCapabilitiesKey:Ljava/lang/String;

    invoke-static {v1}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 414
    new-instance v3, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher$1;

    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    invoke-direct {v3, p0, v4}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher$1;-><init>(Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;Landroid/os/Handler;)V

    .line 420
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_3d} :catch_3e

    return-void

    :catch_3e
    move-exception v0

    .line 422
    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string/jumbo v2, "registerForOSCapabilityChanges: %s"

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->warning(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 423
    iget-object p0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mDriverEventReporter:Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;

    const-string/jumbo v1, "registerForOSCapabilityChanges"

    invoke-virtual {p0, v0, v1}, Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;->asyncMetricUnhandledException(Ljava/lang/Exception;Ljava/lang/String;)V

    return-void

    .line 406
    :cond_54
    iget-object p0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string v0, "No global audio capabilities setting found. Won\'t be listening to any changes in settings."

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private declared-synchronized setOutputDeviceChanged(Z)V
    .registers 8

    monitor-enter p0

    if-eqz p1, :cond_18

    .line 221
    :try_start_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 226
    iget-wide v2, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLastChangeDetectionTime:J
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_16

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1f4

    cmp-long p1, v2, v4

    if-gtz p1, :cond_13

    .line 227
    monitor-exit p0

    return-void

    .line 229
    :cond_13
    :try_start_13
    iput-wide v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLastChangeDetectionTime:J

    goto :goto_1c

    :catchall_16
    move-exception p1

    goto :goto_1e

    .line 232
    :cond_18
    iget-wide v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLastChangeDetectionTime:J

    iput-wide v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLastUsedCooldown:J
    :try_end_1c
    .catchall {:try_start_13 .. :try_end_1c} :catchall_16

    .line 234
    :goto_1c
    monitor-exit p0

    return-void

    :goto_1e
    :try_start_1e
    monitor-exit p0
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_16

    throw p1
.end method

.method private updateSupportedFormats()V
    .registers 11
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x17
    .end annotation

    .line 241
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 242
    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mWatchedAudioDevice:Landroid/media/AudioDeviceInfo;

    const/4 v2, 0x0

    if-eqz v1, :cond_62

    .line 243
    sget-object v1, Lcom/amazon/digitalmusicplayback/internal/AudioFormats;->kAllFormats:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_10
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_26

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/amazon/digitalmusicplayback/AudioFormat;

    .line 244
    invoke-direct {p0, v3}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->isSupportedFormat(Lcom/amazon/digitalmusicplayback/AudioFormat;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 245
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 250
    :cond_26
    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mPlatformSystemInformation:Lcom/amazon/digitalmusicplayback/internal/PlatformSystemInformation;

    invoke-virtual {v1}, Lcom/amazon/digitalmusicplayback/internal/PlatformSystemInformation;->isRunningOnTV()Z

    move-result v1

    if-eqz v1, :cond_53

    iget-boolean v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mBasicDDPSupportsAtmos:Z

    if-nez v1, :cond_36

    iget-boolean v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mHDMISinkSecretlySupportsAtmos:Z

    if-eqz v1, :cond_53

    :cond_36
    sget-object v1, Lcom/amazon/digitalmusicplayback/internal/AudioFormats;->kBasicDDP:Lcom/amazon/digitalmusicplayback/AudioFormat;

    invoke-direct {p0, v1}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->isSupportedFormat(Lcom/amazon/digitalmusicplayback/AudioFormat;)Z

    move-result v3

    if-nez v3, :cond_47

    iget-object v3, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mWatchedAudioDevice:Landroid/media/AudioDeviceInfo;

    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getEncodings()[I

    move-result-object v3

    array-length v3, v3

    if-nez v3, :cond_53

    .line 251
    :cond_47
    iget-object v3, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string v4, "Device supports the EAC3 + JOC hack"

    new-array v5, v2, [Ljava/lang/Object;

    invoke-virtual {v3, v4, v5}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 252
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 254
    :cond_53
    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mWatchedAudioDevice:Landroid/media/AudioDeviceInfo;

    invoke-virtual {v1}, Landroid/media/AudioDeviceInfo;->getEncodings()[I

    move-result-object v1

    const/16 v3, 0xd

    invoke-static {v1, v3}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->intArrayContains([II)Z

    move-result v1

    iput-boolean v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mWatchedDeviceSupportsIEC:Z

    goto :goto_64

    .line 256
    :cond_62
    iput-boolean v2, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mWatchedDeviceSupportsIEC:Z

    .line 259
    :goto_64
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_8e

    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mPlatformSystemInformation:Lcom/amazon/digitalmusicplayback/internal/PlatformSystemInformation;

    invoke-virtual {v1}, Lcom/amazon/digitalmusicplayback/internal/PlatformSystemInformation;->isRunningOnTV()Z

    move-result v1

    if-nez v1, :cond_8e

    iget-boolean v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mRunningOnAutomotive:Z

    if-nez v1, :cond_8e

    .line 262
    new-instance v3, Lcom/amazon/digitalmusicplayback/AudioFormat;

    sget-object v1, Lcom/amazon/digitalmusicplayback/internal/AudioFormats;->kNativeFormat:Lcom/amazon/digitalmusicplayback/AudioFormat;

    invoke-virtual {v1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleRate()J

    move-result-wide v4

    invoke-virtual {v1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getChannelLayout()J

    move-result-wide v6

    sget-object v8, Lcom/amazon/digitalmusicplayback/AudioSampleFormat;->SAMPLEFORMATFLOAT:Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    invoke-virtual {v1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getChannelCount()I

    move-result v9

    invoke-direct/range {v3 .. v9}, Lcom/amazon/digitalmusicplayback/AudioFormat;-><init>(JJLcom/amazon/digitalmusicplayback/AudioSampleFormat;I)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 274
    :cond_8e
    sget-object v1, Lcom/amazon/digitalmusicplayback/internal/AudioFormats;->kNativeFormat:Lcom/amazon/digitalmusicplayback/AudioFormat;

    invoke-static {v0, v1}, Lcom/amazon/digitalmusicplayback/internal/AudioFormats;->listContains(Ljava/util/List;Lcom/amazon/digitalmusicplayback/AudioFormat;)Z

    move-result v3

    if-nez v3, :cond_99

    .line 275
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 278
    :cond_99
    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mSupportedFormats:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_de

    .line 279
    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mSupportedFormats:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    .line 280
    iput-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mSupportedFormats:Ljava/util/ArrayList;

    if-nez v1, :cond_b3

    .line 282
    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mDriverEventReporter:Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;

    invoke-virtual {v1, v0}, Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;->asyncReportSupportedFormats(Ljava/util/ArrayList;)V

    .line 283
    invoke-direct {p0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->notifyOutputDeviceChanged()V

    .line 285
    :cond_b3
    :goto_b3
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mSupportedFormats:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v2, v0, :cond_de

    .line 286
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    add-int/lit8 v1, v2, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mSupportedFormats:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v5, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mSupportedFormats:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    filled-new-array {v3, v4, v2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "Available format %d of %d: %s"

    invoke-virtual {v0, v3, v2}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    move v2, v1

    goto :goto_b3

    :cond_de
    return-void
.end method


# virtual methods
.method public declared-synchronized checkAudioTrack(Landroid/media/AudioTrack;)V
    .registers 15
    .param p1    # Landroid/media/AudioTrack;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    monitor-enter p0

    .line 113
    :try_start_1
    invoke-static {p0, p1}, Lcom/soum91/amazonmusictv/TvBridge;->observeOutputTrack(Ljava/lang/Object;Landroid/media/AudioTrack;)V

    invoke-direct {p0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->readOSAudioCapabilitySettings()V

    .line 114
    invoke-direct {p0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->readHDMIExtraEncodingsLegacyWay()V

    const/4 v0, 0x0

    if-eqz p1, :cond_2b

    .line 118
    invoke-virtual {p1}, Landroid/media/AudioTrack;->getRoutedDevice()Landroid/media/AudioDeviceInfo;

    move-result-object v1

    if-nez v1, :cond_b3

    .line 119
    invoke-virtual {p1}, Landroid/media/AudioTrack;->getPlayState()I

    move-result p1

    const/4 v2, 0x3

    if-ne p1, v2, :cond_b3

    .line 120
    iget-object p1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string v2, "AudioTrack is playing but has no output device? Will use native format only"

    new-array v3, v0, [Ljava/lang/Object;

    invoke-virtual {p1, v2, v3}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->warning(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 121
    iget-object p1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mDriverEventReporter:Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;

    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;->asyncMetricNoRoutedDevice()V

    goto/16 :goto_b3

    :catchall_27
    move-exception v0

    move-object p1, v0

    goto/16 :goto_11a

    .line 124
    :cond_2b
    iget-object p1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mApplicationContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/AudioManager;

    const/4 v1, 0x0

    if-eqz p1, :cond_a3

    const/4 v2, 0x2

    .line 126
    invoke-virtual {p1, v2}, Landroid/media/AudioManager;->getDevices(I)[Landroid/media/AudioDeviceInfo;

    move-result-object p1

    array-length v2, p1

    move v3, v0

    :goto_3f
    if-ge v3, v2, :cond_a3

    aget-object v4, p1, v3

    .line 127
    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->isSink()Z

    move-result v5

    if-eqz v5, :cond_a0

    .line 128
    iget-object v5, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string v6, "Available output device: name=%s id=%s sampleRates=%s channelCounts=%s masks=%s encodings=%s"

    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->getProductName()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->getId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->getSampleRates()[I

    move-result-object v9

    invoke-static {v9}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->getChannelCounts()[I

    move-result-object v10

    invoke-static {v10}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->getChannelIndexMasks()[I

    move-result-object v11

    invoke-static {v11}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->getEncodings()[I

    move-result-object v12

    invoke-static {v12}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v12

    filled-new-array/range {v7 .. v12}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v1, :cond_88

    .line 129
    invoke-direct {p0, v1, v4}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->isBetterDevice(Landroid/media/AudioDeviceInfo;Landroid/media/AudioDeviceInfo;)Z

    move-result v5

    if-eqz v5, :cond_a0

    .line 131
    :cond_88
    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string v5, "%s - %s is the new best audio device"

    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->getId()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->getProductName()Ljava/lang/CharSequence;

    move-result-object v7

    filled-new-array {v6, v7}, [Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    move-object v1, v4

    :cond_a0
    add-int/lit8 v3, v3, 0x1

    goto :goto_3f

    :cond_a3
    if-nez v1, :cond_b3

    .line 137
    iget-object p1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string v2, "No audio output devices? Assuming native format only"

    new-array v3, v0, [Ljava/lang/Object;

    invoke-virtual {p1, v2, v3}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->warning(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 138
    iget-object p1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mDriverEventReporter:Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;

    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;->asyncMetricNoOutputDevices()V

    :cond_b3
    :goto_b3
    if-eqz v1, :cond_110

    .line 141
    iget-object p1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mWatchedAudioDevice:Landroid/media/AudioDeviceInfo;

    if-eqz p1, :cond_c3

    invoke-virtual {p1}, Landroid/media/AudioDeviceInfo;->getId()I

    move-result p1

    invoke-virtual {v1}, Landroid/media/AudioDeviceInfo;->getId()I

    move-result v2

    if-eq p1, v2, :cond_110

    .line 143
    :cond_c3
    iget-object p1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string v2, "Current device id=%s name=\'%s\'"

    invoke-virtual {v1}, Landroid/media/AudioDeviceInfo;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1}, Landroid/media/AudioDeviceInfo;->getProductName()Ljava/lang/CharSequence;

    move-result-object v4

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 145
    iget-object p1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string v2, "Current device id=%s sampleRates=%s channelCounts=%s masks=%s encodings=%s"

    invoke-virtual {v1}, Landroid/media/AudioDeviceInfo;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1}, Landroid/media/AudioDeviceInfo;->getSampleRates()[I

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Landroid/media/AudioDeviceInfo;->getChannelCounts()[I

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Landroid/media/AudioDeviceInfo;->getChannelIndexMasks()[I

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1}, Landroid/media/AudioDeviceInfo;->getEncodings()[I

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v7

    filled-new-array {v3, v4, v5, v6, v7}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 148
    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->resetIgnoredFormats()V

    .line 150
    :cond_110
    iput-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mWatchedAudioDevice:Landroid/media/AudioDeviceInfo;

    .line 152
    invoke-direct {p0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->updateSupportedFormats()V

    .line 153
    invoke-direct {p0, v0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->setOutputDeviceChanged(Z)V
    :try_end_118
    .catchall {:try_start_1 .. :try_end_118} :catchall_27

    .line 154
    monitor-exit p0

    return-void

    :goto_11a
    :try_start_11a
    monitor-exit p0
    :try_end_11b
    .catchall {:try_start_11a .. :try_end_11b} :catchall_27

    throw p1
.end method

.method public declared-synchronized getOutputDeviceAttributes()Lcom/amazon/digitalmusicplayback/OutputDeviceAttributes;
    .registers 2

    monitor-enter p0

    .line 310
    :try_start_1
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mCurrentOutputDeviceAttributes:Lcom/amazon/digitalmusicplayback/OutputDeviceAttributes;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    :try_start_6
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_6 .. :try_end_7} :catchall_5

    throw v0
.end method

.method public declared-synchronized getSupportedFormats()Ljava/util/ArrayList;
    .registers 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/amazon/digitalmusicplayback/AudioFormat;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 158
    :try_start_1
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mSupportedFormats:Ljava/util/ArrayList;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    :try_start_6
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_6 .. :try_end_7} :catchall_5

    throw v0
.end method

.method public declared-synchronized hasOutputDeviceChanged()Z
    .registers 5

    monitor-enter p0

    .line 163
    :try_start_1
    iget-wide v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLastUsedCooldown:J

    iget-wide v2, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLastChangeDetectionTime:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1a

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLastChangeDetectionTime:J
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_18

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1f4

    cmp-long v0, v0, v2

    if-lez v0, :cond_1a

    const/4 v0, 0x1

    goto :goto_1b

    :catchall_18
    move-exception v0

    goto :goto_1d

    :cond_1a
    const/4 v0, 0x0

    :goto_1b
    monitor-exit p0

    return v0

    :goto_1d
    :try_start_1d
    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_1d .. :try_end_1e} :catchall_18

    throw v0
.end method

.method public declared-synchronized ignoreSampleFormat(Lcom/amazon/digitalmusicplayback/AudioSampleFormat;)V
    .registers 4

    monitor-enter p0

    .line 167
    :try_start_1
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mIgnoredSampleFormats:Ljava/util/EnumSet;

    invoke-virtual {v0, p1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 168
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string v1, "Adding sample format %s to the list of ignored formats"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 169
    invoke-direct {p0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->updateSupportedFormats()V
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    .line 170
    monitor-exit p0

    return-void

    :catchall_16
    move-exception p1

    :try_start_17
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw p1
.end method

.method public declared-synchronized isHiResOutputEnabled()Z
    .registers 2

    monitor-enter p0

    .line 173
    :try_start_1
    iget-boolean v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mIsHiResOutputEnabled:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    :try_start_6
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_6 .. :try_end_7} :catchall_5

    throw v0
.end method

.method public declared-synchronized resetIgnoredFormats()V
    .registers 2

    monitor-enter p0

    .line 177
    :try_start_1
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mIgnoredSampleFormats:Ljava/util/EnumSet;

    invoke-virtual {v0}, Ljava/util/AbstractCollection;->clear()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 178
    monitor-exit p0

    return-void

    :catchall_8
    move-exception v0

    :try_start_9
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_9 .. :try_end_a} :catchall_8

    throw v0
.end method

.method public declared-synchronized setHiResOutputEnabled(Z)V
    .registers 4

    monitor-enter p0

    .line 182
    :try_start_1
    iget-boolean v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mIsHiResOutputEnabled:Z

    if-eq v0, p1, :cond_1d

    .line 183
    iput-boolean p1, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mIsHiResOutputEnabled:Z

    .line 184
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string/jumbo v1, "setHiResOutputEnabled -> %s"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 185
    invoke-direct {p0}, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->updateSupportedFormats()V
    :try_end_1a
    .catchall {:try_start_1 .. :try_end_1a} :catchall_1b

    goto :goto_1d

    :catchall_1b
    move-exception p1

    goto :goto_1f

    .line 187
    :cond_1d
    :goto_1d
    monitor-exit p0

    return-void

    :goto_1f
    :try_start_1f
    monitor-exit p0
    :try_end_20
    .catchall {:try_start_1f .. :try_end_20} :catchall_1b

    throw p1
.end method

.method public declared-synchronized toAndroidFormat(Lcom/amazon/digitalmusicplayback/AudioFormat;)Landroid/media/AudioFormat;
    .registers 8

    monitor-enter p0

    .line 191
    :try_start_1
    iget-boolean v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mWatchedDeviceSupportsIEC:Z

    if-eqz v0, :cond_2c

    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleFormat()Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    move-result-object v0

    invoke-static {v0}, Lcom/amazon/digitalmusicplayback/internal/AudioFormats;->isMPEGH(Lcom/amazon/digitalmusicplayback/AudioSampleFormat;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 194
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/OutputDeviceWatcher;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string v1, "Translated %s -> encoding %s"

    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleFormat()Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    move-result-object p1

    const/16 v2, 0xd

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {p1, v3}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    const p1, 0x2ee00

    const/16 v0, 0xc

    goto :goto_44

    :catchall_2a
    move-exception p1

    goto :goto_5b

    .line 205
    :cond_2c
    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleRate()J

    move-result-wide v0

    long-to-int v0, v0

    .line 206
    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleFormat()Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    move-result-object v1

    invoke-static {v1}, Lcom/amazon/digitalmusicplayback/internal/AudioFormats;->toAndroidEncoding(Lcom/amazon/digitalmusicplayback/AudioSampleFormat;)I

    move-result v2

    .line 207
    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getChannelLayout()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/amazon/digitalmusicplayback/internal/AudioFormats;->toAndroidChannelMask(J)I

    move-result p1

    move v5, v0

    move v0, p1

    move p1, v5

    .line 209
    :goto_44
    new-instance v1, Landroid/media/AudioFormat$Builder;

    invoke-direct {v1}, Landroid/media/AudioFormat$Builder;-><init>()V

    .line 210
    invoke-virtual {v1, v0}, Landroid/media/AudioFormat$Builder;->setChannelMask(I)Landroid/media/AudioFormat$Builder;

    move-result-object v0

    .line 211
    invoke-virtual {v0, v2}, Landroid/media/AudioFormat$Builder;->setEncoding(I)Landroid/media/AudioFormat$Builder;

    move-result-object v0

    .line 212
    invoke-virtual {v0, p1}, Landroid/media/AudioFormat$Builder;->setSampleRate(I)Landroid/media/AudioFormat$Builder;

    move-result-object p1

    .line 213
    invoke-virtual {p1}, Landroid/media/AudioFormat$Builder;->build()Landroid/media/AudioFormat;

    move-result-object p1
    :try_end_59
    .catchall {:try_start_1 .. :try_end_59} :catchall_2a

    .line 209
    monitor-exit p0

    return-object p1

    :goto_5b
    :try_start_5b
    monitor-exit p0
    :try_end_5c
    .catchall {:try_start_5b .. :try_end_5c} :catchall_2a

    throw p1
.end method
