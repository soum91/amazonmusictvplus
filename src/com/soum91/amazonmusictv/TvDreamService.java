package com.soum91.amazonmusictv;
import android.content.*;
import android.graphics.Color;
import android.media.*;
import android.media.browse.MediaBrowser;
import android.media.session.MediaController;
import android.os.*;
import android.service.dreams.DreamService;
import android.view.*;
import android.widget.*;
/** Optional artwork ambient screen; never starts playback or replaces device security. */
public final class TvDreamService extends DreamService {
 private final Handler handler=new Handler(Looper.getMainLooper());private MediaBrowser browser;private MediaController controller;private ImageView art;private TextView title;
 private final Runnable tick=new Runnable(){public void run(){if(controller!=null&&controller.getMetadata()!=null){MediaDescription d=controller.getMetadata().getDescription();title.setText(d.getTitle()+"\n"+String.valueOf(d.getSubtitle())+"\n"+TvBridge.qualitySummary());if(!String.valueOf(d.getIconUri()).equals(String.valueOf(art.getTag())))TvImages.load(TvDreamService.this,d.getIconUri(),art);}handler.postDelayed(this,2000);}};
 @Override public void onAttachedToWindow(){super.onAttachedToWindow();setInteractive(true);setFullscreen(true);setScreenBright(false);FrameLayout panel=new FrameLayout(this);panel.setBackgroundColor(0xff101616);art=new ImageView(this);art.setScaleType(ImageView.ScaleType.CENTER_CROP);panel.addView(art,new FrameLayout.LayoutParams(-1,-1));View shade=new View(this);shade.setBackgroundColor(0xa9000000);panel.addView(shade,new FrameLayout.LayoutParams(-1,-1));title=new TextView(this);title.setText("Amazon Music TV Plus");title.setTextColor(Color.WHITE);title.setTextSize(30);title.setPadding(64,32,64,48);panel.addView(title,new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM));panel.setFocusable(true);panel.setOnClickListener(v->{startActivity(TvPlaybackService.playerIntent(this));finish();});setContentView(panel);
  browser=new MediaBrowser(this,new ComponentName(this,"com.amazon.mp3.auto.AutoMusicService"),new MediaBrowser.ConnectionCallback(){public void onConnected(){controller=new MediaController(TvDreamService.this,browser.getSessionToken());}},null);browser.connect();handler.post(tick);
 }
 @Override public void onDetachedFromWindow(){handler.removeCallbacks(tick);if(browser!=null)browser.disconnect();super.onDetachedFromWindow();}
}
