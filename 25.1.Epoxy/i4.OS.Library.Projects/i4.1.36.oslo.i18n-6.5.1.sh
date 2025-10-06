# i4.1.36.oslo.i18n-6.5.1.sh
#

#
# Dependencies Required:
#
#               i3.01   pbr-6.1.1
#               a.08.55 Setuptools-80.9.0   (hidden)
#

#
# Required by:
#
#               i8.23   python-openstackclient-7.5.0
#               i4.1.49 oslo.utils-8.2.0
#               i4.2.18 osc-lib-3.2.0
#               i?.??   oslo.config-9.6.0
#               i?.??   python-keystoneclient-5.5.0
#               i?.??   python-cinderclient-9.6.0
#               i?.??   python-glanceclient-4.7.0
#               i?.??   python-barbicanclient-7.0.0
#               i?.??   python-neutronclient-11.3.1
#               i?.??   oslo.cache-3.8.0
#               i?.??   oslo.concurrency-6.1.0
#               i?.??   oslo.service-3.5.0
#               i?.??   oslo.middleware-6.2.0
#               i?.??   oslo.messaging-14.9.1
#               i?.??   oslo.db-16.0.0
#               i?.??   oslo.policy-4.4.0
#               i?.??   oslo.upgradecheck-2.4.0
#               i?.??   oslo.limit-2.5.0
#               i?.??   oslo.reports-3.4.0
#               i?.??   oslo.privsep-3.4.0
#               i?.??   oslo.versionedobjects-3.4.0
#               i?.??   castellan-5.1.1
#               i?.??   cursive-0.2.3
#               i?.??   keystonemiddleware-10.7.1
#               i?.??   glance_store-4.8.1
#               i?.??   os-win-5.9.0
#               i?.??   os_brick-6.9.1
#               i?.??   os_vif-3.7.0
#               i?.??   KeyStone-26.0.0
#               i?.??   Glance-29.0.0
#

export PKG="oslo_i18n-6.5.1"
export PKGLOG_DIR=$OSLOG/4.1.36
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
                oslo.i18n               \
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
