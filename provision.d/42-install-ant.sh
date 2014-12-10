#!/bin/bash
set -e

ANT_VERSION=1.9.4

ANT_ARCHIVE_FILENAME=apache-ant-${ANT_VERSION}-bin.tar.gz
ANT_HOME=/opt/$(echo $ANT_ARCHIVE_FILENAME | sed -e 's,-bin\.tar\.gz$,,')
ANT_ARCHIVE_URL=https://dist.apache.org/repos/dist/release/ant/binaries/${ANT_ARCHIVE_FILENAME}
ANT_ARCHIVE_LOCAL_CACHE=/vagrant/cache/$ANT_ARCHIVE_FILENAME
ANT_PROFILE_FILENAME=/etc/profile.d/ant.sh

[[ -e $ANT_ARCHIVE_LOCAL_CACHE ]] || \
wget --quiet -O $ANT_ARCHIVE_LOCAL_CACHE $ANT_ARCHIVE_URL

tar -C $(dirname $ANT_HOME) -zxf $ANT_ARCHIVE_LOCAL_CACHE

cat > $ANT_PROFILE_FILENAME <<EOF
export ANT_HOME=$ANT_HOME
export PATH=\$ANT_HOME/bin:\$PATH
EOF
