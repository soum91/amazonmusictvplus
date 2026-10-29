.class Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;
.super Ljava/lang/Object;
.source "AudioBuffer.java"


# static fields
.field private static final BUFFER_POINTERS_SIZE:I = 0x8

.field public static final ERROR:I = -0x64

.field private static final PACKET_LENGTH_SIZE:I = 0x4


# instance fields
.field private mAndroidFormat:Landroid/media/AudioFormat;

.field private final mApplicationContext:Landroid/content/Context;

.field private mAudioBuffer:Ljava/nio/ByteBuffer;

.field private final mAudioDataSource:Lcom/amazon/digitalmusicplayback/internal/AudioDataSource;

.field private mAudioFormat:Lcom/amazon/digitalmusicplayback/AudioFormat;

.field private final mDriverEventReporter:Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;

.field private final mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

.field private mMemoryAddress:J

.field private mSilenceBuffer:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Lcom/amazon/digitalmusicplayback/internal/LoggingFacade;Landroid/content/Context;Lcom/amazon/digitalmusicplayback/internal/AudioDataSource;Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;)V
    .registers 5
    .param p1    # Lcom/amazon/digitalmusicplayback/internal/LoggingFacade;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/amazon/digitalmusicplayback/internal/AudioDataSource;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade;->currentSourceFileLog()Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    move-result-object p1

    iput-object p1, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    .line 21
    iput-object p2, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mApplicationContext:Landroid/content/Context;

    .line 22
    iput-object p3, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioDataSource:Lcom/amazon/digitalmusicplayback/internal/AudioDataSource;

    .line 23
    iput-object p4, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mDriverEventReporter:Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;

    return-void
.end method

.method private static native getDirectBufferAddress(Ljava/nio/ByteBuffer;)J
.end method


# virtual methods
.method public addSilenceToAudioTrack(Landroid/media/AudioTrack;)V
    .registers 5

    if-nez p1, :cond_3

    return-void

    .line 30
    :cond_3
    invoke-virtual {p1}, Landroid/media/AudioTrack;->getSampleRate()I

    move-result v0

    invoke-virtual {p1}, Landroid/media/AudioTrack;->getChannelConfiguration()I

    move-result v1

    invoke-virtual {p1}, Landroid/media/AudioTrack;->getAudioFormat()I

    move-result v2

    invoke-static {v0, v1, v2}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v0

    .line 31
    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mSilenceBuffer:Ljava/nio/ByteBuffer;

    if-eqz v1, :cond_1d

    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    move-result v1

    if-ge v1, v0, :cond_23

    .line 33
    :cond_1d
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mSilenceBuffer:Ljava/nio/ByteBuffer;

    .line 35
    :cond_23
    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mSilenceBuffer:Ljava/nio/ByteBuffer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 36
    iget-object p0, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mSilenceBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x1

    invoke-virtual {p1, p0, v0, v1}, Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I

    return-void
.end method

