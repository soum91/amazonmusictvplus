package com.soum91.amazonmusictv;

import android.content.*;
import android.media.session.*;
import android.net.*;
import android.net.wifi.WifiManager;
import android.os.*;

/** Keeps active background playback runnable; does not intercept the TV's Power key. */
final class TvPowerMonitor {
 private final Context context;private final PowerManager.WakeLock cpu;private final WifiManager.WifiLock wifi;
 private long renewed;private int lastState=-1;private boolean closed;
 private final BroadcastReceiver receiver=new BroadcastReceiver(){public void onReceive(Context c,Intent intent){String action=intent.getAction();event(context,Intent.ACTION_SCREEN_OFF.equals(action)?"SCREEN_OFF observed":Intent.ACTION_SCREEN_ON.equals(action)?"SCREEN_ON observed":"User present");}};
 TvPowerMonitor(Context context){
  this.context=context;cpu=((PowerManager)context.getSystemService(Context.POWER_SERVICE)).newWakeLock(PowerManager.PARTIAL_WAKE_LOCK,"AmazonMusicTV:Playback");cpu.setReferenceCounted(false);
  WifiManager manager=(WifiManager)context.getApplicationContext().getSystemService(Context.WIFI_SERVICE);wifi=manager==null?null:manager.createWifiLock(WifiManager.WIFI_MODE_FULL_HIGH_PERF,"AmazonMusicTV:Streaming");if(wifi!=null)wifi.setReferenceCounted(false);
  IntentFilter filter=new IntentFilter();filter.addAction(Intent.ACTION_SCREEN_OFF);filter.addAction(Intent.ACTION_SCREEN_ON);filter.addAction(Intent.ACTION_USER_PRESENT);
  if(Build.VERSION.SDK_INT>=33)context.registerReceiver(receiver,filter,Context.RECEIVER_NOT_EXPORTED);else context.registerReceiver(receiver,filter);
 }
 void update(PlaybackState state){
  if(closed)return;int value=state==null?PlaybackState.STATE_NONE:state.getState();
  if(value!=lastState){lastState=value;event(context,"Playback state="+value+", position="+(state==null?0:state.getPosition())+" ms");}
  boolean enabled=context.getSharedPreferences("amazon_music_tv",0).getBoolean("keep_playback_awake",true);
  boolean active=value==PlaybackState.STATE_PLAYING||value==PlaybackState.STATE_BUFFERING||value==PlaybackState.STATE_CONNECTING;
  if(!enabled||!active){release();return;}
  long now=SystemClock.elapsedRealtime();if(cpu.isHeld()&&now-renewed<60000)return;
  try{
   cpu.acquire(120000);renewed=now;
   ConnectivityManager cm=(ConnectivityManager)context.getSystemService(Context.CONNECTIVITY_SERVICE);NetworkCapabilities caps=cm.getNetworkCapabilities(cm.getActiveNetwork());boolean wireless=caps!=null&&caps.hasTransport(NetworkCapabilities.TRANSPORT_WIFI);
   if(wifi!=null){if(wireless&&!wifi.isHeld())wifi.acquire();else if(!wireless&&wifi.isHeld())wifi.release();}
  }catch(RuntimeException e){android.util.Log.w("AmazonMusicTV.Power","Playback wake lock unavailable",e);}
 }
 private void release(){if(cpu.isHeld())cpu.release();if(wifi!=null&&wifi.isHeld())wifi.release();renewed=0;}
 void close(){closed=true;try{context.unregisterReceiver(receiver);}catch(IllegalArgumentException ignored){}release();}
 static void event(Context c,String message){
  android.content.SharedPreferences prefs=c.getSharedPreferences("amazon_music_tv",0);String time=java.text.DateFormat.getTimeInstance().format(new java.util.Date());
  String line=time+" · elapsed "+SystemClock.elapsedRealtime()+" ms · "+message+"\n"+TvBridge.qualitySummary()+"\n";
  String history=line+prefs.getString("power_history","");if(history.length()>4500)history=history.substring(0,4500);
  prefs.edit().putString("power_history",history).apply();android.util.Log.i("AmazonMusicTV.Power",message);
  TvBridge.notePowerEvent(c,message);
 }
}
