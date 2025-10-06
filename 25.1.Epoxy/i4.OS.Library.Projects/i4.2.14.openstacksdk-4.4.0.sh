# i4.2.14.openstacksdk-4.4.0.sh
#

#
# Dependencies Required:
#
#               i1.1.03      cryptography-45.0.7 whl
#               i1.1.10      decorator-5.2.1
#      2nd pass i1.2.01      dogpile.cache-1.3.4
#               i1.1.09      iso8601-2.1.0
#               i1.1.11      jmespath-1.0.1
#               i1.1.13      jsonpatch-1.33
#               i4.1.06      keystoneauth1-5.10.0
#               i3.02        os-service-types-1.7.0
#               i3.01        pbr-6.1.1
#               i1.1.15      platformdirs-4.3.8
#               b10.13.24.17 psutil-7.0.0
#               b30.13.24.28 PyYAML-6.0.2
#               i3.03        requestsexceptions-1.4.0
#               i1.1.14      typing-extensions-4.12.2
#
#      ??? 24.2 i1.1.14 netifaces-0.11.0

#
# Required by:
#
#               i8.23   python-openstackclient-7.4.0
#               i4.2.18 osc-lib-3.2.0
#               i040.9.15 python-neutronclient-11.3.1
#               i080.9.10 oslo.limit-2.5.0
#

export PKG="openstacksdk-4.4.0"
export PKGLOG_DIR=$OSLOG/4.14
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
                openstacksdk            \
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
