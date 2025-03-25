# i010.9.03.cryptography-41.0.7.sh
#
# Note: (alternative) .whl install
# since the source build is giving ERRORs
#

#
# Dependencies Required:
#
#               i010.9.02 cffi-1.16.0
#

#
# Required by:
#
#               i040.9.02 openstacksdk-4.0.1
#               i050.9.1  python-openstackclient-7.1.3
#               i010.9.26 pyOpenSSL-23.3.0
#               i095.9.14 pysaml2-7.5.0
#               i151.9.3  KeyStone-26.0.0
#               i070.9.02 castellan-5.1.1
#               i075.9.01 cursive-0.2.3
#               i153.9.3  Glance-29.0.0
#               i095.9.24 jwcrypto-1.5.6
#               i095.9.22 paramiko-3.5.1
#               i111.9.3  Nova-30.0.0
#

export PKG="cryptography-41.0.7-cp37-abi3-manylinux_2_28_x86_64.whl"
export PKGLOG_DIR=$OSLOG/010.03
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
