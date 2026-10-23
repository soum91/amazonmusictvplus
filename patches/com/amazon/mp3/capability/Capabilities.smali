.class public Lcom/amazon/mp3/capability/Capabilities;
.super Ljava/lang/Object;
.source "Capabilities.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "Capabilities"

.field static sHeapSize:F


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private doesMarketSupportFeature(Landroid/content/Context;)Z
    .locals 0

    .line 585
    invoke-static {p1}, Lcom/amazon/mp3/account/details/AccountDetailUtil;->get(Landroid/content/Context;)Lcom/amazon/mp3/account/details/AccountDetailUtil;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/mp3/account/details/AccountDetailUtil;->getHomeMarketPlaceId()Ljava/lang/String;

    move-result-object p0

    const-string p1, "ATVPDKIKX0DER"

    invoke-static {p1, p0}, Lcom/amazon/mp3/util/StringUtil;->csvContains(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static getHeapSize(Landroid/content/Context;)F
    .locals 2

    .line 598
    sget v0, Lcom/amazon/mp3/capability/Capabilities;->sHeapSize:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_2

    .line 599
    invoke-static {}, Lcom/amazon/mp3/AmazonApplication;->getAppInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 602
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v1, 0x100000

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 608
    :goto_0
    const-string v1, "activity"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/ActivityManager;

    if-eqz v0, :cond_1

    .line 609
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getLargeMemoryClass()I

    move-result p0

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result p0

    :goto_1
    int-to-float p0, p0

    sput p0, Lcom/amazon/mp3/capability/Capabilities;->sHeapSize:F

    .line 612
    :cond_2
    sget p0, Lcom/amazon/mp3/capability/Capabilities;->sHeapSize:F

    return p0
.end method

.method private isAOMFreeTierEnabled()Z
    .locals 0

    .line 341
    sget-object p0, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->AOM_FREE_TIER:Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method private isFeatureEnabled(Lcom/amazon/music/platform/featuregate/Feature;Z)Z
    .locals 1

    .line 1640
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 1642
    sget-object p0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string p1, "Error fetching feature gate provider got null: ${this.name}"

    invoke-static {p0, p1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    .line 1645
    :cond_0
    instance-of v0, p0, Lcom/amazon/mp3/platform/providers/CachedFeatureFlagProviderImpl;

    if-eqz v0, :cond_1

    .line 1646
    check-cast p0, Lcom/amazon/mp3/platform/providers/CachedFeatureFlagProviderImpl;

    invoke-virtual {p0, p1, p2}, Lcom/amazon/mp3/platform/providers/CachedFeatureFlagProviderImpl;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;Z)Z

    move-result p0

    return p0

    .line 1648
    :cond_1
    invoke-interface {p0, p1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    return p0
.end method

.method private isFreeTierRecommendationSupported()Z
    .locals 2

    .line 676
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->canAccessRecommendationForFreeTier()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 678
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Unable to retrieve state of canAccessRecommendationForFreeTier()"

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return p0
.end method

.method private isInSubscriptionMarketplace()Z
    .locals 0

    .line 523
    invoke-static {}, Lcom/amazon/mp3/util/UserSubscriptionUtil;->getUserSubscription()Lcom/amazon/music/subscription/UserSubscription;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/subscription/UserSubscription;->isInSubscriptionMarketplace()Z

    move-result p0

    return p0
.end method

.method private isLikesDownloadsRestorationEnabled()Z
    .locals 3

    .line 1592
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 1593
    sget-object v0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->DOWNLOAD_RESTORATION_FIRE_OS:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {v0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1594
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isTrueLikesAndFollowsEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    return v2

    :cond_0
    return v1

    .line 1596
    :cond_1
    sget-object v0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->DOWNLOAD_RESTORATION_ANDROID:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {v0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1597
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isTrueLikesAndFollowsEnabled()Z

    move-result p0

    if-eqz p0, :cond_2

    return v2

    :cond_2
    return v1
.end method

.method public static isNextEnabledForQueueNavigationExperiment()Z
    .locals 4

    .line 2686
    sget-object v0, Lcom/amazon/music/media/playback/ControlSource;->NONE:Lcom/amazon/music/media/playback/ControlSource;

    invoke-static {v0}, Lcom/amazon/mp3/playback/playbackcontrol/PlaybackControllerProvider;->getController(Lcom/amazon/music/media/playback/ControlSource;)Lcom/amazon/mp3/playback/playbackcontrol/ActionValidatedPlaybackController;

    move-result-object v0

    .line 2688
    invoke-interface {v0}, Lcom/amazon/music/media/playback/PlaybackController;->canSkipNext()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    return v2

    .line 2692
    :cond_0
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/amazon/mp3/activity/settings/SettingsUtil;->isSfaSettingEnabled(Landroid/content/Context;)Z

    move-result v1

    const/4 v3, 0x0

    if-nez v1, :cond_1

    return v3

    .line 2696
    :cond_1
    invoke-interface {v0}, Lcom/amazon/mp3/playback/playbackcontrol/ActionValidatedPlaybackController;->isLastTrackOfQueue()Z

    move-result v1

    if-eqz v1, :cond_2

    sget-object v1, Lcom/amazon/mp3/featuregate/ImmersePlaybackFeature;->STAGE_QUEUE_NAVIGATION_FEATURE_WITHOUT_TRIGGER:Lcom/amazon/mp3/featuregate/ImmersePlaybackFeature;

    invoke-virtual {v1}, Lcom/amazon/mp3/featuregate/ImmersePlaybackFeature;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_2

    return v3

    .line 2700
    :cond_2
    invoke-static {v0}, Lcom/amazon/mp3/util/PlaybackMediaTypeUtil;->isPodcastPlaying(Lcom/amazon/music/media/playback/PlaybackController;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-static {v0}, Lcom/amazon/mp3/util/PlaybackMediaTypeUtil;->isMontanaMedia(Lcom/amazon/music/media/playback/PlaybackController;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 2701
    invoke-static {}, Lcom/amazon/mp3/playback/activity/NowPlayingUtil;->isVideoPlaying()Z

    move-result v0

    if-nez v0, :cond_3

    return v2

    :cond_3
    return v3
.end method

.method private isPreLikesDownloadsRestorationEnabled()Z
    .locals 3

    .line 1601
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 1602
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isTrueLikesAndFollowsEnabled()Z

    move-result p0

    if-nez p0, :cond_0

    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->DOWNLOAD_RESTORATION_FIRE_OS_LIKES_C_TREATMENT:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    .line 1603
    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    return v2

    :cond_0
    return v1

    .line 1605
    :cond_1
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isTrueLikesAndFollowsEnabled()Z

    move-result p0

    if-nez p0, :cond_2

    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->DOWNLOAD_RESTORATION_ANDROID_LIKES_C_TREATMENT:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    .line 1606
    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_2

    return v2

    :cond_2
    return v1
.end method

.method private isPrimeRecommendationSupported()Z
    .locals 2

    .line 667
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->canAccessRecommendationForPrime()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 669
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Unable to retrieve state of canAccessRecommendationForPrime()"

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static isPrioritizeDownloadsSupported()Z
    .locals 3

    .line 1978
    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez v0, :cond_0

    .line 1980
    sget-object v1, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v2, "Error fetching Feature gate provider"

    invoke-static {v1, v2}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz v0, :cond_1

    .line 1982
    sget-object v1, Lcom/amazon/mp3/featuregate/Feature;->prioritize_downloads:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {v0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private isTreatmentEnabledViaWeblabT1(Lcom/amazon/mp3/weblab/Weblab;)Z
    .locals 2

    .line 1466
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/WeblabProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/WeblabProvider;

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    .line 1468
    invoke-virtual {p1}, Lcom/amazon/mp3/weblab/Weblab;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x1

    invoke-interface {p0, p1, v1}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    move-result-object p0

    .line 1469
    sget-object p1, Lcom/amazon/music/platform/data/WeblabTreatment;->T1:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-ne p0, p1, :cond_0

    return v1

    :cond_0
    return v0
.end method

.method private isUnlimitedRecommendationSupported()Z
    .locals 2

    .line 658
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->canAccessRecommendationForUnlimited()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 660
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Unable to retrieve state of canAccessRecommendationForUnlimited()"

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return p0
.end method

.method private isVideosWeblabEnabledInNewTerritories()Z
    .locals 3

    .line 1484
    sget-object p0, Lcom/amazon/mp3/environment/MusicTerritory;->INDIA:Lcom/amazon/mp3/environment/MusicTerritory;

    invoke-static {}, Lcom/amazon/mp3/account/details/AccountDetailUtil;->getMusicTerritoryOfResidence()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    const/4 v0, 0x1

    if-nez p0, :cond_0

    sget-object p0, Lcom/amazon/mp3/environment/MusicTerritory;->CANADA:Lcom/amazon/mp3/environment/MusicTerritory;

    .line 1485
    invoke-static {}, Lcom/amazon/mp3/account/details/AccountDetailUtil;->getMusicTerritoryOfResidence()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    return v0

    .line 1487
    :cond_0
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/WeblabProvider;

    invoke-virtual {p0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/WeblabProvider;

    const/4 v1, 0x0

    if-eqz p0, :cond_1

    .line 1489
    const-string v2, "DM_VIDEO_STARLIGHT_677159"

    .line 1490
    invoke-interface {p0, v2, v0}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    move-result-object p0

    .line 1492
    sget-object v2, Lcom/amazon/music/platform/data/WeblabTreatment;->T1:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-ne p0, v2, :cond_1

    return v0

    :cond_1
    return v1
.end method

.method public static shouldShowBannerToImportPlaylists()Z
    .locals 3

    .line 2302
    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez v0, :cond_0

    .line 2304
    sget-object v1, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v2, "Error fetching feature gate provider"

    invoke-static {v1, v2}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz v0, :cond_1

    .line 2306
    sget-object v1, Lcom/amazon/mp3/featuregate/Feature;->show_import_playlists:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {v0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2307
    invoke-static {}, Lcom/amazon/mp3/capability/Capabilities;->shouldUseNewImportPlaylistFlow()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public static shouldShowLikesEducationalScreens()Z
    .locals 4

    .line 2311
    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez v0, :cond_0

    .line 2313
    sget-object v1, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v2, "Error fetching feature gate provider"

    invoke-static {v1, v2}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 2315
    :cond_0
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_2

    if-eqz v0, :cond_1

    .line 2316
    sget-object v1, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->SHOW_LIKES_EVERYWHERE_SPLASH_SCREEN_FIREOS:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-interface {v0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v3

    :cond_1
    return v2

    :cond_2
    if-eqz v0, :cond_3

    .line 2318
    sget-object v1, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->SHOW_LIKES_EVERYWHERE_SPLASH_SCREEN_ANDROID:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-interface {v0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result v0

    if-eqz v0, :cond_3

    return v3

    :cond_3
    return v2
.end method

.method public static shouldUseNewImportPlaylistFlow()Z
    .locals 2

    .line 2293
    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez v0, :cond_0

    .line 2295
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0

    .line 2298
    :cond_0
    new-instance v1, Lcom/amazon/music/platform/featuregate/features/ImportPlaylistIngressFeature;

    invoke-direct {v1}, Lcom/amazon/music/platform/featuregate/features/ImportPlaylistIngressFeature;-><init>()V

    invoke-interface {v0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result v0

    return v0
.end method

.method private subscriptionLevelMustShowStoreIcon()Z
    .locals 1

    .line 814
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 815
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->store_icon:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public areIvyRefinementPillsEnabled()Z
    .locals 2

    .line 1028
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->areIvyRefinementPillsEnabled()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1030
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1031
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;->areIvyRefinementPillsEnabled()Z

    move-result p0

    return p0
.end method

.method public canAccessAlexa()Z
    .locals 0

    .line 337
    sget-object p0, Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;->ALEXA:Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public canAccessCasting()Z
    .locals 2

    .line 352
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    .line 355
    :try_start_0
    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->canAccessCasting()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    .line 357
    :catch_0
    sget-object p0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag not available when checking for Casting."

    invoke-static {p0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return v0
.end method

.method public canAccessWakeWord()Z
    .locals 1

    .line 384
    sget-object v0, Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;->WAKEWORD:Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;

    invoke-virtual {v0}, Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isAlexaEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public canFreeTierUserFollowPlaylists()Z
    .locals 0

    .line 317
    sget-object p0, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->ENABLE_PLAYLIST_FOLLOW:Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public defaultPrefetchImageSize()I
    .locals 1

    .line 589
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->shouldUseGridView()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->get()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f07023d

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    return p0

    .line 592
    :cond_0
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->get()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f07023e

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    return p0
.end method

.method public eligibilityBasedPlaybackIcon()Z
    .locals 1

    .line 2059
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 2063
    :cond_0
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->eligibility_based_playback_icon:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    return p0
.end method

.method public getAllAccessHighlightConfigurations(Ljava/lang/String;)Ljava/util/List;
    .locals 2

    .line 2158
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/ConfigurationProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/featuregating/configuration/Configuration;

    if-nez p0, :cond_0

    .line 2160
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching Feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 2162
    :cond_0
    new-instance v0, Lcom/amazon/mp3/capability/AllAccessTitleHighlight;

    invoke-direct {v0, p0}, Lcom/amazon/mp3/capability/AllAccessTitleHighlight;-><init>(Lcom/amazon/music/featuregating/configuration/Configuration;)V

    .line 2163
    invoke-virtual {v0, p1}, Lcom/amazon/mp3/capability/AllAccessTitleHighlight;->getHighlightMap(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getAppRatingNoIncidentThreshold()I
    .locals 3

    .line 1130
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->getAppRatingNoIncidentThreshold()I

    move-result p0

    .line 1131
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Arcus Feature Flag APP_RATING_NO_INCIDENT_THRESHOLD: %d"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1134
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "The APP_RATING_NO_INCIDENT_THRESHOLD feature flag is unavailable."

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->warning(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1135
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;->getAppRatingNoIncidentThreshold()I

    move-result p0

    return p0
.end method

.method public getCarBluetoothEventThrottleValue()J
    .locals 2

    .line 2356
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/ConfigurationProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/featuregating/configuration/Configuration;

    if-nez p0, :cond_0

    .line 2358
    sget-object p0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v0, "Error fetching Feature gate provider"

    invoke-static {p0, v0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v0, 0x64

    return-wide v0

    .line 2360
    :cond_0
    const-string v0, "car_detection_bluetooth_event_throttle_ms"

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/ConfigurationProvider;->getIntForKey(Ljava/lang/String;)I

    move-result p0

    int-to-long v0, p0

    return-wide v0
.end method

.method public getCarDetectionThrottleValue()J
    .locals 2

    .line 2370
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/ConfigurationProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/featuregating/configuration/Configuration;

    if-nez p0, :cond_0

    .line 2372
    sget-object p0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v0, "Error fetching Feature gate provider"

    invoke-static {p0, v0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v0, 0x3e8

    return-wide v0

    .line 2374
    :cond_0
    const-string v0, "car_detection_throttle_ms"

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/ConfigurationProvider;->getIntForKey(Ljava/lang/String;)I

    move-result p0

    int-to-long v0, p0

    return-wide v0
.end method

.method public getHybridQueueBatchSize()I
    .locals 3

    .line 1252
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->getHybridQueueBatchSize()I

    move-result p0

    .line 1253
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Arcus Feature Flag HYBRID_QUEUE_BATCH_SIZE: %d"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1256
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "The HYBRID_QUEUE_BATCH_SIZE feature flag is unavailable."

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->warning(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1257
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;->getHybridQueueBatchSize()I

    move-result p0

    return p0
.end method

.method public getHybridQueueLookaheadWindowSize()I
    .locals 3

    .line 1241
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->getHybridQueueLookaheadWindowSize()I

    move-result p0

    .line 1242
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Arcus Feature Flag HYBRID_QUEUE_LOOKAHEAD_WINDOW_SIZE: %d"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1245
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "The HYBRID_QUEUE_LOOKAHEAD_WINDOW_SIZE feature flag is unavailable."

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->warning(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1246
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;->getHybridQueueLookaheadWindowSize()I

    move-result p0

    return p0
.end method

.method public getPlatformName()Ljava/lang/String;
    .locals 0

    .line 174
    invoke-static {}, Lcom/amazon/mp3/capability/PlatformNameProvider;->getPlatformName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getStageAutoDismissThresholdInMinutes()I
    .locals 1

    .line 2437
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/ConfigurationProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/featuregating/configuration/Configuration;

    if-nez p0, :cond_0

    .line 2439
    sget-object p0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v0, "getStageAutoDismissThresholdInMinutes: Error fetching feature gate provider"

    invoke-static {p0, v0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    const/16 p0, 0xf

    return p0

    .line 2441
    :cond_0
    const-string/jumbo v0, "stage_auto_dismiss_threshold_minutes"

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/ConfigurationProvider;->getIntForKey(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public getStorageDir()Ljava/lang/String;
    .locals 0

    .line 152
    const-string p0, "amazonmp3"

    return-object p0
.end method

.method public hasWidgets()Z
    .locals 0

    .line 0
    const/4 p0, 0x1

    return p0
.end method

.method public isAMConnectUXUpdateEnabled()Z
    .locals 1

    .line 563
    sget-object v0, Lcom/amazon/mp3/weblab/Weblab;->DM_MUSICACCESS_AMCONNECT_CASTING_UX_UPDATES_ANDROID:Lcom/amazon/mp3/weblab/Weblab;

    invoke-direct {p0, v0}, Lcom/amazon/mp3/capability/Capabilities;->isTreatmentEnabledViaWeblabT1(Lcom/amazon/mp3/weblab/Weblab;)Z

    move-result p0

    return p0
.end method

.method public isAOMHindiSupportEnabled()Z
    .locals 0

    .line 1986
    sget-object p0, Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;->AOM_HINDI_SUPPORT:Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isAOMTextCapabilityEnabled()Z
    .locals 0

    .line 1843
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->canAccessAlexa()Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;->AOM_TEXT_CAPABILITY:Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isActivityFeedSupported()Z
    .locals 0

    .line 774
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isActivityFeedSupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 776
    :catch_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isActivityFeedSupported()Z

    move-result p0

    return p0
.end method

.method public isAddToPlaylistShovelerEnabled()Z
    .locals 0

    .line 0
    const/4 p0, 0x1

    return p0
.end method

.method public isAlbumBadgingInLibrarySupported()Z
    .locals 2

    .line 1060
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isAlbumBadgingInLibrarySupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1062
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1063
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isAlbumBadgingInLibrarySupported()Z

    move-result p0

    return p0
.end method

.method public isAlexaEmpPlaybackEnabled()Z
    .locals 0

    .line 1332
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isAlexaEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;->ALEXA_EMP_PLAYBACK:Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isAlexaEnabled()Z
    .locals 2

    .line 325
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->get()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x7f050000

    invoke-virtual {p0, v0, v1}, Lcom/amazon/mp3/capability/Capabilities;->isFeatureEnabledLocally(Landroid/content/Context;I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 329
    :cond_0
    invoke-static {}, Lcom/amazon/mp3/util/UserSubscriptionUtil;->isNightwingOnly()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 330
    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isAOMFreeTierEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->canAccessAlexa()Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v1

    .line 332
    :cond_2
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->canAccessAlexa()Z

    move-result p0

    return p0
.end method

.method public isAlexaSearchFindBrowseEnabled()Z
    .locals 2

    .line 1879
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isAlexaEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->ALEXA_SEARCH_FIND_BROWSE:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1880
    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1879
    invoke-virtual {p0, v0}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled(Lcom/amazon/music/platform/providers/FeatureGateProvider;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isAlexaSearchFindBrowseInCarModeEnabled()Z
    .locals 2

    .line 1891
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isAlexaEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->ALEXA_SEARCH_FIND_BROWSE_CAR_MODE:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1892
    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1891
    invoke-virtual {p0, v0}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled(Lcom/amazon/music/platform/providers/FeatureGateProvider;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isAlexaSearchOrdinalPlaybackEnabled()Z
    .locals 2

    .line 1885
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isAlexaEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->ALEXA_SEARCH_ORDINAL_PLAYBACK:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1886
    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1885
    invoke-virtual {p0, v0}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled(Lcom/amazon/music/platform/providers/FeatureGateProvider;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isAmazonAdsEnabled()Z
    .locals 2

    .line 321
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->get()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f050001

    invoke-virtual {p0, v0, v1}, Lcom/amazon/mp3/capability/Capabilities;->isFeatureEnabledLocally(Landroid/content/Context;I)Z

    move-result p0

    return p0
.end method

.method public isAppDisplayLangSettingEnabled()Z
    .locals 3

    .line 1731
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/account/details/AccountDetailUtil;->getMusicTerritoryOfResidence()Ljava/lang/String;

    move-result-object p0

    .line 1732
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isAppDisplayLangSettingEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1733
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.amazon.mp3.automotiveOS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p0, :cond_0

    .line 1734
    invoke-static {p0}, Lcom/amazon/mp3/language/preference/locale/AppLocaleProvider;->fromValue(Ljava/lang/String;)Lcom/amazon/mp3/language/preference/locale/AppLocaleProvider;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 1735
    :goto_0
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Arcus Feature Flag MANAGE_APP_DISPLAY_LANGUAGE: %b"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1738
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1739
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;->isAppDisplayLangSettingEnabled()Z

    move-result p0

    return p0
.end method

.method public isAppRatingEnabled(Landroid/content/Context;)Z
    .locals 1

    const v0, 0x7f050002

    .line 787
    invoke-virtual {p0, p1, v0}, Lcom/amazon/mp3/capability/Capabilities;->isFeatureEnabledLocally(Landroid/content/Context;I)Z

    move-result p0

    return p0
.end method

.method public isAppRatingSupported()Z
    .locals 2

    .line 1003
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isAppRatingSupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1005
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1006
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isAppRatingSupported()Z

    move-result p0

    return p0
.end method

.method public isAppToWebSSOEnabled()Z
    .locals 0

    .line 0
    const/4 p0, 0x1

    return p0
.end method

.method public isArtistFollowForVideoStoriesSupported()Z
    .locals 0

    .line 2322
    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isVideosWeblabEnabledInNewTerritories()Z

    move-result p0

    return p0
.end method

.method public isArtistFollowSupported()Z
    .locals 2

    .line 873
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isArtistFollowSupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 875
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 876
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isArtistFollowSupported()Z

    move-result p0

    return p0
.end method

.method public isAudiobooksInSearchResultsEnabled()Z
    .locals 3

    .line 2613
    sget-object p0, Lcom/amazon/mp3/util/ChildUserUtil;->INSTANCE:Lcom/amazon/mp3/util/ChildUserUtil;

    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/mp3/util/ChildUserUtil;->isChildUser(Landroid/content/Context;)Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    return v0

    .line 2617
    :cond_0
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_1

    .line 2619
    sget-object v1, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v2, "Error fetching feature gate provider"

    invoke-static {v1, v2}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    if-eqz p0, :cond_2

    .line 2621
    new-instance v1, Lcom/amazon/music/platform/featuregate/features/AudiobooksInSearchFeature;

    invoke-direct {v1}, Lcom/amazon/music/platform/featuregate/features/AudiobooksInSearchFeature;-><init>()V

    invoke-interface {p0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    return v0
.end method

.method public isAudiobooksPDPBrowseEnabled()Z
    .locals 3

    .line 2588
    sget-object p0, Lcom/amazon/mp3/util/ChildUserUtil;->INSTANCE:Lcom/amazon/mp3/util/ChildUserUtil;

    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/mp3/util/ChildUserUtil;->isChildUser(Landroid/content/Context;)Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    return v0

    .line 2592
    :cond_0
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_1

    .line 2594
    sget-object v1, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v2, "Error fetching feature gate provider"

    invoke-static {v1, v2}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    if-eqz p0, :cond_2

    .line 2596
    new-instance v1, Lcom/amazon/music/platform/featuregate/features/AudiobooksPDPBrowseFeature;

    invoke-direct {v1}, Lcom/amazon/music/platform/featuregate/features/AudiobooksPDPBrowseFeature;-><init>()V

    invoke-interface {p0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    return v0
.end method

.method public isAutoConnectEnabledForNonFamilyAccounts()Z
    .locals 3

    .line 2246
    invoke-static {}, Lcom/amazon/mp3/util/UserSubscriptionUtil;->getUserSubscription()Lcom/amazon/music/subscription/UserSubscription;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/subscription/UserSubscription;->isNightwingOnly()Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    return v0

    .line 2249
    :cond_0
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/WeblabProvider;

    invoke-virtual {p0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/WeblabProvider;

    .line 2250
    invoke-static {}, Lcom/amazon/music/casting/session/CastingSessionManager;->getInstance()Lcom/amazon/music/casting/session/CastingSessionManager;

    move-result-object v1

    .line 2251
    invoke-virtual {v1}, Lcom/amazon/music/casting/session/CastingSessionManager;->isFamilyPlan()Z

    move-result v1

    if-eqz v1, :cond_1

    return v0

    :cond_1
    if-eqz p0, :cond_4

    .line 2255
    sget-object v1, Lcom/amazon/mp3/weblab/Weblab;->DM_MUSICACCESS_AMCONNECT_AUTO_CONNECT_ANDROID_EXPERIMENT:Lcom/amazon/mp3/weblab/Weblab;

    invoke-virtual {v1}, Lcom/amazon/mp3/weblab/Weblab;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {p0, v1, v2}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    move-result-object p0

    .line 2256
    sget-object v1, Lcom/amazon/music/platform/data/WeblabTreatment;->T3:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-eq p0, v1, :cond_3

    sget-object v1, Lcom/amazon/music/platform/data/WeblabTreatment;->T4:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-ne p0, v1, :cond_2

    goto :goto_0

    :cond_2
    return v0

    :cond_3
    :goto_0
    return v2

    :cond_4
    return v0
.end method

.method public isAutoConnectExperimentEnabled()Z
    .locals 3

    .line 2224
    invoke-static {}, Lcom/amazon/mp3/util/UserSubscriptionUtil;->getUserSubscription()Lcom/amazon/music/subscription/UserSubscription;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/subscription/UserSubscription;->isNightwingOnly()Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    return v0

    .line 2227
    :cond_0
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/WeblabProvider;

    invoke-virtual {p0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/WeblabProvider;

    if-eqz p0, :cond_3

    .line 2229
    sget-object v1, Lcom/amazon/mp3/weblab/Weblab;->DM_MUSICACCESS_AMCONNECT_AUTO_CONNECT_ANDROID_EXPERIMENT:Lcom/amazon/mp3/weblab/Weblab;

    invoke-virtual {v1}, Lcom/amazon/mp3/weblab/Weblab;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {p0, v1, v2}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    move-result-object p0

    .line 2230
    sget-object v1, Lcom/amazon/music/platform/data/WeblabTreatment;->T1:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-eq p0, v1, :cond_2

    sget-object v1, Lcom/amazon/music/platform/data/WeblabTreatment;->T2:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-ne p0, v1, :cond_1

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    :goto_0
    return v2

    :cond_3
    return v0
.end method

.method public isAutomotiveTrueLikesAndFollowsEnabled()Z
    .locals 3

    const/4 p0, 0x0

    .line 1557
    :try_start_0
    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez v0, :cond_0

    .line 1559
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "FeatureGateProvider is null, falling back to control for ANDROID_AUTO_AAOS_TRUE_LIKES"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->warning(Ljava/lang/String;Ljava/lang/String;)V

    return p0

    :catch_0
    move-exception v0

    goto :goto_0

    .line 1562
    :cond_0
    sget-object v1, Lcom/amazon/music/media/auto/feature/AutomotiveFeature;->ANDROID_AUTO_AAOS_TRUE_LIKES:Lcom/amazon/music/media/auto/feature/AutomotiveFeature;

    invoke-interface {v0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 1564
    :goto_0
    sget-object v1, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v2, "Failed to check ANDROID_AUTO_AAOS_TRUE_LIKES, falling back to control"

    invoke-static {v1, v2, v0}, Lcom/amazon/mp3/util/Log;->warning(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return p0
.end method

.method public isBOPVideosEnabled()Z
    .locals 1

    .line 504
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->BOP_Videos:Lcom/amazon/mp3/featuregate/Feature;

    invoke-virtual {v0}, Lcom/amazon/mp3/featuregate/Feature;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 505
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isPackageAutomotive()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isVideosWeblabEnabledInNewTerritories()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isBadgingInRecentsTrackSupported()Z
    .locals 2

    .line 1087
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isBadgingInRecentsTrackSupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1089
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1090
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isBadgingInRecentsTrackSupported()Z

    move-result p0

    return p0
.end method

.method public isBauhausADPEnabled()Z
    .locals 2

    .line 1675
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isBauhausADPEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 1677
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/amazon/mp3/activity/settings/SettingsActivity;->shouldDisableBauhausPages(Landroid/content/Context;)Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0

    :catch_0
    move-exception p0

    .line 1679
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1680
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isBauhausADPEnabled()Z

    move-result p0

    return p0
.end method

.method public isBauhausInAppMessagingEnabled()Z
    .locals 2

    .line 1371
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isBauhausInAppMessagingEnabled()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1373
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1374
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isBauhausInAppMessagingEnabled()Z

    move-result p0

    return p0
.end method

.method public isBauhausLibraryArtistDPEnabled()Z
    .locals 2

    .line 1686
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isBauhausLibraryArtistDPEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 1688
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/amazon/mp3/activity/settings/SettingsActivity;->shouldDisableBauhausPages(Landroid/content/Context;)Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0

    :catch_0
    move-exception p0

    .line 1690
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1691
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isBauhausLibraryArtistDPEnabled()Z

    move-result p0

    return p0
.end method

.method public isBauhausLibraryEnabled()Z
    .locals 2

    .line 1706
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isBauhausLibraryEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 1708
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/amazon/mp3/activity/settings/SettingsActivity;->shouldDisableBauhausPages(Landroid/content/Context;)Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0

    :catch_0
    move-exception p0

    .line 1710
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1711
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isBauhausLibraryEnabled()Z

    move-result p0

    return p0
.end method

.method public isBauhausPlaylistDetailEnabled()Z
    .locals 2

    .line 1697
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isBauhausPlaylistDetailPageEnabled()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1699
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1700
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isBauhausPlaylistDetailPageEnabled()Z

    move-result p0

    return p0
.end method

.method public isBauhausTopAppBarEnabled()Z
    .locals 2

    .line 1358
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isBauhausTopAppBarEnabled()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1360
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1361
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isBauhausTopAppBarEnabled()Z

    move-result p0

    return p0
.end method

.method public isBluetoothSearchEnabled()Z
    .locals 2

    .line 1873
    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->BLUETOOTH_SEARCH_ENABLED:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1874
    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1873
    invoke-virtual {p0, v0}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled(Lcom/amazon/music/platform/providers/FeatureGateProvider;)Z

    move-result p0

    return p0
.end method

.method public isBottomBarOptimizationEnabled()Z
    .locals 0

    .line 2807
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isBottomBarUXConsistencyEnabled()Z

    move-result p0

    return p0
.end method

.method public isBottomBarUXConsistencyEnabled()Z
    .locals 2

    .line 2791
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2793
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2795
    sget-object v0, Lcom/amazon/mp3/featuregate/CrossAppFeature;->bottom_bar_ux_consistency:Lcom/amazon/mp3/featuregate/CrossAppFeature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isBrowseHomeRegionFlexEnabled()Z
    .locals 0

    .line 2736
    sget-object p0, Lcom/amazon/mp3/featuregate/Feature;->browse_home_region_flex:Lcom/amazon/mp3/featuregate/Feature;

    invoke-virtual {p0}, Lcom/amazon/mp3/featuregate/Feature;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isCTAPrimecacheAlbumAsinKeyEnabled()Z
    .locals 2

    .line 2491
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2493
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2495
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->ctaprimecache_album_asin_key:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isCastingEnabled()Z
    .locals 2

    .line 368
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->get()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f050003

    invoke-virtual {p0, v0, v1}, Lcom/amazon/mp3/capability/Capabilities;->isFeatureEnabledLocally(Landroid/content/Context;I)Z

    move-result p0

    return p0
.end method

.method public isCastingIngressExperimentEnabled()Z
    .locals 0

    .line 2217
    invoke-static {}, Lcom/amazon/mp3/util/UserSubscriptionUtil;->getUserSubscription()Lcom/amazon/music/subscription/UserSubscription;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/subscription/UserSubscription;->isNightwingOnly()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public isCategoryPostEnabled()Z
    .locals 2

    .line 446
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 448
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching Feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 450
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->Category_Post_Launch:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isCategoryPostEnabledNonTriggering()Z
    .locals 2

    .line 460
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isCategoryPostEnabled()Z

    move-result p0

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 463
    :cond_0
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/WeblabProvider;

    invoke-virtual {p0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/WeblabProvider;

    if-eqz p0, :cond_3

    .line 465
    sget-object v1, Lcom/amazon/mp3/weblab/Weblab;->DM_EXPERIMENT_CATEGORY_PAGE_YOUNG_ADULTS:Lcom/amazon/mp3/weblab/Weblab;

    .line 466
    invoke-virtual {v1}, Lcom/amazon/mp3/weblab/Weblab;->toString()Ljava/lang/String;

    move-result-object v1

    .line 465
    invoke-interface {p0, v1, v0}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    move-result-object p0

    .line 467
    sget-object v1, Lcom/amazon/music/platform/data/WeblabTreatment;->T1:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-eq p0, v1, :cond_2

    sget-object v1, Lcom/amazon/music/platform/data/WeblabTreatment;->T3:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-ne p0, v1, :cond_1

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    :goto_0
    const/4 p0, 0x1

    return p0

    :cond_3
    return v0
.end method

.method public isCloudQueuePlaybackEnabled()Z
    .locals 3

    .line 551
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 554
    :try_start_0
    invoke-interface {v0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isCloudQueueEnabled()Z

    move-result v0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 556
    sget-object v1, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v2, "Feature flag not available when checking for CloudQueue."

    invoke-static {v1, v2, v0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 559
    :cond_0
    sget-object v0, Lcom/amazon/mp3/weblab/Weblab;->DM_ANDROID_CLOUD_QUEUE:Lcom/amazon/mp3/weblab/Weblab;

    invoke-direct {p0, v0}, Lcom/amazon/mp3/capability/Capabilities;->isTreatmentEnabledViaWeblabT1(Lcom/amazon/mp3/weblab/Weblab;)Z

    move-result p0

    if-eqz p0, :cond_1

    :goto_0
    const/4 p0, 0x1

    goto :goto_1

    :cond_1
    const/4 p0, 0x0

    :goto_1
    return p0
.end method

.method public isCollapsibleViewDisable()Z
    .locals 0

    .line 2713
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 2716
    :cond_0
    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->LIBRARY_SONGS_DISABLE_COLLAPSIBLE_VIEW:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isCommunityPlaylistEnabled()Z
    .locals 3

    .line 1861
    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->COMMUNITY_PLAYLIST_ENABLED:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    .line 1862
    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v2

    check-cast v2, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1861
    invoke-virtual {p0, v2}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled(Lcom/amazon/music/platform/providers/FeatureGateProvider;)Z

    move-result p0

    if-nez p0, :cond_1

    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->COMMUNITY_PLAYLIST_FREE_TIER_ENABLED:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    .line 1864
    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1863
    invoke-virtual {p0, v0}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled(Lcom/amazon/music/platform/providers/FeatureGateProvider;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public isCompressedCoralRequestsSupported()Z
    .locals 3

    .line 1115
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isCompressedCoralRequestsSupported()Z

    move-result p0

    .line 1116
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Arcus Feature Flag COMPRESSED_CORAL_REQUESTS: %b"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1119
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "The COMPRESSED_CORAL_REQUESTS feature flag is unavailable."

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->warning(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1120
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->shouldUploadLogAfterCrash()Z

    move-result p0

    return p0
.end method

.method public isConcurrentFamilyUpsellEnabled()Z
    .locals 2

    .line 203
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 205
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching Feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 207
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->concurrent_family_upsell_enabled:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isCpuArchitectureSupported()Z
    .locals 7

    .line 393
    sget-object p0, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    const/4 v0, 0x0

    if-eqz p0, :cond_5

    .line 394
    array-length v1, p0

    if-nez v1, :cond_0

    goto :goto_3

    .line 398
    :cond_0
    const-string v1, "armeabi-v7a"

    aget-object v2, p0, v0

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_2

    const-string v1, "arm64-v8a"

    aget-object v3, p0, v0

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    move v1, v0

    goto :goto_1

    :cond_2
    :goto_0
    move v1, v2

    .line 399
    :goto_1
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const-string/jumbo v4, "org.chromium.arc"

    invoke-virtual {v3, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v3

    .line 400
    sget-object v4, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "suppotedAbis: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " isFirstABISupported: "

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p0, " isChromeOs: "

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, p0}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v1, :cond_4

    if-eqz v3, :cond_3

    goto :goto_2

    :cond_3
    return v2

    .line 402
    :cond_4
    :goto_2
    const-string p0, "Videos not supported on this device"

    invoke-static {v4, p0}, Lcom/amazon/mp3/util/Log;->warning(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    :goto_3
    return v0
.end method

.method public isCrashHandlingEnabled(Landroid/content/Context;)Z
    .locals 1

    const v0, 0x7f050004

    .line 738
    invoke-virtual {p0, p1, v0}, Lcom/amazon/mp3/capability/Capabilities;->isFeatureEnabledLocally(Landroid/content/Context;I)Z

    move-result p0

    return p0
.end method

.method public isCustomerProfilePictureUploadSupported()Z
    .locals 2

    .line 762
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isCustomerProfilePictureUploadSupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 764
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 765
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isCustomerProfilePictureUploadSupported()Z

    move-result p0

    return p0
.end method

.method public isCustomerProfileSupported()Z
    .locals 2

    .line 750
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isCustomerProfileSupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 752
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 753
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isCustomerProfileSupported()Z

    move-result p0

    return p0
.end method

.method public isDedicatedLikesApiKeyEnabled()Z
    .locals 0

    .line 2727
    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->LIKES_DEDICATED_API_KEY:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isDeviceSDCapable(Landroid/content/Context;)Z
    .locals 4

    .line 907
    invoke-static {}, Landroid/os/Environment;->isExternalStorageRemovable()Z

    move-result p0

    const/4 v0, 0x1

    if-eqz p0, :cond_0

    return v0

    .line 911
    :cond_0
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const v1, 0x7f141219

    .line 912
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_1

    return v0

    .line 919
    :cond_1
    invoke-static {}, Lcom/amazon/mp3/AmazonApplication;->getCapabilities()Lcom/amazon/mp3/capability/Capabilities;

    move-result-object v2

    .line 920
    invoke-virtual {v2, p1}, Lcom/amazon/mp3/capability/Capabilities;->secondaryStoragePresent(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 921
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return v0

    :cond_2
    return v3
.end method

.method public isDolbyAtmosEnabled(Landroid/content/Context;)Z
    .locals 0

    .line 1431
    invoke-virtual {p0, p1}, Lcom/amazon/mp3/capability/Capabilities;->isSpatialAudioEnabled(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 1432
    :cond_0
    invoke-static {p1}, Lcom/soum91/amazonmusictv/TvBridge;->isTv(Landroid/content/Context;)Z
    move-result p0
    if-eqz p0, :tv_original_atmos
    invoke-static {}, Lcom/soum91/amazonmusictv/TvBridge;->directAtmosSupported()Z
    move-result p0
    if-eqz p0, :tv_original_atmos
    return p0
    :tv_original_atmos
    invoke-static {}, Lcom/amazon/digitalmusicplayback/PlayerFactory;->hasBuiltinAtmos()Z

    move-result p0

    return p0
.end method

.method public isDownloadTrackButtonEnabled()Z
    .locals 3

    .line 1212
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isDownloadTrackButtonEnabled()Z

    move-result p0

    .line 1213
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Arcus Feature Flag DOWNLOAD_TRACK_BUTTON: %b"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 1222
    :cond_0
    invoke-static {}, Lcom/amazon/mp3/util/UserSubscriptionUtil;->getUserSubscription()Lcom/amazon/music/subscription/UserSubscription;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/subscription/UserSubscription;->isPrime()Z

    move-result p0

    if-nez p0, :cond_1

    return v0

    .line 1227
    :cond_1
    sget-object p0, Lcom/amazon/mp3/weblab/ExperimentWeblabs;->DM_LPN_OFFLINE_DOWNLOAD_BUTTON:Lcom/amazon/mp3/weblab/ExperimentWeblabs;

    .line 1229
    :try_start_1
    invoke-static {}, Lcom/amazon/mp3/weblab/LegacyWeblabController;->getInstance()Lcom/amazon/mp3/weblab/LegacyWeblabController;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/mp3/weblab/ExperimentWeblabs;->getAaWeblab()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/amazon/mp3/weblab/LegacyWeblabController;->getTreatmentAndRecordTrigger(Ljava/lang/String;)Lcom/amazon/music/platform/data/WeblabTreatment;

    .line 1230
    invoke-static {}, Lcom/amazon/mp3/weblab/LegacyWeblabController;->getInstance()Lcom/amazon/mp3/weblab/LegacyWeblabController;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/mp3/weblab/ExperimentWeblabs;->getAbWeblab()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/amazon/mp3/weblab/LegacyWeblabController;->getTreatmentAndRecordTrigger(Ljava/lang/String;)Lcom/amazon/music/platform/data/WeblabTreatment;

    move-result-object v1

    .line 1232
    sget-object p0, Lcom/amazon/music/platform/data/WeblabTreatment;->T1:Lcom/amazon/music/platform/data/WeblabTreatment;
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    if-ne v1, p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    return v0

    :catch_0
    move-exception v1

    .line 1234
    sget-object v2, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    filled-new-array {p0, v1}, [Ljava/lang/Object;

    move-result-object p0

    const-string v1, "The weblab %s is not defined: %s"

    invoke-static {v2, v1, p0}, Lcom/amazon/mp3/util/Log;->warning(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return v0

    :catch_1
    move-exception p0

    .line 1218
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1219
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isDownloadTrackButtonEnabled()Z

    move-result p0

    return p0
.end method

.method public isDownloadsImageCacheEnabled()Z
    .locals 2

    .line 2678
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2680
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2682
    sget-object v0, Lcom/amazon/mp3/featuregate/CrossAppFeature;->downloads_image_cache:Lcom/amazon/mp3/featuregate/CrossAppFeature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isDownloadsRestorationEnabled()Z
    .locals 1

    .line 1588
    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isLikesDownloadsRestorationEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isPreLikesDownloadsRestorationEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public isDragonflyProvidedTimestampEnabled()Z
    .locals 2

    .line 2669
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2671
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2673
    new-instance v0, Lcom/amazon/music/platform/featuregate/features/DragonflyEventTimestampFeature;

    invoke-direct {v0}, Lcom/amazon/music/platform/featuregate/features/DragonflyEventTimestampFeature;-><init>()V

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isES3BackfillPostDownloadRestorationEnabled()Z
    .locals 0

    .line 1610
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 1611
    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->ES3_BACKFILL_POST_DOWNLOAD_RESTORATION_FIRE_OS:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    return p0

    .line 1613
    :cond_0
    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->ES3_BACKFILL_POST_DOWNLOAD_RESTORATION_ANDROID:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isEarlyUseNotificationEnabled()Z
    .locals 2

    .line 1991
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isEarlyUseNotificationEnabled()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1993
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return p0
.end method

.method public isEntityPlaylistAutoPlaybackSupported()Z
    .locals 1

    .line 1810
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-eqz p0, :cond_0

    .line 1812
    sget-object v0, Lcom/amazon/queueexperience/feature/DynamicPlaylistFeatureGating;->dynamic_playlists_t3:Lcom/amazon/queueexperience/feature/DynamicPlaylistFeatureGating;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isEntityPlaylistSupported()Z
    .locals 1

    .line 1797
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-eqz p0, :cond_0

    .line 1799
    sget-object v0, Lcom/amazon/queueexperience/feature/DynamicPlaylistFeatureGating;->supports_dynamic_playlists:Lcom/amazon/queueexperience/feature/DynamicPlaylistFeatureGating;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isEqualizerSupported()Z
    .locals 2

    .line 935
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isHarleyEqualizerSupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 937
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 938
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isHarleyEqualizerSupported()Z

    move-result p0

    return p0
.end method

.method public isExplicitLanguageFilterEnabled()Z
    .locals 3

    .line 834
    sget-object v0, Lcom/amazon/mp3/util/ChildUserUtil;->INSTANCE:Lcom/amazon/mp3/util/ChildUserUtil;

    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/mp3/util/ChildUserUtil;->isChildUser(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    .line 840
    :try_start_0
    invoke-static {}, Lcom/amazon/music/account/AccountManagerSingleton;->get()Lcom/amazon/music/account/AccountManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/music/account/AccountManager;->getUser()Lcom/amazon/music/account/User;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/music/account/User;->isExplicitFilterEnabledOnDevice()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 841
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isExplicitLanguageFilterSupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/account/DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/amazon/music/account/MusicAccountNotCreatedException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_1

    return v1

    :catch_0
    move-exception p0

    goto :goto_0

    :cond_1
    return v0

    .line 843
    :goto_0
    sget-object v1, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v2, "User data not ready"

    invoke-static {v1, v2, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return v0
.end method

.method public isExplicitLanguageFilterSupported()Z
    .locals 1

    .line 820
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 821
    invoke-static {}, Lcom/amazon/mp3/elf/ExplicitLanguageManager;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/amazon/mp3/account/AccountRequestUtil;->isAccountValidForAppStart(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isExternalProviderEnabled()Z
    .locals 0

    .line 165
    invoke-static {}, Lcom/amazon/mp3/util/AmazonDevice;->isGrover()Z

    move-result p0

    if-nez p0, :cond_1

    invoke-static {}, Lcom/amazon/mp3/util/AmazonDevice;->isCanary()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public isFPELatencyExperimentEnabled()Z
    .locals 3

    .line 2755
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/WeblabProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/WeblabProvider;

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    .line 2757
    const-string v1, "DM_ANDROID_FPE_LATENCY_GATING_1290613"

    const/4 v2, 0x1

    invoke-interface {p0, v1, v2}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    move-result-object p0

    .line 2758
    sget-object v1, Lcom/amazon/music/platform/data/WeblabTreatment;->T1:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-ne p0, v1, :cond_0

    return v2

    :cond_0
    return v0
.end method

.method isFeatureEnabledLocally(Landroid/content/Context;I)Z
    .locals 0

    .line 373
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    .line 374
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p0

    return p0
.end method

.method public isFireFlyTrackImportEnabled()Z
    .locals 2

    .line 2478
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2480
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2482
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->firefly_track_import:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isFireOS(Landroid/content/Context;)Z
    .locals 1

    const v0, 0x7f050005

    .line 1349
    invoke-virtual {p0, p1, v0}, Lcom/amazon/mp3/capability/Capabilities;->isFeatureEnabledLocally(Landroid/content/Context;I)Z

    move-result p0

    return p0
.end method

.method public isFollowArtistsWidgetEnabled()Z
    .locals 2

    .line 1282
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isFollowArtistsWidgetEnabled()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1284
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1285
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isFollowArtistsWidgetEnabled()Z

    move-result p0

    return p0
.end method

.method public isFreeAudiobooksEnabled()Z
    .locals 3

    .line 2534
    sget-object p0, Lcom/amazon/mp3/util/ChildUserUtil;->INSTANCE:Lcom/amazon/mp3/util/ChildUserUtil;

    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/mp3/util/ChildUserUtil;->isChildUser(Landroid/content/Context;)Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    return v0

    .line 2538
    :cond_0
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_1

    .line 2540
    sget-object v1, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v2, "Error fetching feature gate provider"

    invoke-static {v1, v2}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    if-eqz p0, :cond_2

    .line 2542
    new-instance v1, Lcom/amazon/music/platform/featuregate/features/FreeAudiobooksFeature;

    invoke-direct {v1}, Lcom/amazon/music/platform/featuregate/features/FreeAudiobooksFeature;-><init>()V

    invoke-interface {p0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    return v0
.end method

.method public isFreeTierContextualUpsellsEnabled()Z
    .locals 3

    .line 1312
    invoke-static {}, Lcom/amazon/mp3/util/UserSubscriptionUtil;->getUserSubscription()Lcom/amazon/music/subscription/UserSubscription;

    move-result-object p0

    .line 1313
    invoke-virtual {p0}, Lcom/amazon/music/subscription/UserSubscription;->isNightwingOnly()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 1315
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isFreeTierContextualUpsellsEnabled()Z

    move-result p0

    .line 1316
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Arcus Feature Flag FREE_TIER_CONTEXTUAL_UPSELL: %b"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1319
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Unable to retrieve state of isFreeTierContextualUpsellsEnabled()"

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1320
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isFreeTierContextualUpsellsEnabled()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isFreeTierSkipLimitEducationalTooltipEnabled()Z
    .locals 3

    .line 2021
    invoke-static {}, Lcom/amazon/mp3/util/UserSubscriptionUtil;->getUserSubscription()Lcom/amazon/music/subscription/UserSubscription;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/subscription/UserSubscription;->isNightwingOnly()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 2023
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isFreeTierSkipLimitEducationalTooltipEnabled()Z

    move-result p0

    .line 2024
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Arcus Feature Flag FREE_TIER_SKIP_LIMIT_EDUCATIONAL_TOOLTIP: %b"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 2027
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Unable to retrieve state of isFreeTierSkipLimitEducationalTooltipEnabled()"

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2028
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isFreeTierSkipLimitEducationalTooltipEnabled()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isFreeTierSkipsRemainingTooltipEnabled()Z
    .locals 0

    .line 2039
    sget-object p0, Lcom/amazon/mp3/featuregate/Feature;->is_skips_remaining_tooltip_enabled:Lcom/amazon/mp3/featuregate/Feature;

    invoke-virtual {p0}, Lcom/amazon/mp3/featuregate/Feature;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isFreeTierUserPlaylistEditingEnabled()Z
    .locals 3

    .line 1302
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isFreeTierUserPlaylistEditingEnabled()Z

    move-result p0

    .line 1303
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Arcus Feature Flag FREE_TIER_USER_PLAYLIST_EDITING: %b"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1306
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1307
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isFreeTierUserPlaylistEditingEnabled()Z

    move-result p0

    return p0
.end method

.method public isGPBLaunchedInTerritory()Z
    .locals 2

    .line 211
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 213
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching Feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 215
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->google_iab_launched_in_territory:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isHapticsOnPlaybackEnabled()Z
    .locals 0

    .line 2277
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public isHyperloopCapabilityEnabled()Z
    .locals 0

    .line 1822
    sget-object p0, Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;->HYPERLOOP_CAPABILITY:Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/voice/featuregating/AlexaFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isINLanguageExpansionSupported()Z
    .locals 3

    .line 1764
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isINLanguageExpansionSupported()Z

    move-result p0

    .line 1766
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Arcus Feature Flag IN_EXTENDED_LANGUAGE_LIST: %b"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1769
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1770
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;->isINLanguageExpansionSupported()Z

    move-result p0

    return p0
.end method

.method public isIngressPillsEnabled(Landroid/content/Context;)Z
    .locals 2

    .line 1780
    sget-object p0, Lcom/amazon/mp3/util/ChildUserUtil;->INSTANCE:Lcom/amazon/mp3/util/ChildUserUtil;

    invoke-virtual {p0, p1}, Lcom/amazon/mp3/util/ChildUserUtil;->isChildUser(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 1782
    sget-object p0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string p1, "Ingress pills are hidden since user is a Child User"

    invoke-static {p0, p1}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    .line 1786
    :cond_0
    sget-object p0, Lcom/amazon/podcast/featuregating/PodcastFeatureGating;->PODCAST:Lcom/amazon/podcast/featuregating/PodcastFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/podcast/featuregating/PodcastFeatureGating;->isEnabled()Z

    move-result p0

    .line 1787
    sget-object p1, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "Arcus Feature Flag PODCAST_ENABLED: %b"

    invoke-static {p1, v1, v0}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return p0
.end method

.method public isInstantSearchEntityExpansionEnabled()Z
    .locals 0

    .line 1857
    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->INSTANT_SEARCH_ENTITY_EXPANSION:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isIoTSkipLimitSupported()Z
    .locals 3

    .line 1267
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isIoTSkipLimitSupported()Z

    move-result p0

    .line 1268
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Arcus Feature Flag IOT_SKIP_LIMIT: %b"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1271
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "The IOT_SKIP_LIMIT feature flag is unavailable."

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->warning(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1272
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isIoTSkipLimitSupported()Z

    move-result p0

    return p0
.end method

.method public isJustPressPlayNpsEnabled()Z
    .locals 2

    .line 2575
    sget-object p0, Lcom/amazon/mp3/util/ChildUserUtil;->INSTANCE:Lcom/amazon/mp3/util/ChildUserUtil;

    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/mp3/util/ChildUserUtil;->isChildUser(Landroid/content/Context;)Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    return v0

    .line 2579
    :cond_0
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_1

    .line 2581
    sget-object p0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {p0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    .line 2584
    :cond_1
    new-instance v0, Lcom/amazon/music/platform/featuregate/features/JustPressPlayNPSFeature;

    invoke-direct {v0}, Lcom/amazon/music/platform/featuregate/features/JustPressPlayNPSFeature;-><init>()V

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    return p0
.end method

.method public isJustPressPlayT1REnabled()Z
    .locals 2

    .line 2562
    sget-object p0, Lcom/amazon/mp3/util/ChildUserUtil;->INSTANCE:Lcom/amazon/mp3/util/ChildUserUtil;

    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/mp3/util/ChildUserUtil;->isChildUser(Landroid/content/Context;)Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    return v0

    .line 2566
    :cond_0
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_1

    .line 2568
    sget-object p0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {p0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    .line 2571
    :cond_1
    new-instance v0, Lcom/amazon/music/platform/featuregate/features/JustPressPlayT1RFeature;

    invoke-direct {v0}, Lcom/amazon/music/platform/featuregate/features/JustPressPlayT1RFeature;-><init>()V

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    return p0
.end method

.method public isKatanaSupported()Z
    .locals 0

    .line 1014
    invoke-static {}, Lcom/amazon/mp3/util/UserSubscriptionUtil;->getUserSubscription()Lcom/amazon/music/subscription/UserSubscription;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/subscription/UserSubscription;->isKatana()Z

    move-result p0

    return p0
.end method

.method public isLibraryCollapsibleViewEnabled()Z
    .locals 0

    .line 1584
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isTrueLikesAndFollowsEnabled()Z

    move-result p0

    return p0
.end method

.method public isLibraryContinueListeningEnabled()Z
    .locals 3

    .line 2764
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    return v0

    .line 2767
    :cond_0
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/WeblabProvider;

    invoke-virtual {p0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/WeblabProvider;

    if-eqz p0, :cond_1

    .line 2769
    const-string v1, "DM_LIBRARY_CONTINUE_LISTENING_ANDROID_1312045"

    const/4 v2, 0x1

    invoke-interface {p0, v1, v2}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    move-result-object p0

    .line 2770
    sget-object v1, Lcom/amazon/music/platform/data/WeblabTreatment;->T1:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-ne p0, v1, :cond_1

    return v2

    :cond_1
    return v0
.end method

.method public isLibraryMPShimmerLoaderEnabled()Z
    .locals 2

    .line 2783
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2785
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2787
    sget-object v0, Lcom/amazon/mp3/featuregate/CrossAppFeature;->library_skeleton_loading_animation:Lcom/amazon/mp3/featuregate/CrossAppFeature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isLibraryRegionFlexEnabled()Z
    .locals 0

    .line 2731
    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->LIBRARY_REGION_FLEX_TRAFFIC_GATING:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isLibraryScrollWidgetEnabled()Z
    .locals 0

    .line 1577
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result p0

    if-nez p0, :cond_0

    .line 1578
    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->LIBRARY_SUBPAGE_SCROLL_WIDGET:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    return p0

    .line 1580
    :cond_0
    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->LIBRARY_SUBPAGE_SCROLL_WIDGET_FIRE_OS:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isLibrarySortByRecentsEnabled()Z
    .locals 0

    .line 1634
    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->LIBRARY_SORT_BY_RECENTS_GATING:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->LIBRARY_SORT_BY_RECENTS_MEASURE:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    .line 1635
    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isLibrarySyncApiDialing()Z
    .locals 2

    .line 1069
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isLibrarySyncApiDialing()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1071
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1072
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isLibrarySyncApiDialing()Z

    move-result p0

    return p0
.end method

.method public isLibrarySyncFpeAndroidEnabled()Z
    .locals 0

    .line 2776
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 2777
    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->LIBRARY_SYNC_FPE_FIRE_OS:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    return p0

    .line 2779
    :cond_0
    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->LIBRARY_SYNC_FPE_ANDROID:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isLikesReconciliationEnabled()Z
    .locals 0

    .line 2720
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 2721
    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->LIKES_RECONCILIATION_FIRE_OS:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public isLiveEventEnabled()Z
    .locals 3

    .line 1183
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isLiveEventEnabled()Z

    move-result p0

    .line 1184
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature Flag LIVE_EVENT_ENABLED: %b"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1187
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "The LIVE_EVENT_ENABLED feature flag is unavailable."

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->warning(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1188
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isLiveEventEnabled()Z

    move-result p0

    return p0
.end method

.method public isLocaleSupportedForUserInArcus()Z
    .locals 0

    .line 2191
    sget-object p0, Lcom/amazon/mp3/featuregate/Feature;->locale_supported:Lcom/amazon/mp3/featuregate/Feature;

    invoke-virtual {p0}, Lcom/amazon/mp3/featuregate/Feature;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isLyricsFeedbackSupported()Z
    .locals 2

    .line 2284
    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2286
    sget-object p0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v0, "Error fetching Feature gate provider"

    invoke-static {p0, v0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 2289
    :cond_0
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isLyricsSupported()Z

    move-result p0

    if-eqz p0, :cond_1

    sget-object p0, Lcom/amazon/mp3/featuregate/Feature;->is_lyrics_feedback_enabled:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {v0, p0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v1
.end method

.method public isLyricsRegionFlexEnabled()Z
    .locals 3

    .line 2820
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/WeblabProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/WeblabProvider;

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    .line 2822
    const-string v1, "DM_MOBILE_LYRICS_REGION_FLEX_MIGRATION_ANDROID_1398156"

    const/4 v2, 0x1

    invoke-interface {p0, v1, v2}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    move-result-object p0

    sget-object v1, Lcom/amazon/music/platform/data/WeblabTreatment;->T1:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-ne p0, v1, :cond_0

    return v2

    :cond_0
    return v0
.end method

.method public isLyricsSharingEnabled()Z
    .locals 2

    .line 2385
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2387
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2389
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->lyrics_sharing:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-static {}, Lcom/amazon/mp3/util/ScreenUtil;->isLargeOrExtraLargeScreen()Z

    move-result p0

    if-nez p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isLyricsSharingEngagementEnabled()Z
    .locals 2

    .line 2403
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2405
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2407
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->lyrics_sharing_engagement:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isLyricsSupported()Z
    .locals 2

    .line 573
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->canAccessLyrics()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 575
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 576
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;->canAccessLyrics()Z

    move-result p0

    return p0
.end method

.method public isMarketIdCheckedForLyricsSupport()Z
    .locals 2

    .line 991
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isMarketPlaceCheckForLyricsSupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 993
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 994
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;->isMarketPlaceCheckForLyricsSupported()Z

    move-result p0

    return p0
.end method

.method public isMemoryConstrainted()Z
    .locals 1

    .line 616
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->get()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/amazon/mp3/capability/Capabilities;->getHeapSize(Landroid/content/Context;)F

    move-result p0

    const/high16 v0, 0x41800000    # 16.0f

    cmpg-float p0, p0, v0

    if-gtz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isMerchEnabled()Z
    .locals 3

    .line 1168
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isMerchEnabled()Z

    move-result p0

    .line 1169
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature Flag MERCH_ENABLED: %b"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1172
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "The MERCH_ENABLED feature flag is unavailable."

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->warning(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1173
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;->isMerchEnabled()Z

    move-result p0

    return p0
.end method

.method public isMiniPlayerAtBottom()Z
    .locals 0

    .line 2394
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isLyricsSharingEnabled()Z

    move-result p0

    if-nez p0, :cond_1

    invoke-static {}, Lcom/amazon/mp3/featuregate/LandscapeUnlockFeature;->isTabletLandscapeUnlocked()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public isMontanaEnabled()Z
    .locals 3

    .line 2517
    sget-object p0, Lcom/amazon/mp3/util/ChildUserUtil;->INSTANCE:Lcom/amazon/mp3/util/ChildUserUtil;

    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/mp3/util/ChildUserUtil;->isChildUser(Landroid/content/Context;)Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    return v0

    .line 2521
    :cond_0
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_1

    .line 2523
    sget-object v1, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v2, "Error fetching feature gate provider"

    invoke-static {v1, v2}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    if-eqz p0, :cond_2

    .line 2525
    new-instance v1, Lcom/amazon/music/platform/featuregate/features/MontanaFeature;

    invoke-direct {v1}, Lcom/amazon/music/platform/featuregate/features/MontanaFeature;-><init>()V

    invoke-interface {p0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    return v0
.end method

.method public isMontanaLibraryLandingEnabled()Z
    .locals 0

    .line 1624
    sget-object p0, Lcom/amazon/podcast/featuregating/PodcastFeatureGating;->MONTANA_LIBRARY_LANDING_UI:Lcom/amazon/podcast/featuregating/PodcastFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/podcast/featuregating/PodcastFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isMontanaPlaybackEnabled()Z
    .locals 1

    .line 2552
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isMontanaEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isFreeAudiobooksEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isJustPressPlayNpsEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public isMontanaSupported()Z
    .locals 0

    .line 2631
    sget-object p0, Lcom/amazon/mp3/featuregate/Feature;->is_montana_supported:Lcom/amazon/mp3/featuregate/Feature;

    invoke-virtual {p0}, Lcom/amazon/mp3/featuregate/Feature;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isMusicNeverStopsEnabled()Z
    .locals 2

    .line 1203
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isMusicNeverStopsEnabled()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1205
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1206
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isMusicNeverStopsEnabled()Z

    move-result p0

    return p0
.end method

.method public isMusicVideosEnabled()Z
    .locals 3

    .line 434
    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 435
    sget-object v1, Lcom/amazon/mp3/featuregate/Feature;->Music_Videos:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {v0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result v0

    .line 436
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->get()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f05000d

    invoke-virtual {p0, v1, v2}, Lcom/amazon/mp3/capability/Capabilities;->isFeatureEnabledLocally(Landroid/content/Context;I)Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 437
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isPackageAutomotive()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isVideosWeblabEnabledInNewTerritories()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isMyMixPlaylistLibraryCapabilityDisabled()Z
    .locals 2

    .line 2640
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2642
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2644
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->my_mix_playlist_library_capability_feature:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isNPSLikesSupported()Z
    .locals 3

    .line 1504
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isNPSLikesSupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1506
    :catch_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isNPSLikesSupported()Z

    move-result p0

    :goto_0
    const/4 v0, 0x1

    if-eqz p0, :cond_0

    return v0

    .line 1513
    :cond_0
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/WeblabProvider;

    invoke-virtual {p0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/WeblabProvider;

    const/4 v1, 0x0

    if-eqz p0, :cond_3

    .line 1516
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1517
    sget-object v2, Lcom/amazon/mp3/weblab/Weblab;->DM_CURATE_LIKES_ON_NOW_PLAYING_FIRE_TABLET_AA:Lcom/amazon/mp3/weblab/Weblab;

    .line 1518
    invoke-virtual {v2}, Lcom/amazon/mp3/weblab/Weblab;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1517
    invoke-interface {p0, v2, v0}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    .line 1519
    sget-object v2, Lcom/amazon/mp3/weblab/Weblab;->DM_CURATE_LIKES_ON_NOW_PLAYING_FIRE_TABLET_AB:Lcom/amazon/mp3/weblab/Weblab;

    .line 1520
    invoke-virtual {v2}, Lcom/amazon/mp3/weblab/Weblab;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1519
    invoke-interface {p0, v2, v0}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    move-result-object p0

    goto :goto_1

    .line 1522
    :cond_1
    sget-object v2, Lcom/amazon/mp3/weblab/Weblab;->DM_CURATE_LIKES_ON_NOW_PLAYING_AA:Lcom/amazon/mp3/weblab/Weblab;

    .line 1523
    invoke-virtual {v2}, Lcom/amazon/mp3/weblab/Weblab;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1522
    invoke-interface {p0, v2, v0}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    .line 1524
    sget-object v2, Lcom/amazon/mp3/weblab/Weblab;->DM_CURATE_LIKES_ON_NOW_PLAYING_AB:Lcom/amazon/mp3/weblab/Weblab;

    .line 1525
    invoke-virtual {v2}, Lcom/amazon/mp3/weblab/Weblab;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1524
    invoke-interface {p0, v2, v0}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    move-result-object p0

    .line 1527
    :goto_1
    sget-object v2, Lcom/amazon/music/platform/data/WeblabTreatment;->T1:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-ne v2, p0, :cond_2

    goto :goto_2

    :cond_2
    move v0, v1

    :goto_2
    move v1, v0

    :cond_3
    return v1
.end method

.method public isOnDemandPlaylistsEnabled()Z
    .locals 0

    .line 1835
    sget-object p0, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->ON_DEMAND_PLAYLISTS:Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isOnlineMusicEnabled()Z
    .locals 0

    .line 277
    :try_start_0
    invoke-static {}, Lcom/amazon/music/account/AccountManagerSingleton;->get()Lcom/amazon/music/account/AccountManager;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/account/AccountManager;->getUser()Lcom/amazon/music/account/User;
    :try_end_0
    .catch Lcom/amazon/music/account/DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/amazon/music/account/MusicAccountNotCreatedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 p0, 0x1

    return p0

    :catch_1
    const/4 p0, 0x0

    return p0
.end method

.method public isPackageAutomotive()Z
    .locals 1

    .line 414
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "com.amazon.mp3.automotiveOS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public isPersistentRefinemetsEnabled()Z
    .locals 2

    .line 2452
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2454
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2456
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->persistent_refinements:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isPersonalizedAudiobooksOnT1REnabled()Z
    .locals 2

    .line 2600
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 2604
    :cond_0
    sget-object v1, Lcom/amazon/mp3/featuregate/Feature;->personalized_audiobooks_t1r:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v0
.end method

.method public isPipEnabled()Z
    .locals 1

    .line 1145
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v0, "android.software.picture_in_picture"

    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isPlaylistSongRecommendationWidgetEnabled()Z
    .locals 2

    .line 2183
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2185
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching Feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2187
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result p0

    if-nez p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isPlaylistsSortingEnabled()Z
    .locals 1

    .line 2117
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 2118
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->cfy_playlists_sorting:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    return p0
.end method

.method public isPodcastAutoConnectEnabled()Z
    .locals 3

    .line 2236
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/WeblabProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/WeblabProvider;

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    .line 2239
    const-string v1, "DM_MUSICACCESS_AMCONNECT_AUTO_CONNECT_ANDROID_PODCAST_904387"

    const/4 v2, 0x1

    invoke-interface {p0, v1, v2}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    move-result-object p0

    .line 2240
    sget-object v1, Lcom/amazon/music/platform/data/WeblabTreatment;->T1:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-ne p0, v1, :cond_0

    return v2

    :cond_0
    return v0
.end method

.method public isPodcastEnabled()Z
    .locals 0

    .line 1383
    sget-object p0, Lcom/amazon/podcast/featuregating/PodcastFeatureGating;->PODCAST:Lcom/amazon/podcast/featuregating/PodcastFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/podcast/featuregating/PodcastFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isPodcastRedhoodPlusUXEnabled()Z
    .locals 3

    .line 2143
    invoke-static {}, Lcom/amazon/podcast/Podcast;->getFeatureGatePreferences()Lcom/amazon/podcast/featureGates/FeatureGatePreferences;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/podcast/featureGates/FeatureGatePreferences;->isRedhoodPlusUXEnabled()Z

    move-result p0

    .line 2144
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "\"Weblab PODCAST_REDHOODPLUS_UX_ENABLED: %b"

    invoke-static {v0, v2, v1}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return p0
.end method

.method public isPodcastTranscriptFeatureEnabled()Z
    .locals 0

    .line 1818
    sget-object p0, Lcom/amazon/podcast/featuregating/PodcastFeatureGating;->SCRUB_TRANSCRIPTION:Lcom/amazon/podcast/featuregating/PodcastFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/podcast/featuregating/PodcastFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isPurchasedTabEnabled()Z
    .locals 2

    .line 2465
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2467
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2469
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->purchased_tab:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isPurchasedTrackPlaybackInKatanaQualitySupported()Z
    .locals 2

    .line 1078
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isPurchasedTrackPlaybackInKatanaQualitySupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1080
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1081
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isPurchasedTrackPlaybackInKatanaQualitySupported()Z

    move-result p0

    return p0
.end method

.method public isReactNativeFindLandingPageEnabled()Z
    .locals 2

    .line 1922
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result p0

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->FIND_LANDING_REACT_NATIVE:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    sget-object v1, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    .line 1923
    invoke-virtual {v1, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v1

    check-cast v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v1}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled(Lcom/amazon/music/platform/providers/FeatureGateProvider;)Z

    move-result p0

    if-nez p0, :cond_1

    .line 1925
    :cond_0
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result p0

    if-eqz p0, :cond_2

    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->FIND_LANDING_REACT_NATIVE_FIRETABLET:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    sget-object v1, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    .line 1926
    invoke-virtual {v1, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled(Lcom/amazon/music/platform/providers/FeatureGateProvider;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 p0, 0x1

    return p0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method public isReactNativeLibraryIngressEnabled()Z
    .locals 2

    .line 2504
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2506
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2508
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->library_landing_react_native:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isReactNativeSearchPageEnabled()Z
    .locals 0

    .line 1936
    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->SEARCH_REACT_NATIVE_ENABLED:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isReactNativeStagePageEnabled(Lcom/amazon/music/platform/data/entity/EntityItemIdentifier;Z)Z
    .locals 3

    .line 1954
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 1956
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching Feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 1961
    invoke-virtual {p1}, Lcom/amazon/music/platform/data/entity/EntityItemIdentifier;->getType()Lcom/amazon/music/platform/data/entity/EntityItemType;

    move-result-object p1

    instance-of p1, p1, Lcom/amazon/music/platform/data/entity/SingleType$Video;

    move p2, v0

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_2

    move p1, v0

    move p2, p1

    goto :goto_0

    .line 1968
    :cond_2
    invoke-static {}, Lcom/amazon/mp3/playback/activity/NowPlayingUtil;->isVideoPlaying()Z

    move-result p1

    .line 1969
    invoke-static {}, Lcom/amazon/mp3/playback/activity/NowPlayingUtil;->isSideLoadedTrackPlaying()Z

    move-result p2

    .line 1972
    :goto_0
    invoke-static {}, Lcom/amazon/mp3/util/ScreenUtil;->isLargeOrExtraLargeScreen()Z

    move-result v1

    .line 1973
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/amazon/mp3/util/DeviceUtil;->isFoldableDevice(Landroid/content/Context;)Z

    move-result v2

    if-nez p1, :cond_3

    if-nez p2, :cond_3

    if-nez v1, :cond_3

    if-nez v2, :cond_3

    if-eqz p0, :cond_3

    .line 1974
    sget-object p1, Lcom/amazon/mp3/featuregate/Feature;->stage_rn_enabled:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, p1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_3

    const/4 p0, 0x1

    return p0

    :cond_3
    return v0
.end method

.method public isRecentTracksSyncSupported()Z
    .locals 2

    .line 979
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isRecentTracksSyncSupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 981
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 982
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isRecentTracksSyncSupported()Z

    move-result p0

    return p0
.end method

.method public isRecentlyPlayedAndYourFrequentPlaysCXRefreshEnabled()Z
    .locals 3

    .line 2265
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/WeblabProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/WeblabProvider;

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    .line 2267
    const-string v1, "DM_BH_DESIGN_REFRESH_EXPERIMENT_RP_YFP_ANDROID_1047133"

    const/4 v2, 0x1

    invoke-interface {p0, v1, v2}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    move-result-object p0

    .line 2268
    sget-object v1, Lcom/amazon/music/platform/data/WeblabTreatment;->T1:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-eq p0, v1, :cond_1

    sget-object v1, Lcom/amazon/music/platform/data/WeblabTreatment;->T2:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-ne p0, v1, :cond_0

    goto :goto_0

    :cond_0
    return v0

    :cond_1
    :goto_0
    return v2

    :cond_2
    return v0
.end method

.method public isRecentsSyncSupported()Z
    .locals 2

    .line 891
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isRecentsSyncSupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 893
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 894
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isRecentsSyncSupported()Z

    move-result p0

    return p0
.end method

.method public isRelatedEntitySearchEnabled()Z
    .locals 2

    .line 1847
    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->RELATED_ENTITY_SEARCH:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1848
    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1847
    invoke-virtual {p0, v0}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled(Lcom/amazon/music/platform/providers/FeatureGateProvider;)Z

    move-result p0

    return p0
.end method

.method public isResetDatabaseEventEmissionEnabled()Z
    .locals 0

    .line 1617
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 1618
    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->RESET_DATABASE_EVENT_FIRE_OS:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    return p0

    .line 1620
    :cond_0
    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->RESET_DATABASE_EVENT_ANDROID:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isRetailLopSyncNotificationEnabled()Z
    .locals 3

    .line 1749
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isRetailLopSyncNotificationEnabled()Z

    move-result p0

    .line 1750
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Arcus Feature Flag MANAGE_RETAIL_LOP_SYNC_NOTIFICATION: %b"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1753
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1754
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isRetailLopSyncNotificationEnabled()Z

    move-result p0

    return p0
.end method

.method public isSearchResultsCachingEnabled()Z
    .locals 1

    .line 1045
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    sget-object v0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->CACHE_SEARCH_RESULTS:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    .line 1046
    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    return p0
.end method

.method public isSharingSupported()Z
    .locals 0

    .line 706
    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isInSubscriptionMarketplace()Z

    move-result p0

    return p0
.end method

.method public isShowTrackDetailsEnabled()Z
    .locals 0

    .line 1839
    sget-object p0, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->SHOW_TRACK_DETAILS_TRACK_SFA:Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->isEnabled()Z

    move-result p0

    if-nez p0, :cond_1

    sget-object p0, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->SHOW_TRACK_DETAILS_ARTIST_AS:Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public isSignOutSettingEnabled(Landroid/content/Context;)Z
    .locals 1

    const v0, 0x7f05000b

    .line 797
    invoke-virtual {p0, p1, v0}, Lcom/amazon/mp3/capability/Capabilities;->isFeatureEnabledLocally(Landroid/content/Context;I)Z

    move-result p0

    return p0
.end method

.method public isSkyfireFindLandingFragmentEnabled()Z
    .locals 2

    .line 1903
    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->FIND_LANDING_SKYFIRE_FRAGMENT:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1904
    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1903
    invoke-virtual {p0, v0}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled(Lcom/amazon/music/platform/providers/FeatureGateProvider;)Z

    move-result p0

    return p0
.end method

.method public isSkyfireFindLandingPageGroupingsAndCategoriesEnabled()Z
    .locals 2

    .line 1909
    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->FIND_LANDING_SKYFIRE_GROUPINGS_CATEGORIES:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1910
    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1909
    invoke-virtual {p0, v0}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled(Lcom/amazon/music/platform/providers/FeatureGateProvider;)Z

    move-result p0

    return p0
.end method

.method public isSkyfireSearchFragmentEnabled()Z
    .locals 2

    .line 1897
    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->SEARCH_SKYFIRE_FRAGMENT:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1898
    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1897
    invoke-virtual {p0, v0}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled(Lcom/amazon/music/platform/providers/FeatureGateProvider;)Z

    move-result p0

    return p0
.end method

.method public isSonicRushEnabled()Z
    .locals 1

    .line 2046
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 2050
    :cond_0
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->sonic_rush:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    return p0
.end method

.method public isSpatialAudioEnabled(Landroid/content/Context;)Z
    .locals 2

    .line 1397
    invoke-static {}, Lcom/amazon/mp3/util/UserSubscriptionUtil;->isHawkfireKatana()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 1402
    :cond_0
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isPackageAutomotive()Z

    move-result p0

    if-eqz p0, :cond_4

    .line 1405
    sget-object p0, Lcom/amazon/mp3/auto/playback/DeviceAtmosCapability;->INSTANCE:Lcom/amazon/mp3/auto/playback/DeviceAtmosCapability;

    invoke-virtual {p0}, Lcom/amazon/mp3/auto/playback/DeviceAtmosCapability;->platformIsVerified()Z

    move-result p1

    if-nez p1, :cond_1

    return v1

    .line 1411
    :cond_1
    invoke-virtual {p0}, Lcom/amazon/mp3/auto/playback/DeviceAtmosCapability;->supportsAtmosViaMediaCodec()Z

    move-result p1

    if-nez p1, :cond_3

    .line 1412
    invoke-virtual {p0}, Lcom/amazon/mp3/auto/playback/DeviceAtmosCapability;->supportsAtmosViaPassthrough()Z

    move-result p0

    if-eqz p0, :cond_2

    goto :goto_0

    :cond_2
    return v1

    :cond_3
    :goto_0
    const/4 p0, 0x1

    return p0

    .line 1417
    :cond_4
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const v0, 0x7f140744

    .line 1418
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public isStageAutoDismissEnabled()Z
    .locals 0

    .line 2429
    sget-object p0, Lcom/amazon/mp3/featuregate/Feature;->stage_auto_dismiss:Lcom/amazon/mp3/featuregate/Feature;

    invoke-virtual {p0}, Lcom/amazon/mp3/featuregate/Feature;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isStageForegroundMemoryConfigEnabled()Z
    .locals 2

    .line 2105
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2107
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2109
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->stage_foreground_memory_config:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isStageTrimMemoryConfigEnabled()Z
    .locals 2

    .line 2416
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2418
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2420
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->stage_trim_memory_config:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isStandaloneExperienceSupported(Landroid/content/Context;)Z
    .locals 1

    const v0, 0x7f05000c

    .line 581
    invoke-virtual {p0, p1, v0}, Lcom/amazon/mp3/capability/Capabilities;->isFeatureEnabledLocally(Landroid/content/Context;I)Z

    move-result p0

    return p0
.end method

.method public isStoreSupported()Z
    .locals 2

    .line 189
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->canAccessStore()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 192
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isConcurrentFamilyUpsellEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/amazon/mp3/util/ChildUserUtil;->INSTANCE:Lcom/amazon/mp3/util/ChildUserUtil;

    .line 193
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/mp3/util/ChildUserUtil;->isChildUser(Landroid/content/Context;)Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0

    :catch_0
    move-exception p0

    .line 195
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 196
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;->canAccessStore()Z

    move-result p0

    return p0
.end method

.method public isTopAppBarConsistencyFeatureEnabled()Z
    .locals 2

    .line 2799
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2801
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 2803
    sget-object v0, Lcom/amazon/mp3/featuregate/CrossAppFeature;->top_app_bar_ux_consistency:Lcom/amazon/mp3/featuregate/CrossAppFeature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isTopHitsCommunityPlaylistEnabled()Z
    .locals 2

    .line 1868
    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->COMMUNITY_PLAYLIST_TOPHITS_ENABLED:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1869
    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 1868
    invoke-virtual {p0, v0}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled(Lcom/amazon/music/platform/providers/FeatureGateProvider;)Z

    move-result p0

    return p0
.end method

.method public isTopVideoRecEnabled()Z
    .locals 2

    .line 1665
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isTopVideoRecEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/amazon/mp3/featuregate/Feature;->music_video_stability_experiment:Lcom/amazon/mp3/featuregate/Feature;

    .line 1666
    invoke-virtual {p0}, Lcom/amazon/mp3/featuregate/Feature;->isEnabled()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0

    :catch_0
    move-exception p0

    .line 1668
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1669
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isTopVideoRecEnabled()Z

    move-result p0

    return p0
.end method

.method public isTrackDownloadFeatureAvailable()Z
    .locals 4

    .line 2127
    sget-object p0, Lcom/amazon/mp3/weblab/ExperimentWeblabs;->DM_LPN_OFFLINE_DOWNLOAD_BUTTON_PHASE_2:Lcom/amazon/mp3/weblab/ExperimentWeblabs;

    .line 2128
    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/WeblabProvider;

    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/WeblabProvider;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2130
    invoke-virtual {p0}, Lcom/amazon/mp3/weblab/ExperimentWeblabs;->getAaWeblab()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    .line 2131
    invoke-virtual {p0}, Lcom/amazon/mp3/weblab/ExperimentWeblabs;->getAbWeblab()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, v3}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    move-result-object p0

    .line 2132
    sget-object v0, Lcom/amazon/music/platform/data/WeblabTreatment;->T1:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-ne p0, v0, :cond_0

    return v3

    :cond_0
    return v1
.end method

.method public isTrackLookupBrowseContentSelectorAllStreamable()Z
    .locals 3

    .line 1451
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/WeblabProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/WeblabProvider;

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    .line 1453
    sget-object v1, Lcom/amazon/mp3/weblab/Weblab;->DM_TRACKLOOKUP_BROWSECONTENTSELECTOR_ALLSTREAMABLE:Lcom/amazon/mp3/weblab/Weblab;

    invoke-virtual {v1}, Lcom/amazon/mp3/weblab/Weblab;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {p0, v1, v2}, Lcom/amazon/music/platform/providers/WeblabProvider;->getTreatment(Ljava/lang/String;Z)Lcom/amazon/music/platform/data/WeblabTreatment;

    move-result-object p0

    .line 1454
    sget-object v1, Lcom/amazon/music/platform/data/WeblabTreatment;->T1:Lcom/amazon/music/platform/data/WeblabTreatment;

    if-ne p0, v1, :cond_0

    return v2

    :cond_0
    return v0
.end method

.method public isTrackPopularityBarSupported()Z
    .locals 2

    .line 1051
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isTrackPopularityBarSupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1053
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1054
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isTrackPopularityBarSupported()Z

    move-result p0

    return p0
.end method

.method public isTrickPlaySupprted()Z
    .locals 1

    .line 1652
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isMusicVideosEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isBOPVideosEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    .line 1657
    :cond_1
    :goto_0
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isTrickPlaySupported()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 1659
    :catch_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isTrickPlaySupported()Z

    move-result p0

    return p0
.end method

.method public isTrueLikesAndFollowsBackfillEnabled()Z
    .locals 0

    .line 1570
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 1571
    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->TRUE_LIKES_AND_FOLLOWS_BACKFILL_FIRE_OS:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    return p0

    .line 1573
    :cond_0
    sget-object p0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->TRUE_LIKES_AND_FOLLOWS_BACKFILL_ANDROID:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isTrueLikesAndFollowsEnabled()Z
    .locals 3

    .line 1543
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isFireOS()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 1544
    sget-object v0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->TRUE_LIKES_AND_FOLLOWS_FIRE_OS:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {v0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isArtistFollowSupported()Z

    move-result p0

    if-eqz p0, :cond_0

    return v2

    :cond_0
    return v1

    .line 1546
    :cond_1
    sget-object v0, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->TRUE_LIKES_AND_FOLLOWS_ANDROID:Lcom/amazon/music/curate/featuregating/CurateFeatureGating;

    invoke-virtual {v0}, Lcom/amazon/music/curate/featuregating/CurateFeatureGating;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isArtistFollowSupported()Z

    move-result p0

    if-eqz p0, :cond_2

    return v2

    :cond_2
    return v1
.end method

.method public isUserPlaylistInCatalogSearchEnabled()Z
    .locals 0

    .line 1853
    sget-object p0, Lcom/amazon/music/find/featuregating/FindFeatureGating;->USER_PLAYLIST_IN_CATALOG_SEARCH_RESULT_ENABLED:Lcom/amazon/music/find/featuregating/FindFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/find/featuregating/FindFeatureGating;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public isVideoLandingPageEnabled()Z
    .locals 3

    .line 479
    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    sget-object v1, Lcom/amazon/mp3/featuregate/Feature;->Video_Landing_Page:Lcom/amazon/mp3/featuregate/Feature;

    .line 480
    invoke-interface {v0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result v0

    .line 481
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->get()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f05000d

    invoke-virtual {p0, v1, v2}, Lcom/amazon/mp3/capability/Capabilities;->isFeatureEnabledLocally(Landroid/content/Context;I)Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 482
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isPackageAutomotive()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isVideoPodcastsEnabled()Z
    .locals 1

    .line 2811
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 2813
    sget-object p0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v0, "Error fetching feature gate provider for video podcast feature"

    invoke-static {p0, v0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    .line 2816
    :cond_0
    new-instance v0, Lcom/amazon/music/platform/featuregate/features/VideoPodcastsFeature;

    invoke-direct {v0}, Lcom/amazon/music/platform/featuregate/features/VideoPodcastsFeature;-><init>()V

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    return p0
.end method

.method public isVideoStoriesEnabled()Z
    .locals 3

    .line 491
    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez v0, :cond_0

    .line 493
    sget-object v1, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v2, "Error fetching Feature gate provider"

    invoke-static {v1, v2}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz v0, :cond_1

    .line 495
    sget-object v1, Lcom/amazon/mp3/featuregate/Feature;->Video_Stories:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {v0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isPackageAutomotive()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isVideosWeblabEnabledInNewTerritories()Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isVideoStoriesMutedAutoPlayEnabled()Z
    .locals 3

    .line 2331
    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez v0, :cond_0

    .line 2333
    sget-object v1, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v2, "Error fetching feature gate provider"

    invoke-static {v1, v2}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz v0, :cond_1

    .line 2335
    sget-object v1, Lcom/amazon/mp3/featuregate/Feature;->video_stories_muted_autoPlay:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {v0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isVideosWeblabEnabledInNewTerritories()Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isVideoStoriesV2Supported()Z
    .locals 3

    .line 2344
    sget-object v0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v1, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {v0, v1}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object v0

    check-cast v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez v0, :cond_0

    .line 2346
    sget-object v1, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v2, "Error fetching feature gate provider"

    invoke-static {v1, v2}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz v0, :cond_1

    .line 2348
    sget-object v1, Lcom/amazon/mp3/featuregate/Feature;->video_stories_v2_supported:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {v0, v1}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isVideosWeblabEnabledInNewTerritories()Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isVideoToggleEnabled()Z
    .locals 1

    .line 509
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isExplicitLanguageFilterEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isMusicVideosEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isVideosWeblabEnabledInNewTerritories()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isVideosEnabled()Z
    .locals 4

    .line 422
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isMusicVideosEnabled()Z

    move-result v0

    .line 423
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isBOPVideosEnabled()Z

    move-result p0

    .line 424
    sget-object v1, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isMusicVideosEnabled: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, " , isBOPVideosEnabled: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v0, :cond_1

    if-eqz p0, :cond_0

    .line 425
    sget-object p0, Lcom/amazon/mp3/util/ChildUserUtil;->INSTANCE:Lcom/amazon/mp3/util/ChildUserUtil;

    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/mp3/util/ChildUserUtil;->isChildUser(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public isWakeWordEnabled(Landroid/content/Context;)Z
    .locals 0

    .line 378
    invoke-static {p1}, Lcom/amazon/mp3/activity/settings/SettingsUtil;->isWakeWordUserSettingEnabled(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 379
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isAlexaEnabled()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 380
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->canAccessWakeWord()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isXRayEnabled()Z
    .locals 0

    .line 0
    const/4 p0, 0x1

    return p0
.end method

.method public isYAImmerseEnabled()Z
    .locals 2

    .line 2089
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    .line 2090
    invoke-static {}, Lcom/amazon/mp3/util/PlatformUtil;->isStreamline()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    sget-object v0, Lcom/amazon/mp3/featuregate/ImmersePlaybackFeature;->kitty_hawk_stage:Lcom/amazon/mp3/featuregate/ImmersePlaybackFeature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    .line 2093
    :cond_0
    invoke-static {}, Lcom/amazon/mp3/util/ScreenUtil;->isLargeOrExtraLargeScreen()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2094
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->ya_immerse:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->ya_immerse_on_large_screen_devices:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    return v1

    :cond_1
    const/4 p0, 0x0

    return p0

    .line 2096
    :cond_2
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->ya_immerse:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    return p0
.end method

.method public playlistFollowButtonChangeEnabled()Z
    .locals 3

    .line 302
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isPlaylistFollowTextChangeEnabled()Z

    move-result p0

    .line 303
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Arcus Feature Flag PLAYLIST_FOLLOW_TEXT_CHANGE: %b"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 306
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Unable to retrieve state of isPlaylistFollowTextChangeEnabled()"

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 307
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isPlaylistFollowTextChangeEnabled()Z

    move-result p0

    return p0
.end method

.method public secondaryStoragePresent(Landroid/content/Context;)Z
    .locals 0

    .line 689
    sget-object p0, Landroid/os/Environment;->DIRECTORY_MUSIC:Ljava/lang/String;

    invoke-static {p1, p0}, Lcom/amazon/music/externalstorage/StorageLocationFileManager;->create(Landroid/content/Context;Ljava/lang/String;)Lcom/amazon/music/externalstorage/StorageLocationFileManager;

    move-result-object p0

    .line 692
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/storage/ExternalStorageListener;->getSecondaryStorageLocation()Lcom/amazon/music/externalstorage/StorageLocation;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/amazon/music/externalstorage/StorageLocationFileManager;->getStorageLocationState(Lcom/amazon/music/externalstorage/StorageLocation;)Lcom/amazon/music/externalstorage/StorageState;

    move-result-object p0
    :try_end_0
    .catch Lcom/amazon/music/externalstorage/ExternalStorageNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 694
    :catch_0
    sget-object p0, Lcom/amazon/music/externalstorage/StorageState;->STORAGE_REMOVED:Lcom/amazon/music/externalstorage/StorageState;

    .line 696
    :goto_0
    sget-object p1, Lcom/amazon/music/externalstorage/StorageState;->STORAGE_MOUNTED:Lcom/amazon/music/externalstorage/StorageState;

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_1

    :cond_0
    const/4 p0, 0x0

    :goto_1
    return p0
.end method

.method public shouldBrowseBeSupported()Z
    .locals 0

    .line 272
    invoke-static {}, Lcom/amazon/mp3/util/UserSubscriptionUtil;->getUserSubscription()Lcom/amazon/music/subscription/UserSubscription;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/subscription/UserSubscription;->isInSubscriptionMarketplace()Z

    move-result p0

    return p0
.end method

.method public shouldCloudBeSupported()Z
    .locals 0

    .line 0
    const/4 p0, 0x1

    return p0
.end method

.method public shouldDisableLyrics(Landroid/content/Context;)Z
    .locals 1

    .line 950
    sget-object p0, Lcom/amazon/music/marketplace/Marketplace;->JAPAN:Lcom/amazon/music/marketplace/Marketplace;

    invoke-static {p1}, Lcom/amazon/mp3/account/details/AccountDetailUtil;->get(Landroid/content/Context;)Lcom/amazon/mp3/account/details/AccountDetailUtil;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/mp3/account/details/AccountDetailUtil;->getHomeMarketPlace()Lcom/amazon/music/marketplace/Marketplace;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 951
    invoke-static {p1}, Lcom/amazon/mp3/util/ConnectivityUtil;->isAvailable(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public shouldEnablePaginationForBauhausPages()Z
    .locals 2

    .line 1717
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->isBauhausPaginationEnabled()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1719
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1720
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->isBauhausPaginationEnabled()Z

    move-result p0

    return p0
.end method

.method public shouldForceRefreshBrowseTab()Z
    .locals 1

    .line 641
    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isUnlimitedRecommendationSupported()Z

    move-result v0

    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isPrimeRecommendationSupported()Z

    move-result p0

    if-eq v0, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public shouldForceRefreshButNotOverATC(Landroid/content/Context;)Z
    .locals 0

    .line 633
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->shouldForceRefreshBrowseTab()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-static {p1}, Lcom/amazon/mp3/ftu/FTUSettingsUtil;->customerCompletedATC(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public shouldHideArtistLink()Z
    .locals 1

    .line 543
    sget-object p0, Lcom/amazon/mp3/environment/MusicTerritory;->INDIA:Lcom/amazon/mp3/environment/MusicTerritory;

    invoke-static {}, Lcom/amazon/mp3/account/details/AccountDetailUtil;->getMusicTerritoryOfResidence()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/mp3/environment/MusicTerritory;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public shouldOverrideAugmentedShuffleWithSfa()Z
    .locals 0

    .line 2154
    invoke-static {}, Lcom/amazon/mp3/util/UserSubscriptionUtil;->isNightwingOnly()Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->OVERRIDE_AUGMENTED_SHUFFLE_WITH_SFA:Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;

    invoke-virtual {p0}, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public shouldPullEmpSkuFromDeeplink()Z
    .locals 2

    .line 237
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 239
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching Feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 241
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->pull_sku_from_deeplink:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public shouldRemoveBMWV()Z
    .locals 0

    .line 219
    sget-object p0, Lcom/amazon/mp3/featuregate/Feature;->remove_bluemoon_web_views:Lcom/amazon/mp3/featuregate/Feature;

    invoke-virtual {p0}, Lcom/amazon/mp3/featuregate/Feature;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public shouldShowRecommendations()Z
    .locals 2

    .line 645
    invoke-static {}, Lcom/amazon/mp3/util/UserSubscriptionUtil;->getUserSubscription()Lcom/amazon/music/subscription/UserSubscription;

    move-result-object v0

    .line 646
    invoke-virtual {v0}, Lcom/amazon/music/subscription/UserSubscription;->isNightwingOnly()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 647
    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isFreeTierRecommendationSupported()Z

    move-result p0

    return p0

    .line 648
    :cond_0
    invoke-virtual {v0}, Lcom/amazon/music/subscription/UserSubscription;->isPrimeOnly()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/amazon/mp3/account/details/AccountDetailUtil;->get()Lcom/amazon/mp3/account/details/AccountDetailUtil;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/mp3/account/details/AccountDetailUtil;->isUserInHawkfireMarketplace()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 649
    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isUnlimitedRecommendationSupported()Z

    move-result p0

    return p0

    .line 650
    :cond_1
    invoke-static {}, Lcom/amazon/mp3/account/details/AccountDetailUtil;->get()Lcom/amazon/mp3/account/details/AccountDetailUtil;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/mp3/account/details/AccountDetailUtil;->isPrimeMusicSupported()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 651
    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isPrimeRecommendationSupported()Z

    move-result p0

    return p0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method public shouldShowSRPageHeaders(Z)Z
    .locals 1

    .line 2195
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->SR_page_headers:Lcom/amazon/mp3/featuregate/Feature;

    invoke-direct {p0, v0, p1}, Lcom/amazon/mp3/capability/Capabilities;->isFeatureEnabled(Lcom/amazon/music/platform/featuregate/Feature;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->sonic_rush:Lcom/amazon/mp3/featuregate/Feature;

    .line 2196
    invoke-direct {p0, v0, p1}, Lcom/amazon/mp3/capability/Capabilities;->isFeatureEnabled(Lcom/amazon/music/platform/featuregate/Feature;Z)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public shouldShowStations()Z
    .locals 0

    .line 528
    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->isInSubscriptionMarketplace()Z

    move-result p0

    return p0
.end method

.method public shouldShowStationsRecommendations()Z
    .locals 1

    .line 532
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->get()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/mp3/capability/Capabilities;->shouldShowStationsRecommendations(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method public shouldShowStationsRecommendations(Landroid/content/Context;)Z
    .locals 1

    .line 536
    invoke-direct {p0, p1}, Lcom/amazon/mp3/capability/Capabilities;->doesMarketSupportFeature(Landroid/content/Context;)Z

    move-result p1

    .line 538
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->shouldShowStations()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->shouldShowRecommendations()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public shouldShowStoreIcon()Z
    .locals 1

    .line 724
    invoke-static {}, Lcom/amazon/mp3/bottomnavbar/BottomNavigationBarContainer;->getInstance()Lcom/amazon/mp3/bottomnavbar/BottomNavigationBarContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/mp3/bottomnavbar/BottomNavigationBarContainer;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->isStoreSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 725
    invoke-direct {p0}, Lcom/amazon/mp3/capability/Capabilities;->subscriptionLevelMustShowStoreIcon()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public shouldSplitDBAccess()Z
    .locals 0

    .line 625
    sget-object p0, Lcom/amazon/mp3/featuregate/Feature;->split_readable_writeable_database:Lcom/amazon/mp3/featuregate/Feature;

    invoke-virtual {p0}, Lcom/amazon/mp3/featuregate/Feature;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public shouldSuppressIvyCatalogNonTrackAlbumFiltering()Z
    .locals 2

    .line 1037
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->shouldSuppressIvyCatalogNonTrackAlbumFiltering()Z

    move-result p0
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1039
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Feature flag provider unavailable "

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1040
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;->shouldSuppressIvyCatalogNonTrackAlbumFiltering()Z

    move-result p0

    return p0
.end method

.method public shouldUploadLogAfterCrash()Z
    .locals 3

    .line 1100
    :try_start_0
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getFeatureFlagProvider()Lcom/amazon/music/featureflag/FeatureFlagProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazon/music/featureflag/FeatureFlagProvider;->shouldUploadLogAfterCrash()Z

    move-result p0

    .line 1101
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Arcus Feature Flag UPLOAD_LOG_AFTER_CRASH: %b"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/mp3/util/Log;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazon/music/featureflag/FeatureFlagUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 1104
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "The UPLOAD_LOG_AFTER_CRASH feature flag is unavailable."

    invoke-static {v0, v1, p0}, Lcom/amazon/mp3/util/Log;->warning(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1105
    invoke-static {}, Lcom/amazon/mp3/capability/FeatureFlagsProvider;->getNoOpProvider()Lcom/amazon/mp3/capability/NoOpFeatureFlagProvider;

    move-result-object p0

    invoke-virtual {p0}, Lcom/amazon/music/featureflag/DefaultFeatureFlagProvider;->shouldUploadLogAfterCrash()Z

    move-result p0

    return p0
.end method

.method public shouldUpsellWithGoogleInAppBilling()Z
    .locals 2

    .line 223
    sget-object p0, Lcom/amazon/music/platform/locator/Providers;->INSTANCE:Lcom/amazon/music/platform/locator/Providers;

    const-class v0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    invoke-virtual {p0, v0}, Lcom/amazon/music/platform/locator/Providers;->get(Ljava/lang/Object;)Lcom/amazon/music/platform/providers/InterfaceProvider;

    move-result-object p0

    check-cast p0, Lcom/amazon/music/platform/providers/FeatureGateProvider;

    if-nez p0, :cond_0

    .line 225
    sget-object v0, Lcom/amazon/mp3/capability/Capabilities;->TAG:Ljava/lang/String;

    const-string v1, "Error fetching Feature gate provider"

    invoke-static {v0, v1}, Lcom/amazon/mp3/util/Log;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 227
    sget-object v0, Lcom/amazon/mp3/featuregate/Feature;->upsell_with_google_iab:Lcom/amazon/mp3/featuregate/Feature;

    invoke-interface {p0, v0}, Lcom/amazon/music/platform/providers/FeatureGateProvider;->isFeatureAvailable(Lcom/amazon/music/platform/featuregate/Feature;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public shouldUseDynamicMessagingForAdsSettingsOnDemandListeningUpsell()Z
    .locals 0

    .line 254
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->shouldUpsellWithGoogleInAppBilling()Z

    move-result p0

    if-nez p0, :cond_1

    sget-object p0, Lcom/amazon/mp3/featuregate/Feature;->use_dynamic_messaging_for_non_blocking_upsell:Lcom/amazon/mp3/featuregate/Feature;

    invoke-virtual {p0}, Lcom/amazon/mp3/featuregate/Feature;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public shouldUseDynamicMessagingForNpsNonBlockingUpsells()Z
    .locals 0

    .line 265
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->shouldUpsellWithGoogleInAppBilling()Z

    move-result p0

    if-nez p0, :cond_1

    sget-object p0, Lcom/amazon/mp3/featuregate/Feature;->use_dynamic_messaging_for_non_blocking_upsell:Lcom/amazon/mp3/featuregate/Feature;

    .line 266
    invoke-virtual {p0}, Lcom/amazon/mp3/featuregate/Feature;->isEnabled()Z

    move-result p0

    if-nez p0, :cond_1

    sget-object p0, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->RECALIBRATED_PRIME:Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;

    .line 267
    invoke-virtual {p0}, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->isEnabled()Z

    move-result p0

    if-nez p0, :cond_1

    sget-object p0, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->RECALIBRATED_PRIME_POST_GRACE_PERIOD:Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;

    .line 268
    invoke-virtual {p0}, Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public shouldUseGridView()Z
    .locals 1

    .line 145
    invoke-static {}, Lcom/amazon/mp3/globals/AppContext;->get()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f05001b

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p0

    return p0
.end method

.method public supportsLocalizedCollation()Z
    .locals 0

    .line 0
    const/4 p0, 0x1

    return p0
.end method

.method public supportsSecondaryLogin(Landroid/content/Context;)Z
    .locals 1

    const v0, 0x7f05000a

    .line 169
    invoke-virtual {p0, p1, v0}, Lcom/amazon/mp3/capability/Capabilities;->isFeatureEnabledLocally(Landroid/content/Context;I)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 170
    invoke-static {}, Lcom/amazon/mp3/util/AmazonDevice;->isGrover()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public useOldStyleCarouselBadging()Z
    .locals 0

    .line 156
    invoke-virtual {p0}, Lcom/amazon/mp3/capability/Capabilities;->shouldUseGridView()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method
