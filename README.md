# Amazon Music TV Plus

Private Google TV adaptation for a Sony A80L / Vizio Elevate setup. Uses the supplied newer Amazon Music 26.36.1 playback engine and native browsing/player resources ported from Amazon Music TV 3.4.1294.0.

## Build 5

- Hold OK on a card, navigation item or playback control to focus the mini-player immediately. Menu/Info also jumps there. Up or Back restores the previous content focus without scrolling through the library.
- Adds Screen off to the fixed mini-player, full-screen player, media notification and floating dock. Hold OK on the mini-player's Screen off button to configure its mode.
- OLED black mode needs no setup: it displays black pixels, dims the activity and keeps the TV awake while the original music service continues. OK, Back or another navigation key restores the picture; media and volume keys continue controlling audio. This is a black display surface, not a hardware standby command.
- Optional Sony Picture off uses the TV's localhost system API and its existing IP-control key if required. It requests pictureOff, restores the prior power-saving mode on return, rejects redirects, and falls back to OLED black mode if unavailable. Consumer firmware support must be tested on the A80L. Keys stay in private app preferences and are never included in logs or Git.
- Holds a partial CPU wake lock and an active Wi-Fi streaming lock while playback is playing, buffering or connecting. The CPU lock expires after two minutes unless renewed; locks are released on pause, stop, connection loss and service destruction. The setting can be disabled.
- Records screen-on/off events, playback-state changes and read-only engine/frame-counter samples under Audio output for a standby test. These samples do not prove that HDMI audio continued for the full standby interval.

The remote's Power button remains controlled by Sony/Android. The app does not intercept it or send forced resume commands after audio-focus loss. Actual TV standby can stop HDMI/eARC or turn off the soundbar despite a playback wake lock. Use the display-only Screen off action when standby interrupts audio.

Build 4 is the user-confirmed Atmos baseline with Timbre left running. Builds made from the verified build 4 APK preserve all 17 existing playback dex files and all native libraries byte-for-byte; build 5 only rebuilds the custom UI/services dex and adds localhost-only display control configuration.

### Device checks for build 5

1. Scroll several rows into Home/Library, hold OK to reach the mini-player, then press Up or Back to return to the same card.
2. Select Screen off while music plays. Check soundbar format and playback for several minutes, then press OK or Back to restore the UI.
3. If desired, configure Sony Picture off under Settings and enter the TV's existing local-control key. Check the panel-off result separately from OLED black mode.
4. Test the remote's Power button while playing. After waking the TV, open Audio output and inspect Screen / standby history and frame/position samples. Continued audio during actual standby remains unverified until this test.

## Build 4

- Adds a read-only observer to the original routing monitor. It captures a weak reference to the AudioTrack the original player passes into that monitor; the hook does not change routing, decoding, bytes, volume or passthrough configuration.
- Shows the actual observed AudioTrack encoding, sample rate, channel count, state, routed device, offload flag and underruns. DD+ JOC source selection is labeled as an Atmos source, separately from output. DD+ encoding alone cannot tell whether its payload retains JOC metadata; AudioTrack reporting does not measure the final HDMI bitstream.
- Moves repeated engine and device reads to a single background worker. UI refreshes use cached snapshots, and direct-capability queries are limited to once per 15 seconds in the diagnostic monitor.
- Updates PiP controls and media-session routing only when state changes, caches resource IDs, skips unchanged text updates, coalesces simultaneous artwork loads and inflates Home shelf cards in small frame batches.
- Hides the floating dock while the TV activity is visible, restoring it when the activity leaves the foreground if docking remains enabled.

Atmos loss on the soundbar has not yet been traced to a specific cause. This build does not claim to fix that output problem. The Audio page now distinguishes selected source from the observed player-to-Android output so the next device test can locate the failure.

### Existing capabilities

