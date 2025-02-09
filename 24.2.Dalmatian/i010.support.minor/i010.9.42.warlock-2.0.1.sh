# i010.9.42.warlock 2.0.1.sh
#
# Note: (alternative) .whl install
# since the source build is giving ERRORs
#

#
# Required by:
#
#               i010.9.17 jsonpatch-1.33
#               i050.9.22 jsonschema-4.23.0
#

export PKG="warlock-2.0.1-py3-none-any.whl"
export PKGLOG_DIR=$OSLOG/010.42
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
