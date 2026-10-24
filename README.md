# Amazon Music TV Plus

Private Google TV adaptation for a Sony A80L / Vizio Elevate setup. Uses the supplied newer Amazon Music 26.36.1 playback engine and native browsing/player resources ported from Amazon Music TV 3.4.1294.0.

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

Install build 4 over builds 1, 2 or 3. Package ID remains `com.amazon.mp3`; version code is `526360114`. The private signing certificate is unchanged.

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
  --tools build-tools --signing-dir /private/path/signing --build-number 4
```

`docs/source-inputs.json` records the exact source hashes. `docs/tv-resource-provenance.json` lists the original resources used. `port_tv_resources.py` extracts and namespaces those resources during a build; generated fonts, images and XML do not have to be committed separately.

`tools/bootstrap.py` verifies all build-tool hashes against `toolchain.json`. The CI workflow validates integration declarations and compiles the native Java UI/services. A complete APK build additionally requires the original source packages and signing key; these are deliberately excluded from Git.

Keep `signing/amazon-music-tv.jks` and `signing/credentials.json` private and reuse them for every update. They are preserved in the existing private build backup. Never commit them or put credentials in a workflow file. Increment the build number for subsequent installs.


## Update from verified build 3

For the same UI and read-only monitor changes, the verified signed build 3 APK can supply the already ported resources and original playback components:

```sh
python3 update_build.py /path/to/Amazon-Music-TV-26.36.1-tv.3-arm32.apk \
  --tools build-tools --signing-dir /private/path/signing --build-number 4
```

The script verifies the exact build 3 hash, recompiles classes18.dex, inserts the single observer call into the original classes15.dex routing monitor, increments the version, and signs with the existing private key. The two original primary-dex patches remain unchanged. A complete build from the two original source packages also applies patches15/ through build.py.
