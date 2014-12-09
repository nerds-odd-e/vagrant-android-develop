#!/bin/bash
set -e

GRADLE_ARCHIVE_FILENAME=gradle-2.2.1-bin.zip

GRADLE_HOME=/opt/$(echo $GRADLE_ARCHIVE_FILENAME | sed -e 's,-bin\.zip$,,')
GRADLE_ARCHIVE_URL=https://services.gradle.org/distributions/$GRADLE_ARCHIVE_FILENAME
GRADLE_ARCHIVE_LOCAL_CACHE=/vagrant/cache/$GRADLE_ARCHIVE_FILENAME
GRADLE_PROFILE_FILENAME=/etc/profile.d/gradle.sh

[[ -e $GRADLE_ARCHIVE_LOCAL_CACHE ]] || \
wget --quiet -O $GRADLE_ARCHIVE_LOCAL_CACHE $GRADLE_ARCHIVE_URL

[[ -d $GRADLE_HOME ]] && [[ -e $GRADLE_PROFILE_FILENAME ]] && exit 0

apt-get install -y unzip

cd $(dirname $GRADLE_HOME)
unzip $GRADLE_ARCHIVE_LOCAL_CACHE

cat > $GRADLE_PROFILE_FILENAME <<EOF
export GRADLE_HOME=$GRADLE_HOME
export PATH=\$GRADLE_HOME/bin:\$PATH
EOF
