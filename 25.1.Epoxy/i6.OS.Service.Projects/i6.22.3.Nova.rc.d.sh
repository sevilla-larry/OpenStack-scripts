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
LOCALBIN=/usr/local/bin
INITMODE=755
#DIRMODE=755
#CNFMODE=644
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

chmod -v ${INITMODE}                \
      $INITDFILEDST1 $INITDFILEDST2 \
      $INITDFILEDST3 $INITDFILEDST4 \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

ln -vsf  $INITDFILEREL1 ${EXTDIR}/rc.d/rc0.d/K15nova-api          \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL1 ${EXTDIR}/rc.d/rc3.d/S85nova-api          \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL1 ${EXTDIR}/rc.d/rc6.d/K15nova-api          \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

ln -vsf  $INITDFILEREL2 ${EXTDIR}/rc.d/rc0.d/K14nova-scheduler    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL2 ${EXTDIR}/rc.d/rc3.d/S86nova-scheduler    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL2 ${EXTDIR}/rc.d/rc6.d/K14nova-scheduler    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

ln -vsf  $INITDFILEREL3 ${EXTDIR}/rc.d/rc0.d/K13nova-conductor    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL3 ${EXTDIR}/rc.d/rc3.d/S87nova-conductor    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL3 ${EXTDIR}/rc.d/rc6.d/K13nova-conductor    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

ln -vsf  $INITDFILEREL4 ${EXTDIR}/rc.d/rc0.d/K12nova-novncproxy   \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL4 ${EXTDIR}/rc.d/rc3.d/S88nova-novncproxy   \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL4 ${EXTDIR}/rc.d/rc6.d/K12nova-novncproxy   \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

WRAPRFILESRC1=$CURRDIR/i6.22.21.nova-api-wrapper.sh
WRAPRFILEDST1=${LOCALBIN}/nova-api-wrapper
WRAPRFILESRC2=$CURRDIR/i6.22.22.nova-scheduler-wrapper.sh
WRAPRFILEDST2=${LOCALBIN}/nova-scheduler-wrapper
WRAPRFILESRC3=$CURRDIR/i6.22.23.nova-conductor-wrapper.sh
WRAPRFILEDST3=${LOCALBIN}/nova-conductor-wrapper
WRAPRFILESRC4=$CURRDIR/i6.22.24.nova-novncproxy-wrapper.sh
WRAPRFILEDST4=${LOCALBIN}/nova-novncproxy-wrapper

echo "Install Wrappers ..."
echo "Install Wrappers ..." >> $OSLOG_PROCESS
echo "Install Wrappers ..." >> $PKGLOG_ERROR

cp -v $WRAPRFILESRC1 $WRAPRFILEDST1 \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
cp -v $WRAPRFILESRC2 $WRAPRFILEDST2 \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
cp -v $WRAPRFILESRC3 $WRAPRFILEDST3 \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
cp -v $WRAPRFILESRC4 $WRAPRFILEDST4 \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

chmod -v ${INITMODE}                \
      $WRAPRFILEDST1 $WRAPRFILEDST2 \
      $WRAPRFILEDST3 $WRAPRFILEDST4 \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_INITD
unset PKGLOG_ERROR
unset PKGLOG_DIR
