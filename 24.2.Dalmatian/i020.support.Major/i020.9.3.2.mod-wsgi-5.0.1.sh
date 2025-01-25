# i020.9.3.2.mod-wsgi-5.0.1.sh
#
# https://docs.openstack.org/keystone/2024.2/install/
# https://docs.openstack.org/keystone/2024.2/install/keystone-install-ubuntu.html
#
# will download Python App online
#

export PKG="mod-wsgi"
export PKGLOG_DIR=$OSLOG/020.3
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export OSLOG_PROCESS=$OSLOG/process.log

# export APACHE_DATA_DIR=/srv/www
# export APACHE_CONF_DIR=/etc/httpd/
# export APACHE_CONF_FILE=$APACHE_CONF_DIR/httpd.conf
# export APACHE_CONF_EXTRA_DIR=$APACHE_CONF_DIR/extra
# export WSGI_TEST_PYTH_SRC=$PWD/i020.9.3.3.wsgi-test.py
# export WSGI_TEST_PYTH_DST=$APACHE_DATA_DIR/wsgi-test.py
# export WSGI_TEST_CONF_SRC=$PWD/i020.9.3.4.wsgi-test.conf
# export WSGI_TEST_CONF_DST=$APACHE_CONF_EXTRA_DIR/wsgi-test.conf

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR


echo "Pip3 Install ..."
echo "Pip3 Install ..." >> $OSLOG_PROCESS
echo "Pip3 Install ..." >> $PKGLOG_ERROR

pip3 install $PKG > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# cp -v   $WSGI_TEST_PYTH_SRC $WSGI_TEST_PYTH_DST \
#         >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
# cp -v   $WSGI_TEST_CONF_SRC $WSGI_TEST_CONF_DST \
#         >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
# chown -v apache:apache $WSGI_TEST_PYTH_DST $WSGI_TEST_CONF_DST  \
#         >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# cat >> $APACHE_CONF_FILE << "EOF"  2>> $PKGLOG_ERROR

# # add wsgi test configuration file
# Include /etc/httpd/extra/wsgi-test.conf
# EOF


# unset WSGI_TEST_PYTH_SRC
# unset WSGI_TEST_PYTH_DST
# unset WSGI_TEST_CONF_SRC
# unset WSGI_TEST_CONF_DST

# unset APACHE_DATA_DIR
# unset APACHE_CONF_DIR
# unset APACHE_CONF_FILE
# unset APACHE_CONF_EXTRA_DIR

unset OSLOG_PROCESS
unset PKGLOG_INSTALL
unset PKGLOG_ERROR
unset PKGLOG_DIR PKG
