# i020.9.5.etcd-3.5.17.sh (binary Install)
#
# https://docs.openstack.org/install-guide/environment-etcd.html
#
# Notes: https://etcd.io/docs/v3.5/install/
#

export PKG="etcd-v3.5.17-linux-amd64"
export PKGDEST="/usr/local"
export PKGLOG_DIR=$LFSLOG/020.2
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR


echo "Extract/Install tar..."
echo "Extract/Install tar..." >> $LFSLOG_PROCESS
echo "Extract/Install tar..." >> $PKGLOG_ERROR
tar -xvf -C $PKGDEST $PKG.tar.xz  > $PKGLOG_TAR 2>> $PKGLOG_ERROR

#cat > /etc/profile.d/rabbitmq.sh << "EOF"  2>> $PKGLOG_ERROR
# Begin /etc/profile.d/rabbitmq.sh
#
#pathprepend $PKGDEST/sbin			PATH
#
# End /etc/profile.d/rabbitmq.sh
#EOF


unset LFSLOG_PROCESS
unset PKGLOG_TAR
unset PKGLOG_ERROR
unset PKGLOG_DIR PKG
unset PKGDEST
