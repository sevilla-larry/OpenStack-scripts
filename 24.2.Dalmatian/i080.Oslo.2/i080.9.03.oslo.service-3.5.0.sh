# i080.9.03.oslo.service-3.5.0.sh
#

#
# Dependencies Required:
#
#               i060.9.02 WebOb-1.8.7
#               i020.9.06 debtcollector-3.0.0
#               i060.9.05 eventlet-0.36.1
#               i060.9.04 greenlet-3.0.3
#               i030.9.02 oslo.utils-7.3.0
#               i080.9.02 oslo.concurrency-6.1.0
#               i030.9.03 oslo.config-9.6.0
#               i030.9.06 oslo.log-6.1.2
#               i030.9.01 oslo.i18n-6.4.0
#               i060.9.06 PasteDeploy-3.1.0
#               i060.9.08 Routes-2.5.1
#               i060.9.09 paste-3.10.1
#               i060.9.10 yappi-1.6.0
#

#
# Required by:
#
#               i080.9.06 oslo.messaging-14.9.1
#               i090.9.11 os_brick-6.9.1
#

export PKG="oslo.service-3.5.0"
export PKGLOG_DIR=$OSLOG/080.03
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
                oslo.service            \
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
