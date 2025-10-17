# i4.1.38.oslo.log-7.1.0.sh
#

#
# Dependencies Required:
#
#               i3.1.01 pbr-6.1.1
#               i4.1.33 oslo.config-9.7.1
#               i4.1.34 oslo.context-5.7.1
#               i4.1.36 oslo.i18n-6.5.1
#               i4.1.49 oslo.utils-8.2.0
#               i4.1.46 oslo.serialization-5.7.0
#               i1.1.31 python-dateutil-2.9.0.post0
#               i3.1.04 debtcollector-3.0.0
#

#
# Required by:
#
#               i1.3.01 cursive-0.2.3
#               i3.2.03 os-win-5.9.0
#               i4.2.01 castellan-5.2.1
#               i4.3.07 keystonemiddleware-10.9.0
#               i4.2.15 os-brick-6.11.0
#               i4.2.17 os_vif-4.1.0
#               i4.2.31 oslo.cache-3.10.0
#               i4.2.37 oslo.limit-2.6.1
#               i4.1.39 oslo.messaging-16.1.0
#               i4.1.40 oslo.metrics-0.11.0
#               i4.1.43 oslo.privsep-3.6.0
#               i4.1.47 oslo.service-4.1.1
#               i4.1.50 oslo.versionedobjects-3.6.0
#               i5.3.21 python-neutronclient-11.4.0
#               i6.12.1 Glance-30.0.0
#               i6.16.1 KeyStone-27.0.0
#               i6.22.1 Nova-31.1.0
#               i6.24.1 Openstack-Placement-13.0.0
#

export PKG="oslo_log-7.1.0"
export PKGLOG_DIR=$OSLOG/4.1.38
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
                oslo.log                \
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
