.class public Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;
.super Ljava/lang/Object;
.source "HarleyWrapper.java"

# interfaces
.implements Lcom/amazon/music/media/playback/player/IHarleyWrapper;
.implements Lcom/amazon/music/media/playback/util/AndroidUtils$ForegroundListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$PBListener;,
        Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$OAuthListener;,
        Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$AdpListener;,
        Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$LogListener;,
        Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$MtrxListener;,
        Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$ConcurrencyListener;,
        Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$WeblabClient;,
        Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$MetricsAttributesProvider;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<REQUEST:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/amazon/music/media/playback/player/IHarleyWrapper<",
        "TREQUEST;>;",
        "Lcom/amazon/music/media/playback/util/AndroidUtils$ForegroundListener;"
    }
.end annotation


# static fields
.field private static final AUTO_END_SEEK_MILLIS:J

.field private static final DEFAULT_AUDIO_QUALITY_SETTING:Lcom/amazon/digitalmusicplayback/QualitySetting;

.field private static final EQUALIZER_FORMAT:Lcom/amazon/digitalmusicplayback/EqualizerFormat;

.field private static final MIN_TIME_FOR_SCRUBBING_REBUFFER_MILLIS:J

.field private static final MIN_TIME_FOR_SCRUBBING_TERMINATION_MILLIS:J

.field private static final MIN_TRACK_STREAMED_MILLIS:J

.field private static final VALID_EXTENSIONS:Ljava/util/Set;

.field private static final logger:Lorg/slf4j/Logger;

.field private static final nativeLogger:Lorg/slf4j/Logger;


# instance fields
.field private actualPosition:Lcom/amazon/music/media/playback/player/PositionTracker;

