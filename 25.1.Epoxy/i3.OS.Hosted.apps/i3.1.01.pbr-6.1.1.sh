# i3.1.01.pbr-6.1.1.sh
#

#
# Dependencies Required:
#
#               a.08.55 Setuptools-80.9.0
#

#
# Required by:
#
#               i1.2.02 testresources-2.0.2
#               i1.2.03 fixtures-4.1.0
#               i1.2.05 testscenarios-0.5.0
#               i3.1.02 os-service-types-1.7.0
#               i4.1.06 keystoneauth1-5.10.0
#               i4.2.07 keystonemiddleware-10.9.0
#               i4.2.14 openstacksdk-4.4.0
#               i4.2.18 osc-lib-3.2.0
#               i4.1.20 stevedore-5.4.1
#               i4.1.32 oslo.concurrency-7.1.0
#               i4.1.34 oslo.context-5.7.1
#               i4.1.36 oslo.i18n-6.5.1
#               i4.1.38 oslo.log-7.1.0
#               i4.1.39 oslo.messaging-16.1.0
#               i4.1.40 oslo.metrics-0.11.0
#               i4.1.41 oslo.middleware-6.3.1
#               i4.1.46 oslo.serialization-5.7.0
#               i4.1.49 oslo.utils-8.2.0
#               i5.07   python-cinderclient-9.7.0
#               i5.16   python-keystoneclient-5.6.0
#               i6.12   Glance-30.0.0
#               i6.16   KeyStone-27.0.0
#               i8.23   python-openstackclient-7.5.0
#               i?.?? python-glanceclient-4.7.0
#               i?.?? python-barbicanclient-7.0.0
#               i?.?? python-neutronclient-11.3.1
#               i?.?? oslo.db-16.0.0
#               i?.?? oslo.reports-3.4.0
#               i?.?? castellan-5.1.1
#               i?.?? cursive-0.2.3
#               i?.?? automaton-3.2.0
#               i?.?? taskflow-5.9.1
#               i?.?? os-win-5.9.0
#               i?.?? os-resource-classes-1.1.0
#               i?.?? os-traits-3.1.0
#               i?.?? os_brick-6.9.1
#               i?.?? ovsdbapp-2.8.0
#               i?.?? os_vif-3.7.0
#               i?.?    Openstack-Placement-12.0.0
#               i?.?    osc-placement-4.5.0
#

export PKG="pbr-6.1.1"
export PKGLOG_DIR=$OSLOG/3.1.01
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export OSLOG_PROCESS=$OSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $OSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. pip3 Build ..."
echo "2. pip3 Build ..." >> $OSLOG_PROCESS
echo "2. pip3 Build ..." >> $PKGLOG_ERROR
pip3 wheel  -w dist                 \
            --no-cache-dir          \
            --no-build-isolation    \
            --no-deps               \
            $PWD                    \
            > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. pip3 Install ..."
echo "3. pip3 Install ..." >> $OSLOG_PROCESS
echo "3. pip3 Install ..." >> $PKGLOG_ERROR
pip3 install    --no-index              \
                --no-user               \
                --find-links dist       \
                --no-cache-dir          \
                pbr                     \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# echo "4. pyTest ..."
# echo "4. pyTest ..." >> $OSLOG_PROCESS
# echo "4. pyTest ..." >> $PKGLOG_ERROR
# pytest >  $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset OSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
