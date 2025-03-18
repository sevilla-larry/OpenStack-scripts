# i111.6.noVNC.sh

export PKG1="noVNC-1.5.0"
export PKG2="novnc-noVNC-67129b6"
export PKGLOG_DIR=$OSLOG/111.3
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR


echo "1. Extract tar..."
echo "1. Extract tar..." >> $OSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG1.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG2

echo "2. Install ..."
echo "2. Install ..." >> $OSLOG_PROCESS
echo "2. Install ..." >> $PKGLOG_ERROR

mkdir -vp /usr/share/novnc                                  \
         >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -vr *.html core/ utils/ vnc.js ui.js /usr/share/novnc/   \
         >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
chown -vR nova:nova /usr/share/novnc                        \
         >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
chmod -vR 755 /usr/share/novnc                              \
         >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset OSLOG_PROCESS
unset PKGLOG_INSTALL
unset PKGLOG_ERROR
unset PKGLOG_DIR
