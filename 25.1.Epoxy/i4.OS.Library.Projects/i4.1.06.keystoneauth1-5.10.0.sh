# i4.06.keystoneauth1-5.10.0.sh
#

#
# Dependencies Required:
#
#               i3.01   pbr-6.1.1
#               i1.1.09 iso8601-2.1.0
#               b30.13.23.30 Requests-2.32.3
#               i4.20   stevedore-5.4.1
#               i3.02   os-service-types-1.7.0
#

#
# Required by:
#
#               i4.14   openstacksdk-4.4.0
#               i4.18   osc-lib-3.1.0
#               i?.??   python-keystoneclient-5.5.0
#               i?.??   python-cinderclient-9.6.0
#               i?.??   python-glanceclient-4.7.0
#               i?.??   python-barbicanclient-7.0.0
#               i?.??   python-neutronclient-11.3.1
#               i?.??   oslo.limit-2.5.0
#               i?.??   castellan-5.1.1
#               i?.??   keystonemiddleware-10.7.1
#               i?.??   glance_store-4.8.1
#               i?.??   Glance-29.0.0
#

export PKG="keystoneauth1-5.10.0"
export PKGLOG_DIR=$OSLOG/4.06
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export OSLOG_PROCESS=$OSLOG/process.log

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
                keystoneauth1           \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# echo "4. pyTest ..."
# echo "4. pyTest ..." >> $OSLOG_PROCESS
# echo "4. pyTest ..." >> $PKGLOG_ERROR
# pytest >  $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset OSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
