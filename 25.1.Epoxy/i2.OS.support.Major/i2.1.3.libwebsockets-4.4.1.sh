# i2.1.3.libwebsockets-4.4.1.sh
#
# https://libwebsockets.org/lws-api-doc-master/html/md_README_8build.html
# 
# Notes: https://libwebsockets.org/
#

#
# Required by:
#
#               novnc
#

export PKG="libwebsockets-4.4.1"
export PKGLOG_DIR=$OSLOG/2.1.3
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $OSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir    build
cd       build

echo "2. Configure ..."
echo "2. Configure ..." >> $OSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_INSTALL_PREFIX=/usr  \
      -D CMAKE_BUILD_TYPE=Release   \
      -D LWS_WITH_SSL=1             \
      -D LWS_WITH_SHARED=1          \
      -D LWS_WITH_STATIC=1          \
      ..                            \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $OSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $OSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

ldconfig >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset OSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
