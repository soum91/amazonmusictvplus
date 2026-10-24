package com.soum91.amazonmusictv;

import android.app.*;
import android.content.*;
import android.os.*;
import android.text.InputType;
import android.widget.*;
import java.io.*;
import java.net.*;
import java.lang.ref.WeakReference;
import java.util.concurrent.*;
import org.json.*;

/** Display-only controls. Never sends a TV power/standby command. */
public final class TvDisplay {
 private static final ExecutorService io=Executors.newSingleThreadExecutor();
 private static final Handler main=new Handler(Looper.getMainLooper());
 private static SharedPreferences prefs(Context c){return c.getSharedPreferences("amazon_music_tv",0);}
 public static String modeName(Context c){return "sony".equals(prefs(c).getString("display_mode","black"))?"Sony Picture off":"OLED black screen";}
 public static Session off(TvActivity activity){
  TvPlaybackService.start(activity,TvPlaybackService.PLAYBACK);
  boolean sony="sony".equals(prefs(activity).getString("display_mode","black"));
  Session session=new Session(activity,prefs(activity).getString("sony_display_psk",""));
  activity.enterBlackScreen(sony?"Trying Sony Picture off. Press OK or Back to restore.":"OLED black screen. TV stays awake; music continues. Press OK or Back to restore.");
  if(sony)io.execute(()->{
   try{
    JSONObject current=rpc("getPowerSavingMode",new JSONArray(),session.key);
    String previous=current.getJSONArray("result").getJSONObject(0).getString("mode");
    if(!previous.equals("pictureOff"))session.previous=previous;
    if(session.cancelled)return;
    rpc("setPowerSavingMode",new JSONArray().put(new JSONObject().put("mode","pictureOff")),session.key);
    session.applied=true;
    if(session.cancelled){session.restoreOnWorker();return;}
    main.post(()->{TvActivity a=session.activity.get();if(a!=null&&!a.isDestroyed()&&a.isScreenBlack())a.screenOffHint("Sony Picture off accepted. Press OK or Back to restore.");});
   }catch(Exception e){
    main.post(()->{TvActivity a=session.activity.get();if(a!=null&&!a.isDestroyed()&&a.isScreenBlack())a.screenOffHint("Sony panel control is unavailable. OLED black screen is active. Configure Picture off in Settings; OK or Back restores the picture.");});
   }
  });
  return session;
 }
 public static final class Session {
  final WeakReference<TvActivity> activity;final String key;volatile boolean cancelled,applied;String previous="off";
  Session(TvActivity activity,String key){this.activity=new WeakReference<TvActivity>(activity);this.key=key;}
  public void restore(){cancelled=true;io.execute(()->restoreOnWorker());}
  private void restoreOnWorker(){if(!applied)return;try{rpc("setPowerSavingMode",new JSONArray().put(new JSONObject().put("mode",previous)),key);applied=false;}catch(Exception ignored){}}
 }
 private static JSONObject rpc(String method,JSONArray params,String key)throws Exception{
  HttpURLConnection connection=(HttpURLConnection)new URL("http://127.0.0.1/sony/system").openConnection();
  connection.setConnectTimeout(1800);connection.setReadTimeout(2200);connection.setInstanceFollowRedirects(false);connection.setRequestMethod("POST");connection.setDoOutput(true);connection.setRequestProperty("Content-Type","application/json; charset=utf-8");
  if(!key.isEmpty())connection.setRequestProperty("X-Auth-PSK",key);
  try{
   byte[] body=new JSONObject().put("method",method).put("params",params).put("id",52).put("version","1.0").toString().getBytes("UTF-8");
   connection.setFixedLengthStreamingMode(body.length);try(OutputStream out=connection.getOutputStream()){out.write(body);}
   if(connection.getResponseCode()!=200)throw new IOException("Sony local control unavailable");
   ByteArrayOutputStream bytes=new ByteArrayOutputStream();try(InputStream in=connection.getInputStream()){byte[] buffer=new byte[1024];int count;while((count=in.read(buffer))!=-1){if(bytes.size()+count>16384)throw new IOException("Unexpected Sony response size");bytes.write(buffer,0,count);}}
   JSONObject response=new JSONObject(bytes.toString("UTF-8"));if(response.has("error")||!response.has("result"))throw new IOException("Sony rejected the display command");return response;
  }finally{connection.disconnect();}
 }
 public static void settings(Activity activity){
  new AlertDialog.Builder(activity).setTitle("Screen off, keep music")
   .setItems(new String[]{"Choose mode: "+modeName(activity),"Set Sony local-control key","About Power / standby"},(d,which)->{
    if(which==0)new AlertDialog.Builder(activity).setTitle("Screen-off mode").setSingleChoiceItems(new String[]{"OLED black screen - no setup","Sony Picture off - local TV API"},"sony".equals(prefs(activity).getString("display_mode","black"))?1:0,(dialog,index)->{prefs(activity).edit().putString("display_mode",index==1?"sony":"black").apply();dialog.dismiss();}).setNegativeButton("Cancel",null).show();
    else if(which==1){EditText field=new EditText(activity);field.setSingleLine();field.setInputType(InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_VARIATION_PASSWORD);field.setHint("TV's existing IP-control pre-shared key");new AlertDialog.Builder(activity).setTitle("Sony local-control key").setMessage("Used only for this TV's localhost Picture off API. Configure the TV's IP control separately if required. The app does not enable remote access. Leave blank to keep the existing key.").setView(field).setPositiveButton("Save",(dialog,x)->{String key=field.getText().toString();if(!key.isEmpty())prefs(activity).edit().putString("sony_display_psk",key).apply();}).setNeutralButton("Clear key",(dialog,x)->prefs(activity).edit().remove("sony_display_psk").apply()).setNegativeButton("Cancel",null).show();}
    else new AlertDialog.Builder(activity).setTitle("Power and standby").setMessage("Screen off keeps music active. OLED black mode displays black pixels while the TV remains awake. Sony Picture off requests real panel-off mode when supported.\n\nThe remote's Power button is controlled by the TV. A playback wake lock cannot guarantee that standby keeps HDMI audio active. Test it while playing, then check Audio output for the screen/standby event history.").setPositiveButton("OK",null).show();
   }).setNegativeButton("Close",null).show();
 }
}
