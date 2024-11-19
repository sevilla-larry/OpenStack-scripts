# i020.9.3.2.mod-wsgi-5.0.1.sh
#
# https://docs.openstack.org/keystone/2024.2/install/
# https://docs.openstack.org/keystone/2024.2/install/keystone-install-ubuntu.html
#
# will download Python App online
#

export PKG="mod-wsgi"
export PKGLOG_DIR=$LFSLOG/020.3
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR


echo "Pip3 Install ..."
echo "Pip3 Install ..." >> $LFSLOG_PROCESS
echo "Pip3 Install ..." >> $PKGLOG_ERROR

pip3 install $PKG > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


unset LFSLOG_PROCESS
unset PKGLOG_INSTALL
unset PKGLOG_ERROR
unset PKGLOG_DIR PKG
