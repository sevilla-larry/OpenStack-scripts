# i050.9.4.5.RabbitMQ.rc.d.sh

export PKGLOG_DIR=$OSLOG/050.4.2
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
COOKIEMODE=400
CURRDIR=`pwd`
ENVFILESRC=$CURRDIR/i050.9.4.2.RabbitMQ-env.conf.txt
ENVFILEDST=${ETCDIR}/rabbitmq/rabbitmq-env.conf
INITDFILESRC=$CURRDIR/i050.9.4.3.RabbitMQ.init.d.sh
INITDFILEDST=${EXTDIR}/rc.d/init.d/rabbitmq
INITDFILEREL=../init.d/rabbitmq
COOKIEFILE=.erlang.cookie
COOKIESRC=$CURRDIR/i050.9.4.5.RabbitMQ${COOKIEFILE}.txt
COOKIEDST1=/var/lib/rabbitmq/$COOKIEFILE
COOKIEDST2=/root/$COOKIEFILE
RABBITMQ_HOME=/usr/local/rabbitmq_server-4.0.3


echo "Install Init.d/rc.d ..."
echo "Install Init.d/rc.d ..." >> $OSLOG_PROCESS
echo "Install Init.d/rc.d ..." >> $PKGLOG_ERROR

      cp -v $INITDFILESRC $INITDFILEDST         \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
      cp -v $ENVFILESRC $ENVFILEDST             \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
      cp -v $COOKIESRC $COOKIEDST1              \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
      # cp -v $COOKIESRC $COOKIEDST2              \
      ln -vsf $COOKIEDST1 $COOKIEDST2           \
          >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

      chmod -v ${MODE} $INITDFILEDST            \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
      chmod -v ${CONFMODE} $ENVFILEDST          \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
      chmod -v ${COOKIEMODE} $COOKIEDST1        \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
      chmod -v ${COOKIEMODE} $COOKIEDST2        \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

chown -vR rabbitmq:rabbitmq $RABBITMQ_HOME      \
        >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
#$ENVFILEDST $COOKIEDST1         \

	ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc0.d/K16rabbitmq  \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
	# ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc1.d/K16rabbitmq  \
      #    >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
	# ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc2.d/S84rabbitmq  \
      #    >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
	ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc3.d/S84rabbitmq  \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
	# ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc4.d/S84rabbitmq  \
      #    >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
	# ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc5.d/S84rabbitmq  \
      #    >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
	ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc6.d/K16rabbitmq  \
         >> $PKGLOG_INITD 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_INITD
unset PKGLOG_ERROR
unset PKGLOG_DIR
