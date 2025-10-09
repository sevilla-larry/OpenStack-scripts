# i151.9.3.KeyStone-26.0.0.sh
#
# https://docs.openstack.org/keystone/2024.2/install/keystone-install-ubuntu.html
#

#
# Dependencies Required:
#
#               i020.9.01 pbr-6.1.0
#               i060.9.02 WebOb-1.8.7
#               i095.9.05 flask-3.0.3
#               i095.9.07 Flask-RESTful-0.3.10
#               i010.9.03 cryptography-41.0.7
#               i060.9.19 sqlalchemy-2.0.37
#               i020.9.02 stevedore-5.3.0
#               i095.9.08 passlib-1.7.4
#               i040.9.11 python-keystoneclient-5.5.0
#               i090.9.02 keystonemiddleware-10.7.1
#               i060.9.12 bcrypt-4.2.0
#               i095.9.09 scrypt-0.8.27
#               i080.9.01 oslo.cache-3.8.0
#               i030.9.03 oslo.config-9.6.0
#               i030.9.05 oslo.context-5.6.0
#               i080.9.06 oslo.messaging-14.9.1
#               i080.9.07 oslo.db-16.0.0
#               i030.9.01 oslo.i18n-6.4.0
#               i030.9.06 oslo.log-6.1.2
#               i080.9.04 oslo.middleware-6.2.0
#               i080.9.08 oslo.policy-4.4.0
#               i030.9.04 oslo.serialization-5.5.0
#               i080.9.09 oslo.upgradecheck-2.4.0
#               i030.9.02 oslo.utils-7.3.0
#               i095.9.10 oauthlib-3.2.2
#               i095.9.14 pysaml2-7.5.0
#               i060.9.25 PyJWT-2.9.0
#               i025.9.01 dogpile.cache-1.3.3
#               i010.9.24 jsonschema-4.23.0
#               i090.9.01 pycadf-3.1.1
#               b30.13.24.17 Msgpack-1.0.8
#               i090.9.03 osprofiler-4.2.0
#

export PKG="keystone-26.0.0"
export PKGLOG_DIR=$OSLOG/151
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log
export SOURCES_DIR=$PWD

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $OSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


groupadd -g 445 keystone        \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
useradd -c "keystone"           \
        -g keystone             \
        -d /var/lib/keystone    \
        -s /usr/sbin/nologin    \
        -u 445                  \
        keystone                \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. pip3 Build ..."
echo "2. pip3 Build ..." >> $OSLOG_PROCESS
echo "2. pip3 Build ..." >> $PKGLOG_ERROR
pip3 wheel  -w dist                 \
            --no-cache-dir          \
            --no-build-isolation    \
            --no-deps               \
            $PWD                    \
            > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. pip3 Install ..."
echo "3. pip3 Install ..." >> $OSLOG_PROCESS
echo "3. pip3 Install ..." >> $PKGLOG_ERROR
pip3 install    --no-index              \
                --no-user               \
                --find-links dist       \
                --no-cache-dir          \
                keystone                \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -d -m755 /etc/keystone               \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/lib/keystone           \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/log/keystone           \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -v   ../keystone.conf.sample                 \
        /etc/keystone/keystone.conf             \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -v   etc/logging.conf.sample                 \
        /etc/keystone/logging.conf             \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
chown -vR keystone:keystone /etc/keystone       \
                        /var/lib/keystone       \
                        /var/log/keystone       \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


export APACHE_CONF_DIR=/etc/httpd
export APACHE_CONF_FILE=$APACHE_CONF_DIR/httpd.conf
export APACHE_CONF_EXTRA_DIR=$APACHE_CONF_DIR/extra

export KEYSTONE_CONF_FOR_APACHE_SRC=$SOURCES_DIR/i151.6.KeyStone.conf.for.Apache.txt
export KEYSTONE_CONF_FOR_APACHE_DST=$APACHE_CONF_EXTRA_DIR/keystone.conf

cp -v   $KEYSTONE_CONF_FOR_APACHE_SRC   \
        $KEYSTONE_CONF_FOR_APACHE_DST   \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

chown -v apache:apache $KEYSTONE_CONF_FOR_APACHE_DST    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cat >> $APACHE_CONF_FILE << "EOF"  2>> $PKGLOG_ERROR

# add wsgi KeyStone configuration file
Include /etc/httpd/extra/keystone.conf
EOF

unset APACHE_CONF_DIR
unset APACHE_CONF_FILE
unset APACHE_CONF_EXTRA_DIR

unset KEYSTONE_CONF_FOR_APACHE_SRC
unset KEYSTONE_CONF_FOR_APACHE_DST


cd ..
rm -rf $PKG
unset SOURCES_DIR
unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
