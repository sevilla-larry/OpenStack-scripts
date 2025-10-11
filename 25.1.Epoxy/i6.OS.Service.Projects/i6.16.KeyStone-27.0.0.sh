# i6.16.KeyStone-27.0.0
#
# https://docs.openstack.org/keystone/2025.1/install/keystone-install-ubuntu.html
#

#
# Dependencies Required:
#
#               i3.1.01 pbr-6.1.1
#               i1.1.21 WebOb-1.8.9
#               i1.1.26 Flask-3.1.2
#               i1.1.28 Flask-RESTful-0.3.10
#               i1.1.03 cryptography-43.0.3
#               i1.1.30 SQLAlchemy-2.0.43
#               i4.1.20 stevedore-5.4.1
#               i5.16   python-keystoneclient-5.6.0
#               i4.2.07 keystonemiddleware-10.9.0
#               i1.1.33 bcrypt-4.0.1
#               i1.1.34 scrypt-0.8.29
#               i4.2.31 oslo.cache-3.10.2
#               i4.1.33 oslo.config-9.7.1
#               i4.1.34 oslo.context-5.7.1
#               i4.1.39 oslo.messaging-16.1.0
#               i4.2.35 oslo.db-17.2.1
#               i4.1.36 oslo.i18n-6.5.1
#               i4.1.38 oslo.log-7.1.0
#               i4.1.41 oslo.middleware-6.3.1
#               i4.1.42 oslo.policy-4.5.1
#               i4.1.46 oslo.serialization-5.7.0
#               i4.1.48 oslo.upgradecheck-2.5.0
#               i4.1.49 oslo.utils-8.2.0
#               i1.1.50 oauthlib-3.2.2
#               i1.1.55 pysaml2-7.5.4
#               i1.1.32 PyJWT-2.10.1
#               i1.2.01 dogpile.cache-1.3.4
#               i1.1.59 jsonschema-4.23.0
#               i3.2.01 pycadf-4.0.1
#               b30.13.24.17 Msgpack-1.1.1
#               i3.2.02 osprofiler-4.2.0
#

export PKG="keystone-27.0.0"
export PKGLOG_DIR=$OSLOG/6.16
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log
export SOURCES=`pwd`
#export SOURCES_DIR=$PWD

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
                        /var/{lib,log}/keystone \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


export APACHE_CONF_DIR=/etc/httpd
export APACHE_CONF_FILE=$APACHE_CONF_DIR/httpd.conf
export APACHE_CONF_EXTRA_DIR=$APACHE_CONF_DIR/extra

export KEYSTONE_CONF_FOR_APACHE_SRC=$SOURCES/i6.16.KeyStone.conf.for.Apache.txt
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


cd $SOURCES
rm -rf $PKG
unset SOURCES
#unset SOURCES_DIR
unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
