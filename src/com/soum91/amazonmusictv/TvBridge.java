package com.soum91.amazonmusictv;

import android.content.Context;
import android.media.*;
import android.os.Build;
import java.lang.reflect.Method;

/** TV adapter. Amazon's original authentication, entitlement and DRM remain in place. */
public final class TvBridge {
    private static volatile Object player;
    private static volatile Context appContext;
    private static volatile String lastError = "";
    private static String lastSelection="";
    public static void attachPlayer(Object value) { player = value; }
    public static void finishSetup() { if(appContext!=null) configure(appContext); }
    public static boolean isTv(Context c) {
        return c.getPackageManager().hasSystemFeature("android.software.leanback");
    }
    public static boolean directAtmosSupported() {
        if (Build.VERSION.SDK_INT < 29) return false;
        try {
            AudioAttributes a = new AudioAttributes.Builder().setUsage(1).setContentType(2).build();
            for (int mask : new int[]{AudioFormat.CHANNEL_OUT_STEREO, AudioFormat.CHANNEL_OUT_5POINT1,
                    AudioFormat.CHANNEL_OUT_7POINT1_SURROUND}) {
                AudioFormat f = new AudioFormat.Builder().setEncoding(AudioFormat.ENCODING_E_AC3_JOC)
                    .setSampleRate(48000).setChannelMask(mask).build();
                if (AudioTrack.isDirectPlaybackSupported(f, a)) return true;
            }
        } catch (Exception e) { lastError = e.toString(); }
        return false;
    }
    public static boolean preferAtmos(Context c) {
        return c.getSharedPreferences("amazon_music_tv",0).getBoolean("atmos",true);
    }
    public static Object call(Object target, String method) throws Exception {
        Method m = target.getClass().getMethod(method); m.setAccessible(true); return m.invoke(target);
    }
    private static Object invoke(String cls, String method, Class<?>[] types, Object... args) throws Exception {
        return Class.forName(cls).getMethod(method,types).invoke(null,args);
    }
    private static void playerCall(String name, Class<?> type, Object value) throws Exception {
        Object p=player; if(p==null)return;
        Class.forName("com.amazon.digitalmusicplayback.Player").getMethod(name,type).invoke(p,value);
    }
    public static void configure(Context c) {
        appContext=c.getApplicationContext();
        try {
            boolean atmos=preferAtmos(c);
            invoke("com.amazon.mp3.activity.settings.SettingsUtil","setSpatialMode",
                new Class<?>[]{Context.class,boolean.class},c,atmos);
            for(String m:new String[]{"setMultiBitrateStreamingPreferenceForWifi","setMultiBitrateStreamingPreferenceForOTA"})
                invoke("com.amazon.mp3.activity.settings.SettingsUtil",m,new Class<?>[]{Context.class,String.class},c,"ALL");
            invoke("com.amazon.digitalmusicplayback.PlayerFactory","enablePassthroughAtmos",new Class<?>[]{boolean.class},true);
            // Keep the original Atmos bitstream instead of requesting a headphone renderer.
            invoke("com.amazon.digitalmusicplayback.PlayerFactory","enableSoftwareAtmos",new Class<?>[]{boolean.class},false);
            playerCall("setThreeDMode",boolean.class,atmos);
            playerCall("set24BitEnabled",boolean.class,true);
            Class<?> q=Class.forName("com.amazon.digitalmusicplayback.QualitySetting");
            Object best=q.getField("BESTAVAILABLE").get(null);
            playerCall("setWifiAudioQualitySetting",q,best);
            playerCall("setOTAAudioQualitySetting",q,best);
            lastError="";
        } catch(Exception e) { lastError=e.getClass().getSimpleName()+": "+e.getMessage(); }
        requestRefresh(c);
    }
    // The monitor hook only keeps weak references. It never changes the track or routing.
    private static volatile java.lang.ref.WeakReference<AudioTrack> observedTrack = new java.lang.ref.WeakReference<AudioTrack>(null);
    private static volatile java.lang.ref.WeakReference<Object> observedWatcher = new java.lang.ref.WeakReference<Object>(null);
    public static void observeOutputTrack(Object watcher, AudioTrack track) {
        if (watcher != null && observedWatcher.get() != watcher) observedWatcher = new java.lang.ref.WeakReference<Object>(watcher);
        if (track != null && observedTrack.get() != track) observedTrack = new java.lang.ref.WeakReference<AudioTrack>(track);
    }
    private static final java.util.concurrent.ExecutorService monitor = java.util.concurrent.Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "AmazonMusicTV.Audio"); t.setDaemon(true); return t;
    });
    private static final java.util.concurrent.atomic.AtomicBoolean refreshing = new java.util.concurrent.atomic.AtomicBoolean();
    private static volatile long lastRequest;
    private static long lastCapabilityRead;private static boolean lastDirectCapability;
    private static volatile Snapshot snapshot = new Snapshot("Waiting for playback", "Waiting for playback", "Start playback, then reopen Audio output.");
    private static final class Snapshot {
        final String summary, stats, details;
        Snapshot(String summary, String stats, String details) {this.summary=summary;this.stats=stats;this.details=details;}
    }
    public static void requestRefresh(Context context) {
        appContext=context.getApplicationContext();
        long now=android.os.SystemClock.elapsedRealtime();
        if(now-lastRequest<1500 || !refreshing.compareAndSet(false,true))return;
        lastRequest=now;
        monitor.execute(() -> {try{sample(appContext);}catch(Exception e){android.util.Log.w("AmazonMusicTV.Audio","Could not sample player diagnostics",e);}finally{refreshing.set(false);}});
    }
    public static String playbackStats() {return snapshot.stats;}
    public static String qualitySummary() {return snapshot.summary;}
    public static String diagnostics(Context c) {requestRefresh(c);return snapshot.details;}
    public static void recordDiagnostics(Context c) {requestRefresh(c);}
    private static String encodingName(int encoding) {
        switch(encoding) {
            case AudioFormat.ENCODING_E_AC3_JOC:return "DD+ JOC";
            case AudioFormat.ENCODING_E_AC3:return "DD+ (JOC metadata not measured)";
            case AudioFormat.ENCODING_AC3:return "Dolby Digital";
            case AudioFormat.ENCODING_PCM_16BIT:return "PCM 16-bit";
            case AudioFormat.ENCODING_PCM_FLOAT:return "PCM float";
            case AudioFormat.ENCODING_PCM_24BIT_PACKED:return "PCM 24-bit";
            case AudioFormat.ENCODING_PCM_32BIT:return "PCM 32-bit";
            case AudioFormat.ENCODING_IEC61937:return "IEC61937 (payload not measured)";
            default:return "encoding "+encoding;
        }
    }
    private static String field(Object object,String name) {
        if(object==null)return "unavailable";
        try{java.lang.reflect.Field f=object.getClass().getDeclaredField(name);f.setAccessible(true);return String.valueOf(f.get(object));}
        catch(Exception e){return "unavailable";}
    }
    private static String describeDevice(AudioDeviceInfo device) {
        return device==null?"not reported":device.getProductName()+" (type "+device.getType()+", id "+device.getId()+")";
    }
    private static void sample(Context c) throws Exception {
        Object p=player;
        String quality="waiting",resolution="unavailable",legacy="not reported",sourceSummary="Waiting for playback";
        if(p!=null) {
            Object a=call(p,"getCurrentAudioAttributes");
            if(a!=null) {
                quality=String.valueOf(call(a,"getAudioQuality"));
                resolution=call(a,"getBitDepth")+"-bit / "+call(a,"getSampleRate")+" Hz";
                if(quality.contains("JOC")||quality.contains("DATMOS")||quality.equals("ATMOS"))sourceSummary="Atmos source";
                else if(quality.contains("UHD")||((Number)call(a,"getBitDepth")).intValue()>16)sourceSummary="Ultra HD source · "+resolution;
                else if(quality.startsWith("HD"))sourceSummary="HD source · "+resolution;
                else sourceSummary=quality+" · "+resolution;
            }
            try{Object out=call(p,"getOutputDeviceAttributes");Object dev=out==null?null:call(out,"getCurrentDevice");if(dev!=null)legacy=call(dev,"getDisplayName")+", passthrough flag="+call(dev,"getPassthroughAtmos");}catch(Exception ignored){}
        }
        AudioTrack track=observedTrack.get();
        String output="not observed",trackDetails="No AudioTrack has been observed yet. Stop and restart the track after this update.";
        if(track!=null)try {
            if(track.getState()==AudioTrack.STATE_INITIALIZED) {
                output=encodingName(track.getFormat().getEncoding());
                String state=track.getPlayState()==AudioTrack.PLAYSTATE_PLAYING?"playing":track.getPlayState()==AudioTrack.PLAYSTATE_PAUSED?"paused":"stopped";
                trackDetails="AudioTrack: "+output+"\nTrack format: "+track.getSampleRate()+" Hz / "+track.getChannelCount()+" channels\nTrack state: "+state+"\nRouted device: "+describeDevice(track.getRoutedDevice())+"\nOffloaded: "+track.isOffloadedPlayback()+"\nUnderruns: "+track.getUnderrunCount();
            } else {output="released";trackDetails="The observed AudioTrack has been released. Start another track.";}
        } catch(IllegalStateException e){output="unavailable";trackDetails="AudioTrack changed during sampling. Waiting for the next update.";}
        String summary=sourceSummary+" · Output: "+output;
        String stats="Selected stream: "+quality+"\nReported source resolution: "+resolution+"\n"+trackDetails+"\nLegacy engine output: "+legacy;
        Object watcher=observedWatcher.get();
        long now=android.os.SystemClock.elapsedRealtime();if(lastCapabilityRead==0||now-lastCapabilityRead>15000){lastDirectCapability=directAtmosSupported();lastCapabilityRead=now;}
        StringBuilder details=new StringBuilder("Amazon Music TV Plus\nAndroid ").append(Build.VERSION.RELEASE).append(" / API ").append(Build.VERSION.SDK_INT)
            .append("\n\n").append(stats)
            .append("\n\nDirect E-AC3/JOC capability: ").append(lastDirectCapability)
            .append("\nEngine DD+ Atmos compatibility: ").append(field(watcher,"mBasicDDPSupportsAtmos"))
            .append("\nEngine HDMI Atmos fallback: ").append(field(watcher,"mHDMISinkSecretlySupportsAtmos"))
            .append("\nEngine rejected formats: ").append(field(watcher,"mIgnoredSampleFormats"));
        AudioManager audio=(AudioManager)c.getSystemService(Context.AUDIO_SERVICE);
        for(AudioDeviceInfo d:audio.getDevices(AudioManager.GET_DEVICES_OUTPUTS))details.append("\n\nAvailable device: ").append(describeDevice(d)).append("\nEncodings: ").append(java.util.Arrays.toString(d.getEncodings())).append("\nRates: ").append(java.util.Arrays.toString(d.getSampleRates()));
        details.append("\n\nAudioTrack describes what the player handed Android. It does not measure the final HDMI bitstream. A DD+ track can still carry JOC metadata. PCM means the observed AudioTrack is decoded audio, not an E-AC3/JOC bitstream.");
        if(!lastError.isEmpty())details.append("\n\nConfiguration: ").append(lastError);
        String selection=summary+"\n"+stats;
        // Buffer counters can change each sample; record only source, encoding and route changes.
        String stable=selection.replaceAll("Underruns: [0-9]+", "Underruns: (counter)");
        android.content.SharedPreferences prefs=c.getSharedPreferences("amazon_music_tv",0);
        if(!stable.equals(lastSelection)) {
            lastSelection=stable;android.util.Log.i("AmazonMusicTV.Audio",selection);
            String previous=prefs.getString("audio_transitions","");
            String history=java.text.DateFormat.getTimeInstance().format(new java.util.Date())+"  "+summary+"\n"+trackDetails+"\n\n"+previous;
            if(history.length()>5000)history=history.substring(0,5000);
            prefs.edit().putString("audio_transitions",history).apply();
        }
        details.append("\n\nRecent stream / output changes:\n").append(prefs.getString("audio_transitions","None recorded yet."));
        snapshot=new Snapshot(summary,stats,details.toString());
    }
}
