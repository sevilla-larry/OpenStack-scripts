# i4.1.49.oslo.utils-8.2.0.sh
#

#
# Dependencies Required:
#
#               i1.1.09      iso8601-2.1.0
#               i4.1.36      oslo.i18n-6.5.1
#               i1.1.16      netaddr-1.3.0
#               i3.04        debtcollector-3.0.0
#               b30.13.24.24 pyparsing-3.2.3
#               a.08.53      Packaging-25.0
#               i1.1.18      tzdata-2025.2
#               b30.13.24.28 PyYAML-6.0.2
#               b10.13.24.17 psutil-7.0.0
#               i3.01        pbr-6.1.1
#
#          ???  i1.1.14 netifaces-0.11.0
#

#
# Required by:
#
#               i4.2.18 osc-lib-3.2.0
#               i4.1.46 oslo.serialization-5.7.0
#               i5.16   python-keystoneclient-5.6.0
#               i5.07   python-cinderclient-9.7.0
#               i040.9.13 python-glanceclient-4.7.0
#               i040.9.14 python-barbicanclient-7.0.0
#               i040.9.15 python-neutronclient-11.3.1
#               i080.9.01 oslo.cache-3.8.0
#               i080.9.02 oslo.concurrency-6.1.0
#               i080.9.03 oslo.service-3.5.0
#               i080.9.04 oslo.middleware-6.2.0
#               i080.9.05 oslo.metrics-0.9.0
#               i080.9.06 oslo.messaging-14.9.1
#               i080.9.07 oslo.db-16.0.0
#               i080.9.08 oslo.policy-4.4.0
#               i080.9.09 oslo.upgradecheck-2.4.0
#               i080.9.11 oslo.reports-3.4.0
#               i080.9.13 oslo.privsep-3.4.0
#               i080.9.14 oslo.versionedobjects-3.4.0
#               i070.9.02 castellan-5.1.1
#               i075.9.01 cursive-0.2.3
#               i090.9.02 keystonemiddleware-10.7.1
#               i3.2.02 osprofiler-4.2.0
#               i090.9.05 taskflow-5.9.1
#               i090.9.06 glance_store-4.8.1
#               i090.9.07 os-win-5.9.0
#               i090.9.11 os_brick-6.9.1
#               i090.9.13 os_vif-3.7.0
#               i090.9.14 tooz-6.3.0
#               i151.3    KeyStone-26.0.0
#               i153.3    Glance-29.0.0
#               i152.3    Openstack-Placement-12.0.0
#

export PKG="oslo_utils-8.2.0"
export PKGLOG_DIR=$OSLOG/4.1.49
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
                oslo.utils              \
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
