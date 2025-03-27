# i090.9.02.keystonemiddleware-10.7.1.sh
#

#
# Dependencies Required:
#
#               i020.9.04 keystoneauth1-5.8.0
#               i080.9.01 oslo.cache-3.8.0
#               i030.9.03 oslo.config-9.6.0
#               i030.9.05 oslo.context-5.6.0
#               i030.9.01 oslo.i18n-6.4.0
#               i030.9.06 oslo.log-6.1.2
#               i030.9.04 oslo.serialization-5.5.0
#               i030.9.02 oslo.utils-7.3.0
#               i020.9.01 pbr-6.1.0
#               i090.9.01 pycadf-3.1.1
#               i060.9.25 PyJWT-2.9.0
#               i040.9.11 python-keystoneclient-5.5.0
#               b30.13.23.30 Requests-2.32.3
#               i060.9.02 WebOb-1.8.7
#

#
# Required by:
#
#               i151.3    KeyStone-26.0.0
#

export PKG="keystonemiddleware-10.7.1"
export PKGLOG_DIR=$OSLOG/090.02
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
                keystonemiddleware      \
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