.method public fillAudioBuffer(Lcom/amazon/digitalmusicplayback/AudioFormat;Landroid/media/AudioFormat;I)J
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    .line 41
    invoke-virtual {v0}, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->remaining()I

    move-result v3

    if-lez v3, :cond_1e

    .line 42
    iget-object v1, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "fetchFromAudioDataSource requires the buffer to be empty"

    invoke-virtual {v1, v3, v2}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 43
    iget-object v0, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    move-result v0

    int-to-long v0, v0

    return-wide v0

    .line 46
    :cond_1e
    iget-object v3, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    const/16 v4, 0x8

    if-eqz v3, :cond_3b

    invoke-virtual {v3}, Ljava/nio/Buffer;->capacity()I

    move-result v3

    add-int/lit8 v5, v2, 0x8

    if-ge v3, v5, :cond_2d

    goto :goto_3b

    .line 51
    :cond_2d
    iget-object v3, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioFormat:Lcom/amazon/digitalmusicplayback/AudioFormat;

    if-eqz v3, :cond_62

    invoke-static {v3, v1}, Lcom/amazon/digitalmusicplayback/internal/AudioFormats;->equals(Lcom/amazon/digitalmusicplayback/AudioFormat;Lcom/amazon/digitalmusicplayback/AudioFormat;)Z

    move-result v3

    if-nez v3, :cond_62

    .line 52
    invoke-virtual {v0}, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->makeAudioBufferEmpty()V

    goto :goto_62

    :cond_3b
    :goto_3b
    add-int/lit8 v3, v2, 0x8

    .line 47
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    iput-object v3, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    .line 48
    invoke-static {v3}, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->getDirectBufferAddress(Ljava/nio/ByteBuffer;)J

    move-result-wide v5

    iput-wide v5, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mMemoryAddress:J

    .line 49
    invoke-virtual {v0}, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->makeAudioBufferEmpty()V

    .line 50
    iget-object v3, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    iget-object v5, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/Buffer;->capacity()I

    move-result v5

    sub-int/2addr v5, v4

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const-string v6, "Allocated bufferSizeBytes=%d"

    invoke-virtual {v3, v6, v5}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 54
    :cond_62
    :goto_62
    iget-object v3, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 55
    iget-object v3, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 56
    iget-object v3, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    iget-wide v5, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mMemoryAddress:J

    const-wide/16 v7, 0x8

    add-long/2addr v5, v7

    invoke-virtual {v3, v5, v6}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 58
    iput-object v1, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioFormat:Lcom/amazon/digitalmusicplayback/AudioFormat;

    move-object/from16 v3, p2

    .line 59
    iput-object v3, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAndroidFormat:Landroid/media/AudioFormat;

    .line 60
    iget-object v9, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioDataSource:Lcom/amazon/digitalmusicplayback/internal/AudioDataSource;

    invoke-virtual {v1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleRate()J

    move-result-wide v10

    iget-object v1, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioFormat:Lcom/amazon/digitalmusicplayback/AudioFormat;

    invoke-virtual {v1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getChannelLayout()J

    move-result-wide v12

    iget-object v1, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioFormat:Lcom/amazon/digitalmusicplayback/AudioFormat;

    invoke-virtual {v1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleFormat()Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    move-result-object v14

    iget-object v1, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioFormat:Lcom/amazon/digitalmusicplayback/AudioFormat;

    invoke-virtual {v1}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getChannelCount()I

    move-result v15

    iget-wide v5, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mMemoryAddress:J

    int-to-long v1, v2

    move-wide/from16 v18, v1

    move-wide/from16 v16, v5

    invoke-virtual/range {v9 .. v19}, Lcom/amazon/digitalmusicplayback/internal/AudioDataSource;->fillAudioDataBuffer(JJLcom/amazon/digitalmusicplayback/AudioSampleFormat;IJJ)J

    move-result-wide v1

    const-wide/16 v5, 0x0

    cmp-long v3, v1, v5

    if-lez v3, :cond_b6

    .line 63
    iget-object v3, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    add-long/2addr v7, v1

    long-to-int v5, v7

    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 64
    iget-object v0, v0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    return-wide v1

    .line 66
    :cond_b6
    invoke-virtual {v0}, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->makeAudioBufferEmpty()V

    return-wide v1
.end method

.method public makeAudioBufferEmpty()V
    .registers 3

    .line 72
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_d

    const/4 v1, 0x0

    .line 73
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 74
    iget-object p0, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    :cond_d
    return-void
.end method

.method public remaining()I
    .registers 1

    .line 79
    iget-object p0, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    if-nez p0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    invoke-virtual {p0}, Ljava/nio/Buffer;->remaining()I

    move-result p0

    return p0
.end method

.method public writeToAudioTrack(Landroid/media/AudioTrack;)I
    .registers 8

    .line 83
    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->remaining()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_12

    .line 84
    iget-object p0, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    const-string/jumbo p1, "writeToAudioTrack requires the buffer to have data"

    new-array v0, v1, [Ljava/lang/Object;

    invoke-virtual {p0, p1, v0}, Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    return v1

    .line 87
    :cond_12
    invoke-virtual {p1}, Landroid/media/AudioTrack;->getSampleRate()I

    move-result v0

    iget-object v2, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAndroidFormat:Landroid/media/AudioFormat;

    invoke-virtual {v2}, Landroid/media/AudioFormat;->getSampleRate()I

    move-result v2

    const/16 v3, -0x64

    const-string/jumbo v4, "writeToAudioTrack"

    if-ne v0, v2, :cond_cc

    invoke-virtual {p1}, Landroid/media/AudioTrack;->getAudioFormat()I

    move-result v0

    iget-object v2, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAndroidFormat:Landroid/media/AudioFormat;

    invoke-virtual {v2}, Landroid/media/AudioFormat;->getEncoding()I

    move-result v2

    if-ne v0, v2, :cond_cc

    invoke-virtual {p1}, Landroid/media/AudioTrack;->getChannelCount()I

    move-result v0

    iget-object v2, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAndroidFormat:Landroid/media/AudioFormat;

    invoke-virtual {v2}, Landroid/media/AudioFormat;->getChannelCount()I

    move-result v2

    if-eq v0, v2, :cond_3d

    goto/16 :goto_cc

    .line 92
    :cond_3d
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioFormat:Lcom/amazon/digitalmusicplayback/AudioFormat;

    invoke-virtual {v0}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleFormat()Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    move-result-object v0

    invoke-static {v0}, Lcom/amazon/digitalmusicplayback/internal/AudioFormats;->isPCM(Lcom/amazon/digitalmusicplayback/AudioSampleFormat;)Z

    move-result v0

    if-eqz v0, :cond_55

    .line 93
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->remaining()I

    move-result p0

    const/4 v1, 0x1

    invoke-static {v0, p0, p1}, Lcom/soum91/amazonmusictv/TvBridge;->processPcm(Ljava/nio/ByteBuffer;ILandroid/media/AudioTrack;)V

    invoke-virtual {p1, v0, p0, v1}, Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I

    move-result p0

    return p0

    .line 96
    :cond_55
    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->remaining()I

    move-result v0

    const/4 v2, 0x4

    if-ge v0, v2, :cond_7b

    .line 97
    iget-object p1, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mDriverEventReporter:Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;

    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->remaining()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioFormat:Lcom/amazon/digitalmusicplayback/AudioFormat;

    invoke-virtual {v2}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleFormat()Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Frame size is truncated in the buffer, remaining=%d sampleFormat=%s"

    invoke-virtual {p1, v0, v4, v2, v1}, Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;->asyncMetricAndLogProgrammingError(Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 98
    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->makeAudioBufferEmpty()V

    return v3

    .line 101
    :cond_7b
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    move-result v0

    .line 102
    iget-object v2, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    if-ltz v2, :cond_a7

    .line 103
    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->remaining()I

    move-result v5

    if-le v2, v5, :cond_90

    goto :goto_a7

    .line 110
    :cond_90
    iget-object v3, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v3, v2, v1}, Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I

    move-result p1

    .line 111
    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    move-result v1

    add-int/lit8 v3, v0, 0x4

    add-int/2addr v3, v2

    if-eq v1, v3, :cond_a6

    .line 112
    iget-object p0, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    :cond_a6
    return p1

    .line 104
    :cond_a7
    :goto_a7
    iget-object p1, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mDriverEventReporter:Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;

    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/Buffer;->remaining()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v5, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAudioFormat:Lcom/amazon/digitalmusicplayback/AudioFormat;

    invoke-virtual {v5}, Lcom/amazon/digitalmusicplayback/AudioFormat;->getSampleFormat()Lcom/amazon/digitalmusicplayback/AudioSampleFormat;

    move-result-object v5

    filled-new-array {v1, v2, v5}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Bad frame size found in the buffer, frameSize=%d remaining=%d sampleFormat=%s"

    invoke-virtual {p1, v0, v4, v2, v1}, Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;->asyncMetricAndLogProgrammingError(Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 105
    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->makeAudioBufferEmpty()V

    return v3

    .line 88
    :cond_cc
    :goto_cc
    iget-object v0, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mDriverEventReporter:Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;

    iget-object v1, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mLogger:Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;

    invoke-static {p1}, Lcom/amazon/digitalmusicplayback/internal/AudioFormats;->toShortString(Landroid/media/AudioTrack;)Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->mAndroidFormat:Landroid/media/AudioFormat;

    invoke-static {v2}, Lcom/amazon/digitalmusicplayback/internal/AudioFormats;->toShortString(Landroid/media/AudioFormat;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {p1, v2}, [Ljava/lang/Object;

    move-result-object p1

    const-string v2, "AudioTrack format does not match buffer, track=%s buffer=%s"

    invoke-virtual {v0, v1, v4, v2, p1}, Lcom/amazon/digitalmusicplayback/internal/DriverEventReporter;->asyncMetricAndLogProgrammingError(Lcom/amazon/digitalmusicplayback/internal/LoggingFacade$Logger;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 89
    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/internal/AudioBuffer;->makeAudioBufferEmpty()V

    return v3
.end method
