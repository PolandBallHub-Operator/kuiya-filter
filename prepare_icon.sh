#!/usr/bin/env bash
set -e
cd /home/ubuntu/KuiyaFilter
mkdir -p app/src/main/res/drawable app/src/main/res/mipmap-anydpi-v26 app/src/main/res/mipmap-hdpi app/src/main/res/values
unzip -o '/home/ubuntu/upload/クイヤicon.zip' -d /tmp/kuiya-icon >/dev/null
cp /tmp/kuiya-icon/foreground.png app/src/main/res/drawable/kuiya_foreground.png
cp /tmp/kuiya-icon/monochrome.png app/src/main/res/drawable/kuiya_monochrome.png
cp /tmp/kuiya-icon/foreground.png app/src/main/res/mipmap-hdpi/ic_launcher.png
