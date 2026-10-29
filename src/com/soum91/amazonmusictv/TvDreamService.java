package com.soum91.amazonmusictv;
import android.content.*;
import android.graphics.Color;
import android.media.*;
import android.media.browse.MediaBrowser;
import android.media.session.MediaController;
import android.media.session.PlaybackState;
import android.os.*;
import android.service.dreams.DreamService;
import android.view.*;
import android.widget.*;
import java.util.*;
import java.util.concurrent.*;

/** Ambient now-playing screen with synchronized Amazon lyrics and artwork fallback. */
public final class TvDreamService extends DreamService {
 private final Handler handler=new Handler(Looper.getMainLooper());private final ExecutorService worker=Executors.newSingleThreadExecutor();
 private MediaBrowser browser;private MediaController controller;private ImageView art;private TextView title,previous,current,next;private String lyricAsin="";private List<TvAmazon.Line> lines=Collections.emptyList();private int loadToken;
 private final Runnable tick=new Runnable(){public void run(){render();handler.postDelayed(this,500);}};
 private int dp(int n){return Math.round(n*getResources().getDisplayMetrics().density);}
 private TextView label(String value,int size,int color){TextView v=new TextView(this);v.setText(value);v.setTextColor(color);v.setTextSize(size);v.setGravity(Gravity.CENTER);v.setMaxLines(3);v.setEllipsize(android.text.TextUtils.TruncateAt.END);return v;}
 @Override public void onAttachedToWindow(){
  super.onAttachedToWindow();setInteractive(true);setFullscreen(true);setScreenBright(false);FrameLayout panel=new FrameLayout(this);panel.setBackgroundColor(0xff090d0e);art=new ImageView(this);art.setScaleType(ImageView.ScaleType.CENTER_CROP);panel.addView(art,new FrameLayout.LayoutParams(-1,-1));View shade=new View(this);shade.setBackgroundColor(0xc9000000);panel.addView(shade,new FrameLayout.LayoutParams(-1,-1));
  LinearLayout words=new LinearLayout(this);words.setOrientation(LinearLayout.VERTICAL);words.setGravity(Gravity.CENTER);words.setPadding(dp(90),dp(50),dp(90),dp(70));previous=label("",25,0xff7f9296);current=label("Amazon Music TV Plus",38,Color.WHITE);next=label("",25,0xff7f9296);words.addView(previous,new LinearLayout.LayoutParams(-1,-2));LinearLayout.LayoutParams active=new LinearLayout.LayoutParams(-1,-2);active.setMargins(0,dp(22),0,dp(22));words.addView(current,active);words.addView(next,new LinearLayout.LayoutParams(-1,-2));panel.addView(words,new FrameLayout.LayoutParams(-1,-1));
  title=label("Amazon Music TV Plus",17,0xffb7c7ca);title.setGravity(Gravity.START|Gravity.BOTTOM);title.setPadding(dp(42),dp(24),dp(42),dp(30));panel.addView(title,new FrameLayout.LayoutParams(-1,-1));panel.setFocusable(true);panel.setContentDescription("Now playing screensaver. Press OK to open player.");panel.setOnClickListener(v->{startActivity(TvPlaybackService.playerIntent(this));finish();});setContentView(panel);
  browser=new MediaBrowser(this,new ComponentName(this,"com.amazon.mp3.auto.AutoMusicService"),new MediaBrowser.ConnectionCallback(){public void onConnected(){controller=new MediaController(TvDreamService.this,browser.getSessionToken());}},null);browser.connect();handler.post(tick);
 }
 private void render(){
  if(controller==null||controller.getMetadata()==null)return;MediaMetadata metadata=controller.getMetadata();MediaDescription d=metadata.getDescription();title.setText(d.getTitle()+"  ·  "+String.valueOf(d.getSubtitle())+"\n"+TvBridge.qualitySummary());if(!String.valueOf(d.getIconUri()).equals(String.valueOf(art.getTag())))TvImages.load(this,d.getIconUri(),art);
  String asin="";try{asin=TvAmazon.currentAsin();}catch(Exception ignored){}if(asin.isEmpty())asin=TvAmazon.asin(d);if(!asin.equals(lyricAsin))loadLyrics(asin);
  PlaybackState state=controller.getPlaybackState();long position=state==null?0:state.getPosition();if(state!=null&&state.getState()==PlaybackState.STATE_PLAYING)position+=(long)((SystemClock.elapsedRealtime()-state.getLastPositionUpdateTime())*state.getPlaybackSpeed());int active=-1;for(int i=0;i<lines.size();i++){TvAmazon.Line line=lines.get(i);if(line.start>=0&&position>=line.start&&(line.end<0||position<line.end))active=i;}if(active>=0){previous.setText(neighbor(active,-1));current.setText(lines.get(active).text);next.setText(neighbor(active,1));}else if(lines.isEmpty()){previous.setText("");current.setText(d.getTitle()+"\n"+String.valueOf(d.getSubtitle()));next.setText("");}
 }
 private String neighbor(int active,int direction){for(int i=active+direction;i>=0&&i<lines.size();i+=direction){TvAmazon.Line line=lines.get(i);if(line.start>=0)return line.text;}return "";}
 private void loadLyrics(String asin){lyricAsin=asin;lines=Collections.emptyList();final int token=++loadToken;if(asin.isEmpty())return;final String song=asin;worker.execute(()->{try{List<TvAmazon.Line> result=TvAmazon.lyrics(getApplicationContext(),song);handler.post(()->{if(token==loadToken)lines=result;});}catch(Exception ignored){}});}
 @Override public void onDetachedFromWindow(){handler.removeCallbacks(tick);loadToken++;worker.shutdownNow();if(browser!=null)browser.disconnect();super.onDetachedFromWindow();}
}
