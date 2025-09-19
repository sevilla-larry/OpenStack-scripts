# i1.1.09.iso8601-2.1.0.whl.sh
#
# Note: (alternative) .whl install
# since the source build is giving ERRORs
#

#
# Required by:
#
#               i8.23   python-openstackclient-7.5.0
#               i4.2.14 openstacksdk-4.4.0
#               i4.1.06 keystoneauth1-5.10.0
#               i4.1.49 oslo.utils-8.2.0
#               i?.??   python-neutronclient-11.3.1
#               i?.??   Glance-29.0.0
#               i?.??   Nova-30.0.0
#               i?.??   oslo.versionedobjects-3.4.0
#

export PKG="iso8601-2.1.0-py3-none-any.whl"
export PKGLOG_DIR=$OSLOG/1.1.09
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
