# i2.4.2.openvswitch-switch.rc.d.sh

export PKGLOG_DIR=$OSLOG/2.4.2
export PKGLOG_INITD=$PKGLOG_DIR/initd.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

SHELL=/bin/bash
ETCDIR=/etc
LIBDIR=${DESTDIR}/lib/services
EXTDIR=${DESTDIR}${ETCDIR}
MODE=754
DIRMODE=755
CONFMODE=644
CURRDIR=`pwd`
INITDFILESRC=$CURRDIR/i2.4.3.openvswitch-switch.init.d.sh
INITDFILEDST=${EXTDIR}/rc.d/init.d/openvswitch-switch
INITDFILEREL=../init.d/openvswitch-switch


echo "Install Init.d/rc.d ..."
echo "Install Init.d/rc.d ..." >> $OSLOG_PROCESS
echo "Install Init.d/rc.d ..." >> $PKGLOG_ERROR

cp -v $INITDFILESRC $INITDFILEDST      \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
chmod -v ${MODE} $INITDFILEDST         \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc0.d/K75openvswitch-switch \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc3.d/S25openvswitch-switch  \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc6.d/K75openvswitch-switch  \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_INITD
unset PKGLOG_ERROR
unset PKGLOG_DIR
