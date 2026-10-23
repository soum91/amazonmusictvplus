#!/usr/bin/env python3
"""Check the launcher, playback and docking integration declarations."""
from pathlib import Path
import py_compile,xml.etree.ElementTree as E
root=Path(__file__).resolve().parents[1]
for name in ['build.py','port_tv_resources.py','tools/bootstrap.py']:py_compile.compile(str(root/name),doraise=True)
a='{http://schemas.android.com/apk/res/android}';r=E.parse(root/'AndroidManifest.xml').getroot();app=r.find('application')
activity=next(e for e in app.findall('activity') if e.get(a+'name')=='com.soum91.amazonmusictv.TvActivity')
assert activity.get(a+'supportsPictureInPicture')=='true'
assert activity.get(a+'resizeableActivity')=='true'
filters=activity.findall('intent-filter')
assert any(any(x.get(a+'name')=='android.intent.action.MAIN' for x in f.findall('action')) and {'android.intent.category.LAUNCHER','android.intent.category.LEANBACK_LAUNCHER'}<={x.get(a+'name') for x in f.findall('category')} for f in filters)
services={e.get(a+'name'):e for e in app.findall('service')}
assert services['com.soum91.amazonmusictv.TvPlaybackService'].get(a+'foregroundServiceType')=='mediaPlayback'
assert services['com.soum91.amazonmusictv.TvPlaybackService'].get(a+'exported')=='false'
assert services['com.soum91.amazonmusictv.TvDreamService'].get(a+'permission')=='android.permission.BIND_DREAM_SERVICE'
assert not list(root.glob('signing/*')) or (root/'.gitignore').read_text().find('signing/')>=0
print('Launcher, PiP, media foreground service and screensaver declarations checked')
