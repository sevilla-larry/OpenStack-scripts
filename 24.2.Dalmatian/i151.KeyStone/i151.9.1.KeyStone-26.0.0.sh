# i151.9.1.KeyStone-26.0.0.sh
#
# https://docs.openstack.org/keystone/2024.2/install/keystone-install-ubuntu.html
#

export PKG="keystone-26.0.0"
export PKGLOG_DIR=$LFSLOG/151.1
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Pip3 Install ..."
echo "2. Pip3 Install ..." >> $LFSLOG_PROCESS
echo "2. Pip3 Install ..." >> $PKGLOG_ERROR
pip3 install . > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
