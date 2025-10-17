# i4.3.07.keystonemiddleware-10.9.0.sh
#

#
# Dependencies Required:
#
#               i4.1.06      keystoneauth1-5.10.0
#               i4.2.31      oslo.cache-3.10.2
#               i4.1.33      oslo.config-9.7.1
#               i4.1.34      oslo.context-5.7.1
#               i4.1.36      oslo.i18n-6.5.1
#               i4.1.38      oslo.log-7.1.0
#               i4.1.46      oslo.serialization-5.7.0
#               i4.1.49      oslo.utils-8.2.0
#               i3.1.01      pbr-6.1.1
#               i3.2.01      pycadf-4.0.1
#               i1.1.32      PyJWT-2.10.1
#               i5.1.16      python-keystoneclient-5.6.0
#               b30.13.24.30 Requests-2.32.5
#               i1.1.21      WebOb-1.8.9
#

#
# Required by:
#
#               i6.12.1 Glance-30.0.0
#               i6.16.1 KeyStone-27.0.0
#               i6.22.1 Nova-31.1.0
#               i6.24.1 Openstack-Placement-13.0.0
#

export PKG="keystonemiddleware-10.9.0"
export PKGLOG_DIR=$OSLOG/4.3.07
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
                keystonemiddleware      \
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
