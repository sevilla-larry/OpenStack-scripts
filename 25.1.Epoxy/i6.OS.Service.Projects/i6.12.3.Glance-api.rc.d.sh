# i6.12.3.Glance-api.rc.d.sh

export PKGLOG_DIR=$OSLOG/6.12.3
export PKGLOG_INITD=$PKGLOG_DIR/initd.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

SHELL=/bin/bash
ETCDIR=/etc
LIBDIR=${DESTDIR}/lib/services
EXTDIR=${DESTDIR}${ETCDIR}
MODE=755
CURRDIR=`pwd`
INITDFILESRC=$CURRDIR/i6.12.5.Glance-api.init.d.sh
INITDFILEDST=${EXTDIR}/rc.d/init.d/glance-api
INITDFILEREL=../init.d/glance-api


echo "Install Init.d/rc.d ..."
echo "Install Init.d/rc.d ..." >> $OSLOG_PROCESS
echo "Install Init.d/rc.d ..." >> $PKGLOG_ERROR

cp -v $INITDFILESRC $INITDFILEDST      \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
chmod -v ${MODE} $INITDFILEDST         \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc0.d/K09glance-api \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc3.d/S91glance-api \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc6.d/K09glance-api \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_INITD
unset PKGLOG_ERROR
unset PKGLOG_DIR
