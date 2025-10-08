# i3.11.etcd-3.1.10.sh (binary Install)
#
# https://docs.openstack.org/install-guide/environment-etcd.html
#
# Notes: https://etcd.io/docs/v3.1/install/
#

export PKG="etcd-v3.1.10-linux-amd64"
export PKGDEST="/usr/local"
export PKGLOG_DIR=$OSLOG/3.11
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log
export CONFYMLFILE1=`pwd`/i3.12.etcd.conf.yml
export CONFYMLFILE2=/etc/etcd.conf.yml

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR


groupadd -g 426 etcd            \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
useradd -c "etcd"               \
        -g etcd                 \
        -d /var/lib/etcd        \
        -s /bin/false           \
        -u 426                  \
        etcd                    \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "Extract/Install tar..."
echo "Extract/Install tar..." >> $OSLOG_PROCESS
echo "Extract/Install tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz -C $PKGDEST > $PKGLOG_TAR 2>> $PKGLOG_ERROR

ln -sv $PKGDEST/$PKG/etcd* /usr/bin \
        > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cp -v $CONFYMLFILE1 $CONFYMLFILE2 \
        > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -dm775 /var/lib/etcd         \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -dm777 /var/log/etcd         \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -dm775 /run/etcd             \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -Rv etcd:etcd     /var/{lib,log}/etcd     \
                        /run/etcd               \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


unset CONFYMLFILE1 CONFYMLFILE2
unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL
unset PKGLOG_TAR
unset PKGLOG_ERROR
unset PKGLOG_DIR PKG
unset PKGDEST
