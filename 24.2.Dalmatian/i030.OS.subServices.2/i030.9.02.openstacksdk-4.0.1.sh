# i030.9.02.openstacksdk-4.0.1.sh
#

#
# Dependencies Required:
#
#               i010.9.03 cryptography-42.0.8
#               i010.9.10 decorator-5.1.1
#               i020.9.01 dogpile.cache-1.3.3
#               i010.9.09 iso8601-2.1.0
#               i010.9.11 jmespath-1.0.1
#               i010.9.13 jsonpatch-1.33
#               i015.9.04 keystoneauth1-5.8.0
#               i010.9.14 netifaces-0.11.0
#               i015.9.03 os-service-types-1.7.0
#               i015.9.01 pbr-6.1.0
#               i010.9.15 platformdirs-4.3.6
#               b30.13.23.28 PyYAML-6.0.2
#               i015.9.05 requestsexceptions-1.4.0
#

#
# Required by:
#
#               i030.9.03 osc-lib-3.1.0.sh
#               i020.9.1  python-openstackclient-7.1.3
#

export PKG="openstacksdk-4.0.1"
export PKGLOG_DIR=$OSLOG/030.02
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
                openstacksdk            \
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
