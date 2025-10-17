# i1.1.33.bcrypt-4.0.1.whl.sh
#
# Note: (alternative) .whl install
# since the source build is giving ERRORs
#

#
# Required by:
#
#               i1.1.73 paramiko-4.0.0
#               i4.1.41 oslo.middleware-6.3.1
#               i6.16.1 KeyStone-27.0.0
#

export PKG="bcrypt-4.0.1-cp36-abi3-manylinux_2_28_x86_64.whl"
export PKGLOG_DIR=$OSLOG/1.1.33
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR


echo "Pip3 Install ..."
echo "Pip3 Install ..." >> $OSLOG_PROCESS
echo "Pip3 Install ..." >> $PKGLOG_ERROR

pip3 install $PKG > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_INSTALL
unset PKGLOG_ERROR
unset PKGLOG_DIR PKG
