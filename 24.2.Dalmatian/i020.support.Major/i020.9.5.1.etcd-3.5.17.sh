# i020.9.5.etcd-3.5.17.sh (binary Install)
#
# https://docs.openstack.org/install-guide/environment-etcd.html
#
# Notes: https://etcd.io/docs/v3.5/install/
#

export PKG="etcd-v3.5.17-linux-amd64"
export PKGDEST="/usr/local"
export PKGLOG_DIR=$LFSLOG/020.5
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export YMLFILE=`pwd`/i020.9.5.2.etcd.conf.yml

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR


echo "Extract/Install tar..."
echo "Extract/Install tar..." >> $LFSLOG_PROCESS
echo "Extract/Install tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz -C $PKGDEST > $PKGLOG_TAR 2>> $PKGLOG_ERROR

ln -sv $PKGDEST/$PKG/etcd* /usr/bin \
        > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cp -v $YMLFILE /etc \
        > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR



unset YMLFILE
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL
unset PKGLOG_TAR
unset PKGLOG_ERROR
unset PKGLOG_DIR PKG
unset PKGDEST
