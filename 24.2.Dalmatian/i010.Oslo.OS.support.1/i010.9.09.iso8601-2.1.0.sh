# i010.9.09.iso8601-2.1.0.sh
#
# Note: (alternative) .whl install
# since the source build is giving ERRORs
#

#
# Required by:
#
#               i020.9.04 keystoneauth1-5.8.0
#               i040.9.02 openstacksdk-4.0.1
#               i030.9.02 oslo.utils-7.3.0
#               i050.9.1  python-openstackclient-7.1.3
#               i040.9.15 python-neutronclient-11.3.1
#               i153.9.3  Glance-29.0.0
#               i111.9.3  Nova-30.0.0
#               i080.9.14 oslo.versionedobjects-3.4.0
#

export PKG="iso8601-2.1.0-py3-none-any.whl"
export PKGLOG_DIR=$OSLOG/010.09
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
