# i111.5.Nova.rc.d.sh

export PKGLOG_DIR=$OSLOG/111.2
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
INITDFILESRC=$CURRDIR/i111.4.Nova.init.d.sh
INITDFILEDST=${EXTDIR}/rc.d/init.d/nova
INITDFILEREL=../init.d/nova


echo "Install Init.d/rc.d ..."
echo "Install Init.d/rc.d ..." >> $OSLOG_PROCESS
echo "Install Init.d/rc.d ..." >> $PKGLOG_ERROR

   cp -v $INITDFILESRC $INITDFILEDST      \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
   chmod -v ${MODE} $INITDFILEDST         \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

	ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc0.d/K06nova   \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
	ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc3.d/S94nova   \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
	ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc6.d/K06nova   \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_INITD
unset PKGLOG_ERROR
unset PKGLOG_DIR
