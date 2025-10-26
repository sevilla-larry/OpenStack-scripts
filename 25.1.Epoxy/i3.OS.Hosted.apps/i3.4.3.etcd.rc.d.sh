# i3.4.3.etcd.rc.d.sh

export PKGLOG_DIR=$OSLOG/3.4.3
export PKGLOG_INITD=$PKGLOG_DIR/initd.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

SHELL=/bin/bash
ETCDIR=/etc
LIBDIR=${DESTDIR}/lib/services
EXTDIR=${DESTDIR}${ETCDIR}
INITMODE=755
DIRMODE=755
CONFMODE=644
CURRDIR=`pwd`
INITDFILESRC=$CURRDIR/i3.4.4.etcd.init.d.sh
INITDFILEDST=${EXTDIR}/rc.d/init.d/etcd
INITDFILEREL=../init.d/etcd


echo "Install Init.d/rc.d ..."
echo "Install Init.d/rc.d ..." >> $OSLOG_PROCESS
echo "Install Init.d/rc.d ..." >> $PKGLOG_ERROR

cp -v $INITDFILESRC $INITDFILEDST      \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

chmod -v ${INITMODE} $INITDFILEDST     \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc0.d/K22etcd  \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
#ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc1.d/K22etcd  \
#      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
#ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc2.d/S78etcd  \
#      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc3.d/S78etcd  \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
#ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc4.d/S78etcd  \
#      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
#ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc5.d/S78etcd  \
#      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc6.d/K22etcd  \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

cat >> /etc/rc.d/rc3.d/15runowner << "EOF"    2>> $PKGLOG_ERROR

install -d -m 2755 -o etcd -g etcd /var/run/etcd

EOF

chmod -v 777 /etc/rc.d/rc3.d/15runowner   \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_INITD
unset PKGLOG_ERROR
unset PKGLOG_DIR
