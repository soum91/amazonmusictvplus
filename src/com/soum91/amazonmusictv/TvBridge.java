package com.soum91.amazonmusictv;

import android.content.Context;
import android.media.*;
import android.os.Build;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/** TV adapter. Amazon's original authentication, entitlement and DRM remain in place. */
public final class TvBridge {
    private static volatile Object player;
    private static volatile Context appContext;
    private static volatile String lastError = "";
    private static String lastSelection="";
    private static String lastSong="";
    public static void noteSong(Context c,String id,String title){
        String key=id+"|"+title;if(key.equals(lastSong))return;lastSong=key;
        final Context app=c.getApplicationContext();monitor.execute(()->{try{sample(app);android.content.SharedPreferences prefs=app.getSharedPreferences("amazon_music_tv",0);String history=java.text.DateFormat.getTimeInstance().format(new java.util.Date())+"  "+title+"\n"+snapshot.stats+"\n\n"+prefs.getString("song_audio_history","");prefs.edit().putString("song_audio_history",history.length()>7000?history.substring(0,7000):history).apply();}catch(Exception ignored){}});
    }
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
    public static boolean levelerEnabled(Context c) {return c.getSharedPreferences("amazon_music_tv",0).getBoolean("volume_leveler",true);}
    public static int levelerTrimDb(Context c) {return c.getSharedPreferences("amazon_music_tv",0).getInt("stereo_trim_db",6);}
    public static boolean autoLevelerEnabled(Context c) {return c.getSharedPreferences("amazon_music_tv",0).getBoolean("auto_leveler",true);}
    public static int levelerTargetDb(Context c) {return c.getSharedPreferences("amazon_music_tv",0).getInt("leveler_target_db",-18);}
    public static String levelerShort(Context c) {if(!levelerEnabled(c))return "Leveler: Off";if(autoLevelerEnabled(c))return "Auto leveler: "+(autoGainDb>=0?"+":"")+String.format(java.util.Locale.ROOT,"%.1f",autoGainDb)+" dB";return "Leveler: -"+levelerTrimDb(c)+" dB PCM";}
    public static void applyLeveler(Context c) {
        appContext=c.getApplicationContext();AudioTrack track=observedTrack.get();if(track==null)return;
        try{
            int encoding=track.getFormat().getEncoding();boolean passthrough=encoding==AudioFormat.ENCODING_E_AC3_JOC||encoding==AudioFormat.ENCODING_E_AC3||encoding==AudioFormat.ENCODING_AC3||encoding==AudioFormat.ENCODING_IEC61937||encoding==AudioFormat.ENCODING_MPEGH_BL_L3||encoding==AudioFormat.ENCODING_MPEGH_BL_L4||encoding==AudioFormat.ENCODING_MPEGH_LC_L3||encoding==AudioFormat.ENCODING_MPEGH_LC_L4;
            boolean auto=levelerEnabled(c)&&autoLevelerEnabled(c);float gain=!levelerEnabled(c)||passthrough||auto?1f:(float)Math.pow(10d,-levelerTrimDb(c)/20d);track.setVolume(gain);lastLeveler=passthrough?"Passthrough unchanged":!levelerEnabled(c)?"Off":auto?autoStatus:"Stereo/PCM -"+levelerTrimDb(c)+" dB";
        }catch(Exception e){lastLeveler="Unavailable: "+e.getClass().getSimpleName();}
    }
    private static final Object levelerLock=new Object();private static volatile AudioTrack autoTrack;private static volatile double autoInputDb=-60,autoGainDb;private static volatile String autoStatus="Automatic · waiting for PCM";
    public static void processPcm(ByteBuffer source,int byteCount,AudioTrack track) {
        Context c=appContext;if(c==null||source==null||track==null||!levelerEnabled(c)||!autoLevelerEnabled(c))return;
        int encoding;try{encoding=track.getFormat().getEncoding();}catch(Exception e){return;}
        if(encoding!=AudioFormat.ENCODING_PCM_16BIT&&encoding!=AudioFormat.ENCODING_PCM_FLOAT&&encoding!=AudioFormat.ENCODING_PCM_24BIT_PACKED&&encoding!=AudioFormat.ENCODING_PCM_32BIT)return;
        synchronized(levelerLock){try{
            ByteBuffer b=source.duplicate().order(ByteOrder.LITTLE_ENDIAN);int start=b.position(),end=Math.min(b.limit(),start+Math.max(0,byteCount));int bytes=encoding==AudioFormat.ENCODING_PCM_16BIT?2:encoding==AudioFormat.ENCODING_PCM_24BIT_PACKED?3:4,samples=(end-start)/bytes;if(samples<8)return;
            int stride=Math.max(1,samples/4096);double sum=0,peak=0;int count=0;
            for(int n=0;n<samples;n+=stride){int at=start+n*bytes;double v=sample(b,at,encoding);sum+=v*v;peak=Math.max(peak,Math.abs(v));count++;}
            double rms=Math.sqrt(sum/Math.max(1,count));if(rms<0.001){autoStatus="Automatic · silence · gain "+signed(autoGainDb)+" dB";lastLeveler=autoStatus;return;}
            double measured=20d*Math.log10(rms);if(autoTrack!=track){autoTrack=track;autoInputDb=measured;autoGainDb=0;}else autoInputDb=autoInputDb*0.96d+measured*0.04d;
            double desired=clamp(levelerTargetDb(c)-autoInputDb,-12d,6d),headroom=peak<=0?6d:20d*Math.log10(0.98d/peak);desired=Math.min(desired,headroom);double rate=desired<autoGainDb?0.12d:0.025d;autoGainDb+=clamp(desired-autoGainDb,-2d,2d)*rate;autoGainDb=Math.min(autoGainDb,headroom);double gain=Math.pow(10d,autoGainDb/20d);
            if(Math.abs(gain-1d)>0.002d)for(int n=0;n<samples;n++){int at=start+n*bytes;writeSample(b,at,encoding,sample(b,at,encoding)*gain);}
            autoStatus="Automatic · input "+String.format(java.util.Locale.ROOT,"%.1f",autoInputDb)+" dBFS · target "+levelerTargetDb(c)+" dBFS · gain "+signed(autoGainDb)+" dB";lastLeveler=autoStatus;
        }catch(java.nio.ReadOnlyBufferException e){autoStatus="Automatic analysis only · PCM buffer is read-only";lastLeveler=autoStatus;}catch(Exception e){autoStatus="Automatic unavailable: "+e.getClass().getSimpleName();lastLeveler=autoStatus;}}
    }
    private static double sample(ByteBuffer b,int at,int encoding){if(encoding==AudioFormat.ENCODING_PCM_16BIT)return b.getShort(at)/32768d;if(encoding==AudioFormat.ENCODING_PCM_FLOAT)return b.getFloat(at);if(encoding==AudioFormat.ENCODING_PCM_24BIT_PACKED){int v=(b.get(at)&255)|((b.get(at+1)&255)<<8)|(b.get(at+2)<<16);return v/8388608d;}return b.getInt(at)/2147483648d;}
    private static void writeSample(ByteBuffer b,int at,int encoding,double value){value=clamp(value,-1d,0.999999d);if(encoding==AudioFormat.ENCODING_PCM_16BIT){b.putShort(at,(short)Math.round(value*32767d));return;}if(encoding==AudioFormat.ENCODING_PCM_FLOAT){b.putFloat(at,(float)value);return;}if(encoding==AudioFormat.ENCODING_PCM_24BIT_PACKED){int v=(int)Math.round(value*8388607d);b.put(at,(byte)v);b.put(at+1,(byte)(v>>8));b.put(at+2,(byte)(v>>16));return;}b.putInt(at,(int)Math.round(value*2147483647d));}
    private static double clamp(double value,double low,double high){return Math.max(low,Math.min(high,value));}
    private static String signed(double value){return (value>=0?"+":"")+String.format(java.util.Locale.ROOT,"%.1f",value);}
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
    private static volatile String lastLeveler="Waiting for playback";
    public static void observeOutputTrack(Object watcher, AudioTrack track) {
        if (watcher != null && observedWatcher.get() != watcher) observedWatcher = new java.lang.ref.WeakReference<Object>(watcher);
        if (track != null && observedTrack.get() != track) {observedTrack = new java.lang.ref.WeakReference<AudioTrack>(track);Context c=appContext;if(c!=null)applyLeveler(c);}
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
    public static String diagnostics(Context c) {requestRefresh(c);return snapshot.details+"\n\nScreen / standby history:\n"+c.getSharedPreferences("amazon_music_tv",0).getString("power_history","No screen events recorded yet.")+"\n\nFrame/position samples:\n"+c.getSharedPreferences("amazon_music_tv",0).getString("power_samples","None yet.")+"\nThese samples do not prove HDMI audio continued throughout standby.";}
    public static void recordDiagnostics(Context c) {requestRefresh(c);}
    public static void notePowerEvent(Context c,String event){
        Context app=c.getApplicationContext();monitor.execute(()->{
            StringBuilder line=new StringBuilder(java.text.DateFormat.getTimeInstance().format(new java.util.Date())).append(" · ").append(event);
            try{Object p=player;if(p!=null)line.append("\nEngine time (raw): ").append(call(p,"getCurrentTime"));AudioTrack track=observedTrack.get();if(track!=null&&track.getState()==AudioTrack.STATE_INITIALIZED)line.append("\nSession: ").append(track.getAudioSessionId()).append(" · frame counter: ").append(Integer.toUnsignedLong(track.getPlaybackHeadPosition())).append(" · state: ").append(track.getPlayState()).append(" · ").append(encodingName(track.getFormat().getEncoding())).append("\nRoute: ").append(describeDevice(track.getRoutedDevice()));}catch(Exception e){line.append("\nOutput changed during sampling.");}
            android.content.SharedPreferences prefs=app.getSharedPreferences("amazon_music_tv",0);String history=line+"\n\n"+prefs.getString("power_samples","");if(history.length()>4500)history=history.substring(0,4500);prefs.edit().putString("power_samples",history).apply();
        });
    }
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
            case AudioFormat.ENCODING_MPEGH_BL_L3:case AudioFormat.ENCODING_MPEGH_BL_L4:case AudioFormat.ENCODING_MPEGH_LC_L3:case AudioFormat.ENCODING_MPEGH_LC_L4:return "MPEG-H 3D Audio";
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
                else if(quality.contains("360")||quality.contains("MPEGH")||quality.contains("MPEG_H"))sourceSummary="360 Reality Audio / MPEG-H source";
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
        applyLeveler(c);String summary=sourceSummary+" · Output: "+output;
        String stats="Selected stream: "+quality+"\nReported source resolution: "+resolution+"\n"+trackDetails+"\nLegacy engine output: "+legacy;
        Object watcher=observedWatcher.get();
        long now=android.os.SystemClock.elapsedRealtime();if(lastCapabilityRead==0||now-lastCapabilityRead>15000){lastDirectCapability=directAtmosSupported();lastCapabilityRead=now;}
        StringBuilder details=new StringBuilder("Amazon Music TV Plus\nAndroid ").append(Build.VERSION.RELEASE).append(" / API ").append(Build.VERSION.SDK_INT)
            .append("\n\n").append(stats)
            .append("\n\nDirect E-AC3/JOC capability: ").append(lastDirectCapability)
            .append("\nEngine DD+ Atmos compatibility: ").append(field(watcher,"mBasicDDPSupportsAtmos"))
            .append("\nEngine HDMI Atmos fallback: ").append(field(watcher,"mHDMISinkSecretlySupportsAtmos"))
            .append("\nVolume leveler: ").append(lastLeveler)
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
        details.append("\n\nSong-start output snapshots:\n").append(prefs.getString("song_audio_history","None yet."));
        details.append("\n\nVizio Elevate: the green Atmos indicator fades after 5 seconds. It is not a per-song guarantee. Use the soundbar's SETUP > Info > OK to hear the current input and audio type. A continuous stream need not renegotiate on each song.");
        snapshot=new Snapshot(summary,stats,details.toString());
    }
    public static String sony360(Context c){
        boolean output=false;AudioManager audio=(AudioManager)c.getSystemService(Context.AUDIO_SERVICE);
        for(AudioDeviceInfo device:audio.getDevices(AudioManager.GET_DEVICES_OUTPUTS))for(int e:device.getEncodings())if(e==AudioFormat.ENCODING_MPEGH_BL_L3||e==AudioFormat.ENCODING_MPEGH_BL_L4||e==AudioFormat.ENCODING_MPEGH_LC_L3||e==AudioFormat.ENCODING_MPEGH_LC_L4)output=true;
        return "Sony 360 Reality Audio uses MPEG-H 3D Audio. Android advertises an MPEG-H output: "+output+".\nA source badge does not prove HDMI passthrough. This app does not force MPEG-H or convert Sony 360 into Atmos. End-to-end 360 support on this TV and soundbar has not been established.";
    }
}



