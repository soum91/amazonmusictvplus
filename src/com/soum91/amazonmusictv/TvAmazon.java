package com.soum91.amazonmusictv;

import android.content.Context;
import android.media.MediaDescription;
import android.net.Uri;
import java.lang.reflect.*;
import java.util.*;

/** Adapts verified entry points in the bundled Amazon engine, without a second login or API client. */
final class TvAmazon {
 static Class<?> type(String n)throws Exception{return Class.forName(n);}
 static Object invoke(Object target,String name,Class<?>[] types,Object... args)throws Exception{
  Method m=(target instanceof Class?(Class<?>)target:target.getClass()).getMethod(name,types);m.setAccessible(true);return m.invoke(target instanceof Class?null:target,args);
 }
 static Object get(Object target,String name)throws Exception{return invoke(target,name,new Class<?>[0]);}
 static Object field(String cls,String name)throws Exception{return type(cls).getField(name).get(null);}
 static Object playback()throws Exception{
  Class<?> source=type("com.amazon.music.media.playback.ControlSource");
  return invoke(type("com.amazon.mp3.playback.playbackcontrol.PlaybackControllerProvider"),"getController",new Class<?>[]{source},source.getField("APP_UI").get(null));
 }
 static String currentAsin()throws Exception{
  Object item=get(playback(),"getCurrentMediaItem");if(item==null)return "";
  Object ids=get(item,"getMediaItemIds");
  if(ids instanceof Iterable)for(Object id:(Iterable<?>)ids){String t=String.valueOf(get(id,"getType"));String value=String.valueOf(get(id,"getId"));if(t.contains("ASIN")&&value.matches("[A-Z0-9]{10}"))return value;}
  return "";
 }
 static String asin(MediaDescription d){
  if(d==null)return "";String value=String.valueOf(d.getMediaId());
  java.util.regex.Matcher m=java.util.regex.Pattern.compile("(?<![A-Z0-9])B[A-Z0-9]{9}(?![A-Z0-9])").matcher(value);return m.find()?m.group():"";
 }
 static Object track(String asin)throws Exception{
  if(!asin.matches("[A-Z0-9]{10}"))throw new IllegalArgumentException("No track identifier");
  Object factory=get(type("com.amazon.mp3.AmazonApplication"),"getLibraryItemFactory");
  return invoke(factory,"getTrackForAsin",new Class<?>[]{String.class},asin);
 }
 static Uri trackUri(Object track)throws Exception{return (Uri)get(track,"getContentUri");}
 static List<MediaDescription> related(Object track,boolean artist)throws Exception{
  Object factory=get(type("com.amazon.mp3.AmazonApplication"),"getLibraryItemFactory"),album=get(track,"getAlbum"),collection=album;
  if(album==null)album=invoke(factory,"getAlbumForTrack",new Class<?>[]{type("com.amazon.mp3.library.item.MusicTrack")},track);
  collection=artist?invoke(factory,"getArtistForAlbum",new Class<?>[]{type("com.amazon.mp3.library.item.Album")},album):album;
  Object tracks=invoke(factory,artist?"getTracksForArtist":"getTracksForAlbum",new Class<?>[]{type(artist?"com.amazon.mp3.library.item.Artist":"com.amazon.mp3.library.item.Album")},collection);
  List<MediaDescription> result=new ArrayList<>();if(tracks instanceof Iterable)for(Object t:(Iterable<?>)tracks){Uri uri=trackUri(t);if(uri==null)continue;String image=String.valueOf(get(t,"getAlbumArtUrl"));android.os.Bundle extras=new android.os.Bundle();extras.putBoolean("tv_native_uri",true);String asin=String.valueOf(get(t,"getAsin"));result.add(new MediaDescription.Builder().setExtras(extras).setMediaId(asin.matches("[A-Z0-9]{10}")?"https://music.amazon.ca/tracks/"+asin:uri.toString()).setTitle(String.valueOf(get(t,"getTitle"))).setSubtitle(String.valueOf(get(t,"getArtistName"))).setIconUri(image.equals("null")?null:Uri.parse(image)).build());}
  return result;
 }
 static void enqueue(Uri uri,boolean next)throws Exception{
  Object queue=get(type("com.amazon.mp3.library.provider.source.nowplaying.NowPlayingQueueUtil"),"getInstance");
  if(uri==null||!Boolean.TRUE.equals(invoke(queue,"isUriSupported",new Class<?>[]{Uri.class},uri)))throw new IllegalArgumentException("This item is not supported by Amazon's queue");
  invoke(queue,"addToPlayQueue",new Class<?>[]{Uri.class,boolean.class},uri,next);
 }
 static boolean canRate() {try{return Boolean.TRUE.equals(get(playback(),"canRateCurrentItem"));}catch(Exception e){return false;}}
 static boolean liked(){try{return ((Number)get(playback(),"getCurrentItemRating")).intValue()==1;}catch(Exception e){return false;}}
 static void rate(boolean like)throws Exception{invoke(playback(),"setCurrentItemRating",new Class<?>[]{int.class},like?1:0);}
 static void similar(Context c,String asin)throws Exception{
  Class<?> page=type("com.amazon.music.metrics.mts.event.types.PlaybackPageType"),source=type("com.amazon.music.media.playback.ControlSource");
  invoke(type("com.amazon.mp3.card.prime.StationUtils"),"startSFA",new Class<?>[]{Context.class,String.class,String.class,page,source},c,asin,"TRACK_SEED",page.getField("SONGS_LIST").get(null),source.getField("APP_UI").get(null));
 }
 static String account(Context c){
  try{Object util=invoke(type("com.amazon.mp3.account.credentials.AccountCredentialUtil"),"get",new Class<?>[]{Context.class},c);
   boolean signed=Boolean.TRUE.equals(get(util,"isSignedIn"));String name=String.valueOf(get(util,"getFirstName"));
   return signed?"Signed in"+(name.equals("null")||name.isEmpty()?"":" as "+name):"Not signed in";
  }catch(Exception e){return "Account status unavailable";}
 }
 static List<Line> lyrics(Context c,String asin)throws Exception{
  Object detail=invoke(type("com.amazon.mp3.account.details.AccountDetailUtil"),"get",new Class<?>[]{Context.class},c);
  String market=(String)get(detail,"getHomeMarketPlaceId");
  Class<?> infoClass=type("com.amazon.mp3.lyrics.item.LyricsTrackInfo"),dbClass=type("com.amazon.mp3.lyrics.LyricsDB");
  Object db=type("com.amazon.mp3.lyrics.LyricsDatabase").getConstructor(Context.class,String.class).newInstance(c,market);
  Object manager=type("com.amazon.mp3.lyrics.LyricsManager").getConstructor(Context.class,dbClass).newInstance(c,db);
  Constructor<?> ctor=type("com.amazon.mp3.lyrics.LibraryLyricsFetcher$FetcherTrackInfo").getDeclaredConstructor(String.class,String.class);ctor.setAccessible(true);Object info=ctor.newInstance(asin,market),lyrics=null;
  try{lyrics=invoke(manager,"loadLyrics",new Class<?>[]{infoClass},info);}catch(Exception ignored){}
  if(lyrics==null)lyrics=invoke(manager,"downloadLyrics",new Class<?>[]{infoClass},info);
  List<Line> result=new ArrayList<>();if(lyrics==null)return result;
  for(Object line:(List<?>)get(lyrics,"getLines")){if(result.size()>=1500)break;result.add(new Line(String.valueOf(get(line,"getLine")),((Number)get(line,"getStartTime")).longValue(),((Number)get(line,"getEndTime")).longValue()));}
  Object copyrights=get(lyrics,"getCopyrights");if(copyrights instanceof String[])for(String credit:(String[])copyrights)result.add(new Line(credit,-1,-1));
  return result;
 }
 static final class Line {final String text;final long start,end;Line(String t,long s,long e){text=t;start=s;end=e;}}
}
