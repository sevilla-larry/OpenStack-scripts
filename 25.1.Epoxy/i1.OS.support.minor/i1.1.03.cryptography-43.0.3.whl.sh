# i1.1.03.cryptography-43.0.3.whl.sh
# Note: version chosen by pysaml2-7.5.4
#
#
# Note: (alternative) .whl install
# since the source build is giving ERRORs
#

#
# Dependencies Required:
#
#               i1.1.02 cffi-1.17.1
#

#
# Required by:
#
#               i1.1.52 pyOpenSSL-24.2.1
#               i1.1.55 pysaml2-7.5.4 whl
#               i1.3.01 cursive-0.2.3
#               i4.2.01 castellan-5.2.1
#               i4.2.14 openstacksdk-4.4.0
#               i6.12   Glance-30.0.0
#               i6.16   KeyStone-27.0.0
#               i8.23   python-openstackclient-7.5.0
#               i?.??   jwcrypto-1.5.6
#               i?.??   paramiko-3.5.1
#               i?.??   Nova-30.0.0
#

export PKG="cryptography-43.0.3-cp39-abi3-manylinux_2_28_x86_64.whl"
export PKGLOG_DIR=$OSLOG/1.1.03
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
