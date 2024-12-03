# i010.9.1.simplejson-3.19.3.sh
#

#
# Required by:
#
#				i020.9.3 RabbitMQ-4.0.3 (source build)
#
#

export PKG="simplejson-3.19.3-py3-none-any.whl"
export PKGLOG_DIR=$OSLOG/010.1
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
