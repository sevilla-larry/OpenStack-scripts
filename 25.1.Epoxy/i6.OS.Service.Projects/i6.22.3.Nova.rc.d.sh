# i6.22.2.Nova.rc.d.sh

export PKGLOG_DIR=$OSLOG/6.22.3
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
INITDFILESRC1=$CURRDIR/i6.22.11.nova-api.init.d.sh
INITDFILEDST1=${EXTDIR}/rc.d/init.d/nova-api
INITDFILESRC2=$CURRDIR/i6.22.12.nova-scheduler.init.d.sh
INITDFILEDST2=${EXTDIR}/rc.d/init.d/nova-scheduler
INITDFILESRC3=$CURRDIR/i6.22.13.nova-conductor.init.d.sh
INITDFILEDST3=${EXTDIR}/rc.d/init.d/nova-conductor
INITDFILESRC4=$CURRDIR/i6.22.14.nova-novncproxy.init.d.sh
INITDFILEDST4=${EXTDIR}/rc.d/init.d/nova-novncproxy
INITDFILEREL1=../init.d/nova-api
INITDFILEREL2=../init.d/nova-scheduler
INITDFILEREL3=../init.d/nova-conductor
INITDFILEREL4=../init.d/nova-novncproxy


echo "Install Init.d/rc.d ..."
echo "Install Init.d/rc.d ..." >> $OSLOG_PROCESS
echo "Install Init.d/rc.d ..." >> $PKGLOG_ERROR

cp -v $INITDFILESRC1 $INITDFILEDST1 \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
cp -v $INITDFILESRC2 $INITDFILEDST2 \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
cp -v $INITDFILESRC3 $INITDFILEDST3 \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
cp -v $INITDFILESRC4 $INITDFILEDST4 \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

chmod -v ${MODE}
      $INITDFILEDST1 $INITDFILEDST2 \
      $INITDFILEDST3 $INITDFILEDST4 \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

ln -vsf  $INITDFILEREL1 ${EXTDIR}/rc.d/rc0.d/K08nova-api          \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL1 ${EXTDIR}/rc.d/rc3.d/S92nova-api          \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL1 ${EXTDIR}/rc.d/rc6.d/K08nova-api          \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL2 ${EXTDIR}/rc.d/rc0.d/K07nova-scheduler    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL2 ${EXTDIR}/rc.d/rc3.d/S93nova-scheduler    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL2 ${EXTDIR}/rc.d/rc6.d/K07nova-scheduler    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL3 ${EXTDIR}/rc.d/rc0.d/K06nova-conductor    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL3 ${EXTDIR}/rc.d/rc3.d/S94nova-conductor    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL3 ${EXTDIR}/rc.d/rc6.d/K06nova-conductor    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL4 ${EXTDIR}/rc.d/rc0.d/K05nova-novncproxy   \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL4 ${EXTDIR}/rc.d/rc3.d/S95nova-novncproxy   \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL4 ${EXTDIR}/rc.d/rc6.d/K05nova-novncproxy   \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_INITD
unset PKGLOG_ERROR
unset PKGLOG_DIR
