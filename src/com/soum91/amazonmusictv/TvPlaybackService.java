package com.soum91.amazonmusictv;
import android.app.*;
import android.content.*;
import android.graphics.*;
import android.graphics.drawable.Icon;
import android.media.*;
import android.media.browse.MediaBrowser;
import android.media.session.MediaController;
import android.media.session.PlaybackState;
import android.net.Uri;
import android.os.*;
import android.provider.Settings;
import android.view.*;
import android.widget.*;
import java.util.*;

/** Keeps the existing playback service bound; publishes its real MediaSession. */
public final class TvPlaybackService extends Service {
 public static final String PLAYBACK="tv.playback",TOGGLE="tv.toggle",PREVIOUS="tv.previous",NEXT="tv.next",STOP="tv.stop",DOCK="tv.dock",UNDOCK="tv.undock",MOVE="tv.move";
 private static final String CHANNEL="amazon_music_tv_playback";private static final int NOTIFICATION=8303;
 private MediaBrowser browser;private MediaController controller;private final Handler handler=new Handler(Looper.getMainLooper());
 private final ArrayDeque<String> pending=new ArrayDeque<>();private WindowManager windows;private View dock;private WindowManager.LayoutParams dockParams;
 private TextView dockTitle;private ImageView dockArt;private String lastNotification="";private boolean dockWanted;
 private final Runnable ticker=new Runnable(){public void run(){publish();handler.postDelayed(this,1500);}};
 public static void start(Context c,String action){Intent in=new Intent(c,TvPlaybackService.class).setAction(action);if(Build.VERSION.SDK_INT>=26)c.startForegroundService(in);else c.startService(in);}
 static PendingIntent intent(Context c,String action){return PendingIntent.getService(c,action.hashCode(),new Intent(c,TvPlaybackService.class).setAction(action),PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE);}
 public static RemoteAction remoteAction(Context c,String action){int icon=action.equals(PREVIOUS)?android.R.drawable.ic_media_previous:action.equals(NEXT)?android.R.drawable.ic_media_next:android.R.drawable.ic_media_pause;String label=action.equals(PREVIOUS)?"Previous":action.equals(NEXT)?"Next":"Play / pause";return new RemoteAction(Icon.createWithResource(c,icon),label,label,intent(c,action));}
 static Intent playerIntent(Context c){return new Intent(c,TvActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_SINGLE_TOP).putExtra("show_player",true);}
 public static void routeSession(Context c,MediaController controller){
  try{Object playback=Class.forName("com.amazon.music.media.playback.Playback").getMethod("getInstance").invoke(null);Object session=TvBridge.call(playback,"getMediaSession");
   PendingIntent open=PendingIntent.getActivity(c,8303,playerIntent(c),PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE);
   session.getClass().getMethod("setSessionActivity",PendingIntent.class).invoke(session,open);
   PlaybackState state=controller.getPlaybackState();if(state!=null&&state.getState()==PlaybackState.STATE_PLAYING)session.getClass().getMethod("setActive",boolean.class).invoke(session,true);
  }catch(Exception e){android.util.Log.w("AmazonMusicTV","Could not update session return activity",e);}
 }
 @Override public void onCreate(){super.onCreate();NotificationChannel channel=new NotificationChannel(CHANNEL,"Amazon Music playback",NotificationManager.IMPORTANCE_LOW);channel.setDescription("Playback controls on supported Home and lock screens");channel.setLockscreenVisibility(Notification.VISIBILITY_PUBLIC);getSystemService(NotificationManager.class).createNotificationChannel(channel);windows=(WindowManager)getSystemService(WINDOW_SERVICE);
  browser=new MediaBrowser(this,new ComponentName(this,"com.amazon.mp3.auto.AutoMusicService"),new MediaBrowser.ConnectionCallback(){public void onConnected(){controller=new MediaController(TvPlaybackService.this,browser.getSessionToken());routeSession(TvPlaybackService.this,controller);while(!pending.isEmpty())command(pending.removeFirst());if(dockWanted)showDock();publish();}public void onConnectionFailed(){stopSelf();}public void onConnectionSuspended(){controller=null;lastNotification="";}},null);browser.connect();handler.post(ticker);
 }
 @Override public int onStartCommand(Intent in,int flags,int startId){startForeground(NOTIFICATION,notification());String action=in==null?PLAYBACK:in.getAction();if(DOCK.equals(action)){dockWanted=true;showDock();}else if(UNDOCK.equals(action)){dockWanted=false;hideDock();}else if(MOVE.equals(action)){if(dockParams!=null){dockParams.gravity=dockParams.gravity==(Gravity.BOTTOM|Gravity.END)?(Gravity.BOTTOM|Gravity.START):(Gravity.BOTTOM|Gravity.END);windows.updateViewLayout(dock,dockParams);}}else if(STOP.equals(action)){if(controller!=null)controller.getTransportControls().pause();stopSelf();return START_NOT_STICKY;}else if(!PLAYBACK.equals(action)){if(controller==null)pending.add(action);else command(action);}return START_NOT_STICKY;}
 private void command(String action){if(controller==null)return;MediaController.TransportControls c=controller.getTransportControls();if(TOGGLE.equals(action)){PlaybackState s=controller.getPlaybackState();if(s!=null&&s.getState()==PlaybackState.STATE_PLAYING)c.pause();else c.play();}else if(PREVIOUS.equals(action))c.skipToPrevious();else if(NEXT.equals(action))c.skipToNext();lastNotification="";publish();}
 private Notification notification(){
  MediaMetadata m=controller==null?null:controller.getMetadata();MediaDescription d=m==null?null:m.getDescription();PlaybackState s=controller==null?null:controller.getPlaybackState();boolean playing=s!=null&&s.getState()==PlaybackState.STATE_PLAYING;
  Notification.Builder b=new Notification.Builder(this,CHANNEL).setSmallIcon(android.R.drawable.ic_media_play).setContentTitle(d==null?"Amazon Music TV Plus":d.getTitle()).setContentText(d==null?"Connecting to playback":d.getSubtitle()).setSubText(TvBridge.qualitySummary()).setCategory(Notification.CATEGORY_TRANSPORT).setVisibility(Notification.VISIBILITY_PUBLIC).setShowWhen(false).setOnlyAlertOnce(true).setOngoing(playing).setContentIntent(PendingIntent.getActivity(this,8303,playerIntent(this),PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE));
  b.addAction(new Notification.Action.Builder(android.R.drawable.ic_media_previous,"Previous",intent(this,PREVIOUS)).build());b.addAction(new Notification.Action.Builder(playing?android.R.drawable.ic_media_pause:android.R.drawable.ic_media_play,playing?"Pause":"Play",intent(this,TOGGLE)).build());b.addAction(new Notification.Action.Builder(android.R.drawable.ic_media_next,"Next",intent(this,NEXT)).build());
  if(dock!=null)b.addAction(new Notification.Action.Builder(android.R.drawable.ic_menu_close_clear_cancel,"Hide dock",intent(this,UNDOCK)).build());b.addAction(new Notification.Action.Builder(android.R.drawable.ic_menu_close_clear_cancel,"Stop",intent(this,STOP)).build());
  Notification.MediaStyle style=new Notification.MediaStyle().setShowActionsInCompactView(0,1,2);if(controller!=null)style.setMediaSession(controller.getSessionToken());b.setStyle(style);
  if(d!=null){Bitmap art=TvImages.cached(d.getIconUri());if(art!=null)b.setLargeIcon(art);}return b.build();
 }
 private void publish(){
  if(controller==null)return;routeSession(this,controller);MediaMetadata m=controller.getMetadata();MediaDescription d=m==null?null:m.getDescription();PlaybackState s=controller.getPlaybackState();TvBridge.recordDiagnostics(this);
  String key=String.valueOf(d==null?null:d.getMediaId())+":"+(s==null?0:s.getState())+":"+TvBridge.qualitySummary()+":"+(d!=null&&TvImages.cached(d.getIconUri())!=null)+":"+(dock!=null);
  if(!key.equals(lastNotification)){lastNotification=key;getSystemService(NotificationManager.class).notify(NOTIFICATION,notification());}
  if(dock!=null&&d!=null){dockTitle.setText(d.getTitle()+"\n"+String.valueOf(d.getSubtitle())+"\n"+TvBridge.qualitySummary());if(!String.valueOf(d.getIconUri()).equals(String.valueOf(dockArt.getTag())))TvImages.load(this,d.getIconUri(),dockArt);}
 }
 private int dp(int n){return Math.round(n*getResources().getDisplayMetrics().density);}
 private void showDock(){if(dock!=null||!Settings.canDrawOverlays(this))return;
  LinearLayout panel=new LinearLayout(this);panel.setGravity(Gravity.CENTER_VERTICAL);panel.setPadding(dp(12),dp(10),dp(10),dp(10));panel.setBackgroundColor(0xf21e2222);
  dockArt=new ImageView(this);dockArt.setScaleType(ImageView.ScaleType.CENTER_CROP);panel.addView(dockArt,new LinearLayout.LayoutParams(dp(68),dp(68)));
  dockTitle=new TextView(this);dockTitle.setText("Amazon Music");dockTitle.setTextColor(Color.WHITE);dockTitle.setTextSize(14);dockTitle.setPadding(dp(12),0,dp(8),0);panel.addView(dockTitle,new LinearLayout.LayoutParams(dp(230),-2));
  TextView close=new TextView(this);close.setText("×");close.setTextSize(26);close.setTextColor(Color.WHITE);close.setPadding(dp(8),0,dp(8),0);close.setOnClickListener(v->{dockWanted=false;hideDock();});panel.addView(close);
  panel.setOnClickListener(v->startActivity(playerIntent(this)));
  // Non-focusable: Home keeps D-pad navigation. Media keys still control the real session.
  dockParams=new WindowManager.LayoutParams(dp(380),dp(92),WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE|WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL,PixelFormat.TRANSLUCENT);dockParams.gravity=Gravity.BOTTOM|Gravity.END;dockParams.x=dp(24);dockParams.y=dp(38);
  try{windows.addView(panel,dockParams);dock=panel;lastNotification="";publish();}catch(RuntimeException e){dockWanted=false;Toast.makeText(this,"Floating dock is unavailable on this TV",Toast.LENGTH_LONG).show();}
 }
 private void hideDock(){if(dock!=null){try{windows.removeView(dock);}catch(RuntimeException ignored){}dock=null;lastNotification="";}}
 @Override public void onDestroy(){handler.removeCallbacks(ticker);hideDock();if(browser!=null)browser.disconnect();stopForeground(true);super.onDestroy();}
 @Override public IBinder onBind(Intent intent){return null;}
}
