# i095.9.14.pysaml2-7.5.0.sh
#
# Note: (alternative) .whl install
# since the source build is giving ERRORs
#

#
# Dependencies Required:
#
#               i010.9.03 cryptography-41.0.7
#               i095.9.11 defusedxml-0.7.1
#               i010.9.26 pyOpenSSL-23.3.0
#               i010.9.27 python-dateutil-2.9.0.post0
#               b30.13.24.21 Pytz-2024.1
#               b30.13.23.30 Requests-2.32.3
#               i095.9.13 xmlschema-2.5.1
#

#
# Required by:
#
#               i151.9.3  KeyStone-26.0.0
#

export PKG="pysaml2-7.5.0-py3-none-any.whl"
export PKGLOG_DIR=$OSLOG/095.14
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
