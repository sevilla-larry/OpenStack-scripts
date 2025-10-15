# i1.1.70.warlock-2.0.1.whl.sh
#
# Note: (alternative) .whl install
# since the source build is giving ERRORs
#

#
# Dependencies Required:
#
#               i1.1.13 jsonpatch-1.33
#               i1.1.59 jsonschema-4.23.0
#

#
# Required by:
#
#               i5.1.12 python-glanceclient-4.8.0
#

export PKG="warlock-2.0.1-py3-none-any.whl"
export PKGLOG_DIR=$OSLOG/1.1.70
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
