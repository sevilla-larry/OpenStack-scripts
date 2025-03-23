# i060.9.16.oslo.versionedobjects-3.4.0.sh
#

#
# Dependencies Required:
#
#               i060.9.04 oslo.concurrency-6.1.0
#               ?i010.9.45 oslo.config-9.6.0
#               i060.9.01 oslo.context-5.6.0
#               i060.9.08 oslo.messaging-14.9.1
#               ?i010.9.50 oslo.serialization-5.5.0
#               ?i010.9.39 oslo.utils-7.3.0
#               ?i010.9.12 iso8601-2.1.0
#               i060.9.02 oslo.log-6.1.2
#               ?i010.9.31 oslo.i18n-6.4.0
#               i050.9.03 WebOb-1.8.7
#               ?i010.9.32 netaddr-1.3.0
#

#
# Required by:
#
#               i111.8 Nova-30.0.0
#

export PKG="oslo.versionedobjects-3.4.0"
export PKGLOG_DIR=$OSLOG/060.16
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
                oslo.versionedobjects   \
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
