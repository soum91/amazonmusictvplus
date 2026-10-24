#!/usr/bin/env python3
"""Rebuild the UI and read-only AudioTrack probe from the verified build 3 APK."""
import argparse,hashlib,json,shutil,zipfile
from pathlib import Path
from build import ROOT,run

def main():
    p=argparse.ArgumentParser()
    p.add_argument('base_apk',type=Path)
    p.add_argument('--tools',required=True,type=Path)
    p.add_argument('--signing-dir',required=True,type=Path)
    p.add_argument('--work',default=ROOT/'build',type=Path)
    p.add_argument('--build-number',default=4,type=int)
    a=p.parse_args()
    if a.build_number<4:raise ValueError('Update build number must be at least 4')
    if hashlib.file_digest(a.base_apk.open('rb'),'sha256').hexdigest()!='37a491724d86ac37292a167a308c279c13730cbe95c11b2aa79257444754a736':raise ValueError('Expected the verified signed build 3 APK')
    tools=a.tools.resolve();w=a.work.resolve();w.mkdir(parents=True,exist_ok=True)
    def jar(name,*args):return run(['java','-Xmx2g','-jar',tools/(name+'.jar'),*args])
    jar('apktool','d','-f','-s',a.base_apk,'-o',w/'decoded')
    engine=w/'smali15'
    run(['java','-Xmx2g','-cp',tools/'apkeditor.jar','org.jf.baksmali.Main','d','--api','31',w/'decoded/classes15.dex','-o',engine])
    shutil.copytree(ROOT/'patches15',engine,dirs_exist_ok=True)
    run(['java','-Xmx2g','-cp',tools/'apkeditor.jar','org.jf.smali.Main','a','--api','31',engine,'-o',w/'decoded/classes15.dex'])
    compiled=w/'compiled';compiled.mkdir(exist_ok=True)
    jar('ecj','-8','-nowarn','-classpath',tools/'android.jar','-d',compiled,*sorted((ROOT/'src').rglob('*.java')))
    with zipfile.ZipFile(w/'ui.jar','w') as z:
        for f in compiled.rglob('*.class'):z.write(f,str(f.relative_to(compiled)))
    dex=w/'ui-dex';dex.mkdir(exist_ok=True)
    run(['java','-cp',tools/'r8.jar','com.android.tools.r8.D8','--min-api','29','--lib',tools/'android.jar','--output',dex,w/'ui.jar'])
    shutil.copyfile(dex/'classes.dex',w/'decoded/classes18.dex')
    shutil.copyfile(ROOT/'AndroidManifest.xml',w/'decoded/AndroidManifest.xml')
    yml=w/'decoded/apktool.yml';s=yml.read_text().replace('versionCode: 526360113',f'versionCode: {526360110+a.build_number}').replace('versionName: 26.36.1-tv.3',f'versionName: 26.36.1-tv.{a.build_number}');yml.write_text(s)
    jar('apktool','b',w/'decoded','-o',w/'unsigned.apk')
    credentials=json.loads((a.signing_dir/'credentials.json').read_text())
    signed=w/'signed';signed.mkdir(exist_ok=True)
    jar('signer','-a',w/'unsigned.apk','-o',signed,'--ks',a.signing_dir/'amazon-music-tv.jks','--ksAlias',credentials['alias'],'--ksPass',credentials['password'],'--ksKeyPass',credentials['password'])
    output=w/f'Amazon-Music-TV-26.36.1-tv.{a.build_number}-arm32.apk'
    shutil.copyfile(next(signed.glob('*.apk')),output);print(output)

if __name__=='__main__':main()
