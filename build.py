#!/usr/bin/env python3
"""Rebuild the private ARM32 TV adaptation from the exact user-supplied APKM."""
import argparse, hashlib, json, os, shutil, subprocess, zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent
INPUT_SHA256 = '7c95fc6caf61f7ad27ce45e66bd96a2bf58637534c671182cd07e4df87d451bb'

def run(args):
    result = subprocess.run([str(x) for x in args], capture_output=True, text=True)
    if result.returncode:
        raise RuntimeError(result.stdout + result.stderr)
    return result.stdout

def main():
    p = argparse.ArgumentParser()
    p.add_argument('bundle', type=Path)
    p.add_argument('--tools', required=True, type=Path)
    p.add_argument('--tv-apk', required=True, type=Path)
    p.add_argument('--signing-dir', default=ROOT/'signing', type=Path)
    p.add_argument('--work', default=ROOT/'build', type=Path)
    p.add_argument('--build-number', default=5, type=int)
    a = p.parse_args()
    if a.build_number < 1: raise ValueError('Build number must be positive')
    if hashlib.file_digest(a.bundle.open('rb'),'sha256').hexdigest() != INPUT_SHA256:
        raise ValueError('Input differs from the inspected 26.36.1 universal APKM')
    w=a.work.resolve();w.mkdir(parents=True,exist_ok=True)
    tools=a.tools.resolve()
    def jar(name,*args):return run(['java','-Xmx2g','-jar',tools/(name+'.jar'),*args])
    split=w/'splits';split.mkdir(exist_ok=True)
    with zipfile.ZipFile(a.bundle) as z:
        for n in ['base.apk','split_config.armeabi_v7a.apk','split_config.tvdpi.apk']:z.extract(n,split)
    jar('apkeditor','m','-i',split,'-o',w/'merged.apk','-extractNativeLibs','true','-clean-meta','-f')
    jar('apktool','d','-f','-s',w/'merged.apk','-o',w/'decoded')
    jar('apktool','d','-f','-s',a.tv_apk,'-o',w/'tv-reference')
    from port_tv_resources import generate
    generate(w/'tv-reference',w/'tv-port')
    shutil.copytree(w/'tv-port/res',w/'decoded/res',dirs_exist_ok=True)
    shutil.copytree(w/'tv-port/assets',w/'decoded/assets',dirs_exist_ok=True)
    shutil.copytree(ROOT/'res',w/'decoded/res',dirs_exist_ok=True)
    with zipfile.ZipFile(split/'base.apk') as z:(w/'primary.dex').write_bytes(z.read('classes.dex'))
    primary=w/'smali'
    if primary.exists():shutil.rmtree(primary)
    run(['java','-Xmx2g','-cp',tools/'apkeditor.jar','org.jf.baksmali.Main','d','--api','31',w/'primary.dex','-o',primary])
    shutil.copytree(ROOT/'patches',primary,dirs_exist_ok=True)
    run(['java','-Xmx2g','-cp',tools/'apkeditor.jar','org.jf.smali.Main','a','--api','31',primary,'-o',w/'decoded/classes.dex'])
    with zipfile.ZipFile(split/'base.apk') as z:(w/'engine15.dex').write_bytes(z.read('classes15.dex'))
    engine=w/'smali15'
    if engine.exists():shutil.rmtree(engine)
    run(['java','-Xmx2g','-cp',tools/'apkeditor.jar','org.jf.baksmali.Main','d','--api','31',w/'engine15.dex','-o',engine])
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
    banner=w/'decoded/res/drawable-xhdpi/amazon_music_tv_banner.png';banner.parent.mkdir(parents=True,exist_ok=True)
    shutil.copyfile(ROOT/'assets/amazon_music_tv_banner.png',banner)
    yml=w/'decoded/apktool.yml';s=yml.read_text().replace('versionCode: 526360110',f'versionCode: {526360110+a.build_number}').replace('versionName: 26.36.1',f'versionName: 26.36.1-tv.{a.build_number}');yml.write_text(s)
    jar('apktool','b',w/'decoded','-o',w/'unsigned.apk')
    credentials=json.loads((a.signing_dir/'credentials.json').read_text())
    output=w/'signed';output.mkdir(exist_ok=True)
    jar('signer','-a',w/'unsigned.apk','-o',output,'--ks',a.signing_dir/'amazon-music-tv.jks','--ksAlias',credentials['alias'],'--ksPass',credentials['password'],'--ksKeyPass',credentials['password'])
    signed=next(output.glob('*.apk'))
    dest=w/f'Amazon-Music-TV-26.36.1-tv.{a.build_number}-arm32.apk';shutil.copyfile(signed,dest)
    print(dest)

if __name__=='__main__':main()


