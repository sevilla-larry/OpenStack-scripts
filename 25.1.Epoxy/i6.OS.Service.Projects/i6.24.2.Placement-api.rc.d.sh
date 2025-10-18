# i6.24.2.Placement-api.rc.d.sh

export PKGLOG_DIR=$OSLOG/6.24.2
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
INITDFILESRC=$CURRDIR/i6.24.3.Placement-api.init.d.sh
INITDFILEDST=${EXTDIR}/rc.d/init.d/placement
INITDFILEREL=../init.d/placement


echo "Install Init.d/rc.d ..."
echo "Install Init.d/rc.d ..." >> $OSLOG_PROCESS
echo "Install Init.d/rc.d ..." >> $PKGLOG_ERROR

cp -v $INITDFILESRC $INITDFILEDST      \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
chmod -v ${MODE} $INITDFILEDST         \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc0.d/K07placement    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc3.d/S93placement    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc6.d/K07placement    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_INITD
unset PKGLOG_ERROR
unset PKGLOG_DIR
