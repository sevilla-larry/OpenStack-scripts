# i010.9.04.cryptography-41.0.7.sh
#
# Note: (alternative) .whl install
# since the source build is giving ERRORs
#

#
# Dependencies Required:
#
#               i010.9.03 cffi-1.16.0
#

#
# Required by:
#
#               i010.9.30 openstacksdk-4.0.1
#               i020.9.1 python-openstackclient-7.1.3
#               i050.9.15 pyOpenSSL-23.3.0.sh
#

export PKG="cryptography-41.0.7-cp37-abi3-manylinux_2_28_x86_64.whl"
export PKGLOG_DIR=$OSLOG/010.04
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
