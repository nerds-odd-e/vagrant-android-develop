#!/bin/bash
set -e

WORDPRESS_HOME=/vagrant/wordpress
WORDPRESS_USER=vagrant

cd /vagrant

WORDPRESS_ARCHIVE=cache/latest.tar.gz
if [ ! -e $WORDPRESS_ARCHIVE ]; then
    wget -O $WORDPRESS_ARCHIVE https://wordpress.org/latest.tar.gz
fi

[ -f wordpress/index.php ] && git status --ignored -s wordpress | grep '^!!' | cut -d' ' -f2 | xargs -- rm -r
tar -zxf $WORDPRESS_ARCHIVE

cp -f wordpress.conf /etc/apache2/sites-available/
a2dissite 000-default.conf
a2ensite wordpress.conf
a2enmod rewrite
service apache2 restart


echo "Install wp-cli ..."

WP_CLI_HOME=/opt/wp-cli
WP_CLI_CMD=$WP_CLI_HOME/wp
WP_CLI_CONFIG_PATH=$WP_CLI_HOME/config.yml

mkdir -p $WP_CLI_HOME
if [[ ! -e $WP_CLI_CMD ]]; then
    wget --quiet -O /tmp/wp https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    mv /tmp/wp $WP_CLI_CMD
    chmod +x $WP_CLI_CMD
fi

cat > $WP_CLI_CONFIG_PATH <<EOF
path: $WORDPRESS_HOME
color: false
core config:
    dbuser: root
    dbpass:
EOF

cat > /etc/profile.d/wp-cli.sh <<EOF
export WP_CLI_CONFIG_PATH=$WP_CLI_CONFIG_PATH
export PATH=$WP_CLI_HOME:\$PATH
EOF

cat >> /etc/motd <<EOF
WordPress:
    URL: http://wordpress.local
    Username: odd-e
    Passowrd: s3cr3t

EOF

cat > /usr/bin/wordpress_set_url <<EOF
#!/bin/bash
set -ex

if [[ "0" != \$(id -u) ]]; then
    sudo \$0 "\$@"
    exit $?
fi

WORDPRESS_URL=\${1:-http://wordpress.local}

WP_CLI_OPTS='--allow-root --path=$WORDPRESS_HOME'

[[ "\$WORDPRESS_URL" == "\$($WP_CLI_CMD \$WP_CLI_OPTS option get siteurl)" ]] \
&& [[ "\$($WP_CLI_CMD \$WP_CLI_OPTS option get siteurl)" == "\$($WP_CLI_CMD \$WP_CLI_OPTS option get home)" ]] \
&& exit 0

echo "
$WP_CLI_CMD \$WP_CLI_OPTS option update siteurl '\$WORDPRESS_URL'
$WP_CLI_CMD \$WP_CLI_OPTS option update home    '\$WORDPRESS_URL'
" | su -lc /bin/bash $WORDPRESS_USER

sudo sed -i -e "/URL:/{a\ \ \ \ URL: \${WORDPRESS_URL}
;d}" /etc/motd
EOF

cat > /usr/bin/wordpress_use_ip <<EOF
#!/bin/bash
set -ex

WORDPRESS_URL="http://\$(/sbin/ifconfig | fgrep 'inet addr' | fgrep -v 10.0.2 | fgrep -v 127.0.0 | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -1)/"

wordpress_set_url "\$WORDPRESS_URL"
EOF

cat > /usr/bin/wordpress_use_url <<EOF
#!/bin/bash
set -ex

wordpress_set_url "http://\$(hostname -f)"
EOF

chmod +x /usr/bin/wordpress_*

su -lc /bin/bash vagrant <<EOF
echo "Update WordPress ..."

/usr/bin/wordpress_use_url

$WP_CLI_CMD core update-db
$WP_CLI_CMD plugin update --all
$WP_CLI_CMD theme  update --all

EOF