.field private final bandGainCache:[I

.field private bassGainMillibels:I

.field private bestAvailableAttributes:Lcom/amazon/music/media/playback/PlaybackAttributes;

.field private final callback:Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;

.field private volatile clearingData:Z

.field private clientInfo:Lcom/amazon/digitalmusicplayback/ClientInfo;

.field private final context:Landroid/content/Context;

.field private currentPlaybackAttributes:Lcom/amazon/music/media/playback/PlaybackAttributes;

.field private currentPlayerCapabilities:Lcom/amazon/music/media/playback/PlayerCapabilities;

.field private customerBenefitFlags:Ljava/util/EnumSet;

.field private debugHarley:Z

.field private desiredSeekPosition:J

.field private dmlsConfig:Lcom/amazon/digitalmusicplayback/DMLSConfig;

.field private downloaded:Z

.field private final entryQueue:Ljava/util/List;

.field private frameChangedListener:Lcom/amazon/music/media/playback/OnFrameChangedListener;

.field private harleyRequest:Ljava/lang/Object;

.field private harleySequenceId:I

.field private volatile harleyStalled:Z

.field private ignoreTrackStreamed:Z

.field private volatile initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

.field private final initStatusLock:Ljava/lang/Object;

.field private volatile lastSeenTrackId:I

.field private loudnessNormalizationEnabled:Z

.field private mricToken:Ljava/lang/String;

.field private muted:Z

.field private openTelemetryReporter:Lcom/amazon/digitalmusicplayback/OpenTelemetryReporter;

.field private otaStreamingQualitySetting:Lcom/amazon/digitalmusicplayback/QualitySetting;

.field private final playRequestMap:Landroid/util/SparseArray;

.field private playbackListener:Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$PBListener;

.field private playbackMetricsListener:Lcom/amazon/music/media/playback/OnPlaybackMetricsListener;

.field private player:Lcom/amazon/digitalmusicplayback/Player;

.field private playerAuthentication:Lcom/amazon/music/media/playback/config/PlayerAuthentication;

.field private prebufferChangedListener:Lcom/amazon/music/media/playback/OnPrebufferChangedListener;

.field private prioritizeDownloads:Z

.field private recentlyPlayed:Landroid/util/LruCache;

.field private final requestQueue:Ljava/util/List;

.field private scrubbingTimestamp:J

.field private seekEndTime:J

.field private seekPosition:J

.field private seeking:Z

.field private volatile shouldClearData:Z

.field private volatile status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

.field private storageDir:Ljava/io/File;

.field private streamOnWifiOnly:Ljava/lang/Boolean;

.field private tempDir:Ljava/io/File;

.field private threeDMode:Z

.field private trebleGainMillibels:I

.field private final unmodifiableRequestQueue:Ljava/util/List;

.field private volume:F

.field private wifiStreamingQualitySetting:Lcom/amazon/digitalmusicplayback/QualitySetting;


# direct methods
.method public static synthetic $r8$lambda$WOfN7nL4gR2vZaHhQUX9vYT6f60(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Ljava/lang/String;Ljava/util/EnumSet;)V
    .locals 0

    .line 0
    invoke-direct {p0, p1, p2}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->lambda$setProfileInformation$0(Ljava/lang/String;Ljava/util/EnumSet;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetactualPosition(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Lcom/amazon/music/media/playback/player/PositionTracker;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->actualPosition:Lcom/amazon/music/media/playback/player/PositionTracker;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcallback(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->callback:Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetdebugHarley(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Z
    .locals 0

    .line 0
    iget-boolean p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->debugHarley:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetentryQueue(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Ljava/util/List;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetframeChangedListener(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Lcom/amazon/music/media/playback/OnFrameChangedListener;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->frameChangedListener:Lcom/amazon/music/media/playback/OnFrameChangedListener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetharleyRequest(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Ljava/lang/Object;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleyRequest:Ljava/lang/Object;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetharleyStalled(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Z
    .locals 0

    .line 0
    iget-boolean p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleyStalled:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetignoreTrackStreamed(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Z
    .locals 0

    .line 0
    iget-boolean p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->ignoreTrackStreamed:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetinitStatus(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetinitStatusLock(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Ljava/lang/Object;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatusLock:Ljava/lang/Object;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmricToken(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Ljava/lang/String;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->mricToken:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetplayRequestMap(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Landroid/util/SparseArray;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playRequestMap:Landroid/util/SparseArray;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetplaybackListener(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$PBListener;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playbackListener:Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$PBListener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetplaybackMetricsListener(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Lcom/amazon/music/media/playback/OnPlaybackMetricsListener;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playbackMetricsListener:Lcom/amazon/music/media/playback/OnPlaybackMetricsListener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetplayer(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Lcom/amazon/digitalmusicplayback/Player;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetplayerAuthentication(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Lcom/amazon/music/media/playback/config/PlayerAuthentication;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playerAuthentication:Lcom/amazon/music/media/playback/config/PlayerAuthentication;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetprebufferChangedListener(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Lcom/amazon/music/media/playback/OnPrebufferChangedListener;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->prebufferChangedListener:Lcom/amazon/music/media/playback/OnPrebufferChangedListener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetrequestQueue(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Ljava/util/List;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetscrubbingTimestamp(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)J
    .locals 2

    .line 0
    iget-wide v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->scrubbingTimestamp:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$fgetseeking(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Z
    .locals 0

    .line 0
    iget-boolean p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seeking:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetshouldClearData(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Z
    .locals 0

    .line 0
    iget-boolean p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->shouldClearData:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetstatus(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputbestAvailableAttributes(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/PlaybackAttributes;)V
    .locals 0

    .line 0
    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->bestAvailableAttributes:Lcom/amazon/music/media/playback/PlaybackAttributes;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputclearingData(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Z)V
    .locals 0

    .line 0
    iput-boolean p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->clearingData:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputcurrentPlaybackAttributes(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/PlaybackAttributes;)V
    .locals 0

    .line 0
    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->currentPlaybackAttributes:Lcom/amazon/music/media/playback/PlaybackAttributes;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputcurrentPlayerCapabilities(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/PlayerCapabilities;)V
    .locals 0

    .line 0
    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->currentPlayerCapabilities:Lcom/amazon/music/media/playback/PlayerCapabilities;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputdownloaded(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Z)V
    .locals 0

    .line 0
    iput-boolean p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->downloaded:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputinitStatus(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;)V
    .locals 0

    .line 0
    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputscrubbingTimestamp(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;J)V
    .locals 0

    .line 0
    iput-wide p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->scrubbingTimestamp:J

    return-void
.end method

.method static bridge synthetic -$$Nest$fputseekEndTime(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;J)V
    .locals 0

    .line 0
    iput-wide p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seekEndTime:J

    return-void
.end method

.method static bridge synthetic -$$Nest$fputseeking(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Z)V
    .locals 0

    .line 0
    iput-boolean p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seeking:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputshouldClearData(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Z)V
    .locals 0

    .line 0
    iput-boolean p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->shouldClearData:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputstatus(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;)V
    .locals 0

    .line 0
    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    return-void
.end method

.method static bridge synthetic -$$Nest$mcreatePlaybackException(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;ILcom/amazon/digitalmusicplayback/EngineError;)Lcom/amazon/music/media/playback/PlaybackException;
    .locals 0

    .line 0
    invoke-direct {p0, p1, p2}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->createPlaybackException(ILcom/amazon/digitalmusicplayback/EngineError;)Lcom/amazon/music/media/playback/PlaybackException;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mcreatePlayer(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/digitalmusicplayback/DMLSConfig;)V
    .locals 0

    .line 0
    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->createPlayer(Lcom/amazon/digitalmusicplayback/DMLSConfig;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcreatePlayerIfNeeded(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->createPlayerIfNeeded()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mendSeek(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;J)V
    .locals 0

    .line 0
    invoke-direct {p0, p1, p2}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->endSeek(J)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetRequest(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;I)Ljava/lang/Object;
    .locals 0

    .line 0
    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->getRequest(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mindexOf(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;I)I
    .locals 0

    .line 0
    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->indexOf(I)I

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$misFirstInQueue(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;I)Z
    .locals 0

    .line 0
    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->isFirstInQueue(I)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$misHarleyCurrent(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Z
    .locals 0

    .line 0
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->isHarleyCurrent()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$misSeeking(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)Z
    .locals 0

    .line 0
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->isSeeking()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mrecreatePlayer(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->recreatePlayer()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetHarleySequenceId(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;I)Z
    .locals 0

    .line 0
    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->setHarleySequenceId(I)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$msetHarleyStalled(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Z)V
    .locals 0

    .line 0
    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->setHarleyStalled(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetupPlayer(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->setupPlayer()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mstartPlayback(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->startPlayback()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateDuration(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;I)V
    .locals 0

    .line 0
    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->updateDuration(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetMIN_TIME_FOR_SCRUBBING_REBUFFER_MILLIS()J
    .locals 2

    .line 0
    sget-wide v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->MIN_TIME_FOR_SCRUBBING_REBUFFER_MILLIS:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$sfgetMIN_TIME_FOR_SCRUBBING_TERMINATION_MILLIS()J
    .locals 2

    .line 0
    sget-wide v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->MIN_TIME_FOR_SCRUBBING_TERMINATION_MILLIS:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$sfgetMIN_TRACK_STREAMED_MILLIS()J
    .locals 2

    .line 0
    sget-wide v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->MIN_TRACK_STREAMED_MILLIS:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$sfgetlogger()Lorg/slf4j/Logger;
    .locals 1

    .line 0
    sget-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetnativeLogger()Lorg/slf4j/Logger;
    .locals 1

    .line 0
    sget-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->nativeLogger:Lorg/slf4j/Logger;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 111
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x2

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v1

    sput-wide v1, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->MIN_TIME_FOR_SCRUBBING_TERMINATION_MILLIS:J

    const-wide/16 v1, 0x1

    .line 115
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v3

    sput-wide v3, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->MIN_TIME_FOR_SCRUBBING_REBUFFER_MILLIS:J

    .line 127
    const-string v3, "HarleyWrapper"

    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;

    move-result-object v3

    sput-object v3, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    .line 129
    const-string v3, "DMPPlayer"

    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;

    move-result-object v3

    sput-object v3, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->nativeLogger:Lorg/slf4j/Logger;

    .line 131
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v3

    sput-wide v3, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->AUTO_END_SEEK_MILLIS:J

    .line 137
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->MIN_TRACK_STREAMED_MILLIS:J

    .line 141
    sget-object v0, Lcom/amazon/digitalmusicplayback/QualitySetting;->BESTAVAILABLE:Lcom/amazon/digitalmusicplayback/QualitySetting;

    sput-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->DEFAULT_AUDIO_QUALITY_SETTING:Lcom/amazon/digitalmusicplayback/QualitySetting;

    .line 143
    sget-object v0, Lcom/amazon/digitalmusicplayback/EqualizerFormat;->BANDSIZE5:Lcom/amazon/digitalmusicplayback/EqualizerFormat;

    sput-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->EQUALIZER_FORMAT:Lcom/amazon/digitalmusicplayback/EqualizerFormat;

    .line 155
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->VALID_EXTENSIONS:Ljava/util/Set;

    .line 156
    const-string v1, "aac"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 157
    const-string v1, "aif"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 158
    const-string v1, "aiff"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 159
    const-string v1, "flac"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 160
    const-string/jumbo v1, "m4a"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 161
    const-string/jumbo v1, "mp3"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 162
    const-string/jumbo v1, "mpg"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 163
    const-string/jumbo v1, "ogg"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 164
    const-string/jumbo v1, "wav"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 165
    const-string/jumbo v1, "wma"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 171
    :try_start_0
    sget v0, Lcom/amazon/digitalmusicplayback/PlayerFactory;->$r8$clinit:I
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 173
    new-instance v1, Ljava/lang/ExceptionInInitializerError;

    invoke-direct {v1, v0}, Ljava/lang/ExceptionInInitializerError;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;)V
    .locals 3

    .line 258
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 179
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatusLock:Ljava/lang/Object;

    .line 182
    sget-object v0, Lcom/amazon/music/media/playback/PlaybackAttributes;->UNKNOWN:Lcom/amazon/music/media/playback/PlaybackAttributes;

    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->currentPlaybackAttributes:Lcom/amazon/music/media/playback/PlaybackAttributes;

    .line 183
    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->bestAvailableAttributes:Lcom/amazon/music/media/playback/PlaybackAttributes;

    .line 188
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playRequestMap:Landroid/util/SparseArray;

    .line 191
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    .line 194
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    .line 196
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->unmodifiableRequestQueue:Ljava/util/List;

    const/4 v0, -0x1

    .line 199
    iput v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleySequenceId:I

    const/4 v0, 0x0

    .line 204
    iput-boolean v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->debugHarley:Z

    .line 209
    sget-object v0, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->UNSTARTED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    .line 210
    sget-object v0, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->UNINITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    const/4 v0, 0x1

    .line 213
    iput-boolean v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleyStalled:Z

    const/high16 v0, -0x80000000

    .line 214
    iput v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->lastSeenTrackId:I

    .line 219
    new-instance v1, Lcom/amazon/music/media/playback/player/PositionTracker;

    invoke-direct {v1}, Lcom/amazon/music/media/playback/player/PositionTracker;-><init>()V

    iput-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->actualPosition:Lcom/amazon/music/media/playback/player/PositionTracker;

    .line 223
    new-instance v1, Landroid/util/LruCache;

    const/16 v2, 0x18

    invoke-direct {v1, v2}, Landroid/util/LruCache;-><init>(I)V

    iput-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->recentlyPlayed:Landroid/util/LruCache;

    const/high16 v1, 0x3f800000    # 1.0f

    .line 226
    iput v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->volume:F

    .line 228
    sget-object v1, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->DEFAULT_AUDIO_QUALITY_SETTING:Lcom/amazon/digitalmusicplayback/QualitySetting;

    iput-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->wifiStreamingQualitySetting:Lcom/amazon/digitalmusicplayback/QualitySetting;

    .line 229
    iput-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->otaStreamingQualitySetting:Lcom/amazon/digitalmusicplayback/QualitySetting;

    .line 235
    iput v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->bassGainMillibels:I

    .line 236
    iput v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->trebleGainMillibels:I

    .line 259
    invoke-static {p1}, Lorg/apache/commons/lang3/Validate;->notNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->context:Landroid/content/Context;

    .line 260
    invoke-static {p2}, Lorg/apache/commons/lang3/Validate;->notNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;

    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->callback:Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;

    .line 262
    invoke-virtual {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->getEqualizerBandCount()I

    move-result p1

    new-array p1, p1, [I

    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->bandGainCache:[I

    .line 263
    invoke-static {p1, v0}, Ljava/util/Arrays;->fill([II)V

    return-void
.end method

.method private addSoonToPlayToRecents()V
    .locals 6

    .line 1001
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/16 v1, 0x8

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    if-lez v1, :cond_1

    .line 1004
    iget-object v3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/amazon/digitalmusicplayback/SequenceEntry;

    .line 1005
    iget-object v4, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v3, :cond_0

    if-eqz v4, :cond_0

    .line 1007
    iget-object v5, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->recentlyPlayed:Landroid/util/LruCache;

    invoke-virtual {v3}, Lcom/amazon/digitalmusicplayback/SequenceEntry;->getSequenceID()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v5, v3, v4}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, -0x1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private append(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 10

    .line 963
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    .line 964
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    move v4, v2

    :goto_0
    if-le v0, v1, :cond_1

    .line 970
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Too many entries returned! (requested "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " and returned "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/amazon/music/media/playback/util/StrictMode;->crashIfStrict(Ljava/lang/String;)V

    .line 974
    :cond_1
    iget-object v5, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    move v5, v4

    move v4, v2

    :goto_1
    if-ge v2, v1, :cond_6

    if-nez v5, :cond_2

    sub-int v6, v0, v4

    sub-int v7, v1, v2

    if-ne v6, v7, :cond_2

    move v5, v3

    :cond_2
    const/4 v6, 0x0

    if-lt v4, v0, :cond_3

    .line 984
    iget-object v7, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 986
    :cond_3
    invoke-interface {p3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/amazon/digitalmusicplayback/SequenceEntry;

    if-nez v5, :cond_5

    .line 987
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7}, Lcom/amazon/digitalmusicplayback/SequenceEntry;->getURI()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    goto :goto_2

    .line 992
    :cond_4
    iget-object v7, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 988
    :cond_5
    :goto_2
    iget-object v6, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 989
    iget-object v6, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playRequestMap:Landroid/util/SparseArray;

    invoke-virtual {v7}, Lcom/amazon/digitalmusicplayback/SequenceEntry;->getSequenceID()I

    move-result v7

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    add-int/lit8 v4, v4, 0x1

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 997
    :cond_6
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->addSoonToPlayToRecents()V

    return-void
.end method

.method private canCreatePlayer()Z
    .locals 2

    .line 378
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->dmlsConfig:Lcom/amazon/digitalmusicplayback/DMLSConfig;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playerAuthentication:Lcom/amazon/music/media/playback/config/PlayerAuthentication;

    if-nez v0, :cond_0

    goto :goto_0

    .line 381
    :cond_0
    invoke-virtual {v0}, Lcom/amazon/music/media/playback/config/PlayerAuthentication;->isValid()Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    .line 384
    :cond_1
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->dmlsConfig:Lcom/amazon/digitalmusicplayback/DMLSConfig;

    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/DMLSConfig;->getDeviceID()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/amazon/music/media/playback/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    return v1

    :cond_2
    const/4 p0, 0x1

    return p0

    :cond_3
    :goto_0
    return v1
.end method

.method private clearDataInBackground()V
    .locals 1

    .line 806
    new-instance v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$4;

    invoke-direct {v0, p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$4;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)V

    invoke-static {v0}, Lcom/amazon/music/media/playback/util/ThreadUtils;->postInBackground(Ljava/lang/Runnable;)V

    return-void
.end method

.method private convertIntToShort(I)S
    .locals 0

    .line 0
    const/16 p0, -0x8000

    if-ge p1, p0, :cond_0

    return p0

    :cond_0
    const/16 p0, 0x7fff

    if-le p1, p0, :cond_1

    return p0

    :cond_1
    int-to-short p0, p1

    return p0
.end method

.method private convertToUris(Ljava/util/List;)Ljava/util/List;
    .locals 3

    .line 1483
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1484
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 1485
    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->callback:Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;

    invoke-interface {v2, v1}, Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;->getUri(Ljava/lang/Object;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    .line 1486
    invoke-static {v1, v2}, Lcom/amazon/music/media/playback/util/StringUtils;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private createFilePath(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 621
    new-instance p0, Ljava/io/File;

    invoke-direct {p0, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 622
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 623
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    .line 624
    sget-object p1, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "File path created: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    return-object p0
.end method

.method private createPlaybackException(ILcom/amazon/digitalmusicplayback/EngineError;)Lcom/amazon/music/media/playback/PlaybackException;
    .locals 6

    .line 1651
    invoke-virtual {p2}, Lcom/amazon/digitalmusicplayback/EngineError;->getCode()Lcom/amazon/digitalmusicplayback/ErrorCode;

    move-result-object v0

    invoke-static {v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->getPlaybackError(Lcom/amazon/digitalmusicplayback/ErrorCode;)Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    move-result-object v0

    .line 1652
    sget-object v1, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$5;->$SwitchMap$com$amazon$digitalmusicplayback$ErrorScope:[I

    invoke-virtual {p2}, Lcom/amazon/digitalmusicplayback/EngineError;->getScope()Lcom/amazon/digitalmusicplayback/ErrorScope;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x0

    const/4 v3, 0x1

    packed-switch v1, :pswitch_data_0

    .line 1693
    sget-object v1, Lcom/amazon/music/media/playback/PlaybackException$Recoverability;->MEDIA_ITEM:Lcom/amazon/music/media/playback/PlaybackException$Recoverability;

    :goto_0
    move v2, v3

    :goto_1
    move v4, v2

    goto :goto_3

    .line 1686
    :pswitch_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "trackInitFailed("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/amazon/music/media/playback/util/StrictMode;->crashIfStrict(Ljava/lang/String;)V

    .line 1687
    sget-object v1, Lcom/amazon/music/media/playback/PlaybackException$Recoverability;->MEDIA_ITEM:Lcom/amazon/music/media/playback/PlaybackException$Recoverability;

    goto :goto_0

    .line 1681
    :pswitch_1
    sget-object v1, Lcom/amazon/music/media/playback/PlaybackException$Recoverability;->COLLECTION:Lcom/amazon/music/media/playback/PlaybackException$Recoverability;

    :goto_2
    move v4, v3

    goto :goto_3

    .line 1676
    :pswitch_2
    sget-object v1, Lcom/amazon/music/media/playback/PlaybackException$Recoverability;->COLLECTION:Lcom/amazon/music/media/playback/PlaybackException$Recoverability;

    goto :goto_2

    .line 1665
    :pswitch_3
    sget-object v1, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->DrmLicenseExpired:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    if-ne v0, v1, :cond_0

    .line 1666
    sget-object v1, Lcom/amazon/music/media/playback/PlaybackException$Recoverability;->MEDIA_ITEM:Lcom/amazon/music/media/playback/PlaybackException$Recoverability;

    goto :goto_2

    .line 1670
    :cond_0
    sget-object v1, Lcom/amazon/music/media/playback/PlaybackException$Recoverability;->COLLECTION:Lcom/amazon/music/media/playback/PlaybackException$Recoverability;

    goto :goto_0

    .line 1660
    :pswitch_4
    sget-object v1, Lcom/amazon/music/media/playback/PlaybackException$Recoverability;->MEDIA_ITEM:Lcom/amazon/music/media/playback/PlaybackException$Recoverability;

    goto :goto_0

    .line 1655
    :pswitch_5
    sget-object v1, Lcom/amazon/music/media/playback/PlaybackException$Recoverability;->CONTROLLER:Lcom/amazon/music/media/playback/PlaybackException$Recoverability;

    goto :goto_1

    .line 1698
    :goto_3
    new-instance v5, Lcom/amazon/music/media/playback/PlaybackException$Config;

    invoke-direct {v5, v1}, Lcom/amazon/music/media/playback/PlaybackException$Config;-><init>(Lcom/amazon/music/media/playback/PlaybackException$Recoverability;)V

    .line 1699
    invoke-virtual {v5, v2}, Lcom/amazon/music/media/playback/PlaybackException$Config;->autoRetry(Z)Lcom/amazon/music/media/playback/PlaybackException$Config;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "trackInitFailed: "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1700
    invoke-virtual {v1, v2}, Lcom/amazon/music/media/playback/PlaybackException$Config;->description(Ljava/lang/String;)Lcom/amazon/music/media/playback/PlaybackException$Config;

    move-result-object v1

    .line 1701
    invoke-virtual {v1, v0}, Lcom/amazon/music/media/playback/PlaybackException$Config;->playbackError(Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;)Lcom/amazon/music/media/playback/PlaybackException$Config;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1702
    invoke-virtual {p2}, Lcom/amazon/digitalmusicplayback/EngineError;->getCode()Lcom/amazon/digitalmusicplayback/ErrorCode;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/amazon/digitalmusicplayback/EngineError;->getScope()Lcom/amazon/digitalmusicplayback/ErrorScope;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/music/media/playback/PlaybackException$Config;->metricsName(Ljava/lang/String;)Lcom/amazon/music/media/playback/PlaybackException$Config;

    move-result-object v0

    if-eqz v4, :cond_1

    .line 1704
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->callback:Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;

    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->getRequest(I)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {v1, p0}, Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;->getMediaItem(Ljava/lang/Object;)Lcom/amazon/music/media/playback/MediaItem;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/amazon/music/media/playback/PlaybackException$Config;->mediaItem(Lcom/amazon/music/media/playback/MediaItem;)Lcom/amazon/music/media/playback/PlaybackException$Config;

    .line 1707
    :cond_1
    sget-object p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$5;->$SwitchMap$com$amazon$digitalmusicplayback$ErrorCode:[I

    invoke-virtual {p2}, Lcom/amazon/digitalmusicplayback/EngineError;->getCode()Lcom/amazon/digitalmusicplayback/ErrorCode;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p0, p0, p1

    if-eq p0, v3, :cond_2

    const/4 p1, 0x2

    if-eq p0, p1, :cond_2

    .line 1712
    new-instance p0, Lcom/amazon/music/media/playback/PlaybackException;

    invoke-direct {p0, v0}, Lcom/amazon/music/media/playback/PlaybackException;-><init>(Lcom/amazon/music/media/playback/PlaybackException$Config;)V

    return-object p0

    .line 1710
    :cond_2
    new-instance p0, Lcom/amazon/music/media/playback/NetworkUnavailableException;

    invoke-direct {p0, v0}, Lcom/amazon/music/media/playback/NetworkUnavailableException;-><init>(Lcom/amazon/music/media/playback/PlaybackException$Config;)V

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private createPlayer(Lcom/amazon/digitalmusicplayback/DMLSConfig;)V
    .locals 14

    .line 439
    const-string v1, "CreateHarleyPlayer-"

    sget-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    const-string v2, "createPlayer()"

    invoke-interface {v0, v2}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 442
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->storageDir:Ljava/io/File;

    const-string v2, "harleyDRM"

    invoke-direct {p0, v0, v2}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->createFilePath(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 445
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->tempDir:Ljava/io/File;

    const-string v2, "harleyTemp"

    invoke-direct {p0, v0, v2}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->createFilePath(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 448
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "harleyConfig"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 449
    new-instance v2, Ljava/io/File;

    iget-object v4, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->storageDir:Ljava/io/File;

    invoke-direct {v2, v4, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 450
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 451
    invoke-virtual {v0, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 453
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 456
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->storageDir:Ljava/io/File;

    const-string v2, "harleyDataStorage"

    invoke-direct {p0, v0, v2}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->createFilePath(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 458
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playerAuthentication:Lcom/amazon/music/media/playback/config/PlayerAuthentication;

    invoke-static {v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->getAuthenticationStrategy(Lcom/amazon/music/media/playback/config/PlayerAuthentication;)Lcom/amazon/digitalmusicplayback/PlayerAuthStrategy;

    move-result-object v10

    .line 460
    new-instance v3, Lcom/amazon/digitalmusicplayback/PlayerConfig;

    iget-object v11, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->wifiStreamingQualitySetting:Lcom/amazon/digitalmusicplayback/QualitySetting;

    iget-object v12, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->otaStreamingQualitySetting:Lcom/amazon/digitalmusicplayback/QualitySetting;

    iget-boolean v13, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->threeDMode:Z

    const/4 v8, 0x0

    move-object v5, p1

    invoke-direct/range {v3 .. v13}, Lcom/amazon/digitalmusicplayback/PlayerConfig;-><init>(Ljava/lang/String;Lcom/amazon/digitalmusicplayback/DMLSConfig;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Lcom/amazon/digitalmusicplayback/PlayerAuthStrategy;Lcom/amazon/digitalmusicplayback/QualitySetting;Lcom/amazon/digitalmusicplayback/QualitySetting;Z)V

    .line 472
    new-instance p1, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$PBListener;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$PBListener;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/player/impl/HarleyWrapper-IA;)V

    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playbackListener:Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$PBListener;

    .line 474
    sget-object p1, Lcom/amazon/digitalmusicplayback/PlayerAuthStrategy;->OAUTHV2:Lcom/amazon/digitalmusicplayback/PlayerAuthStrategy;

    if-ne v10, p1, :cond_1

    .line 475
    new-instance p1, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$OAuthListener;

    sget-object v2, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v4, Lcom/amazon/music/platform/providers/ProfileProvider;

    invoke-virtual {v2, v4}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v2

    check-cast v2, Lcom/amazon/music/platform/providers/ProfileProvider;

    invoke-direct {p1, p0, v2}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$OAuthListener;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/platform/providers/ProfileProvider;)V

    :goto_0
    move-object v8, p1

    goto :goto_1

    :cond_1
    new-instance p1, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$AdpListener;

    invoke-direct {p1, p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$AdpListener;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/player/impl/HarleyWrapper-IA;)V

    goto :goto_0

    .line 478
    :goto_1
    :try_start_0
    iget-boolean p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->debugHarley:Z

    if-eqz p1, :cond_2

    .line 479
    iget-object v4, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->context:Landroid/content/Context;

    iget-object v5, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playbackListener:Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$PBListener;

    new-instance v6, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$LogListener;

    invoke-direct {v6, p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$LogListener;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/player/impl/HarleyWrapper-IA;)V

    new-instance v7, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$MtrxListener;

    invoke-direct {v7, p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$MtrxListener;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/player/impl/HarleyWrapper-IA;)V

    new-instance v9, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$ConcurrencyListener;

    invoke-direct {v9, p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$ConcurrencyListener;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/player/impl/HarleyWrapper-IA;)V

    new-instance v10, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$WeblabClient;

    invoke-direct {v10, p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$WeblabClient;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/player/impl/HarleyWrapper-IA;)V

    new-instance v11, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$MetricsAttributesProvider;

    invoke-direct {v11, p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$MetricsAttributesProvider;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/player/impl/HarleyWrapper-IA;)V

    invoke-static/range {v4 .. v11}, Lcom/amazon/music/media/playback/player/impl/HarleyTracePlayer;->create(Landroid/content/Context;Lcom/amazon/digitalmusicplayback/PlaybackListener;Lcom/amazon/digitalmusicplayback/LoggingListener;Lcom/amazon/digitalmusicplayback/MetricsListener;Lcom/amazon/digitalmusicplayback/AuthenticationListener;Lcom/amazon/digitalmusicplayback/ConcurrencyListener;Lcom/amazon/digitalmusicplayback/WeblabClient;Lcom/amazon/digitalmusicplayback/MetricsAttributesProvider;)Lcom/amazon/digitalmusicplayback/Player;

    move-result-object p1

    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    .line 482
    sget-object v0, Lcom/amazon/digitalmusicplayback/PlayerLogLevel;->DEBUG:Lcom/amazon/digitalmusicplayback/PlayerLogLevel;

    invoke-virtual {p1, v0}, Lcom/amazon/digitalmusicplayback/Player;->setLogLevel(Lcom/amazon/digitalmusicplayback/PlayerLogLevel;)V

    goto :goto_2

    :catch_0
    move-exception v0

    move-object p1, v0

    goto/16 :goto_3

    .line 484
    :cond_2
    iget-object v4, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->context:Landroid/content/Context;

    iget-object v5, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playbackListener:Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$PBListener;

    new-instance v6, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$LogListener;

    invoke-direct {v6, p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$LogListener;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/player/impl/HarleyWrapper-IA;)V

    new-instance v7, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$MtrxListener;

    invoke-direct {v7, p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$MtrxListener;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/player/impl/HarleyWrapper-IA;)V

    new-instance v9, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$ConcurrencyListener;

    invoke-direct {v9, p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$ConcurrencyListener;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/player/impl/HarleyWrapper-IA;)V

    new-instance v10, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$WeblabClient;

    invoke-direct {v10, p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$WeblabClient;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/player/impl/HarleyWrapper-IA;)V

    new-instance v11, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$MetricsAttributesProvider;

    invoke-direct {v11, p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$MetricsAttributesProvider;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/player/impl/HarleyWrapper-IA;)V

    invoke-static/range {v4 .. v11}, Lcom/amazon/digitalmusicplayback/PlayerFactory;->create(Landroid/content/Context;Lcom/amazon/digitalmusicplayback/PlaybackListener;Lcom/amazon/digitalmusicplayback/LoggingListener;Lcom/amazon/digitalmusicplayback/MetricsListener;Lcom/amazon/digitalmusicplayback/AuthenticationListener;Lcom/amazon/digitalmusicplayback/ConcurrencyListener;Lcom/amazon/digitalmusicplayback/WeblabClient;Lcom/amazon/digitalmusicplayback/MetricsAttributesProvider;)Lcom/amazon/digitalmusicplayback/Player;

    move-result-object p1

    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    .line 486
    sget-object v0, Lcom/amazon/digitalmusicplayback/PlayerLogLevel;->INFO:Lcom/amazon/digitalmusicplayback/PlayerLogLevel;

    invoke-virtual {p1, v0}, Lcom/amazon/digitalmusicplayback/Player;->setLogLevel(Lcom/amazon/digitalmusicplayback/PlayerLogLevel;)V

    .line 491
    :goto_2
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->clientInfo:Lcom/amazon/digitalmusicplayback/ClientInfo;

    sget-object v2, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->EQUALIZER_FORMAT:Lcom/amazon/digitalmusicplayback/EqualizerFormat;

    invoke-virtual {p1, v3, v0, v2}, Lcom/amazon/digitalmusicplayback/Player;->initialize(Lcom/amazon/digitalmusicplayback/PlayerConfig;Lcom/amazon/digitalmusicplayback/ClientInfo;Lcom/amazon/digitalmusicplayback/EqualizerFormat;)Lcom/amazon/digitalmusicplayback/EngineError;

    move-result-object p1

    .line 492
    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/EngineError;->getCode()Lcom/amazon/digitalmusicplayback/ErrorCode;

    move-result-object v0

    sget-object v2, Lcom/amazon/digitalmusicplayback/ErrorCode;->NOERROR:Lcom/amazon/digitalmusicplayback/ErrorCode;

    if-ne v0, v2, :cond_3

    .line 500
    const-string p1, "Harley engine initialized"

    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->leaveBreadcrumb(Ljava/lang/String;)V

    .line 501
    sget-object p1, Lcom/amazon/music/media/playback/montana/musicmodel/MontanaItemPersistence;->Companion:Lcom/amazon/music/media/playback/montana/musicmodel/MontanaItemPersistence$Companion;

    invoke-virtual {p1}, Lcom/amazon/music/media/playback/montana/musicmodel/MontanaItemPersistence$Companion;->onCdmInitialized()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 527
    new-instance p1, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$3;

    invoke-direct {p1, p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$3;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;)V

    invoke-static {p1}, Lcom/amazon/music/media/playback/util/ThreadUtils;->runOnMainThread(Ljava/lang/Runnable;)V

    return-void

    .line 493
    :cond_3
    :try_start_1
    new-instance v0, Lcom/amazon/music/media/playback/PlaybackException$Config;

    sget-object v2, Lcom/amazon/music/media/playback/PlaybackException$Recoverability;->CONTROLLER:Lcom/amazon/music/media/playback/PlaybackException$Recoverability;

    invoke-direct {v0, v2}, Lcom/amazon/music/media/playback/PlaybackException$Config;-><init>(Lcom/amazon/music/media/playback/PlaybackException$Recoverability;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 494
    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/EngineError;->getCode()Lcom/amazon/digitalmusicplayback/ErrorCode;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/amazon/music/media/playback/PlaybackException$Config;->metricsName(Ljava/lang/String;)Lcom/amazon/music/media/playback/PlaybackException$Config;

    move-result-object v0

    .line 495
    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/EngineError;->getCode()Lcom/amazon/digitalmusicplayback/ErrorCode;

    move-result-object v2

    invoke-static {v2}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->getPlaybackError(Lcom/amazon/digitalmusicplayback/ErrorCode;)Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/amazon/music/media/playback/PlaybackException$Config;->playbackError(Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;)Lcom/amazon/music/media/playback/PlaybackException$Config;

    move-result-object v0

    .line 496
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "EngineError - Code: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/EngineError;->getCode()Lcom/amazon/digitalmusicplayback/ErrorCode;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", Scope: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/EngineError;->getScope()Lcom/amazon/digitalmusicplayback/ErrorScope;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", Descriptor: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/EngineError;->getDescriptor()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/amazon/music/media/playback/PlaybackException$Config;->description(Ljava/lang/String;)Lcom/amazon/music/media/playback/PlaybackException$Config;

    .line 497
    new-instance p1, Lcom/amazon/music/media/playback/PlaybackException;

    invoke-direct {p1, v0}, Lcom/amazon/music/media/playback/PlaybackException;-><init>(Lcom/amazon/music/media/playback/PlaybackException$Config;)V

    throw p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 503
    :goto_3
    sget-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    const-string v2, "Error initializing Harley"

    invoke-interface {v0, v2, p1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 505
    instance-of v0, p1, Lcom/amazon/music/media/playback/PlaybackException;

    if-eqz v0, :cond_4

    .line 506
    check-cast p1, Lcom/amazon/music/media/playback/PlaybackException;

    goto :goto_4

    .line 508
    :cond_4
    new-instance v0, Lcom/amazon/music/media/playback/PlaybackException$Config;

    sget-object v2, Lcom/amazon/music/media/playback/PlaybackException$Recoverability;->CONTROLLER:Lcom/amazon/music/media/playback/PlaybackException$Recoverability;

    invoke-direct {v0, v2}, Lcom/amazon/music/media/playback/PlaybackException$Config;-><init>(Lcom/amazon/music/media/playback/PlaybackException$Recoverability;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 509
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/music/media/playback/PlaybackException$Config;->metricsName(Ljava/lang/String;)Lcom/amazon/music/media/playback/PlaybackException$Config;

    move-result-object v0

    const-string v1, "Exception initializing Harley"

    .line 510
    invoke-virtual {v0, v1}, Lcom/amazon/music/media/playback/PlaybackException$Config;->description(Ljava/lang/String;)Lcom/amazon/music/media/playback/PlaybackException$Config;

    move-result-object v0

    .line 511
    invoke-virtual {v0, p1}, Lcom/amazon/music/media/playback/PlaybackException$Config;->source(Ljava/lang/Throwable;)Lcom/amazon/music/media/playback/PlaybackException$Config;

    move-result-object p1

    .line 512
    new-instance v0, Lcom/amazon/music/media/playback/PlaybackException;

    invoke-direct {v0, p1}, Lcom/amazon/music/media/playback/PlaybackException;-><init>(Lcom/amazon/music/media/playback/PlaybackException$Config;)V

    move-object p1, v0

    .line 514
    :goto_4
    new-instance v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$2;

    invoke-direct {v0, p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$2;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/music/media/playback/PlaybackException;)V

    invoke-static {v0}, Lcom/amazon/music/media/playback/util/ThreadUtils;->runOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private createPlayerIfNeeded()V
    .locals 3

    .line 392
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatusLock:Ljava/lang/Object;

    monitor-enter v0

    .line 393
    :try_start_0
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v2, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->UNINITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v1, v2, :cond_2

    iget-boolean v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->clearingData:Z

    if-nez v1, :cond_2

    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->canCreatePlayer()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 396
    :cond_0
    sget-object v1, Lcom/amazon/music/media/playback/util/AutomotiveServiceUtil;->INSTANCE:Lcom/amazon/music/media/playback/util/AutomotiveServiceUtil;

    invoke-virtual {v1}, Lcom/amazon/music/media/playback/util/AutomotiveServiceUtil;->isAutomotiveServiceRunning()Z

    move-result v1

    if-nez v1, :cond_1

    .line 397
    invoke-static {}, Lcom/amazon/music/media/playback/util/AndroidUtils;->isApplicationInForeground()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    sget-object v2, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->UNSTARTED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    if-ne v1, v2, :cond_1

    .line 399
    invoke-static {}, Lcom/amazon/music/media/playback/Playback;->getInstance()Lcom/amazon/music/media/playback/Playback;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/music/media/playback/Playback;->getPlaybackConfig()Lcom/amazon/music/media/playback/config/PlaybackConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/music/media/playback/config/PlaybackConfig;->isAutomotiveControls()Z

    move-result v1

    if-nez v1, :cond_1

    .line 402
    invoke-static {p0}, Lcom/amazon/music/media/playback/util/AndroidUtils;->addForegroundListener(Lcom/amazon/music/media/playback/util/AndroidUtils$ForegroundListener;)V

    .line 403
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 405
    :cond_1
    invoke-static {p0}, Lcom/amazon/music/media/playback/util/AndroidUtils;->removeForegroundListener(Lcom/amazon/music/media/playback/util/AndroidUtils$ForegroundListener;)V

    .line 406
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->dmlsConfig:Lcom/amazon/digitalmusicplayback/DMLSConfig;

    .line 407
    sget-object v2, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZING:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    iput-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    .line 408
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 409
    new-instance v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$1;

    invoke-direct {v0, p0, v1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$1;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Lcom/amazon/digitalmusicplayback/DMLSConfig;)V

    invoke-static {v0}, Lcom/amazon/music/media/playback/util/ThreadUtils;->runInBackground(Ljava/lang/Runnable;)V

    return-void

    .line 394
    :cond_2
    :goto_0
    :try_start_1
    monitor-exit v0

    return-void

    .line 408
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private endSeek(J)V
    .locals 4

    .line 1598
    iget-wide v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seekPosition:J

    iget-wide v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->desiredSeekPosition:J

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1599
    iget-wide p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->desiredSeekPosition:J

    iput-wide p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seekPosition:J

    .line 1600
    invoke-static {}, Lcom/amazon/music/media/playback/util/Clock;->now()J

    move-result-wide p1

    sget-wide v2, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->AUTO_END_SEEK_MILLIS:J

    add-long/2addr p1, v2

    iput-wide p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seekEndTime:J

    .line 1601
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    iget-object p2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/amazon/digitalmusicplayback/SequenceEntry;

    iget-wide v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->desiredSeekPosition:J

    invoke-virtual {p1, p2, v0, v1}, Lcom/amazon/digitalmusicplayback/Player;->seek(Lcom/amazon/digitalmusicplayback/SequenceEntry;J)V

    return-void

    .line 1603
    :cond_0
    iput-boolean v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seeking:Z

    const-wide/16 v0, 0x0

    .line 1604
    iput-wide v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seekEndTime:J

    .line 1605
    iget-boolean v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleyStalled:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->PENDING:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    if-ne v0, v1, :cond_1

    .line 1606
    sget-object v0, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->RENDERING:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    .line 1607
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->callback:Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;

    invoke-interface {v0}, Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;->onStatusChanged()V

    .line 1609
    :cond_1
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->callback:Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;

    invoke-interface {p0, p1, p2}, Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;->onPositionChanged(J)V

    return-void
.end method

.method private filterUris(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 2

    .line 1496
    new-instance p0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 1497
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1498
    invoke-static {v0}, Lcom/amazon/music/media/playback/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1499
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method private static getAuthenticationStrategy(Lcom/amazon/music/media/playback/config/PlayerAuthentication;)Lcom/amazon/digitalmusicplayback/PlayerAuthStrategy;
    .locals 1

    .line 251
    sget-object v0, Lcom/amazon/digitalmusicplayback/PlayerAuthStrategy;->ADP:Lcom/amazon/digitalmusicplayback/PlayerAuthStrategy;

    if-nez p0, :cond_0

    goto :goto_0

    .line 255
    :cond_0
    invoke-virtual {p0}, Lcom/amazon/music/media/playback/config/PlayerAuthentication;->isOAuth()Z

    move-result p0

    if-eqz p0, :cond_1

    sget-object p0, Lcom/amazon/digitalmusicplayback/PlayerAuthStrategy;->OAUTHV2:Lcom/amazon/digitalmusicplayback/PlayerAuthStrategy;

    return-object p0

    :cond_1
    :goto_0
    return-object v0
.end method

.method private static getPlaybackError(Lcom/amazon/digitalmusicplayback/ErrorCode;)Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;
    .locals 2

    if-nez p0, :cond_0

    .line 1015
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->GenericStreaming:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1020
    :cond_0
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->DMLSUNKNOWNERROR:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1021
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->DMLS:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1022
    :cond_1
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->CONTENTNOTELIGIBLE:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1023
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->ContentNotEligible:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1024
    :cond_2
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->CUSTOMERNOTELIGIBLE:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1025
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->CustomerNotEligible:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1026
    :cond_3
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->BADREQUEST:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->FRAGMENTREQUESTFAILED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1027
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->RETRYFAILURE:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1028
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->NETWORKREQUESTFAILED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1029
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->SERVICEUNAVAILABLE:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1030
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->INTERNALERROR:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1031
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->THROTTLINGERROR:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1032
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->DEPENDENCYSERVICEERROR:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1033
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->SYSTEMOTHERERROR:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1034
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->VALIDATIONERROR:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1035
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto/16 :goto_9

    .line 1037
    :cond_4
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->AUDIODEVICEUNAVAILABLE:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1b

    sget-object v1, Lcom/amazon/digitalmusicplayback/ErrorCode;->ENGINENOTINITIALIZED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1038
    invoke-virtual {v1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1b

    .line 1039
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->OUTOFMEMORYERROR:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1040
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->AUDIODRIVERFAILURE:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1041
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->INVALIDCONFIGURATION:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1042
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    goto/16 :goto_8

    .line 1044
    :cond_5
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->FILEFORMAT:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->FILEPERMISSION:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1045
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->FILEOPENFAILED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1046
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->FILESEEKFAILED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1047
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->FILEREADFAILED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1048
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    goto/16 :goto_7

    .line 1050
    :cond_6
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->FILEEXCEPTION:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1051
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->InvalidFile:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1052
    :cond_7
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->UNRECOGNIZEDRESPONSESTRUCTURE:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->JSONPARSEERROR:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1053
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    goto/16 :goto_6

    .line 1055
    :cond_8
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->CONTENTNOTAVAILABLE:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->STALLING:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1056
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->MANIFESTPARSEFAILED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1057
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->MANIFESTFETCHFAILED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1058
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->EMPTYMEDIALIST:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1059
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->MANIFESTEXPIRED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1060
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->DECODEFAILED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1061
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->FRAGMENTBUILDERFAILED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1062
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->FRAGMENTPARSERFAILED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1063
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->FRAGMENTNOTBUILT:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1064
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->AVCODECFAILED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1065
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->AUDIOSTREAMNOTFOUND:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1066
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->STREAMINGSTATUSINVALID:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1067
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->UNKNOWNMARKETPLACE:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1068
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    goto/16 :goto_5

    .line 1070
    :cond_9
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->DRMSESSIONNOTINITIALIZED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->DRMDECRYPTIONFAILED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1071
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->DRMLICENSEACQUISITIONFAILED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1072
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    goto/16 :goto_4

    .line 1074
    :cond_a
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->NOTAUTHENTICATED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->CUSTOMERNOTVALID:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1075
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->DEVICENOTVALID:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1076
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->CLIENTNOTVALID:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1077
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->DEVICENOTAUTHORIZED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1078
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->DEVICEIDMISMATCH:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1079
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->UNSUPPORTEDDEVICETYPE:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1080
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->ACCOUNTNOTFOUND:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1081
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    goto/16 :goto_3

    .line 1083
    :cond_b
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->MAXCONTENTLIMIT:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->MULTIPLECONTENTREQUESTNOTSUPPORTED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1084
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->MAXCONCURRENCYERROR:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1085
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    goto/16 :goto_2

    .line 1087
    :cond_c
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->REQUIREDCOOKIESMISSING:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1088
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->Cirrus:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1089
    :cond_d
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->CONTENTNOTVALID:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->APPMETADATANOTVALID:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1090
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->PROTOCOLNOTVALID:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1091
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->APPVERSIONNOTVALID:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1092
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->EMPTYCONTENTLIST:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1093
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->INVALIDTRACKID:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1094
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->INVALIDEXPIRATIONTIME:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1095
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->INVALIDCONTENTDURATION:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1096
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->INVALIDBITRATE:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1097
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->INVALIDMANIFESTTYPE:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1098
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->INVALIDHLSVERSION:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1099
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->INVALIDANCHOR:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1100
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->UNSUPPORTEDURI:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1101
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    goto :goto_1

    .line 1103
    :cond_e
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->DOWNLOADINPROGRESS:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->FILEWRITE:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1104
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->DEVICENOTELIGIBLE:Lcom/amazon/digitalmusicplayback/ErrorCode;

    .line 1105
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    goto :goto_0

    .line 1107
    :cond_f
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->STORAGEFULL:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 1108
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->InsufficientStorage:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1109
    :cond_10
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->WIFIREQUIRED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 1110
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->StreamingRestriction:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1111
    :cond_11
    sget-object v0, Lcom/amazon/digitalmusicplayback/ErrorCode;->DRMSESSIONEXPIRED:Lcom/amazon/digitalmusicplayback/ErrorCode;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12

    .line 1112
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->DrmLicenseExpired:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1114
    :cond_12
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->GenericStreaming:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1106
    :cond_13
    :goto_0
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->SecondaryStorageNotFound:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1102
    :cond_14
    :goto_1
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->StreamingServiceError:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1086
    :cond_15
    :goto_2
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->ConnectionLimit:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1082
    :cond_16
    :goto_3
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->SignedOut:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1073
    :cond_17
    :goto_4
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->GenericDrm:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1069
    :cond_18
    :goto_5
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->StreamingPlayback:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1054
    :cond_19
    :goto_6
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->InvalidParameter:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1049
    :cond_1a
    :goto_7
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->FileNotFound:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1043
    :cond_1b
    :goto_8
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->GenericStreaming:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0

    .line 1036
    :cond_1c
    :goto_9
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;->NetworkFailure:Lcom/amazon/music/media/playback/PlaybackException$PlaybackError;

    return-object p0
.end method

.method private getQualitySettingsFromBitrate(Lcom/amazon/music/media/playback/config/BitRateSelection;)Lcom/amazon/digitalmusicplayback/QualitySetting;
    .locals 0

    .line 1303
    sget-object p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$5;->$SwitchMap$com$amazon$music$media$playback$config$BitRateSelection:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p0, p0, p1

    const/4 p1, 0x1

    if-eq p0, p1, :cond_2

    const/4 p1, 0x2

    if-eq p0, p1, :cond_1

    const/4 p1, 0x3

    if-eq p0, p1, :cond_1

    const/4 p1, 0x4

    if-eq p0, p1, :cond_0

    .line 1313
    sget-object p0, Lcom/amazon/digitalmusicplayback/QualitySetting;->BESTAVAILABLE:Lcom/amazon/digitalmusicplayback/QualitySetting;

    return-object p0

    .line 1310
    :cond_0
    sget-object p0, Lcom/amazon/digitalmusicplayback/QualitySetting;->SAVER:Lcom/amazon/digitalmusicplayback/QualitySetting;

    return-object p0

    .line 1308
    :cond_1
    sget-object p0, Lcom/amazon/digitalmusicplayback/QualitySetting;->STANDARD:Lcom/amazon/digitalmusicplayback/QualitySetting;

    return-object p0

    .line 1305
    :cond_2
    sget-object p0, Lcom/amazon/digitalmusicplayback/QualitySetting;->HD:Lcom/amazon/digitalmusicplayback/QualitySetting;

    return-object p0
.end method

.method private getRequest(I)Ljava/lang/Object;
    .locals 2

    .line 1517
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->recentlyPlayed:Landroid/util/LruCache;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 1521
    :cond_0
    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->isHarleySequenceId(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1522
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleyRequest:Ljava/lang/Object;

    return-object p0

    .line 1524
    :cond_1
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playRequestMap:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private indexOf(I)I
    .locals 3

    .line 1580
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 1582
    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazon/digitalmusicplayback/SequenceEntry;

    if-eqz v2, :cond_0

    .line 1583
    invoke-virtual {v2}, Lcom/amazon/digitalmusicplayback/SequenceEntry;->getSequenceID()I

    move-result v2

    if-ne v2, p1, :cond_0

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method private isFirstInQueue(I)Z
    .locals 2

    .line 1576
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/amazon/digitalmusicplayback/SequenceEntry;

    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/SequenceEntry;->getSequenceID()I

    move-result p0

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v1
.end method

.method private isHarleyCurrent()Z
    .locals 3

    .line 1572
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1

    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleyRequest:Ljava/lang/Object;

    if-nez p0, :cond_0

    return v1

    :cond_0
    return v2

    :cond_1
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleyRequest:Ljava/lang/Object;

    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    if-ne v0, p0, :cond_2

    return v1

    :cond_2
    return v2
.end method

.method private isHarleySequenceId(I)Z
    .locals 1

    .line 1509
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleyRequest:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleySequenceId:I

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private isNewConfig(Lcom/amazon/digitalmusicplayback/DMLSConfig;Lcom/amazon/digitalmusicplayback/ClientInfo;)Z
    .locals 1

    if-eqz p1, :cond_3

    if-nez p2, :cond_0

    goto :goto_1

    .line 298
    :cond_0
    iget-object p2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->dmlsConfig:Lcom/amazon/digitalmusicplayback/DMLSConfig;

    const/4 v0, 0x1

    if-eqz p2, :cond_2

    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->clientInfo:Lcom/amazon/digitalmusicplayback/ClientInfo;

    if-nez p0, :cond_1

    goto :goto_0

    .line 303
    :cond_1
    invoke-virtual {p1, p2}, Lcom/amazon/digitalmusicplayback/DMLSConfig;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr p0, v0

    return p0

    :cond_2
    :goto_0
    return v0

    :cond_3
    :goto_1
    const/4 p0, 0x0

    return p0
.end method

.method private isSeeking()Z
    .locals 4

    .line 1623
    iget-boolean v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seeking:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/amazon/music/media/playback/util/Clock;->now()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seekEndTime:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 1624
    iget-wide v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seekPosition:J

    invoke-direct {p0, v0, v1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->endSeek(J)V

    .line 1626
    :cond_0
    iget-boolean p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seeking:Z

    return p0
.end method

.method private synthetic lambda$setProfileInformation$0(Ljava/lang/String;Ljava/util/EnumSet;)V
    .locals 1

    .line 705
    new-instance v0, Lcom/amazon/digitalmusicplayback/ProfileInformation;

    invoke-direct {v0, p1, p2}, Lcom/amazon/digitalmusicplayback/ProfileInformation;-><init>(Ljava/lang/String;Ljava/util/EnumSet;)V

    .line 706
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0, v0}, Lcom/amazon/digitalmusicplayback/Player;->setProfileInformation(Lcom/amazon/digitalmusicplayback/ProfileInformation;)V

    return-void
.end method

.method private leaveBreadcrumb(Ljava/lang/String;)V
    .locals 1

    .line 557
    sget-object p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    invoke-interface {p0, p1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 559
    :try_start_0
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/StabilityManagerProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/StabilityManagerProvider;

    if-eqz p0, :cond_0

    .line 561
    invoke-interface {p0, p1}, Lcom/amazon/music/platform/providers/StabilityManagerProvider;->leaveBreadcrumbs(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 565
    sget-object p1, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    const-string v0, "Failed to leave breadcrumb"

    invoke-interface {p1, v0, p0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method private recreatePlayer()V
    .locals 5

    .line 418
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatusLock:Ljava/lang/Object;

    monitor-enter v0

    .line 419
    :try_start_0
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->shouldClearData:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    .line 421
    :goto_0
    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->dmlsConfig:Lcom/amazon/digitalmusicplayback/DMLSConfig;

    .line 422
    iget-object v3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->clientInfo:Lcom/amazon/digitalmusicplayback/ClientInfo;

    .line 423
    iget-object v4, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playerAuthentication:Lcom/amazon/music/media/playback/config/PlayerAuthentication;

    .line 425
    invoke-virtual {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->close()V

    .line 427
    iput-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->dmlsConfig:Lcom/amazon/digitalmusicplayback/DMLSConfig;

    .line 428
    iput-object v3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->clientInfo:Lcom/amazon/digitalmusicplayback/ClientInfo;

    .line 429
    iput-object v4, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playerAuthentication:Lcom/amazon/music/media/playback/config/PlayerAuthentication;

    if-nez v1, :cond_1

    .line 432
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->createPlayerIfNeeded()V

    .line 434
    :cond_1
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private setHarleySequenceId(I)Z
    .locals 4

    .line 1538
    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->isHarleySequenceId(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_5

    .line 1539
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playRequestMap:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleyRequest:Ljava/lang/Object;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    move v0, p1

    .line 1540
    :goto_0
    iput v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleySequenceId:I

    .line 1542
    sget-object v0, Lcom/amazon/music/media/playback/PlaybackAttributes;->UNKNOWN:Lcom/amazon/music/media/playback/PlaybackAttributes;

    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->currentPlaybackAttributes:Lcom/amazon/music/media/playback/PlaybackAttributes;

    .line 1543
    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->bestAvailableAttributes:Lcom/amazon/music/media/playback/PlaybackAttributes;

    .line 1544
    iput-boolean v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->downloaded:Z

    .line 1545
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1546
    sget-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "entryQueue was empty for trackId: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 1548
    :cond_1
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleyRequest:Ljava/lang/Object;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 1549
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->recentlyPlayed:Landroid/util/LruCache;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleyRequest:Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v0, v1

    .line 1551
    :cond_2
    :goto_1
    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazon/digitalmusicplayback/SequenceEntry;

    invoke-virtual {v2}, Lcom/amazon/digitalmusicplayback/SequenceEntry;->getSequenceID()I

    move-result v2

    if-eq v2, p1, :cond_3

    .line 1552
    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazon/digitalmusicplayback/SequenceEntry;

    if-eqz v2, :cond_2

    .line 1554
    iget-object v3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 1555
    iget-object v3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playRequestMap:Landroid/util/SparseArray;

    invoke-virtual {v2}, Lcom/amazon/digitalmusicplayback/SequenceEntry;->getSequenceID()I

    move-result v2

    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->remove(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    if-lez v0, :cond_4

    .line 1560
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->callback:Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;

    invoke-interface {p1}, Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;->onTrackChanged()V

    .line 1562
    :cond_4
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->addSoonToPlayToRecents()V

    .line 1565
    :cond_5
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleyRequest:Ljava/lang/Object;

    if-eqz p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    return v1
.end method

.method private setHarleyStalled(Z)V
    .locals 2

    .line 1717
    iput-boolean p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->harleyStalled:Z

    .line 1718
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->actualPosition:Lcom/amazon/music/media/playback/player/PositionTracker;

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->PAUSED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    if-eq p1, v1, :cond_1

    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    sget-object p1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->UNSTARTED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    if-ne p0, p1, :cond_0

    goto :goto_0

    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    :goto_1
    invoke-virtual {v0, p0}, Lcom/amazon/music/media/playback/player/PositionTracker;->setRunSpeed(F)V

    return-void
.end method

.method private setProfileInformation(Lcom/amazon/music/media/playback/config/PlayerAuthentication;)V
    .locals 2

    .line 698
    sget-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    const-string v1, "Updating Profile Information in Harley"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 701
    const-class v0, Lcom/amazon/digitalmusicplayback/CustomerBenefitFlags;

    invoke-static {v0}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    .line 702
    invoke-virtual {p1}, Lcom/amazon/music/media/playback/config/PlayerAuthentication;->getIdentifier()Ljava/lang/String;

    move-result-object p1

    .line 704
    new-instance v1, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$$ExternalSyntheticLambda0;-><init>(Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;Ljava/lang/String;Ljava/util/EnumSet;)V

    invoke-static {v1}, Lcom/amazon/music/media/playback/util/ThreadUtils;->runInBackground(Ljava/lang/Runnable;)V

    return-void
.end method

.method private setupPlayer()V
    .locals 5

    .line 570
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;
    invoke-static {v0}, Lcom/soum91/amazonmusictv/TvBridge;->attachPlayer(Ljava/lang/Object;)V

    iget v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->volume:F

    float-to-double v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/amazon/digitalmusicplayback/Player;->setVolume(D)V

    .line 571
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    iget-boolean v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->muted:Z

    invoke-virtual {v0, v1}, Lcom/amazon/digitalmusicplayback/Player;->setMuted(Z)V

    .line 572
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->wifiStreamingQualitySetting:Lcom/amazon/digitalmusicplayback/QualitySetting;

    if-eqz v0, :cond_0

    .line 573
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {v1, v0}, Lcom/amazon/digitalmusicplayback/Player;->setWifiAudioQualitySetting(Lcom/amazon/digitalmusicplayback/QualitySetting;)V

    .line 576
    :cond_0
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->otaStreamingQualitySetting:Lcom/amazon/digitalmusicplayback/QualitySetting;

    if-eqz v0, :cond_1

    .line 577
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {v1, v0}, Lcom/amazon/digitalmusicplayback/Player;->setOTAAudioQualitySetting(Lcom/amazon/digitalmusicplayback/QualitySetting;)V

    .line 580
    :cond_1
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    iget-boolean v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->loudnessNormalizationEnabled:Z

    invoke-virtual {v0, v1}, Lcom/amazon/digitalmusicplayback/Player;->setLoudnessNormalizationMode(Z)V

    .line 582
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playerAuthentication:Lcom/amazon/music/media/playback/config/PlayerAuthentication;

    if-eqz v0, :cond_2

    .line 583
    invoke-virtual {p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->setPlayerAuthentication(Lcom/amazon/music/media/playback/config/PlayerAuthentication;)V

    .line 586
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->bandGainCache:[I

    array-length v1, v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    .line 587
    :goto_0
    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->bandGainCache:[I

    array-length v3, v2

    const/high16 v4, -0x80000000

    if-ge v1, v3, :cond_4

    .line 588
    aget v2, v2, v1

    if-ne v2, v4, :cond_3

    goto :goto_1

    .line 591
    :cond_3
    new-instance v3, Lcom/amazon/digitalmusicplayback/EqualizerUpdate;

    invoke-direct {p0, v2}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->convertIntToShort(I)S

    move-result v2

    iget-object v4, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    .line 592
    invoke-virtual {v4}, Lcom/amazon/digitalmusicplayback/Player;->getEqualizerSettings()Lcom/amazon/digitalmusicplayback/EqualizerSettings;

    move-result-object v4

    invoke-virtual {v4}, Lcom/amazon/digitalmusicplayback/EqualizerSettings;->getEqualizerBandList()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/amazon/digitalmusicplayback/EqualizerBand;

    invoke-virtual {v4}, Lcom/amazon/digitalmusicplayback/EqualizerBand;->getBandIndex()B

    move-result v4

    invoke-direct {v3, v2, v4}, Lcom/amazon/digitalmusicplayback/EqualizerUpdate;-><init>(SB)V

    .line 591
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 594
    :cond_4
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {v1, v0}, Lcom/amazon/digitalmusicplayback/Player;->updateEqualizerSettings(Ljava/util/ArrayList;)V

    .line 596
    iget v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->bassGainMillibels:I

    if-eq v0, v4, :cond_5

    .line 597
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-direct {p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->convertIntToShort(I)S

    move-result v0

    invoke-virtual {v1, v0}, Lcom/amazon/digitalmusicplayback/Player;->updateBassSettings(S)V

    .line 600
    :cond_5
    iget v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->trebleGainMillibels:I

    if-eq v0, v4, :cond_6

    .line 601
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-direct {p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->convertIntToShort(I)S

    move-result v0

    invoke-virtual {v1, v0}, Lcom/amazon/digitalmusicplayback/Player;->updateTrebleSettings(S)V

    .line 604
    :cond_6
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->streamOnWifiOnly:Ljava/lang/Boolean;

    if-eqz v0, :cond_7

    .line 605
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {v1, v0}, Lcom/amazon/digitalmusicplayback/Player;->setStreamOnWifiOnly(Z)V

    .line 608
    :cond_7
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->customerBenefitFlags:Ljava/util/EnumSet;

    if-eqz v0, :cond_8

    .line 609
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {v1, v0}, Lcom/amazon/digitalmusicplayback/Player;->setCustomerBenefits(Ljava/util/EnumSet;)V

    .line 612
    :cond_8
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    iget-boolean v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->threeDMode:Z

    invoke-virtual {v0, v1}, Lcom/amazon/digitalmusicplayback/Player;->setThreeDMode(Z)V

    .line 613
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    iget-boolean v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->prioritizeDownloads:Z

    invoke-virtual {v0, v1}, Lcom/amazon/digitalmusicplayback/Player;->setPrioritizeDownloadsPlayback(Z)V

    .line 615
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->openTelemetryReporter:Lcom/amazon/digitalmusicplayback/OpenTelemetryReporter;

    if-eqz v0, :cond_9

    .line 616
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0, v0}, Lcom/amazon/digitalmusicplayback/Player;->setOpenTelemetryReporter(Lcom/amazon/digitalmusicplayback/OpenTelemetryReporter;)V

    :cond_9
    invoke-static {}, Lcom/soum91/amazonmusictv/TvBridge;->finishSetup()V
    return-void
.end method

.method private shutdown(Z)V
    .locals 4

    .line 774
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatusLock:Ljava/lang/Object;

    monitor-enter v0

    .line 775
    :try_start_0
    sget-object v1, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "shutdown("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, ") - initStatus: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x5

    invoke-static {v3}, Lcom/amazon/music/media/playback/util/StringUtils;->getStackTrace(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 776
    iget-boolean v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->clearingData:Z

    if-eqz v1, :cond_0

    .line 777
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_0
    const/4 v1, 0x1

    if-nez p1, :cond_1

    .line 779
    iget-boolean p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->shouldClearData:Z

    if-eqz p1, :cond_2

    .line 780
    :cond_1
    iput-boolean v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->shouldClearData:Z

    .line 782
    :cond_2
    invoke-static {p0}, Lcom/amazon/music/media/playback/util/AndroidUtils;->removeForegroundListener(Lcom/amazon/music/media/playback/util/AndroidUtils$ForegroundListener;)V

    .line 783
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v2, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-eq p1, v2, :cond_3

    .line 784
    monitor-exit v0

    return-void

    .line 786
    :cond_3
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v2}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->setQueue(Ljava/util/List;Z)V

    .line 787
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    const/4 v3, 0x0

    if-eqz p1, :cond_5

    .line 788
    iget-boolean p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->shouldClearData:Z

    if-eqz p1, :cond_4

    .line 789
    iput-boolean v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->clearingData:Z

    .line 790
    iput-boolean v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->shouldClearData:Z

    .line 791
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->clearDataInBackground()V

    goto :goto_0

    .line 793
    :cond_4
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p1, v1}, Lcom/amazon/digitalmusicplayback/Player;->shutdown(Ljava/lang/Boolean;)V

    .line 794
    iput-object v3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    .line 797
    :cond_5
    :goto_0
    sget-object p1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->UNINITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    .line 798
    iput-object v3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playbackListener:Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$PBListener;

    .line 799
    iput-object v3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->dmlsConfig:Lcom/amazon/digitalmusicplayback/DMLSConfig;

    .line 800
    iput-object v3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->clientInfo:Lcom/amazon/digitalmusicplayback/ClientInfo;

    .line 801
    iput-object v3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playerAuthentication:Lcom/amazon/music/media/playback/config/PlayerAuthentication;

    .line 802
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private startPlayback()V
    .locals 6

    .line 847
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-eq v0, v1, :cond_0

    .line 848
    sget-object v0, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->PENDING:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    .line 849
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->createPlayerIfNeeded()V

    return-void

    .line 853
    :cond_0
    sget-object v0, Lcom/amazon/music/metrics/mts/event/types/pagelatencyinfo/LatencyTrackingLeg;->IPD_HARLEY_REQUEST:Lcom/amazon/music/metrics/mts/event/types/pagelatencyinfo/LatencyTrackingLeg;

    invoke-static {v0}, Lcom/amazon/music/media/playback/util/MetricUtils;->emitIPDLatencyMetricLeg(Lcom/amazon/music/metrics/mts/event/types/pagelatencyinfo/LatencyTrackingLeg;)V

    .line 854
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 855
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 856
    invoke-direct {p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->convertToUris(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->filterUris(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v1

    .line 857
    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {v2, v1}, Lcom/amazon/digitalmusicplayback/Player;->play(Ljava/util/ArrayList;)Lcom/amazon/digitalmusicplayback/PlayResponse;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/digitalmusicplayback/PlayResponse;->getSequenceEntries()Ljava/util/ArrayList;

    move-result-object v2

    .line 858
    sget-object v3, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "entries: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 859
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 861
    const-string/jumbo v0, "setting status to UNSTARTED from startPlayback()"

    invoke-interface {v3, v0}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 862
    sget-object v0, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->UNSTARTED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    return-void

    .line 865
    :cond_1
    sget-object v4, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->PENDING:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    iput-object v4, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    .line 866
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "setting status to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " from setQueue()"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 867
    invoke-direct {p0, v0, v1, v2}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->append(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 868
    iget-wide v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->desiredSeekPosition:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_2

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->getCurrentRequest()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_2

    .line 869
    iget-wide v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->desiredSeekPosition:J

    invoke-virtual {p0, v0, v1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seekTo(J)V

    :cond_2
    return-void
.end method

.method private updateDuration(I)V
    .locals 5

    .line 1631
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_1

    iget v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->lastSeenTrackId:I

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 1634
    :cond_0
    iput p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->lastSeenTrackId:I

    .line 1636
    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->getRequest(I)Ljava/lang/Object;

    move-result-object p1

    .line 1637
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->callback:Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;

    invoke-interface {v0, p1}, Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;->getMediaItem(Ljava/lang/Object;)Lcom/amazon/music/media/playback/MediaItem;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1640
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {v1}, Lcom/amazon/digitalmusicplayback/Player;->getTrackDuration()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_1

    .line 1641
    invoke-virtual {v0}, Lcom/amazon/music/media/playback/MediaItem;->getDurationMillis()J

    move-result-wide v3

    cmp-long v0, v1, v3

    if-eqz v0, :cond_1

    .line 1642
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->callback:Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;

    invoke-interface {p0, p1, v1, v2}, Lcom/amazon/music/media/playback/player/IHarleyWrapper$HarleyCallback;->onDurationChanged(Ljava/lang/Object;J)V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public addToQueue(ILjava/util/List;)V
    .locals 5

    .line 903
    sget-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addToQueue("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 904
    const-string v0, ", size: "

    const-string/jumbo v1, "replaceFromIndex: "

    if-ltz p1, :cond_a

    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-gt p1, v2, :cond_a

    .line 908
    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    sget-object v3, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->UNSTARTED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    if-eq v2, v3, :cond_8

    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v4, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-eq v2, v4, :cond_0

    goto/16 :goto_2

    .line 919
    :cond_0
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    .line 920
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    sget-object v0, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->PAUSED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    if-eq p1, v0, :cond_1

    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    if-eq p1, v3, :cond_1

    move v1, v2

    :cond_1
    invoke-virtual {p0, p2, v1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->setQueue(Ljava/util/List;Z)V

    return-void

    :cond_2
    add-int/lit8 v0, p1, -0x1

    :goto_0
    if-ltz v0, :cond_3

    .line 926
    iget-object v3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_3

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_3
    if-gez v0, :cond_5

    .line 931
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    sget-object v0, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->PAUSED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    if-eq p1, v0, :cond_4

    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    sget-object v0, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->UNSTARTED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    if-eq p1, v0, :cond_4

    move v1, v2

    :cond_4
    invoke-virtual {p0, p2, v1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->setQueue(Ljava/util/List;Z)V

    return-void

    .line 936
    :cond_5
    invoke-direct {p0, p2}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->convertToUris(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 937
    invoke-direct {p0, v1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->filterUris(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v2

    .line 938
    iget-object v3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    iget-object v4, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/digitalmusicplayback/SequenceEntry;

    invoke-virtual {v3, v0, v2}, Lcom/amazon/digitalmusicplayback/Player;->enqueue(Lcom/amazon/digitalmusicplayback/SequenceEntry;Ljava/util/ArrayList;)Lcom/amazon/digitalmusicplayback/PlayResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/digitalmusicplayback/PlayResponse;->getSequenceEntries()Ljava/util/ArrayList;

    move-result-object v0

    .line 941
    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    :cond_6
    :goto_1
    add-int/lit8 v2, v2, -0x1

    if-lt v2, p1, :cond_7

    .line 942
    iget-object v3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/amazon/digitalmusicplayback/SequenceEntry;

    .line 943
    iget-object v4, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    if-eqz v3, :cond_6

    .line 945
    iget-object v4, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playRequestMap:Landroid/util/SparseArray;

    invoke-virtual {v3}, Lcom/amazon/digitalmusicplayback/SequenceEntry;->getSequenceID()I

    move-result v3

    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->remove(I)V

    goto :goto_1

    .line 950
    :cond_7
    invoke-direct {p0, p2, v1, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->append(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-void

    .line 909
    :cond_8
    :goto_2
    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-gt p1, v2, :cond_9

    .line 913
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v0, p1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 914
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-void

    .line 911
    :cond_9
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 905
    :cond_a
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public addToQueue(Ljava/lang/Object;Ljava/util/List;)V
    .locals 3

    .line 885
    sget-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addToQueue("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 886
    :cond_0
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    :goto_0
    if-gez p1, :cond_2

    .line 890
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-nez p1, :cond_1

    const/4 p1, -0x1

    goto :goto_1

    .line 895
    :cond_1
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    :cond_2
    :goto_1
    add-int/lit8 p1, p1, 0x1

    .line 898
    invoke-virtual {p0, p1, p2}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->addToQueue(ILjava/util/List;)V

    return-void
.end method

.method public canPlay(Landroid/net/Uri;)Z
    .locals 1

    const/4 p0, 0x0

    if-nez p1, :cond_0

    return p0

    .line 761
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_1

    return p0

    :cond_1
    const/16 v0, 0x2e

    .line 765
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    if-gez v0, :cond_2

    return p0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 769
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 770
    sget-object p1, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->VALID_EXTENSIONS:Ljava/util/Set;

    invoke-interface {p1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public clearCache()V
    .locals 2

    .line 740
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 741
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/Player;->clearCache()V

    :cond_0
    return-void
.end method

.method public clearData()V
    .locals 1

    const/4 v0, 0x1

    .line 732
    invoke-direct {p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->shutdown(Z)V

    return-void
.end method

.method public close()V
    .locals 1

    const/4 v0, 0x0

    .line 723
    invoke-direct {p0, v0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->shutdown(Z)V

    return-void
.end method

.method public getBassSettings()Lcom/amazon/digitalmusicplayback/FrequencySettings;
    .locals 2

    .line 1724
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 1725
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/Player;->getBassSettings()Lcom/amazon/digitalmusicplayback/FrequencySettings;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getBestAvailablePlaybackAttributes()Lcom/amazon/music/media/playback/PlaybackAttributes;
    .locals 1

    .line 656
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->isHarleyCurrent()Z

    move-result v0

    if-nez v0, :cond_0

    .line 657
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackAttributes;->UNKNOWN:Lcom/amazon/music/media/playback/PlaybackAttributes;

    return-object p0

    .line 659
    :cond_0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->bestAvailableAttributes:Lcom/amazon/music/media/playback/PlaybackAttributes;

    return-object p0
.end method

.method public getCrashDirectory()Ljava/io/File;
    .locals 2

    .line 356
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->tempDir:Ljava/io/File;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 357
    new-instance v0, Ljava/io/File;

    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->tempDir:Ljava/io/File;

    const-string v1, "harleyTemp"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getCurrentPlaybackAttributes()Lcom/amazon/music/media/playback/PlaybackAttributes;
    .locals 1

    .line 647
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->isHarleyCurrent()Z

    move-result v0

    if-nez v0, :cond_0

    .line 648
    sget-object p0, Lcom/amazon/music/media/playback/PlaybackAttributes;->UNKNOWN:Lcom/amazon/music/media/playback/PlaybackAttributes;

    return-object p0

    .line 650
    :cond_0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->currentPlaybackAttributes:Lcom/amazon/music/media/playback/PlaybackAttributes;

    return-object p0
.end method

.method public getCurrentRequest()Ljava/lang/Object;
    .locals 1

    .line 278
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public getDownloadCoordinator(Lcom/amazon/digitalmusicplayback/DownloadCoordinatorListener;Lcom/amazon/digitalmusicplayback/DownloadCoordinatorConfig;)Lcom/amazon/digitalmusicplayback/DownloadCoordinator;
    .locals 2

    .line 288
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-eq v0, v1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 291
    :cond_0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0, p1, p2}, Lcom/amazon/digitalmusicplayback/Player;->getDownloadCoordinator(Lcom/amazon/digitalmusicplayback/DownloadCoordinatorListener;Lcom/amazon/digitalmusicplayback/DownloadCoordinatorConfig;)Lcom/amazon/digitalmusicplayback/DownloadCoordinator;

    move-result-object p0

    return-object p0
.end method

.method public getEqualizerBandCount()I
    .locals 1

    .line 1788
    sget-object p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$5;->$SwitchMap$com$amazon$digitalmusicplayback$EqualizerFormat:[I

    sget-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->EQUALIZER_FORMAT:Lcom/amazon/digitalmusicplayback/EqualizerFormat;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget p0, p0, v0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x5

    return p0
.end method

.method public getEqualizerSettings()Lcom/amazon/digitalmusicplayback/EqualizerSettings;
    .locals 2

    .line 1758
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 1759
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/Player;->getEqualizerSettings()Lcom/amazon/digitalmusicplayback/EqualizerSettings;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getNextRequest()Ljava/lang/Object;
    .locals 2

    .line 283
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    const/4 v0, 0x1

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public getPlayerCapabilities()Lcom/amazon/music/media/playback/PlayerCapabilities;
    .locals 1

    .line 667
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->isHarleyCurrent()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 670
    :cond_0
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->currentPlayerCapabilities:Lcom/amazon/music/media/playback/PlayerCapabilities;

    return-object p0
.end method

.method public getRequestQueue()Ljava/util/List;
    .locals 0

    .line 1471
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->unmodifiableRequestQueue:Ljava/util/List;

    return-object p0
.end method

.method public getStatus()Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;
    .locals 0

    .line 1463
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    return-object p0
.end method

.method public getTrebleSettings()Lcom/amazon/digitalmusicplayback/FrequencySettings;
    .locals 2

    .line 1741
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 1742
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/Player;->getTrebleSettings()Lcom/amazon/digitalmusicplayback/FrequencySettings;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 0

    .line 641
    invoke-static {}, Lcom/amazon/digitalmusicplayback/Player;->libraryVersion()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getVolume()F
    .locals 0

    .line 1260
    iget p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->volume:F

    return p0
.end method

.method public isDownloaded()Z
    .locals 1

    .line 678
    iget-boolean v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->downloaded:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->isHarleyCurrent()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isHarleyDebugModeEnabled()Z
    .locals 0

    .line 715
    iget-boolean p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->debugHarley:Z

    return p0
.end method

.method public isLoudnessNormalizationEnabled()Z
    .locals 0

    .line 1415
    iget-boolean p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->loudnessNormalizationEnabled:Z

    return p0
.end method

.method public nativeCrash()V
    .locals 0

    .line 2548
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/Player;->nativeCrash()V

    return-void
.end method

.method public onApplicationInForegroundChanged(Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 1799
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->createPlayerIfNeeded()V

    :cond_0
    return-void
.end method

.method public pause()V
    .locals 4

    .line 1444
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->PAUSED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    sget-object v2, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->UNSTARTED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    if-ne v0, v2, :cond_0

    goto :goto_0

    .line 1447
    :cond_0
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v3, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-eq v0, v3, :cond_1

    .line 1448
    iput-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    return-void

    .line 1451
    :cond_1
    sget-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v2, "setting status to PAUSED from pause()"

    invoke-interface {v0, v2}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 1452
    iput-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    .line 1453
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/amazon/digitalmusicplayback/Player;->setPaused(Z)Lcom/amazon/digitalmusicplayback/EngineError;

    :cond_2
    :goto_0
    return-void
.end method

.method public play(Ljava/lang/String;)V
    .locals 3

    .line 1426
    sget-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "play() - requestQueue size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", status: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    if-nez p1, :cond_0

    .line 1428
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->PAUSED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    if-ne v0, v1, :cond_0

    .line 1429
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/amazon/digitalmusicplayback/Player;->setPaused(Z)Lcom/amazon/digitalmusicplayback/EngineError;

    goto :goto_0

    .line 1430
    :cond_0
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->UNSTARTED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    if-ne v0, v1, :cond_1

    .line 1431
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->startPlayback()V

    :cond_1
    :goto_0
    if-eqz p1, :cond_2

    .line 1433
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_2

    .line 1434
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {v0, p1}, Lcom/amazon/digitalmusicplayback/Player;->resumeAndTerminateRemoteStream(Ljava/lang/String;)V

    .line 1436
    :cond_2
    sget-object p1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->PENDING:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    return-void
.end method

.method public seekTo(J)V
    .locals 6

    .line 1176
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->UNSTARTED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-eq v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1177
    iput-wide p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->desiredSeekPosition:J

    return-void

    .line 1181
    :cond_1
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 1183
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_2

    goto :goto_0

    .line 1186
    :cond_2
    iput-wide p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->desiredSeekPosition:J

    .line 1187
    iget-boolean v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seeking:Z

    if-nez v0, :cond_4

    const/4 v0, 0x1

    .line 1188
    iput-boolean v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seeking:Z

    .line 1189
    iput-wide p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seekPosition:J

    .line 1190
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    sget-object v2, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->RENDERING:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    if-ne v0, v2, :cond_3

    .line 1191
    sget-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v2, "setting status to PENDING from seekTo()"

    invoke-interface {v0, v2}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 1192
    sget-object v0, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->PENDING:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    .line 1194
    :cond_3
    invoke-static {}, Lcom/amazon/music/media/playback/util/Clock;->now()J

    move-result-wide v2

    sget-wide v4, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->AUTO_END_SEEK_MILLIS:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seekEndTime:J

    .line 1195
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/amazon/digitalmusicplayback/SequenceEntry;

    invoke-virtual {v0, p0, p1, p2}, Lcom/amazon/digitalmusicplayback/Player;->seek(Lcom/amazon/digitalmusicplayback/SequenceEntry;J)V

    :cond_4
    :goto_0
    return-void

    .line 1182
    :cond_5
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Trying to seek when nothing is playing!"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public setBassGainMillibels(I)V
    .locals 2

    .line 1732
    iput p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->bassGainMillibels:I

    .line 1733
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 1734
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->convertIntToShort(I)S

    move-result p0

    invoke-virtual {v0, p0}, Lcom/amazon/digitalmusicplayback/Player;->updateBassSettings(S)V

    :cond_0
    return-void
.end method

.method public setBitRateSelectionForOTA(Lcom/amazon/music/media/playback/config/BitRateSelection;)V
    .locals 1

    .line 1296
    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->getQualitySettingsFromBitrate(Lcom/amazon/music/media/playback/config/BitRateSelection;)Lcom/amazon/digitalmusicplayback/QualitySetting;

    move-result-object p1

    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->otaStreamingQualitySetting:Lcom/amazon/digitalmusicplayback/QualitySetting;

    .line 1297
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v0, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne p1, v0, :cond_0

    .line 1298
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->otaStreamingQualitySetting:Lcom/amazon/digitalmusicplayback/QualitySetting;

    invoke-virtual {p1, p0}, Lcom/amazon/digitalmusicplayback/Player;->setOTAAudioQualitySetting(Lcom/amazon/digitalmusicplayback/QualitySetting;)V

    :cond_0
    return-void
.end method

.method public setBitRateSelectionForWifi(Lcom/amazon/music/media/playback/config/BitRateSelection;)V
    .locals 1

    .line 1283
    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->getQualitySettingsFromBitrate(Lcom/amazon/music/media/playback/config/BitRateSelection;)Lcom/amazon/digitalmusicplayback/QualitySetting;

    move-result-object p1

    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->wifiStreamingQualitySetting:Lcom/amazon/digitalmusicplayback/QualitySetting;

    .line 1284
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v0, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne p1, v0, :cond_0

    .line 1285
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->wifiStreamingQualitySetting:Lcom/amazon/digitalmusicplayback/QualitySetting;

    invoke-virtual {p1, p0}, Lcom/amazon/digitalmusicplayback/Player;->setWifiAudioQualitySetting(Lcom/amazon/digitalmusicplayback/QualitySetting;)V

    :cond_0
    return-void
.end method

.method public setCustomerBenefits(Ljava/util/EnumSet;)V
    .locals 2

    .line 370
    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->customerBenefitFlags:Ljava/util/EnumSet;

    .line 372
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 373
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0, p1}, Lcom/amazon/digitalmusicplayback/Player;->setCustomerBenefits(Ljava/util/EnumSet;)V

    :cond_0
    return-void
.end method

.method public setEqualizerBandGain(II)V
    .locals 3

    if-ltz p1, :cond_0

    .line 1766
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->bandGainCache:[I

    array-length v1, v0

    if-ge p1, v1, :cond_0

    .line 1767
    aput p2, v0, p1

    .line 1769
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 1770
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1771
    new-instance v1, Lcom/amazon/digitalmusicplayback/EqualizerUpdate;

    invoke-direct {p0, p2}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->convertIntToShort(I)S

    move-result p2

    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    .line 1772
    invoke-virtual {v2}, Lcom/amazon/digitalmusicplayback/Player;->getEqualizerSettings()Lcom/amazon/digitalmusicplayback/EqualizerSettings;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/digitalmusicplayback/EqualizerSettings;->getEqualizerBandList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/amazon/digitalmusicplayback/EqualizerBand;

    invoke-virtual {p1}, Lcom/amazon/digitalmusicplayback/EqualizerBand;->getBandIndex()B

    move-result p1

    invoke-direct {v1, p2, p1}, Lcom/amazon/digitalmusicplayback/EqualizerUpdate;-><init>(SB)V

    .line 1771
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1773
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0, v0}, Lcom/amazon/digitalmusicplayback/Player;->updateEqualizerSettings(Ljava/util/ArrayList;)V

    :cond_0
    return-void
.end method

.method public setIgnoreTrackStreamed(Z)V
    .locals 0

    .line 273
    iput-boolean p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->ignoreTrackStreamed:Z

    return-void
.end method

.method public setLoudnessNormalizationEnabled(Z)V
    .locals 2

    .line 1402
    iput-boolean p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->loudnessNormalizationEnabled:Z

    .line 1403
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 1404
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0, p1}, Lcom/amazon/digitalmusicplayback/Player;->setLoudnessNormalizationMode(Z)V

    :cond_0
    return-void
.end method

.method public setMricTokenForChildUser(Ljava/lang/String;)V
    .locals 0

    .line 268
    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->mricToken:Ljava/lang/String;

    return-void
.end method

.method public setMuted(Z)V
    .locals 2

    .line 1219
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 1220
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {v0, p1}, Lcom/amazon/digitalmusicplayback/Player;->setMuted(Z)V

    .line 1222
    :cond_0
    iput-boolean p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->muted:Z

    return-void
.end method

.method public setOnFrameChangedListener(Lcom/amazon/music/media/playback/OnFrameChangedListener;)V
    .locals 0

    .line 1247
    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->frameChangedListener:Lcom/amazon/music/media/playback/OnFrameChangedListener;

    return-void
.end method

.method public setOnPrebufferChangedListener(Lcom/amazon/music/media/playback/OnPrebufferChangedListener;)V
    .locals 0

    .line 1252
    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->prebufferChangedListener:Lcom/amazon/music/media/playback/OnPrebufferChangedListener;

    return-void
.end method

.method public setOpenTelemetryReporter(Lcom/amazon/digitalmusicplayback/OpenTelemetryReporter;)V
    .locals 2

    .line 2552
    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->openTelemetryReporter:Lcom/amazon/digitalmusicplayback/OpenTelemetryReporter;

    .line 2553
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 2554
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0, p1}, Lcom/amazon/digitalmusicplayback/Player;->setOpenTelemetryReporter(Lcom/amazon/digitalmusicplayback/OpenTelemetryReporter;)V

    :cond_0
    return-void
.end method

.method public setPlaybackMetricsListener(Lcom/amazon/music/media/playback/OnPlaybackMetricsListener;)V
    .locals 0

    .line 1242
    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playbackMetricsListener:Lcom/amazon/music/media/playback/OnPlaybackMetricsListener;

    return-void
.end method

.method public setPlaybackSpeed(D)V
    .locals 2

    .line 1231
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 1232
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0, p1, p2}, Lcom/amazon/digitalmusicplayback/Player;->setTempo(D)V

    :cond_0
    return-void
.end method

.method public setPlayerAuthentication(Lcom/amazon/music/media/playback/config/PlayerAuthentication;)V
    .locals 2

    .line 688
    sget-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v1, "setPlayerAuthentication()"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 689
    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playerAuthentication:Lcom/amazon/music/media/playback/config/PlayerAuthentication;

    .line 690
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 691
    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->setProfileInformation(Lcom/amazon/music/media/playback/config/PlayerAuthentication;)V

    return-void

    .line 693
    :cond_0
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->createPlayerIfNeeded()V

    return-void
.end method

.method public setPrioritizeDownloadsPlayback(Z)V
    .locals 2

    .line 1389
    iput-boolean p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->prioritizeDownloads:Z

    .line 1390
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 1391
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0, p1}, Lcom/amazon/digitalmusicplayback/Player;->setPrioritizeDownloadsPlayback(Z)V

    :cond_0
    return-void
.end method

.method public setQueue(Ljava/util/List;Z)V
    .locals 3

    .line 827
    sget-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setQueue("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 828
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    .line 829
    iput-boolean v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seeking:Z

    const-wide/16 v1, 0x0

    .line 830
    iput-wide v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->desiredSeekPosition:J

    .line 831
    iput-wide v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seekEndTime:J

    .line 832
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playRequestMap:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->clear()V

    .line 833
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 834
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 835
    iget-object v1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 836
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne p1, v1, :cond_1

    if-nez v0, :cond_1

    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    if-nez p2, :cond_1

    .line 837
    :cond_0
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/amazon/digitalmusicplayback/Player;->setPaused(Z)Lcom/amazon/digitalmusicplayback/EngineError;

    :cond_1
    if-eqz p2, :cond_2

    .line 839
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2

    .line 840
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->startPlayback()V

    return-void

    .line 842
    :cond_2
    sget-object p1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->UNSTARTED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    return-void
.end method

.method public setStreamOnWifiOnly(Z)V
    .locals 2

    .line 1270
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->streamOnWifiOnly:Ljava/lang/Boolean;

    .line 1271
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 1272
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0, p1}, Lcom/amazon/digitalmusicplayback/Player;->setStreamOnWifiOnly(Z)V

    :cond_0
    return-void
.end method

.method public setThreeDMode(Z)V
    .locals 2

    .line 1377
    iput-boolean p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->threeDMode:Z

    .line 1378
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 1379
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0, p1}, Lcom/amazon/digitalmusicplayback/Player;->setThreeDMode(Z)V

    :cond_0
    return-void
.end method

.method public setTrebleGainMillibels(I)V
    .locals 2

    .line 1749
    iput p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->trebleGainMillibels:I

    .line 1750
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 1751
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-direct {p0, p1}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->convertIntToShort(I)S

    move-result p0

    invoke-virtual {v0, p0}, Lcom/amazon/digitalmusicplayback/Player;->updateTrebleSettings(S)V

    :cond_0
    return-void
.end method

.method public setVolume(F)V
    .locals 3

    .line 1205
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->volume:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 1206
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    float-to-double v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/amazon/digitalmusicplayback/Player;->setVolume(D)V

    .line 1208
    :cond_0
    iput p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->volume:F

    return-void
.end method

.method public skipTo(Ljava/lang/Object;)I
    .locals 5

    .line 1128
    sget-object v0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "skipTo("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ") - requests: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->getRequestQueue()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 1130
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->status:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;->UNSTARTED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$Status;

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    if-eq v0, v1, :cond_6

    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-eq v0, v1, :cond_0

    goto :goto_2

    .line 1140
    :cond_0
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-gtz p1, :cond_1

    return v4

    .line 1145
    :cond_1
    iput-boolean v4, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seeking:Z

    .line 1146
    iput-wide v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->seekEndTime:J

    .line 1148
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    move v1, p1

    :goto_0
    if-ge v1, v0, :cond_2

    .line 1149
    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    if-ge v1, v0, :cond_5

    move p1, v1

    :cond_3
    :goto_1
    add-int/lit8 p1, p1, -0x1

    if-ltz p1, :cond_4

    .line 1155
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 1156
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/digitalmusicplayback/SequenceEntry;

    invoke-virtual {v0}, Lcom/amazon/digitalmusicplayback/SequenceEntry;->getSequenceID()I

    move-result v0

    .line 1157
    iget-object v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->playRequestMap:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->remove(I)V

    goto :goto_1

    .line 1160
    :cond_4
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {p1, v4, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 1161
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {p1, v4, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 1162
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->entryQueue:Ljava/util/List;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/digitalmusicplayback/SequenceEntry;

    invoke-virtual {p1, v0}, Lcom/amazon/digitalmusicplayback/Player;->playNext(Lcom/amazon/digitalmusicplayback/SequenceEntry;)V

    .line 1164
    :cond_5
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->addSoonToPlayToRecents()V

    return v1

    .line 1131
    :cond_6
    :goto_2
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-lez p1, :cond_7

    .line 1133
    iput-wide v2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->desiredSeekPosition:J

    .line 1134
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->requestQueue:Ljava/util/List;

    invoke-interface {p0, v4, p1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->clear()V

    return p1

    :cond_7
    return v4
.end method

.method public threeDMode()Z
    .locals 2

    .line 1365
    iget-object v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    sget-object v1, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZED:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    if-ne v0, v1, :cond_0

    .line 1366
    iget-object p0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->player:Lcom/amazon/digitalmusicplayback/Player;

    invoke-virtual {p0}, Lcom/amazon/digitalmusicplayback/Player;->threeDMode()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public updateConfiguration(Lcom/amazon/digitalmusicplayback/DMLSConfig;Lcom/amazon/digitalmusicplayback/ClientInfo;Ljava/io/File;Ljava/io/File;Ljava/lang/Boolean;)V
    .locals 2

    .line 326
    invoke-direct {p0, p1, p2}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->isNewConfig(Lcom/amazon/digitalmusicplayback/DMLSConfig;Lcom/amazon/digitalmusicplayback/ClientInfo;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->debugHarley:Z

    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    return-void

    .line 327
    :cond_1
    :goto_0
    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p5

    iput-boolean p5, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->debugHarley:Z

    .line 328
    iput-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->dmlsConfig:Lcom/amazon/digitalmusicplayback/DMLSConfig;

    .line 329
    iput-object p2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->clientInfo:Lcom/amazon/digitalmusicplayback/ClientInfo;

    .line 330
    iput-object p3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->storageDir:Ljava/io/File;

    .line 331
    iput-object p4, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->tempDir:Ljava/io/File;

    .line 332
    iget-object p1, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatusLock:Ljava/lang/Object;

    monitor-enter p1

    .line 333
    :try_start_0
    sget-object p2, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper$5;->$SwitchMap$com$amazon$music$media$playback$player$IHarleyWrapper$InitStatus:[I

    iget-object p3, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    aget p2, p2, p3

    const/4 p3, 0x1

    if-eq p2, p3, :cond_3

    const/4 p3, 0x2

    if-eq p2, p3, :cond_3

    const/4 p3, 0x3

    if-eq p2, p3, :cond_2

    .line 346
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 347
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->createPlayerIfNeeded()V

    return-void

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 340
    :cond_2
    :try_start_1
    sget-object p2, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    const-string/jumbo p3, "updateConfiguration called while player initialized, calling on close(), shutdown(false)"

    invoke-interface {p2, p3}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 341
    invoke-direct {p0}, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->recreatePlayer()V

    .line 342
    monitor-exit p1

    return-void

    .line 336
    :cond_3
    sget-object p2, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->logger:Lorg/slf4j/Logger;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo p4, "updateConfiguration while initStatus is "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p4, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p2, p3}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 337
    sget-object p2, Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;->INITIALIZING_WITH_WRONG_VALUES:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    iput-object p2, p0, Lcom/amazon/music/media/playback/player/impl/HarleyWrapper;->initStatus:Lcom/amazon/music/media/playback/player/IHarleyWrapper$InitStatus;

    .line 338
    monitor-exit p1

    return-void

    .line 346
    :goto_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method
