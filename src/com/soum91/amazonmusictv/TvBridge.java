package com.soum91.amazonmusictv;

import android.content.Context;
import android.media.*;
import android.os.Build;
import java.lang.reflect.Method;

/** TV adapter. Amazon's original authentication, entitlement and DRM remain in place. */
public final class TvBridge {
    private static volatile Object player;
    private static Context appContext;
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
    }
    public static String playbackStats() {
        Object p=player;
        if(p==null)return "Playback engine has not started. Sign in and play a track.";
        try {
            Object a=call(p,"getCurrentAudioAttributes");
            Object out=call(p,"getOutputDeviceAttributes");
            Object device=out==null?null:call(out,"getCurrentDevice");
            String s="Selected stream: "+(a==null?"waiting":call(a,"getAudioQuality"))
                +"\nSource: "+(a==null?"waiting":call(a,"getBitDepth")+"-bit / "+call(a,"getSampleRate")+" Hz")
                +"\nOutput: "+(device==null?"unknown":call(device,"getDisplayName"))
                +"\nEngine Atmos passthrough route: "+(device==null?"unknown":call(device,"getPassthroughAtmos"))
                +"\n24-bit enabled: "+call(p,"is24BitEnabled");
            return s;
        } catch(Exception e) { return "Playback details unavailable: "+e.getClass().getSimpleName(); }
    }
    public static String qualitySummary() {
        Object p=player;if(p==null)return "Waiting for playback";
        try {
            Object a=call(p,"getCurrentAudioAttributes");if(a==null)return "Waiting for stream";
            String quality=String.valueOf(call(a,"getAudioQuality"));
            Object out=call(p,"getOutputDeviceAttributes");Object dev=out==null?null:call(out,"getCurrentDevice");
            boolean passthrough=dev!=null&&Boolean.TRUE.equals(call(dev,"getPassthroughAtmos"));
            String res=call(a,"getBitDepth")+"-bit / "+call(a,"getSampleRate")+" Hz";
            if(quality.contains("DATMOS")||quality.equals("ATMOS"))return "Dolby Atmos · "+(passthrough?"passthrough route":"route not confirmed");
            if(quality.contains("UHD")||quality.contains("ULTRA")||((Number)call(a,"getBitDepth")).intValue()>16)return "Ultra HD · "+res;
            if(quality.contains("HD")||quality.contains("HI_FI"))return "HD · "+res;
            return quality+" · "+res;
        }catch(Exception e){return "Stream details unavailable";}
    }
    public static synchronized void recordDiagnostics(Context c) {
        if(player==null)return;
        String selection=qualitySummary()+"\n"+playbackStats();if(selection.equals(lastSelection))return;
        lastSelection=selection;
        android.util.Log.i("AmazonMusicTV.Audio",selection);
        android.content.SharedPreferences prefs=c.getSharedPreferences("amazon_music_tv",0);
        String previous=prefs.getString("audio_transitions","");
        String line=java.text.DateFormat.getTimeInstance().format(new java.util.Date())+"  "+qualitySummary()+"\n";
        String history=line+previous;if(history.length()>2200)history=history.substring(0,2200);
        prefs.edit().putString("audio_transitions",history).apply();
    }
    public static String diagnostics(Context c) {
        StringBuilder b=new StringBuilder("Amazon Music TV Plus\nAndroid ").append(Build.VERSION.RELEASE)
            .append(" / API ").append(Build.VERSION.SDK_INT).append("\nABI: ").append(android.text.TextUtils.join(", ",Build.SUPPORTED_ABIS))
            .append("\nDirect E-AC3/JOC support: ").append(directAtmosSupported()).append("\n\n").append(playbackStats());
        AudioManager am=(AudioManager)c.getSystemService(Context.AUDIO_SERVICE);
        for(AudioDeviceInfo d:am.getDevices(AudioManager.GET_DEVICES_OUTPUTS)) {
            b.append("\n\nAndroid output: ").append(d.getProductName()).append(" (type ").append(d.getType()).append(")")
                .append("\nSupported rates: ").append(java.util.Arrays.toString(d.getSampleRates()))
                .append("\nEncodings: ").append(java.util.Arrays.toString(d.getEncodings()));
        }
        if(!lastError.isEmpty())b.append("\n\nConfiguration: ").append(lastError);
        b.append("\n\nRecent stream changes:\n").append(c.getSharedPreferences("amazon_music_tv",0).getString("audio_transitions","No transitions recorded yet."));
        b.append("\n\nStream quality and reported route do not confirm the final HDMI signal. Check the soundbar's format display.");
        return b.toString();
    }
}
