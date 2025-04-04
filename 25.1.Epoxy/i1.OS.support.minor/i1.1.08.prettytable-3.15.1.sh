# i1.1.08.prettytable-3.15.1.sh
#
# Note: (alternative) .whl install
# since the source build is giving ERRORs
#

#
# Dependencies Required:
#
#               i1.1.06 wcwidth-0.2.13
#

#
# Required by:
#
#               i4.1.03 cliff-4.9.1
#               i?.??   python-cinderclient-9.6.0
#               i?.??   python-glanceclient-4.7.0
#               i?.??   oslo.upgradecheck-2.4.0
#               i?.??   osprofiler-4.2.0
#               i?.??   automaton-3.2.0
#               i?.??   Glance-29.0.0
#               i?.??  d Nova-30.0.0
#

export PKG="prettytable-3.15.1-py3-none-any.whl"
export PKGLOG_DIR=$OSLOG/1.1.08
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
