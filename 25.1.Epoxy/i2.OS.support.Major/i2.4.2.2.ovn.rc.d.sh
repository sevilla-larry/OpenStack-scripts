# i2.4.2.2.ovn.rc.d.sh

export PKGLOG_DIR=$OSLOG/2.4.2.2
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
INITDFILESRC1=$CURRDIR/i2.4.2.3.ovn-dbs.init.d.sh
INITDFILEDST1=${EXTDIR}/init.d/ovn-dbs
INITDFILEREL1=../init.d/ovn-dbs
INITDFILESRC2=$CURRDIR/i2.4.2.4.ovn-northd.init.d.sh
INITDFILEDST2=${EXTDIR}/init.d/ovn-northd
INITDFILEREL2=../init.d/ovn-northd


echo "Install Init.d/rc.d ..."
echo "Install Init.d/rc.d ..." >> $OSLOG_PROCESS
echo "Install Init.d/rc.d ..." >> $PKGLOG_ERROR

cp -v $INITDFILESRC1 $INITDFILEDST1       \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
cp -v $INITDFILESRC2 $INITDFILEDST2       \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

chmod -v ${INITMODE}                      \
      $INITDFILEDST1    $INITDFILEDST2    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

ln -vsf  $INITDFILEREL1 ${EXTDIR}/rc.d/rc0.d/K74ovn-dbs \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL1 ${EXTDIR}/rc.d/rc3.d/S26ovn-dbs  \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL1 ${EXTDIR}/rc.d/rc6.d/K74ovn-dbs  \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

ln -vsf  $INITDFILEREL2 ${EXTDIR}/rc.d/rc0.d/K73ovn-northd  \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL2 ${EXTDIR}/rc.d/rc3.d/S27ovn-northd  \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL2 ${EXTDIR}/rc.d/rc6.d/K73ovn-northd  \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_INITD
unset PKGLOG_ERROR
unset PKGLOG_DIR
