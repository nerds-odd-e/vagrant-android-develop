#!/bin/bash
set -e

echo "Install Android SDK ..."

ANDROID_SDK_FILENAME=android-sdk_r23.0.2-linux.tgz

ANDROID_HOME=/opt/android-sdk-linux
ANDROID_SDK_URL=http://dl.google.com/android/$ANDROID_SDK_FILENAME
ANDROID_SDK_LOCAL_CACHE=/vagrant/cache/$ANDROID_SDK_FILENAME
ANDROID_SDK_PACKAGES_LOCAL_CACHE=/vagrant/cache/android-sdk-packages.tgz
ANDROID_PROFILE_FILENAME=/etc/profile.d/android.sh

[[ "i686" == $(uname -i) ]] || apt-get install -y libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1

[[ -e $ANDROID_SDK_LOCAL_CACHE ]] || \
wget --quiet -O $ANDROID_SDK_LOCAL_CACHE $ANDROID_SDK_URL

[[ -e $ANDROID_PROFILE_FILENAME ]] || rm -rf $ANDROID_HOME

[[ -d $ANDROID_HOME ]] && exit 0

tar -C /opt -zxf $ANDROID_SDK_LOCAL_CACHE
chown -R root:root $ANDROID_HOME
find $ANDROID_HOME -exec chmod go+r {} \;
find $ANDROID_HOME -type d -exec chmod go+x {} \;
find $ANDROID_HOME -type f -executable -exec chmod go+x {} \;

echo "Install Android SDK Packages ..."

if [[ -f $ANDROID_SDK_PACKAGES_LOCAL_CACHE ]]; then
    tar -C $ANDROID_HOME -zxf $ANDROID_SDK_PACKAGES_LOCAL_CACHE
else
    apt-get install -y expect
    expect -i <<EOF
set timeout -1   ;

spawn $ANDROID_HOME/tools/android --silent update sdk --no-ui --all --filter "tools,platform-tools,build-tools-19.1.0,android-19,extra-android-m2repository,extra-android-support,extra-google-m2repository"

expect {
    "Do you accept the license" { exp_send "y\r" ; exp_continue }
    eof
}
EOF
    tar -C /opt/android-sdk-linux -zcf $ANDROID_SDK_PACKAGES_LOCAL_CACHE build-tools/ extras/ platforms platform-tools/
fi

# run adb command as root
chmod +s $ANDROID_HOME/platform-tools/adb

cat > $ANDROID_PROFILE_FILENAME <<EOF
export ANDROID_HOME=$ANDROID_HOME
export PATH=\$ANDROID_HOME/tools:\$ANDROID_HOME/platform-tools:\$PATH
EOF
