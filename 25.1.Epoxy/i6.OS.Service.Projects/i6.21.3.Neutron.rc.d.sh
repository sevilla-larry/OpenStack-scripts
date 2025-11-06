# i6.21.3.Neutron.rc.d.sh

export PKGLOG_DIR=$OSLOG/6.21.3
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
#DIRMODE=755
#CNFMODE=644
CURRDIR=`pwd`
INITDFILESRC1=$CURRDIR/i6.21.11.Neutron-Server.init.d.sh
INITDFILEDST1=${EXTDIR}/rc.d/init.d/neutron-server
INITDFILEREL1=../init.d/neutron-server
INITDFILESRC2=$CURRDIR/i6.21.12.Neutron-OpenVSwitch-Agent.init.d.sh
INITDFILEDST2=${EXTDIR}/rc.d/init.d/neutron-openvswitch-agent
INITDFILEREL2=../init.d/neutron-openvswitch-agent
INITDFILESRC3=$CURRDIR/i6.21.13.Neutron-DHCP-Agent.init.d.sh
INITDFILEDST3=${EXTDIR}/rc.d/init.d/neutron-dhcp-agent
INITDFILEREL3=../init.d/neutron-dhcp-agent
INITDFILESRC4=$CURRDIR/i6.21.14.Neutron-MetaData-Agent.init.d.sh
INITDFILEDST4=${EXTDIR}/rc.d/init.d/neutron-metadata-agent
INITDFILEREL4=../init.d/neutron-metadata-agent


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

chmod -v ${INITMODE}                      \
      $INITDFILEDST1    $INITDFILEDST2    \
      $INITDFILEDST3    $INITDFILEDST4    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

ln -vsf  $INITDFILEREL1 ${EXTDIR}/rc.d/rc0.d/K09neutron-server            \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL1 ${EXTDIR}/rc.d/rc3.d/S91neutron-server            \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL1 ${EXTDIR}/rc.d/rc6.d/K09neutron-server            \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL2 ${EXTDIR}/rc.d/rc0.d/K08neutron-openvswitch-agent \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL2 ${EXTDIR}/rc.d/rc3.d/S92neutron-openvswitch-agent \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL2 ${EXTDIR}/rc.d/rc6.d/K08neutron-openvswitch-agent \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL3 ${EXTDIR}/rc.d/rc0.d/K07neutron-dhcp-agent        \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL3 ${EXTDIR}/rc.d/rc3.d/S93neutron-dhcp-agent        \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL3 ${EXTDIR}/rc.d/rc6.d/K07neutron-dhcp-agent        \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL4 ${EXTDIR}/rc.d/rc0.d/K06neutron-metadata-agent    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL4 ${EXTDIR}/rc.d/rc3.d/S94neutron-metadata-agent    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL4 ${EXTDIR}/rc.d/rc6.d/K06neutron-metadata-agent    \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_INITD
unset PKGLOG_ERROR
unset PKGLOG_DIR