- Ports eight original TV layouts and their 133 resource dependencies: artwork shelves, album cards, track rows, full-screen player, progress bar, focus selectors, icons and TV fonts.
- Replaces the old TV app's custom view classes with platform widgets, bound to the newer playback service. The TV browsing/player UI does not use a WebView. Amazon's existing account screen remains the sign-in entry.
- Retains the previously tested playback path, Atmos preference and best-available lossless fallback. Amazon authentication, entitlement checks and DRM are unchanged.
- Displays the **selected** stream quality and the engine's reported output device, with a timestamped transition history. This does not measure the final HDMI signal or establish that Amazon rejected a device.
- Adds system PiP, including playback actions, when the firmware advertises support. Automatic PiP is optional.
- Adds an optional non-focusable floating mini-player over Home or other apps. Android's display-over-other-apps permission must be granted by the user. Home retains D-pad focus; remote media keys control playback. Reopen the app or use the media notification for controls. Settings includes Hide dock and Move dock actions for D-pad remotes.
- Publishes a foreground MediaStyle notification using the original active media-session token. The system can expose playback controls on supported Home, lock and notification surfaces; their placement is controlled by the TV firmware/launcher.
- Adds an optional artwork DreamService, selectable in the system screensaver settings. It is an ambient music display, not a replacement for device security.

The Sony's firmware determines whether PiP, overlay permission settings, a lockscreen media surface and screensaver selection are available. Unsupported surfaces are not forced on.

## Install and verify

Install build 5 over builds 1 through 4. Package ID remains `com.amazon.mp3`; version code is `526360115`. The private signing certificate is unchanged.

1. Sign in if needed, return to the TV UI, and select Home or Library.
2. Play a known Atmos track. Open Audio and compare the selected stream/engine route with the soundbar's format indication.
3. Play a non-Atmos UHD track and check the selected source resolution. Source resolution does not prove bit-perfect HDMI output.
4. While playing, try PiP if shown, or select Dock and grant the system overlay permission. Check playback after returning Home.
5. Optionally select Amazon Music artwork in the system screensaver settings.

Search currently sends a search-to-play request to Amazon; it does not yet render a full search-results catalog. Layouts and services have build-time validation; the final UI, docking behavior, account flow and sustained HDMI output still need device testing.

## Build locally

Requirements: Java 17+, Python 3.11+, the two user-supplied source packages, and the existing private signing directory.

```sh
python3 tools/bootstrap.py
python3 tools/check_source.py
python3 build.py /path/to/mobile-26.36.1.apkm \
  --tv-apk /path/to/Amazon-Music_3.4.1294.0_apkcube.apk \
  --tools build-tools --signing-dir /private/path/signing --build-number 5
```

`docs/source-inputs.json` records the exact source hashes. `docs/tv-resource-provenance.json` lists the original resources used. `port_tv_resources.py` extracts and namespaces those resources during a build; generated fonts, images and XML do not have to be committed separately.

`tools/bootstrap.py` verifies all build-tool hashes against `toolchain.json`. The CI workflow validates integration declarations and compiles the native Java UI/services. A complete APK build additionally requires the original source packages and signing key; these are deliberately excluded from Git.

Keep `signing/amazon-music-tv.jks` and `signing/credentials.json` private and reuse them for every update. They are preserved in the existing private build backup. Never commit them or put credentials in a workflow file. Increment the build number for subsequent installs.


## Update from a verified signed build

For the same UI and read-only monitor changes, the verified signed build 4 APK can supply the already ported resources and original playback components:

```sh
python3 update_build.py /path/to/Amazon-Music-TV-26.36.1-tv.4-arm32.apk \
  --tools build-tools --signing-dir /private/path/signing --build-number 5
```

The script verifies the exact base hash, recompiles classes18.dex, increments the version, and signs with the existing private key. A build 4 base preserves classes15.dex and the other existing dex files unchanged; the older build 3 input remains supported and receives the existing single observer call. The two original primary-dex patches remain unchanged. A complete build from the two original source packages also applies patches15/ through build.py.

## Release distribution

Publish signed APK builds through GitHub Releases in this private repository. Attach the versioned APK and its SHA-256 checksum, and provide a copyable browser release/download URL as the primary distribution link. Reuse the existing package ID and private signing key, and increment the version code for install-over updates. Keep signing keys and credentials out of Git and release assets. Verify the published release and its APK asset before reporting publication as complete.

