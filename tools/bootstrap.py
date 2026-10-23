#!/usr/bin/env python3
import argparse,hashlib,json,urllib.request
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
URLS={
 'apktool.jar':'https://github.com/iBotPeaches/Apktool/releases/download/v2.12.1/apktool_2.12.1.jar',
 'apkeditor.jar':'https://github.com/REAndroid/APKEditor/releases/download/V1.4.9/APKEditor-1.4.9.jar',
 'signer.jar':'https://github.com/patrickfav/uber-apk-signer/releases/download/v1.3.0/uber-apk-signer-1.3.0.jar',
 'ecj.jar':'https://repo.maven.apache.org/maven2/org/eclipse/jdt/ecj/3.40.0/ecj-3.40.0.jar',
 'r8.jar':'https://dl.google.com/dl/android/maven2/com/android/tools/r8/8.9.35/r8-8.9.35.jar',
 'android.jar':'https://raw.githubusercontent.com/Reginer/aosp-android-jar/main/android-35/android.jar'}
p=argparse.ArgumentParser();p.add_argument('--dir',type=Path,default=ROOT/'build-tools');p.add_argument('--compile-only',action='store_true');a=p.parse_args();a.dir.mkdir(parents=True,exist_ok=True)
pins=json.loads((ROOT/'toolchain.json').read_text())
for name,url in URLS.items():
 if a.compile_only and name not in ['ecj.jar','android.jar']:continue
 f=a.dir/name
 if not f.exists():urllib.request.urlretrieve(url,f)
 if hashlib.file_digest(f.open('rb'),'sha256').hexdigest()!=pins[name]['sha256']:raise SystemExit('Tool hash mismatch: '+name)
 print(name+' verified')
