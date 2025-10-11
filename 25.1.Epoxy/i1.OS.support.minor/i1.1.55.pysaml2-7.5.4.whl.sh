# i1.1.55.pysaml2-7.5.4.whl.sh
#
# Note: (alternative) .whl install
# since the source build is giving ERRORs
#

#
# Dependencies Required:
#
#               i1.1.03      cryptography-43.0.3
#               i1.1.51      defusedxml-0.7.1
#               i1.1.52      pyOpenSSL-24.2.1
#               i1.1.31      python-dateutil-2.9.0.post0
#               b30.13.24.30 Requests-2.32.5
#               i1.1.54      xmlschema-2.5.1
#

#
# Required by:
#
#               i6.16 KeyStone-27.0.0
#

export PKG="pysaml2-7.5.4-py3-none-any.whl"
export PKGLOG_DIR=$OSLOG/1.1.55
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
