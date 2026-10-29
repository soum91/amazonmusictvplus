#!/usr/bin/env python3
"""Rebuild the UI and read-only AudioTrack probe from a verified signed APK."""
import argparse,hashlib,json,shutil,zipfile
from pathlib import Path
from build import ROOT,run

def main():
    p=argparse.ArgumentParser()
    p.add_argument('base_apk',type=Path)
    p.add_argument('--tools',required=True,type=Path)
    p.add_argument('--signing-dir',required=True,type=Path)
    p.add_argument('--work',default=ROOT/'build',type=Path)
    p.add_argument('--build-number',default=10,type=int)
    a=p.parse_args()
    versions={'37a491724d86ac37292a167a308c279c13730cbe95c11b2aa79257444754a736':3,'8620a8037b20fca056fc7b41f5fa71e9cc63a63941c890edc04b68ae00a5fcf0':4,'9593a8d9527a2f5761511a9d7dbbaf58af4565de26b34e25966c7f0bde40dccb':5,'4a9330fda584750703a26f65ae63f84b2d1526134cd5e47c79b1afaa0e4b76cc':6,'05f85284ac605ca495882a3396010e61d6d93774a8b44be612f24f1ff0b62d8e':7,'eea021d6ac592e1fe244f4408b8a997d41f4b064140259484e13b43c94114875':8,'2e7753d64d56b60f090151a77ad9262c0125e6854d12c01ef46a186868ec21b3':9}
    version=versions.get(hashlib.file_digest(a.base_apk.open('rb'),'sha256').hexdigest())
    if version is None:raise ValueError('Expected a verified signed build 3 through 9 APK')
    if a.build_number<=version:raise ValueError('Update version must exceed the base APK version')
    tools=a.tools.resolve();w=a.work.resolve();w.mkdir(parents=True,exist_ok=True)
    def jar(name,*args):return run(['java','-Xmx2g','-jar',tools/(name+'.jar'),*args])
    jar('apktool','d','-f','-s',a.base_apk,'-o',w/'decoded')
    if version==3:
        engine=w/'smali15'
        run(['java','-Xmx2g','-cp',tools/'apkeditor.jar','org.jf.baksmali.Main','d','--api','31',w/'decoded/classes15.dex','-o',engine])
        shutil.copytree(ROOT/'patches15',engine,dirs_exist_ok=True)
        run(['java','-Xmx2g','-cp',tools/'apkeditor.jar','org.jf.smali.Main','a','--api','31',engine,'-o',w/'decoded/classes15.dex'])
    if version>=8:
        engine=w/'smali15-leveler'
        run(['java','-Xmx2g','-cp',tools/'apkeditor.jar','org.jf.baksmali.Main','d','--api','31',w/'decoded/classes15.dex','-o',engine])
        shutil.copytree(ROOT/'patches15_leveler',engine,dirs_exist_ok=True)
        run(['java','-Xmx2g','-cp',tools/'apkeditor.jar','org.jf.smali.Main','a','--api','31',engine,'-o',w/'decoded/classes15.dex'])
    # Build 4 already has the observer; preserve its playback dex byte-for-byte.
    compiled=w/'compiled';compiled.mkdir(exist_ok=True)
    jar('ecj','-8','-nowarn','-classpath',tools/'android.jar','-d',compiled,*sorted((ROOT/'src').rglob('*.java')))
    with zipfile.ZipFile(w/'ui.jar','w') as z:
        for f in compiled.rglob('*.class'):z.write(f,str(f.relative_to(compiled)))
    dex=w/'ui-dex';dex.mkdir(exist_ok=True)
    run(['java','-cp',tools/'r8.jar','com.android.tools.r8.D8','--min-api','29','--lib',tools/'android.jar','--output',dex,w/'ui.jar'])
    shutil.copyfile(dex/'classes.dex',w/'decoded/classes18.dex')
    shutil.copyfile(ROOT/'AndroidManifest.xml',w/'decoded/AndroidManifest.xml')
    shutil.copytree(ROOT/'res',w/'decoded/res',dirs_exist_ok=True)
    yml=w/'decoded/apktool.yml';s=yml.read_text().replace(f'versionCode: {526360110+version}',f'versionCode: {526360110+a.build_number}').replace(f'versionName: 26.36.1-tv.{version}',f'versionName: 26.36.1-tv.{a.build_number}');yml.write_text(s)
    jar('apktool','b',w/'decoded','-o',w/'unsigned.apk')
    credentials=json.loads((a.signing_dir/'credentials.json').read_text())
    signed=w/'signed';signed.mkdir(exist_ok=True)
    jar('signer','-a',w/'unsigned.apk','-o',signed,'--ks',a.signing_dir/'amazon-music-tv.jks','--ksAlias',credentials['alias'],'--ksPass',credentials['password'],'--ksKeyPass',credentials['password'])
    output=w/f'Amazon-Music-TV-26.36.1-tv.{a.build_number}-arm32.apk'
    shutil.copyfile(next(signed.glob('*.apk')),output);print(output)

if __name__=='__main__':main()



