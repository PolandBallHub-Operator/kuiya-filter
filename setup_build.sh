#!/usr/bin/env bash
set -e
cd /home/ubuntu/KuiyaFilter
mkdir -p /home/ubuntu/android-sdk/cmdline-tools
if [ ! -x /home/ubuntu/gradle-8.10.2/bin/gradle ]; then
  curl -L -o /tmp/gradle.zip https://services.gradle.org/distributions/gradle-8.10.2-bin.zip
  unzip -q -o /tmp/gradle.zip -d /home/ubuntu
fi
if [ ! -x /home/ubuntu/android-sdk/cmdline-tools/latest/bin/sdkmanager ]; then
  curl -L -o /tmp/cmdline.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
  mkdir -p /home/ubuntu/android-sdk/cmdline-tools/latest
  unzip -q -o /tmp/cmdline.zip -d /tmp/android-tools
  cp -r /tmp/android-tools/cmdline-tools/* /home/ubuntu/android-sdk/cmdline-tools/latest/
fi
export ANDROID_HOME=/home/ubuntu/android-sdk
yes | /home/ubuntu/android-sdk/cmdline-tools/latest/bin/sdkmanager --licenses >/dev/null || true
/home/ubuntu/android-sdk/cmdline-tools/latest/bin/sdkmanager "platform-tools" "platforms;android-35" "build-tools;35.0.0"
/home/ubuntu/gradle-8.10.2/bin/gradle --no-daemon assembleDebug
