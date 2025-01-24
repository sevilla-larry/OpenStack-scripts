# i151.9.9.KeyStone-26.0.0.sh
#
# https://docs.openstack.org/keystone/2024.2/install/keystone-install-ubuntu.html
#

export PKG="keystone-26.0.0"
export PKGLOG_DIR=$LFSLOG/151.9
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES_DIR=$PWD

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
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

echo "2. Pip3 Install ..."
echo "2. Pip3 Install ..." >> $LFSLOG_PROCESS
echo "2. Pip3 Install ..." >> $PKGLOG_ERROR
pip3 install . > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -d -m755 /etc/keystone               \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/lib/keystone           \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/log/keystone           \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -v   ../keystone.conf.sample                 \
        /etc/keystone/keystone.conf             \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
chown -vR keystone:keystone /etc/keystone       \
                        /var/lib/keystone       \
                        /var/log/keystone       \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# export APACHE_CONF_DIR=/etc/httpd/
# export APACHE_CONF_FILE=$APACHE_CONF_DIR/httpd.conf
# export APACHE_CONF_EXTRA_DIR=$APACHE_CONF_DIR/extra

# export KEYSTONE_CONF_FOR_APACHE_SRC=$SOURCES_DIR/i151.9.3.KeyStone.conf.for.Apache.txt
# export KEYSTONE_CONF_FOR_APACHE_DST=$APACHE_CONF_EXTRA_DIR/keystone.conf

# cp -v   $KEYSTONE_CONF_FOR_APACHE_SRC   \
#         $KEYSTONE_CONF_FOR_APACHE_DST   \
#         >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# chown -v apache:apache $KEYSTONE_CONF_FOR_APACHE_DST    \
#     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# cat >> $APACHE_CONF_FILE << "EOF"  2>> $PKGLOG_ERROR

# # add wsgi KeyStone configuration file
# Include /etc/httpd/extra/keystone.conf
# EOF

# unset APACHE_CONF_DIR
# unset APACHE_CONF_FILE
# unset APACHE_CONF_EXTRA_DIR


cd ..
rm -rf $PKG
unset SOURCES_DIR
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
