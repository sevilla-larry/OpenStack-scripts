# i4.2.17.os-vif-4.1.0.sh
#

#
# Dependencies Required:
#
#               i3.1.01 pbr-6.1.2
#               i4.1.32 oslo.concurrency-7.1.0
#               i4.1.33 oslo.config-9.7.1
#               i4.1.38 oslo.log-7.1.0
#               i4.1.36 oslo.i18n-6.5.1
#               i4.1.43 oslo.privsep-3.6.0
#               i4.1.46 oslo.serialization-5.7.0
#               i4.1.49 oslo.utils-8.2.0
#               i4.1.50 oslo.versionedobjects-3.6.0
#               i4.2.19 ovsdbapp-2.11.0
#               i1.1.79 pyroute2-0.8.1
#               i4.1.20 stevedore-5.4.1
#               i3.1.04 debtcollector-3.0.0
#

#
# Required by:
#
#               i6.22.1 Nova-31.1.0
#

export PKG="os_vif-4.1.0"
export PKGLOG_DIR=$OSLOG/4.2.17
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
                os_vif                  \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "4. pyTest ..."
echo "4. pyTest ..." >> $OSLOG_PROCESS
echo "4. pyTest ..." >> $PKGLOG_ERROR
pytest >  $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset OSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
