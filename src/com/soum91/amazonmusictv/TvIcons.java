package com.soum91.amazonmusictv;
import android.content.Context;
import android.graphics.*;
import android.widget.TextView;
final class TvIcons {
 static String symbol(String name){switch(name){case "home":return "⌂";case "search":return "⌕";case "library":return "▤";case "previous":return "❮";case "next":return "❯";case "play":return "▶";case "pause":return "Ⅱ";case "screen":return "◐";default:return "•••";}}
 static final class Button extends TextView {
  String icon,label="";private final Paint paint=new Paint(3);
  Button(Context c,String name){super(c);icon=name;setText("");}
  void icon(String name){if(!name.equals(icon)){icon=name;invalidate();}}
  void label(String value){label=value;invalidate();}
  private void line(Canvas c,float... xy){Path p=new Path();p.moveTo(xy[0],xy[1]);for(int i=2;i<xy.length;i+=2)p.lineTo(xy[i],xy[i+1]);c.drawPath(p,paint);}
  @Override protected void onDraw(Canvas canvas){float density=getResources().getDisplayMetrics().density;float size=24*density,cx=getWidth()/2f,cy=label.isEmpty()?getHeight()/2f:22*density;canvas.save();canvas.translate(cx-size/2,cy-size/2);canvas.scale(size/24,size/24);paint.setColor(isFocused()?0xff42eee1:Color.WHITE);paint.setStrokeWidth(1.8f);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);paint.setStyle(Paint.Style.STROKE);
   switch(icon){case "home":line(canvas,3,10,12,3,21,10);line(canvas,5,9,5,21,10,21,10,14,14,14,14,21,19,21,19,9);break;
    case "search":canvas.drawCircle(10,10,6.5f,paint);line(canvas,15,15,21,21);break;
    case "library":canvas.drawRoundRect(4,4,20,21,2,2,paint);line(canvas,8,4,8,21);line(canvas,12,9,17,9);line(canvas,12,13,17,13);break;
    case "previous":line(canvas,5,5,5,19);line(canvas,18,5,8,12,18,19,18,5);break;
    case "next":line(canvas,19,5,19,19);line(canvas,6,5,16,12,6,19,6,5);break;
    case "pause":line(canvas,8,5,8,19);line(canvas,16,5,16,19);break;
    case "play":line(canvas,7,4,20,12,7,20,7,4);break;
    case "screen":canvas.drawRoundRect(3,4,21,18,2,2,paint);line(canvas,8,22,16,22);line(canvas,12,18,12,22);line(canvas,6,15,18,7);break;
    default:paint.setStyle(Paint.Style.FILL);canvas.drawCircle(5,12,1.7f,paint);canvas.drawCircle(12,12,1.7f,paint);canvas.drawCircle(19,12,1.7f,paint);
   }canvas.restore();if(!label.isEmpty()){paint.setStyle(Paint.Style.FILL);paint.setTextAlign(Paint.Align.CENTER);paint.setTextSize(11*getResources().getDisplayMetrics().scaledDensity);canvas.drawText(label,cx,53*density,paint);}
  }
 }
}
