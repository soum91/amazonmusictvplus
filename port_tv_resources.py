#!/usr/bin/env python3
"""Port the supplied 3.4.1294.0 TV XML layouts to platform Android widgets.

Keeps original layout structure, dimensions, colors, artwork selectors, icons
and typefaces. Replaces only the old app-specific widget implementations and
removes unavailable video/lyrics children. No WebView is used by this UI.
"""
import argparse, copy, hashlib, json, re, shutil, subprocess, zipfile
from pathlib import Path
import xml.etree.ElementTree as E

NS='http://schemas.android.com/apk/res/android'; A='{'+NS+'}'
E.register_namespace('android',NS)
REF=re.compile(r'@(?:\+)?(layout|drawable|color|dimen|style|string|id)/([\w.]+)')
ROOTS=['main_activity','chrome_view','tab_layout','mini_player','shoveler_row_view',
       'vertical_item','horizontal_item','now_playing_template_view']

def generate(decoded, destination):
    decoded=Path(decoded);dst=Path(destination);res=dst/'res';res.mkdir(parents=True,exist_ok=True)
    definitions={}
    for f in (decoded/'res/values').glob('*.xml'):
        for e in E.parse(f).getroot():
            typ=e.get('type') if e.tag=='item' else e.tag
            if e.get('name'):definitions[(typ,e.get('name'))]=e
    pending=[('layout',n) for n in ROOTS]+[('drawable',n) for n in ['previous','play','pause','next']]
    done=set();values=E.Element('resources');provenance=[]
    def rewrite(s):
        if not s:return s
        def sub(m):
            typ,n=m.groups();pending.append((typ,n))
            return '@'+('+' if typ=='id' else '')+typ+'/amztv_'+n.replace('.','_')
        return REF.sub(sub,s)
    def flattened(name,seen=None):
        seen=set() if seen is None else set(seen)
        if name in seen or name in ['AppTheme','AppTheme.NowPlaying','AppTheme.Widget']:return {}
        seen.add(name);e=definitions.get(('style',name))
        if e is None:return {}
        parent=e.get('parent','').replace('@style/','');items=flattened(parent,seen)
        for item in e:
            if item.get('name','').startswith('android:'):items[item.get('name')]=item.text or ''
        return items
    def transform(node):
        # These contain video rendering / lyrics services from the older app.
        remove_ids={'now_playing_surface_view','video_now_playing_filter','now_playing_spinner',
            'now_playing_spinner_filter','SubtitleContainer','lyrics_notification_container',
            'now_playing_overlay_flipper_container','now_playing_stats','now_playing_logo'}
        for child in list(node):
            ident=child.get(A+'id','').split('/')[-1]
            if child.tag=='ViewStub' or ident in remove_ids:node.remove(child);continue
            transform(child)
        old=node.tag
        if old=='com.amazon.music.activity.views.transport.TransportView':
            node.tag='LinearLayout';node.set(A+'gravity','center');node.set(A+'orientation','horizontal');node.set(A+'layout_height','72dp')
        elif old=='com.amazon.music.activity.views.chrome.TabLayout':node.tag='FrameLayout';node.set(A+'layout_height','104dp')
        elif old=='com.amazon.music.activity.views.chrome.MiniPlayer':node.tag='FrameLayout'
        elif old=='android.support.v17.leanback.widget.HorizontalGridView':node.tag='HorizontalScrollView';node.set(A+'scrollbars','none')
        elif old=='android.support.v7.widget.LinearLayoutCompat':node.tag='LinearLayout'
        elif 'FadingImageView' in old:node.tag='ImageView';node.set(A+'scaleType','centerCrop')
        elif old=='com.amazon.music.activity.views.TextView':node.tag='TextView'
        elif old=='com.amazon.music.tv.view.SeekBar':node.tag='SeekBar'
        ident=node.get(A+'id','').split('/')[-1]
        if ident=='chrome_view_flipper':node.set(A+'layout_marginTop','104dp');node.set(A+'layout_marginBottom','62dp')
        if ident=='now_playing_badges':
            node.tag='TextView';node.set(A+'layout_width','wrap_content');node.set(A+'layout_height','26dp');node.set(A+'textColor','#25d1da');node.set(A+'textSize','15sp');node.attrib.pop('style',None)
        if ident=='now_playing_seekbar':node.set(A+'focusable','true');node.set(A+'clickable','true')
        if ident=='now_playing_album_art':node.set(A+'layout_width','212dp');node.set(A+'layout_height','212dp')
        if ident=='main_content':node.set(A+'background','#f21e2222')
        style=node.get('style','').replace('@style/','')
        for key,val in flattened(style).items():
            if key in ['android:layout_width','android:layout_height']:
                node.attrib.setdefault(A+key.split(':',1)[1],val)
        if node.tag not in ['requestFocus','include','merge']:
            node.attrib.setdefault(A+'layout_width','wrap_content');node.attrib.setdefault(A+'layout_height','wrap_content')
        for k,v in list(node.attrib.items()):node.set(k,rewrite(v))
        if node.text:node.text=rewrite(node.text)
    while pending:
        typ,name=pending.pop(0)
        if (typ,name) in done:continue
        done.add((typ,name));newname='amztv_'+name.replace('.','_')
        if typ=='id':E.SubElement(values,'item',{'type':'id','name':newname});continue
        if typ=='style':
            e=E.SubElement(values,'style',{'name':newname,'parent':''})
            for k,v in flattened(name).items():E.SubElement(e,'item',{'name':k}).text=rewrite(v)
            continue
        if (typ,name) in definitions:
            e=copy.deepcopy(definitions[(typ,name)]);e.set('name',newname)
            for ch in e.iter():
                if ch.text:ch.text=rewrite(ch.text)
            values.append(e);continue
        files=list((decoded/'res').glob(typ+'*/'+name+'.*'))
        if not files:raise ValueError('Missing TV resource '+typ+'/'+name)
        for f in files:
            target=res/f.parent.name/(newname+''.join(f.suffixes));target.parent.mkdir(exist_ok=True)
            if f.suffix=='.xml':
                tree=E.parse(f)
                if typ=='layout':transform(tree.getroot())
                else:
                    for ch in tree.getroot().iter():
                        for k,v in list(ch.attrib.items()):ch.set(k,rewrite(v))
                        if ch.text:ch.text=rewrite(ch.text)
                tree.write(target,encoding='utf-8',xml_declaration=True)
            else:shutil.copyfile(f,target)
            provenance.append(str(f.relative_to(decoded)))
    out=res/'values/amztv_port.xml';out.parent.mkdir(exist_ok=True);E.ElementTree(values).write(out,encoding='utf-8',xml_declaration=True)
    fonts=dst/'assets/tv_fonts';fonts.mkdir(parents=True,exist_ok=True)
    for n in ['AmazonEmber_Rg.ttf','AmazonEmber_Bd.ttf','SharpGroteskPanEuroSmBld-20.ttf']:
        shutil.copyfile(decoded/'assets/fonts'/n,fonts/n);provenance.append('assets/fonts/'+n)
    (dst/'tv-resource-provenance.json').write_text(json.dumps({'source':'Amazon Music TV 3.4.1294.0','layouts':ROOTS,'files':sorted(provenance),'adaptation':'Platform widget substitutions; video and lyrics-specific views omitted; transport bound to newer engine.'},indent=2))
    return len(done)

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('decoded_tv');p.add_argument('destination');a=p.parse_args()
    print('Ported',generate(a.decoded_tv,a.destination),'TV resources')
