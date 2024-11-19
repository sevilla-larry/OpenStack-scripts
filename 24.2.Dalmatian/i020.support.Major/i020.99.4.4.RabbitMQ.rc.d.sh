# i020.9.4.4.RabbitMQ.rc.d.sh

export PKGLOG_DIR=$LFSLOG/020.4
export PKGLOG_INITD=$PKGLOG_DIR/initd.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

SHELL=/bin/bash
ETCDIR=/etc
LIBDIR=${DESTDIR}/lib/services
EXTDIR=${DESTDIR}${ETCDIR}
MODE=754
DIRMODE=755
CONFMODE=644
CURRDIR=`pwd`
INITDFILESRC=$CURRDIR/i020.9.4.3.RabbitMQ.init.d.sh
INITDFILEDST=${EXTDIR}/rc.d/init.d/rabbitmq
INITDFILEREL=../init.d/rabbitmq


echo "Install Init.d/rc.d ..."
echo "Install Init.d/rc.d ..." >> $LFSLOG_PROCESS
echo "Install Init.d/rc.d ..." >> $PKGLOG_ERROR

   cp -v $INITDFILESRC $INITDFILEDST      \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
   chmod -v ${MODE} $INITDFILEDST         \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

	ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc0.d/K09rabbitmq  \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
	ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc1.d/K09rabbitmq  \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
	ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc2.d/S91rabbitmq  \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
	ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc3.d/S91rabbitmq  \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
	ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc4.d/S91rabbitmq  \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
	ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc5.d/S91rabbitmq  \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
	ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc6.d/K09rabbitmq  \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR


unset LFSLOG_PROCESS
unset PKGLOG_INITD
unset PKGLOG_ERROR
unset PKGLOG_DIR
