# i4.1.40.oslo.metrics-0.11.0.sh
#

#
# Dependencies Required:
#
#               i020.9.01 pbr-6.1.0
#               i030.9.02 oslo.utils-7.3.0
#               i030.9.06 oslo.log-6.1.2
#               i030.9.03 oslo.config-9.6.0
#               i060.9.17 prometheus_client-0.20.0
#

#
# Required by:
#
#               i4.1.39 oslo.messaging-16.1.0
#

export PKG="oslo.metrics-0.11.0"
export PKGLOG_DIR=$OSLOG/4.1.40
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
                oslo.metrics            \
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
