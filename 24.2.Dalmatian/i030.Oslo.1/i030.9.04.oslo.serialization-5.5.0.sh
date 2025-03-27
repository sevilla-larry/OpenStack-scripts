# i030.9.04.oslo.serialization-5.5.0.sh
#

#
# Dependencies Required:
#
#               i020.9.01 pbr-6.1.0
#               b30.13.24.17 Msgpack-1.0.8
#               i030.9.02 oslo.utils-7.3.0
#               i010.9.19 tzdata-2024.2
#

#
# Required by:
#
#               i040.9.11 python-keystoneclient-5.5.0
#               i040.9.14 python-barbicanclient-7.0.0
#               i040.9.15 python-neutronclient-11.3.1
#               i080.9.06 oslo.messaging-14.9.1
#               i080.9.08 oslo.policy-4.4.0
#               i080.9.11 oslo.reports-3.4.0
#               i080.9.14 oslo.versionedobjects-3.4.0
#               i075.9.01 cursive-0.2.3
#               i090.9.01 pycadf-3.1.1
#               i090.9.02 keystonemiddleware-10.7.1
#               i090.9.03 osprofiler-4.2.0
#               i090.9.05 taskflow-5.9.1
#               i090.9.06 glance_store-4.8.1
#               i090.9.11 os_brick-6.9.1
#               i090.9.13 os_vif-3.7.0
#               i090.9.14 tooz-6.3.0
#               i151.3    KeyStone-26.0.0
#

export PKG="oslo.serialization-5.5.0"
export PKGLOG_DIR=$OSLOG/030.04
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
                oslo.serialization      \
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
