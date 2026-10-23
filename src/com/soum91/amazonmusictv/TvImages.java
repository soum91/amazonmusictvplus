package com.soum91.amazonmusictv;
import android.content.Context;
import android.graphics.*;
import android.net.Uri;
import android.os.*;
import android.util.LruCache;
import android.widget.ImageView;
import java.io.*;
import java.net.*;
import java.util.concurrent.*;
public final class TvImages {
    private static final ExecutorService pool=Executors.newFixedThreadPool(3);
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static final LruCache<String,Bitmap> cache=new LruCache<String,Bitmap>(8*1024*1024){protected int sizeOf(String k,Bitmap b){return b.getAllocationByteCount();}};
    public static void load(Context c,Uri uri,ImageView view){
        if(view==null)return;view.setTag(uri);view.setImageDrawable(null);if(uri==null)return;
        Bitmap b=cache.get(uri.toString());if(b!=null){view.setImageBitmap(b);return;}
        Context app=c.getApplicationContext();pool.execute(()->{Bitmap result=read(app,uri);if(result!=null)cache.put(uri.toString(),result);main.post(()->{if(uri.equals(view.getTag())&&result!=null)view.setImageBitmap(result);});});
    }
    public static Bitmap cached(Uri uri){return uri==null?null:cache.get(uri.toString());}
    private static Bitmap read(Context c,Uri uri){
        try(InputStream in=open(c,uri);ByteArrayOutputStream bytes=new ByteArrayOutputStream()){
            byte[] buf=new byte[8192];int n,total=0;while((n=in.read(buf))!=-1){total+=n;if(total>6*1024*1024)return null;bytes.write(buf,0,n);}
            byte[] data=bytes.toByteArray();BitmapFactory.Options o=new BitmapFactory.Options();o.inJustDecodeBounds=true;BitmapFactory.decodeByteArray(data,0,data.length,o);
            o.inSampleSize=1;while(Math.max(o.outWidth,o.outHeight)/o.inSampleSize>640)o.inSampleSize*=2;
            o.inJustDecodeBounds=false;o.inPreferredConfig=Bitmap.Config.RGB_565;return BitmapFactory.decodeByteArray(data,0,data.length,o);
        }catch(Exception e){return null;}
    }
    private static InputStream open(Context c,Uri uri)throws Exception{
        if("content".equals(uri.getScheme())||"android.resource".equals(uri.getScheme()))return c.getContentResolver().openInputStream(uri);
        if(!"https".equals(uri.getScheme()))throw new IOException("Unsupported artwork URI");
        URLConnection con=new URL(uri.toString()).openConnection();con.setConnectTimeout(5000);con.setReadTimeout(5000);return con.getInputStream();
    }
}
